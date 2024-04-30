//
//  ViewController.swift
//  modul_18.1
//
//  Created by Admin on 28/04/24.
//

import SnapKit
import UIKit
import Alamofire

class ViewController: UIViewController {

    let apiKey = "8444fa56-7af6-40e6-b27f-fdbcbab43f60"
    
    let searchTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "тут пользовательский текст"
        textField.borderStyle = .roundedRect
        return textField
    }()
    
    let urlSessionButton: UIButton = {
        let button = UIButton()
        button.setTitle("URLSession", for: .normal)
        //button.setTitleColor(.blue, for: .normal)
        button.backgroundColor = .systemBlue
        button.addTarget(self, action: #selector(urlSesionButtonTaped), for: .touchUpInside)
        button.layer.cornerRadius = 6
        return button
    }()
    
    let alomafireButton: UIButton = {
        let button = UIButton()
        button.setTitle("Alomafire", for: .normal)
        //button.setTitleColor(.blue, for: .normal)
        button.backgroundColor = .systemBlue
        button.addTarget(self, action: #selector(alomafireButtonTaped), for: .touchUpInside)
        button.layer.cornerRadius = 6
        
        return button
    }()
    
    let resultTextView: UITextView = {
        let textView = UITextView()
        textView.isEditable = false
        textView.isScrollEnabled = true
        textView.backgroundColor = .systemGray6
        textView.layer.borderWidth = 1.0
        textView.layer.borderColor = UIColor.black.cgColor
        textView.layer.cornerRadius = 8.0
        return textView
    }()
    
    
    let textLabel: UILabel = {
        let label = UILabel()
        label.text = "тут результат:"
        label.textColor = UIColor.black
        label.font = .systemFont(ofSize: 14)
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //view.backgroundColor = .systemGreen
        
    
        setupUI()
    }


    
    func setupUI() {
        view.addSubview(searchTextField)
        view.addSubview(urlSessionButton)
        view.addSubview(alomafireButton)
        view.addSubview(resultTextView)
        view.addSubview(textLabel)
        
        searchTextField.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(60)
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().offset(-20)
            make.height.equalTo(40)
        }
        
        urlSessionButton.snp.makeConstraints { make in
            make.top.equalTo(searchTextField.snp.bottom).offset(20)
            make.leading.equalTo(50)
            //make.trailing.equalTo-20)
            make.height.equalTo(40)
            make.width.equalTo(120)
        }
        
        alomafireButton.snp.makeConstraints { make in
            make.top.equalTo(searchTextField.snp.bottom).offset(20)
            //make.leading.equalTo(urlSessionButton.snp.trailing).offset(70)
            make.trailing.equalTo(-40)
            make.height.equalTo(40)
            make.width.equalTo(100)
        }
        
        resultTextView.snp.makeConstraints{ make in
            make.top.equalTo(urlSessionButton.snp.bottom).offset(40)
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().offset(-20)
            make.bottom.equalTo(view.safeAreaLayoutGuide).offset(-20)
        }
        
        textLabel.snp.makeConstraints{ make in
            make.top.equalTo(urlSessionButton.snp.bottom).offset(50)
            make.leading.equalToSuperview().offset(30)
        }
    }
    
    
    @objc func urlSesionButtonTaped() {
        guard let searchText = searchTextField.text else {
            return
        }
        
        let urlString = "https://api.kinopoisk.cloud/search-by-keyword?keyword=\(searchText)"
        
        // Выбор метода для отправки запроса
        if let selectedMethod = UserDefaults.standard.string(forKey: "selectedMethod") {
            switch selectedMethod {
            case "URLSession":
                fetchUsingURLSession(urlString: urlString)
                //case "Alamofire":
                //fetchUsingAlamofire(urlString: urlString)
            default:
                print("No method selected")
            }
        } else {
            print("No method selectedd")
        }
    
        func fetchUsingURLSession(urlString: String) {
            if let url = URL(string: urlString) {
                var request = URLRequest(url: url)
                request.httpMethod = "GET"
                request.allHTTPHeaderFields = ["accept": "application/json"]
                request.httpBody = nil
                request.setValue(apiKey, forHTTPHeaderField: "8444fa56-7af6-40e6-b27f-fdbcbab43f60")
                
                let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
                    if let error = error {
                        print("Error: \(error)")
                    } else if let data = data, let json = try? JSONSerialization.jsonObject(with: data, options: []) {
                        print(json)
                        let resultString = String(data: data, encoding: .utf8)
                        DispatchQueue.main.async {
                            self.resultTextView.text = resultString
                        }
                    }
                }
                task.resume()
            }
            
        }
        
    }
    
    
    @objc func alomafireButtonTaped() {
        searchTextField.text = searchTextField.text?.lowercased()
        
        guard let searchText = searchTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines),
              !searchText.isEmpty, let encodedText = searchText.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) else {
            print("search text is empty")
            return
        }
        print("search text \(searchText)")
        print("search text \(encodedText)")
    }
    

    private func makeApi(keyword: String) {
        guard let baseURL = URL(string: "https://api.kinopoisk.cloud/search-by-keyword?keyword") else {
            return
        }
        
        var components = URLComponents(url: baseURL, resolvingAgainstBaseURL: true)
        components?.queryItems = [URLQueryItem(name: "keyword", value: keyword)]
        
        guard (components?.url) != nil else {
            return
        }
    }
    
}





