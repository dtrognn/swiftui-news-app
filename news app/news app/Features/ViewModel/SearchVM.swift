//
//  SearchVM.swift
//  news app
//
//  Created by dtrognn on 27/10/2023.
//

import Foundation

class SearchVM: NetworkManager {
    @Published var text: String = ""
    @Published var news: [ArticleItemViewData] = []
    @Published var isLoading: Bool = false
    private var newsType: NewsType = .everything

    private func getEndpoint() -> String {
        return "/v2/\(newsType.rawValue)?q=\(text.lowercased())"
    }

    private func getRequest(complete: @escaping (_ result: Result<ArticleResponse, Error>) -> Void) {
        let endpoint = getEndpoint()
        get(path: endpoint, complete: complete)
    }

    func getData() {
        isLoading = true
        getRequest { [weak self] result in
            switch result {
            case .success(let data):
                self?.handleData(data)
                self?.isLoading = false
            case .failure(let error):
                self?.handleError(error)
                self?.isLoading = false
            }
        }
    }

    private func handleData(_ data: ArticleResponse) {
        guard let articles = data.articles else { return }

        news = []
        DispatchQueue.main.async {
            articles.forEach { article in
                let item = ArticleItemViewData(article)
                self.news.append(item)
            }
        }
    }

    private func handleError(_ error: Error) {
        print("AAA register error: \(error.localizedDescription)")
    }
}
