//
//  WebviewCommon.swift
//  news app
//
//  Created by dtrognn on 26/10/2023.
//

import SwiftUI
import WebKit

public struct WebViewCommon: UIViewRepresentable {
    public typealias UIViewType = WKWebView
    @ObservedObject public var webViewStore: WebViewVM

    public init(_ webViewStore: WebViewVM) {
        self.webViewStore = webViewStore
    }

    public func makeUIView(context: Context) -> WKWebView {
        return webViewStore.webView
    }

    public func updateUIView(_ uiView: WKWebView, context: Context) {}
}

public class WebViewVM: NSObject, ObservableObject {
    @Published var webView: WKWebView
    @Published public var showLoading: Bool = false
    private let timeout = 10.0

    override public init() {
        let wv = WKWebView()
        self.webView = wv
        super.init()
        wv.navigationDelegate = self
    }

    public func loadData(_ urlString: String) {
        if let url = URL(string: urlString) {
            showLoading = true
            var request = URLRequest(url: url)
            request.timeoutInterval = timeout
            webView.load(request)
        }
    }
}

extension WebViewVM: WKNavigationDelegate {
    public func webView(_ webView: WKWebView, decidePolicyFor navigationAction: WKNavigationAction, decisionHandler: @escaping (WKNavigationActionPolicy) -> Void) {
        // TODO:
        decisionHandler(.allow)
    }

    public func webView(_ webView: WKWebView, decidePolicyFor navigationResponse: WKNavigationResponse, decisionHandler: @escaping (WKNavigationResponsePolicy) -> Void) {
        // TODO:
        decisionHandler(.allow)
    }

    public func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        showLoading = false
    }

    public func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: Error) {
        showLoading = false
    }

    public func webView(_ webView: WKWebView, didFailProvisionalNavigation navigation: WKNavigation!, withError error: Error) {
        showLoading = false
    }
}
