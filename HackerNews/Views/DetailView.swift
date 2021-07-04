//
//  DetailView.swift
//  HackerNews
//
//  Created by hardip gajera on 04/07/21.
//

import SwiftUI

struct DetailView: View {
    
    var newsModal: NewsModal
    
    init(_ newsModal: NewsModal) {
        self.newsModal = newsModal
    }
    
    var body: some View {
        VStack(spacing: 10) {
            Text("\(newsModal.title ?? "")")
        }.padding()
    }
}
