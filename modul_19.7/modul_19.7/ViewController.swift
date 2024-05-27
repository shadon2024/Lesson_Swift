//
//  ViewController.swift
//  modul_19.7
//
//  Created by Admin on 23/05/24.
//

import SnapKit
import UIKit
import Alamofire




class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    

    
    let apiKey = "8444fa56-7af6-40e6-b27f-fdbcbab43f60"
    var movies: [Movie] = []
    
    let searchTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "тут пользовательский текст"
        textField.borderStyle = .roundedRect
        textField.layer.borderWidth = 1.0
        textField.layer.borderColor = UIColor.black.cgColor
        textField.layer.cornerRadius = 5
        return textField
    }()
    
    let urlSessionButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitleColor(.white, for: .normal)
        button.setTitle("Поиск", for: .normal)
        button.backgroundColor = .systemBlue
        button.addTarget(nil, action: #selector(urlSesionButtonTaped), for: .touchUpInside)
        button.layer.cornerRadius = 6
        return button
    }()
    
    
    let alomafireButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitleColor(.white, for: .normal)
        button.setTitle("Популярные фильмы", for: .normal)
        button.backgroundColor = .systemBlue
        button.addTarget(nil, action: #selector(alomafireButtonTaped), for: .touchUpInside)
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
    
    
    let resultTextLabel: UILabel = {
        let label = UILabel()
        label.text = ""
        label.textColor = UIColor.black
        label.font = .systemFont(ofSize: 14)
        return label
    }()
    
    let  activityIndicator: UIActivityIndicatorView = {
        let activityIndicator = UIActivityIndicatorView()
        activityIndicator.translatesAutoresizingMaskIntoConstraints = false
        activityIndicator.style = .large
        activityIndicator.color = .red
        return activityIndicator
    }()
    
    let horizontalLine: UIView = {
        let horizontalLine  = UIView()
        horizontalLine.backgroundColor = .black
        horizontalLine.translatesAutoresizingMaskIntoConstraints = false
        return horizontalLine
    }()
    
    let tableView: UITableView = {
        let table = UITableView()
        table.tintColor = .red
        return table
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(MovieTableViewCell.self, forCellReuseIdentifier: MovieTableViewCell.identifier)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        setupUI()
    }
    
    
    
    func setupUI() {
        view.addSubview(searchTextField)
        view.addSubview(urlSessionButton)
        view.addSubview(alomafireButton)
        view.addSubview(resultTextView)
        view.addSubview(resultTextLabel)
        view.addSubview(activityIndicator)
        self.view.addSubview(horizontalLine)
        view.addSubview(tableView)
        
        searchTextField.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(20)
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().offset(-20)
            make.height.equalTo(40)
        }
        
        urlSessionButton.snp.makeConstraints { make in
            make.top.equalTo(searchTextField.snp.bottom).offset(20)
            make.centerX.equalToSuperview()
            make.height.equalTo(40)
            make.width.equalTo(100)
        }
        
        alomafireButton.snp.makeConstraints { make in
            make.top.equalTo(urlSessionButton.snp.bottom).offset(20)
            make.centerX.equalToSuperview()
            make.height.equalTo(40)
            make.width.equalTo(200)
        }
        
        resultTextLabel.snp.makeConstraints { make in
            make.top.equalTo(alomafireButton.snp.bottom).offset(60)
            make.leading.equalToSuperview().offset(20)
        }
        
        horizontalLine.snp.makeConstraints { make in
            make.top.equalTo(alomafireButton.snp.bottom).offset(85)
            make.height.equalTo(1)
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().offset(-20)
        }
        
        
        tableView.snp.makeConstraints { make in
            make.top.equalTo(horizontalLine).offset(10)
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().offset(-20)
            make.height.equalTo(300)
        }
        
        resultTextView.snp.makeConstraints{ make in
            make.top.equalTo(alomafireButton.snp.bottom).offset(450)
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().offset(-20)
            make.height.equalTo(100)
        }
        
        activityIndicator.snp.makeConstraints { make in
            make.top.equalTo(alomafireButton.snp.bottom).offset(20)
            make.centerX.equalToSuperview()
        }
    }
    
    
    @objc func urlSesionButtonTaped() {

        view.endEditing(true) // Скрытие клавиатуры

        guard let movieId = searchTextField.text, !movieId.isEmpty else {
            print("Movie is empty")
            return
        }

        guard let movieId1 = movieId.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) else {
            print("Invalid movie ID encoding")
            return
        }
        let urlString = "https://kinopoiskapiunofficial.tech/api/v2.1/films/search-by-keyword?keyword=\(movieId1)"
        //let urlString = "https://kinopoiskapiunofficial.tech/api/v2.1/films/\(movieId1)"

        guard let url = URL(string: urlString) else {
            print("Invalid URL")
            return
        }


        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.addValue(apiKey, forHTTPHeaderField: "X-API-KEY")

        activityIndicator.startAnimating() // Запуск индикатора загрузки

        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            DispatchQueue.main.async {
                self.activityIndicator.stopAnimating() // Остановка индикатора загрузки
            }
            if let error = error {
                print("Error: \(error.localizedDescription)")
                return
            }

            guard let data = data else {
                print("No data returned")
                return
            }

//            if let jsonString = String(data: data, encoding: .utf8) {
//                DispatchQueue.main.async {
//                    self.resultTextView.text = jsonString
//                }
//
//                DispatchQueue.main.async {
//                    self.resultTextLabel.text = "Поиск по запросу: \(self.searchTextField.text ?? "search is not find") "
//                    self.resultTextLabel.font = .systemFont(ofSize: 18, weight: .semibold)
//                }
//            }

            do {

                let movieInfo = try JSONDecoder().decode(Movie.self, from: data)
                let movie = Movie(filmId: movieInfo.filmId, nameRu: movieInfo.nameRu, posterUrl: movieInfo.posterUrl)
                DispatchQueue.main.async {
                    self.movies = [movie]
                    //self.movies.append(movie)
                    self.tableView.reloadData()

                    //self.resultTextLabel.text = "Поиск по запросу: \(self.searchTextField.text ?? "search is not find") "
                    //self.resultTextLabel.font = .systemFont(ofSize: 18, weight: .semibold)
                }
            } catch {
                print("Error decoding data: \(error.localizedDescription)")
                print(String(data: data, encoding: .utf8) ?? "No data")

                DispatchQueue.main.async {
                    self.tableView.reloadData()
                    self.resultTextLabel.text = "Поиск по запросу: \(self.searchTextField.text ?? "search is not find") "
                    self.resultTextLabel.font = .systemFont(ofSize: 18, weight: .semibold)
                }
            }

        }
        task.resume()
        

    }
    
    
    @objc func alomafireButtonTaped() {

        view.endEditing(true) // Скрытие клавиатуры

        guard let movieId = searchTextField.text, !movieId.isEmpty else {
                    print("Movie ID is empty")
                    return
                }

        guard let movieId1 = movieId.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) else {
            print("Invalid movie ID encoding")
            return
        }
                let urlString = "https://kinopoiskapiunofficial.tech/api/v2.1/films/search-by-keyword?keyword=\(movieId1)"

                let headers: HTTPHeaders = [
                    "X-API-KEY": apiKey
                ]

        activityIndicator.startAnimating() // Запуск индикатора загрузки

                AF.request(urlString, headers: headers).response { response in
                    DispatchQueue.main.async {
                        self.activityIndicator.stopAnimating() // Остановка индикатора загрузки
                    }

                    if let error = response.error {
                        print("Error: \(error.localizedDescription)")
                        return
                    }

                    guard let data = response.data else {
                        print("No data returned")
                        return
                    }

                    if let jsonString = String(data: data, encoding: .utf8) {
                        DispatchQueue.main.async {
                            self.resultTextView.text = jsonString
                        }

                        DispatchQueue.main.async {
                            self.resultTextLabel.text = "Популярные фильмы"
                            self.resultTextLabel.font = .systemFont(ofSize: 18, weight: .semibold)
                        }
                    }
                }
        
    }
    
 
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count
        //return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MovieCell", for: indexPath) as! MovieTableViewCell
        let movie = movies[indexPath.row]
        cell.textLabel?.numberOfLines = 0
        cell.textLabel?.text = movie.nameRu
        //cell.textLabel?.text = "hello"
        //cell.imageView?.image = movie.posterUrl
        cell.configure(with: movie)
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let movie = movies[indexPath.row]
        let detailVC = MovieDetailViewController()
        detailVC.movie = movie
        navigationController?.pushViewController(detailVC, animated: true)
    }
    
}

