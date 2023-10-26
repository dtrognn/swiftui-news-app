//
//  HomeVM.swift
//  news app
//
//  Created by dtrognn on 26/10/2023.
//

import Foundation

class HomeVM: NetworkManager {
    @Published var news: [ArticleItemViewData] = []
    @Published var catergory: Catergory = .general
    @Published var country: Country = .us
    private var newsType: NewsType = .topHeadlines

    private func getEndpoint() -> String {
        return "/v2/\(newsType.rawValue)?country=\(country.rawValue)&category=\(catergory.rawValue)"
    }

    private func getRequest(complete: @escaping (_ result: Result<ArticleResponse, Error>) -> Void) {
        let endpoint = getEndpoint()
        get(path: endpoint, complete: complete)
    }

    func getData() {
        showLoading(true)
        getRequest { [weak self] result in
            self?.showLoading(false)
            switch result {
            case .success(let data):
                self?.handleData(data)
            case .failure(let error):
                self?.handleError(error)
            }
        }
    }

    private func handleData(_ data: ArticleResponse) {
        guard let articles = data.articles else { return }

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

private extension ArticleItemViewData {
    init(_ data: Article) {
        self.source = data.source?.name ?? " "
        self.title = data.title ?? ""
        self.description = data.description ?? ""
        self.url = data.url ?? ""
        self.urlToImage = data.urlToImage ?? ""
        self.publishedAt = data.publishedAt ?? ""
    }
}
