//
//  ViewController.swift
//  modul_17
//
//  Created by Admin on 22/04/24.
//

import UIKit
import SnapKit

class ViewController: UIViewController {

    
    
    // Массив путей с картинками
    private let imageURLs = [
        "https://img.razrisyika.ru/kart/32/1200/125980-peyzazhi-prirody-28.jpg",
        "https://cloudfront.slrlounge.com/wp-content/uploads/2016/02/when-to-shoot-hdr.jpg",
        "https://fikiwiki.com/uploads/posts/2022-02/1644988274_45-fikiwiki-com-p-krasivie-kartinki-prirodi-na-rabochii-stol-51.jpg",
        "https://w.forfun.com/fetch/e4/e492830eb852edbef6c88838bb08e377.jpeg",
    ]
    
    private var images = [Data] ()
    
    private lazy var stackView: UIStackView = {
        let view = UIStackView()
        view.axis = .vertical
        view.distribution = .fillEqually
        view.spacing = 20
        return view
    }()
    
    
    private lazy var activityIndicator: UIActivityIndicatorView = {
        let view = UIActivityIndicatorView(style: .large)
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemGreen
        
        setupViews()
        
        // загрузка обычным способом
        //asyncUsual()
        
        // загрузка на одной очереди
        //asyncGroup()
        
        // загрузка на разных очередях
        asyncGroup2()
        
    }

    private func setupViews() {
        view.addSubview(stackView)
        stackView.snp.makeConstraints { make in
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottomMargin)
            make.top.equalTo(view.safeAreaLayoutGuide.snp.topMargin)
            make.left.right.equalToSuperview()
        }
        stackView.addArrangedSubview(activityIndicator)
        activityIndicator.startAnimating()
        
    }

    
    func asyncGroup() {
        print("\n----- asyncGroup ---\n")
        let dispatchGroup = DispatchGroup()
        
        for i in 0...3 {
            dispatchGroup.enter()
            asyncLoadImage(imageURL: URL(string: imageURLs[i])!,
                           runQueue: DispatchQueue.global(),
                           completionQueue: DispatchQueue.main)
            { result, error in
                guard let image1 = result else {return}
                print("----finished \(i) приоритет = \(qos_class_self().rawValue)")
                self.images.append(image1)
                dispatchGroup.leave()
            }
                          
        }
        
        dispatchGroup.notify(queue: DispatchQueue.main) { [ weak self] in
            guard let self = self else { return }
            self.activityIndicator.stopAnimating()
            self.stackView.removeArrangedSubview(self.activityIndicator)
            for i in 0...3 {
                self.addImage(data: self.images[i])
            }

        }
    }
    
    
    func asyncGroup2() {
        print("\n----- asyncGroup2 ---\n")
        let dispatchGroup = DispatchGroup()
        let queue = DispatchQueue(label: "com.skillbox.queues.serial")
        
        for i in 0...3 {
            dispatchGroup.enter()
            asyncLoadImage(imageURL: URL(string: imageURLs[i])!,
                           runQueue: queue,
                           completionQueue: DispatchQueue.main)
            { [ weak self] result, error in
                guard let self = self else {return}
                guard let image1 = result else {return}
                self.images.append(image1)
                print("изображение \(i) приоритет = \(qos_class_self().rawValue)")
                dispatchGroup.leave()
            }
                          
        }
        
        for i in 2...3 {
            DispatchQueue.global(qos: .userInitiated).async (group: dispatchGroup) { [weak self] in
                guard let self = self else {return}
                let url = URL(string: self.imageURLs[i])
                let data = try? Data(contentsOf: url!)
                sleep(arc4random() % 4)
                self.images.append(data!)
                print("изображение \(i) приоритет = \(qos_class_self().rawValue)")
            }
        }
        
        dispatchGroup.notify(queue: DispatchQueue.main) { [ weak self] in
            guard let self = self else { return }
            self.activityIndicator.stopAnimating()
            self.stackView.removeArrangedSubview(self.activityIndicator)
            for i in 0...3 {
                self.addImage(data: self.images[i])
            }

        }
    }
    
    
    func asyncUsual() {
        print("\n----- asyncUsual ---\n")
        for i in 0...3 {
            let url = URL(string: imageURLs[i])
            let request = URLRequest(url: url!)
            let task = URLSession.shared.dataTask(with: request) {
                (data, response, error) -> Void in
                DispatchQueue.main.async { [ weak self ]  in
                    guard let self = self else { return }
                    print("изображение \(i)")
                    self.addImage(data: data!)
                }
            }
            task.resume()
        }
    }
     

}


private extension ViewController {
    func asyncLoadImage(
        imageURL: URL,
        runQueue: DispatchQueue,
        completionQueue: DispatchQueue,
        completion: @escaping (Data?, Error?) -> ()
    ) {
        runQueue.async {
            do {
                let data = try Data(contentsOf: imageURL)
                // sleep остановливает очередь на заданное время
                // arc4random дает нам рандомное время
                sleep(arc4random() % 4)
                completionQueue.async { completion(data, nil)}
            } catch let error {
                completionQueue.async {completion(nil, error)}
            }
        }
    }
    
    func addImage(data: Data) {
        let view = UIImageView(image: UIImage(data: data))
        view.contentMode = .scaleAspectFit
        self.stackView.addArrangedSubview(view)
    }
}
