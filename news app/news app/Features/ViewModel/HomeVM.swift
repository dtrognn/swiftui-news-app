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
    @Published var isShowError: Bool = false
    @Published var errorMessage: String = ""
    private var newsType: NewsType = .topHeadlines

    private func getEndpoint() -> String {
        return "/v2/\(newsType.rawValue)?country=\(country.rawValue)&category=\(catergory.rawValue)"
    }

    private func getRequest(complete: @escaping (_ result: Result<ArticleResponse, Error>) -> Void) async {
        let endpoint = getEndpoint()
        get(path: endpoint, complete: complete)
    }

    func getData() async {
        showLoading(true)
        await getRequest { [weak self] result in
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
        errorMessage = error.localizedDescription
        isShowError = true
    }
}

extension ArticleItemViewData {
    convenience init(_ data: Article) {
        self.init(
            source: data.source?.name ?? " ",
            title: data.title ?? "",
            description: data.description ?? "",
            url: data.url ?? "",
            urlToImage: data.urlToImage ?? "",
            publishedAt: data.timeFormatted
        )
    }
}
