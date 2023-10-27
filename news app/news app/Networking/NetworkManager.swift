//
//  NetworkManager.swift
//  news app
//
//  Created by dtrognn on 26/10/2023.
//

import Foundation

enum NewsType: String {
    case topHeadlines = "top-headlines"
    case everything
}

enum HttpMethod: String {
    case get = "GET"
    case post = "POST"
}

class NetworkManager: BaseVM {
    static let shared = NetworkManager()

    private var APP_KEY = "4a02d9c3ad9243cc960e7eb91de3f70c"
    private let domain = "https://newsapi.org"

    func get<T: Codable>(path: String, header: [String: String] = [:], complete: @escaping (_ result: Result<T, Error>) -> Void) {
        let appKey = "&apiKey=\(APP_KEY)"
        guard let url = URL(string: domain + path + appKey) else { return }

        var request = URLRequest(url: url)
        request.httpMethod = HttpMethod.get.rawValue
        header.forEach {
            request.setValue($0.value, forHTTPHeaderField: $0.key)
        }

        URLSession.shared.dataTask(with: request) { [weak self] data, response, error in
            self?.handleResponse(data: data, response: response, error: error, complete: complete)
        }.resume()
    }

    private func handleResponse<T: Codable>(data: Data?, response: URLResponse?, error: Error?, complete: @escaping (_ result: Result<T, Error>) -> Void) {
        if let error = error {
            complete(.failure(error))
        } else {
            if let response = response as? HTTPURLResponse {
                switch response.statusCode {
                case 200...299:
                    if let data = data {
                        do {
                            let object = try JSONDecoder().decode(T.self, from: data)
                            complete(.success(object))
                        } catch {
                            print("AAA JSON decoding error: \(error)")
                            complete(.failure(NetworkManagerError.parserError(error)))
                        }
                    } else {
                        complete(.failure(NetworkManagerError.emptyData))
                    }
                case 300...399:
                    complete(.failure(NetworkManagerError.redirection))
                case 400...499:
                    complete(.failure(NetworkManagerError.client))
                case 500...599:
                    complete(.failure(NetworkManagerError.server))
                default:
                    complete(.failure(NetworkManagerError.unknown))
                }
            } else {
                complete(.failure(NetworkManagerError.responseEmpty))
            }
        }
    }
}
