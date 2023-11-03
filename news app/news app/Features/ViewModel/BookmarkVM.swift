//
//  BookmarkVM.swift
//  news app
//
//  Created by dtrognn on 02/11/2023.
//

import Combine
import Foundation

class BookmarkVM: BaseVM {
    static let shared = BookmarkVM()

    @Published var bookmarks: [ArticleItemViewData] = []
    private let BOOKMARK_KEY = "BOOKMARK_KEY"

    override init() {
        super.init()
        loadBookmarkFromLocal()
    }

    func addBookmark(_ bookmark: ArticleItemViewData) {
        bookmarks.append(bookmark)
        saveBookmarkToLocal()
    }

    func removeBoolmark(_ bookmark: ArticleItemViewData) {
        showLoading(true)
        if let articleSelectedIndex = bookmarks.firstIndex(where: { $0.id == bookmark.id }) {
            bookmarks.remove(at: articleSelectedIndex)
            showLoading(false)
            saveBookmarkToLocal()
        } else {
            showLoading(false)
        }
    }

    private func saveBookmarkToLocal() {
        if let encodedData = try? JSONEncoder().encode(bookmarks) {
            UserDefaults.standard.set(encodedData, forKey: BOOKMARK_KEY)
            UserDefaults.standard.synchronize()
        }
    }

    private func loadBookmarkFromLocal() {
        showLoading(true)
        if let encodedData = UserDefaults.standard.object(forKey: BOOKMARK_KEY) as? Data {
            if let bookmarkLocal = try? JSONDecoder().decode([ArticleItemViewData].self, from: encodedData) {
                showLoading(false)
                bookmarks = bookmarkLocal
                return
            }
        }
        showLoading(false)
    }
}
