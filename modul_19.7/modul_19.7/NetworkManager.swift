//
//  NetworkManager.swift
//  modul_19.7
//
//  Created by Admin on 27/05/24.
//

import Foundation

struct NetworkManager {
    static let apiKey = "8444fa56-7af6-40e6-b27f-fdbcbab43f60"
    static let baseURL = "https://kinopoiskapiunofficial.tech/api/v2.1"
    
    static func searchMovies(query: String, completion: @escaping ([Movie]?) -> Void) {
        let urlString = "\(baseURL)/films/search-by-keyword?keyword=\(query)"
        guard let url = URL(string: urlString) else { return }
        
        var request = URLRequest(url: url)
        request.setValue(apiKey, forHTTPHeaderField: "X-API-KEY")
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data, error == nil else {
                completion(nil)
                return
            }
            do {
                let response = try JSONDecoder().decode(PopularMoviesResponse.self, from: data)
                completion(response.films)
            } catch {
                completion(nil)
            }
        }.resume()
    }
    
    static func fetchPopularMovies(completion: @escaping ([Movie]?) -> Void) {
        let urlString = "\(baseURL)/films/top"
        guard let url = URL(string: urlString) else { return }
        
        var request = URLRequest(url: url)
        request.setValue(apiKey, forHTTPHeaderField: "X-API-KEY")
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data, error == nil else {
                completion(nil)
                return
            }
            do {
                let response = try JSONDecoder().decode(PopularMoviesResponse.self, from: data)
                completion(response.films)
            } catch {
                completion(nil)
            }
        }.resume()
    }
}
