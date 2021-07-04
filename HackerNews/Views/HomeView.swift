//
//  HomeView.swift
//  HackerNews
//
//  Created by hardip gajera on 03/07/21.
//

import SwiftUI

struct HomeView: View {
    
    @StateObject private var viewModal = HomeViewModal()
    
    var body: some View {
        NavigationView {
            List(viewModal.newsArray.indices,id: \.self) { index in
                NavigationLink(destination: DetailView(viewModal.newsArray[index])) {
                    Text("\(viewModal.newsArray[index].title ?? "")")
                        .padding()
                        .onAppear {
                            self.loadNewsIfNeeded(index)
                        }
                }
            }
            .navigationBarTitle("HackerNews")
        }
    }
    
    func loadNewsIfNeeded(_ onIndex:Int) {
        if onIndex > (viewModal.newsArray.count - 4) {
            if !viewModal.isPageLoading {
                viewModal.fetchNews()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
