//
//  HomeViewModal.swift
//  HackerNews
//
//  Created by hardip gajera on 04/07/21.
//

import Foundation

class HomeViewModal: ObservableObject {
    
    @Published var newsArray : [NewsModal] = []
    private var newsStore : NewsStoreHandler?
    private var newsIDs: [String] = [] {
        didSet {
            fetchNews()
        }
    }
    private var isListFull = false
    private var currentPage = 0
    private let perPage = 20
    
    var isPageLoading = false
    
    init(_ newsStoreHandler: NewsStoreHandler? = NewsStore.shared) {
        self.newsStore = newsStoreHandler
        fetchTopStoriesID()
    }
    
    func fetchNews() {
        guard !isListFull else { return }
        isPageLoading = true
        var newsRange : [String] = []
        if (currentPage + perPage) < newsIDs.count {
            newsRange = Array(newsIDs[currentPage...currentPage + perPage])
        } else {
            newsRange = Array(newsIDs[currentPage...newsIDs.count - 1])
            isListFull = true
        }
        for (id,element) in newsRange.enumerated() {
            DispatchQueue.global(qos: .background).async { [weak self] in
                self?.newsStore?.getStoriesFromID(element, completionHandler: { (newsModal) in
                    DispatchQueue.main.async {
                        self?.newsArray.append(newsModal)
                        if id  == newsRange.count - 1 { self?.isPageLoading = false }
                    }
                })
            }
        }
        currentPage += perPage
    }
    
    private func fetchTopStoriesID() {
        DispatchQueue.global(qos: .background).async { [weak self] in
            self?.newsStore?.getTopStories({ (ids) in
                DispatchQueue.main.async {
                    self?.newsIDs = ids.map { String($0) }
                }
            })
        }
    }
    
}
