//
//  ImageViewController.swift
//  modul_17
//
//  Created by Admin on 22/04/24.
//

import UIKit
import SnapKit

class ImageViewController: UIViewController {

    //  Путь с картинками
    private let imageURL: URL = URL(string: "https://ru.wallpaper.mob.org/pc/image/palmy-pejzazh-plyazh-39461.html")!
    
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

        setupViews()
        //downloadImage()
        
        let queue = DispatchQueue.global(qos: .utility)
        queue.async {
            sleep(arc4random() % 4 )
            
//            if let data = try? Date(contentsOf: self.imageURL){
//                DispatchQueue.main.async { [weak self] in
//                    guard let self = self else {return}
//
//                    self.activityIndicator.stopAnimating()
//
//                    let view = UIImageView(image: UIImage(data: data))
//                    view.contentMode = .scaleAspectFit
//                    self.stackView.addArrangedSubview(view)
//                    print("Image is added")
//                }
//                print("Done")
//            }
        }
        
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
    
//    func downloadImage() {
//        let queue = DispatchQueue.global(qos: .utility)
//        queue.async {
//            sleep(arc4random() % 4 )
//
//            if let data = try? Date(contentsOf: self.imageURL){
//                DispatchQueue.main.async { [weak self] in
//                    guard let self = self else {return}
//
//                    self.activityIndicator.stopAnimating()
//
//                    let view = UIImageView(image: UIImage(data: data))
//                    view.contentMode = .scaleAspectFit
//                    self.stackView.addArrangedSubview(view)
//                    print("Image is added")
//                }
//                print("Done")
//            }
//        }
//    }
    
}
