//
//  ViewController.swift
//  modul_19.4
//
//  Created by Admin on 22/05/24.
//
  
import SnapKit
import UIKit
import Alamofire

class ViewController: UIViewController {
    
    var titleString: String = "text hello"
    
    
    lazy var dataInHeadersRequestButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("dataInHeadersRequest", for: .normal)
        //button.setTitleColor(.blue, for: .normal)
        button.backgroundColor = .systemBlue
        button.setTitleColor(.white, for: .normal)
        button.addTarget(nil, action: #selector(dataInHeadersRequestTaped), for: .touchUpInside)
        button.layer.cornerRadius = 6
        return button
    }()
    
    
    lazy var deviceRequestModelButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("dataInQueryItemsRequest", for: .normal)
        button.backgroundColor = .systemBlue
        button.setTitleColor(.white, for: .normal)
        button.addTarget(self, action: #selector(dataInQueryItemsRequestTaped), for: .touchUpInside)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 13)
        button.layer.cornerRadius = 5
        return button
    }()
    
    lazy var deviceRequestModel: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("deviceRequestModel", for: .normal)
        //button.setTitleColor(.blue, for: .normal)
        button.backgroundColor = .systemBlue
        button.setTitleColor(.white, for: .normal)
        button.addTarget(nil, action: #selector(deviceRequestModelTaped), for: .touchUpInside)
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
        textView.font = .systemFont(ofSize: 14, weight: .medium)
        return textView
    }()
    
    
    let textLabel: UILabel = {
        let label = UILabel()
        label.text = "тут результат:"
        label.textColor = UIColor.black
        label.font = .systemFont(ofSize: 14)
        return label
    }()
    
    let result: UILabel = {
        let label = UILabel()
        label.text = "result:"
        label.textColor = UIColor.black
        label.font = .systemFont(ofSize: 34, weight: .medium)
        label.textAlignment = .center
        return label
    }()
    
    let  activityIndicator: UIActivityIndicatorView = {
        let activityIndicator = UIActivityIndicatorView()
        activityIndicator.translatesAutoresizingMaskIntoConstraints = false
        activityIndicator.style = .large
        activityIndicator.color = .red
        return activityIndicator
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //view.backgroundColor = .systemGreen
        //jsonSwiftBaseApi()
        //dataInHeadersRequest()
        
        setupUI()
        
        
    }
    
    func setupUI() {
        view.addSubview(dataInHeadersRequestButton)
        view.addSubview(deviceRequestModelButton)
        view.addSubview(deviceRequestModel)
        view.addSubview(resultTextView)
        view.addSubview(textLabel)
        view.addSubview(result)
        view.addSubview(activityIndicator)
        
        
        
        dataInHeadersRequestButton.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(30)
            make.leading.equalToSuperview().offset(20)
            //make.trailing.equalTo(-40)
            //make.centerX.equalToSuperview()
            make.height.equalTo(40)
            make.width.equalTo(165)
        }
        
        deviceRequestModelButton.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(30)
            make.trailing.equalToSuperview().offset(-20)
            make.height.equalTo(40)
            make.width.equalTo(165)
        }
        
        deviceRequestModel.snp.makeConstraints { make in
            make.top.equalTo(deviceRequestModelButton).offset(60)
            make.leading.equalToSuperview().offset(20)
            make.height.equalTo(40)
            make.width.equalTo(165)
        }
        
        resultTextView.snp.makeConstraints{ make in
            make.top.equalTo(dataInHeadersRequestButton.snp.bottom).offset(195)
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().offset(-20)
            //make.bottom.equalTo(view.safeAreaLayoutGuide).offset(-20)
            make.height.equalTo(200)
        }
        
        textLabel.snp.makeConstraints{ make in
            make.top.equalTo(dataInHeadersRequestButton.snp.bottom).offset(160)
            //make.trailing.equalToSuperview().offset(-90)
            make.leading.equalTo(result.snp.trailing).offset(30)
        }
        
        result.snp.makeConstraints{ make in
            make.top.equalTo(dataInHeadersRequestButton.snp.bottom).offset(150)
            make.leading.equalToSuperview().offset(30)
            //make.centerX.equalToSuperview()
        }
        
        activityIndicator.snp.makeConstraints { make in
            make.top.equalTo(dataInHeadersRequestButton.snp.bottom).offset(80)
            make.centerX.equalToSuperview()
            //make.bottom.equalTo(resultTextView.snp.top).offset(-3)
        }
    }
    
    
    
    
    // 1) способ
    // Отправка данных в хедерах запроса
    // Первый способ отправки данных при вызове запроса — это передача данных в хедерах запроса. Тут могут передаваться различные данные, например ключ доступа, тип устройства, версия операционной системы устройства.
    
    @objc func dataInHeadersRequestTaped() {
        
            let link = "https://webhook.site/3cd52151-fcdf-428b-9e7b-4d3f92e3abec"
            guard let url = URL(string: link) else { return }
            var request = URLRequest(url: url)
                request.httpMethod = "GET"
                request.setValue("application/json", forHTTPHeaderField: "Content-Type")
                request.setValue("iOS " + UIDevice.current.systemVersion, forHTTPHeaderField: "system-version")
                request.setValue("Bearer '3cd52151-fcdf-428b-9e7b-4d3f92e3abec' ", forHTTPHeaderField: "Authorization")
            
            activityIndicator.startAnimating() // Запуск индикатора загрузки
            
            let task = URLSession.shared.dataTask(with: request) { (data: Data?, response: URLResponse?, error: Error?) -> Void in
                    DispatchQueue.main.async {
                        self.activityIndicator.stopAnimating() // Остановка индикатора загрузки
                    }
                
                    DispatchQueue.main.async {
                        self.displaySuccess()
                    
                    }
                
                    if let jsonString = String(data: data!, encoding: .utf8) {
                            DispatchQueue.main.async {
                                self.resultTextView.text = jsonString
                                self.resultTextView.font = .systemFont(ofSize: 16, weight: .bold)
                            }
                    }
                }
            task.resume()
        }
        
    
    
    
    // 2) способ
    // Отправка данных в параметрах запроса
    // Второй способ отправки данных при вызове запроса — это передача в параметрах. Схематично это выглядит так:
    // https://путь?параметр1=значение1&параметр2=значение2
    
    @objc func dataInQueryItemsRequestTaped() {
        
        let link = "https://webhook.site/3cd52151-fcdf-428b-9e7b-4d3f92e3abec"
        
        dataInQueryItemsRequest(link: link)
        
        func dataInQueryItemsRequest(link: String) {
            
            var components = URLComponents(string: link)
            let queryItemSystemVersion = URLQueryItem(name: "system-version", value: "IOS-" + UIDevice.current.systemVersion)
            let queryItemDeviceLanguage = URLQueryItem(name: "device-language", value: Locale.preferredLanguages[0])
            components?.queryItems = [queryItemSystemVersion, queryItemDeviceLanguage]
            
            guard let url = components?.url else { return }
            
            var request = URLRequest(url: url)
            request.httpMethod = "GET"
            
            activityIndicator.startAnimating()
            
            let task = URLSession.shared.dataTask(with: request) { _, _, _ in
                
                DispatchQueue.main.async {
                    self.activityIndicator.stopAnimating()
                }
                
                DispatchQueue.main.async {
                    self.displaySuccess()
                }
            }
            task.resume()
        }
        
    }
    
    
    
    
    // 3) способ
    // Отправка данных в теле запроса
    // В третьем способе отправки данных для их формирования будут использоваться структуры, соответствующие типу Codable. Соответствие вашего типа Codable означает, что ваш тип будет соответствовать протоколам Encodable и Decodable.
    
    @objc func deviceRequestModelTaped() {
        
        struct DeviceRequestModel: Codable {
            let systemVersion: String
            let deviceLanguage: String
            let randomModel: RandomModel
        }
        
        struct RandomModel: Codable {
            let randomInt: Int
            let randomBool: Bool
        }
        
        let link = "https://webhook.site/3cd52151-fcdf-428b-9e7b-4d3f92e3abec"
        dataInBodyRequest(link: link)
        
        func dataInBodyRequest(link: String) {
            let link = "https://webhook.site/3cd52151-fcdf-428b-9e7b-4d3f92e3abec"
            
            let model = DeviceRequestModel(
                systemVersion: "IOS-" + UIDevice.current.systemVersion,
                deviceLanguage: Locale.preferredLanguages[0],
                randomModel: RandomModel(randomInt: Int.random(in: 1...1000), randomBool: Bool.random()))
            
            guard
                let jsonData = try? JSONEncoder().encode(model),
                let url = URL(string: link)
            else {
                return
            }
            
            var request = URLRequest(url: url)
            request.httpMethod = "POST"
            request.httpBody = jsonData
            
            activityIndicator.startAnimating()
            let task = URLSession.shared.dataTask(with: request) { _, _, _ in
                DispatchQueue.main.async {
                    self.activityIndicator.stopAnimating()
                }
                
                DispatchQueue.main.async {
                    self.displaySuccess()
                }
                
            }
            task.resume()
            
        }
    }
    
    private func displaySuccess() {
        textLabel.textColor = .systemGreen
        textLabel.text = "Success: it's OK! "
        textLabel.font = .systemFont(ofSize: 24, weight: .medium)
    }
    
    private func displayFailure() {
        textLabel.textColor = .systemRed
        textLabel.text = "Success: it's not OK!"
        textLabel.font = .systemFont(ofSize: 24, weight: .medium)
    }
    
    
}



//class ViewModel {
//
//    //private func jsonSwiftBaseApi(jsonData: Data)
//    private func jsonSwiftBaseApi() {
//
//        // создаем модель
//        let model1 = JsonSwiftBase(id: 1, title: "Title One")
//        let model2 = JsonSwiftBase(id: 2, title: "Title Two")
//        let model3 = JsonSwiftBase(id: 3, title: "Title Three")
//
//        // преврашаем в Json
//        let jsonData = try? JSONSerialization.data(
//            withJSONObject: [
//                model1.dictionaryRepresentation(),
//                model2.dictionaryRepresentation(),
//                model3.dictionaryRepresentation()
//            ]
//        )
//
//        // настроиваем запрос
//        var request = URLRequest(url: URL(string: "https://jsonplaceholder.typicode.com/posts")!)
//        request.httpMethod = "POST"
//        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
//        request.httpBody = jsonData
//
//        activityIndicator.startAnimating() // Запуск индикатора загрузки
//
//        // делаем запрос и обработываем ответ
//        URLSession.shared.dataTask(with: request) { [weak self] (data, response, error) in
//            DispatchQueue.main.async {
//                self?.activityIndicator.stopAnimating() // Остановка индикатора загрузки
//            }
//
//            guard let data = data, error == nil else {
//                DispatchQueue.main.async {
//                    self?.displayFailure()
//                }
//                return
//            }
//
//            DispatchQueue.main.async {
//                self?.displaySuccess()
//
//            }
//
////            if let jsonString = String(data: data, encoding: .utf8) {
////                DispatchQueue.main.async {
////                    self?.resultTextView.text = jsonString
////                }
////            }
//
//            let responseJson = try? JSONSerialization.jsonObject(with: data, options: [])
//            if let responseJson = responseJson as? [String: Any] {
//                print(responseJson)
//            }
//        }.resume()
//    }
//
//
//    private func dataInHeadersRequest() {
//        let link = "https://webhook.site/3cd52151-fcdf-428b-9e7b-4d3f92e3abec"
//        guard let url = URL(string: link) else { return }
//        var request = URLRequest(url: url)
//            request.httpMethod = "GET"
//            request.setValue("application/json", forHTTPHeaderField: "Content-Type")
//            request.setValue("iOS " + UIDevice.current.systemVersion, forHTTPHeaderField: "system-version")
//            request.setValue("Bearer '3cd52151-fcdf-428b-9e7b-4d3f92e3abec' ", forHTTPHeaderField: "Authorization")
//
//        activityIndicator.startAnimating() // Запуск индикатора загрузки
//
//        let task = URLSession.shared.dataTask(with: request) { (data: Data?, response: URLResponse?, error: Error?) -> Void in
//                DispatchQueue.main.async {
//                    self.activityIndicator.stopAnimating() // Остановка индикатора загрузки
//                }
//
//                DispatchQueue.main.async {
//                    self.displaySuccess()
//
//                }
//
//                if let jsonString = String(data: data!, encoding: .utf8) {
//                        DispatchQueue.main.async {
//                            self.resultTextView.text = jsonString
//                            self.resultTextView.font = .systemFont(ofSize: 16, weight: .bold)
//                        }
//                }
//            }
//        task.resume()
//    }
//}
