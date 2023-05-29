//
//  WebView.swift
//  DigimonDB
//
//  Created by Taijaun Pitt on 29/05/2023.
//

import SwiftUI
import WebKit

struct WebView: UIViewRepresentable {
    typealias UIViewType = WKWebView
    
    let url: URL
    
    func makeUIView(context: Context) -> WKWebView {
        return WKWebView()
    }
    
    func updateUIView(_ uiView: WKWebView, context: Context) {
        let request = URLRequest(url: url)
        uiView.load(request)
    }
    
    
    
    
   
    
}

//struct WebView_Previews: PreviewProvider {
//    static var previews: some View {
//        WebView()
//    }
//}
