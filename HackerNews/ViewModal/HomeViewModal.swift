//
//  HomeViewModal.swift
//  HackerNews
//
//  Created by hardip gajera on 04/07/21.
//

import Foundation

struct PaginationModal {
    var isListFull = false
    var currentPage = 0
    let perPage = 20
    var isPageLoading = false
}

class HomeViewModal: ObservableObject {
    
    @Published var newsArray : [NewsModal] = []
    private var newsStore : NewsStoreHandler = NewsStore()
    private var newsIDs: [Int] = [] {
        didSet {
            fetchNews()
        }
    }
    var paginationModal = PaginationModal()
    
    init() {
        fetchTopStoriesID()
    }
    
    func fetchNews() {
        guard !paginationModal.isListFull else { return }
        paginationModal.isPageLoading = true
        var newsRange : [Int] = []
        if (paginationModal.currentPage + paginationModal.perPage) < newsIDs.count {
            newsRange = Array(newsIDs[paginationModal.currentPage...paginationModal.currentPage + paginationModal.perPage])
        } else {
            newsRange = Array(newsIDs[paginationModal.currentPage...newsIDs.count - 1])
            paginationModal.isListFull = true
        }
        for (id,element) in newsRange.enumerated() {
            self.newsStore.getStoryFromID(element, completionHandler: { (newsModal)  in
                if let newsModal = newsModal {
                    DispatchQueue.main.async {
                        self.newsArray.append(newsModal)
                        if id  == newsRange.count - 1 { self.paginationModal.isPageLoading = false }
                    }
                }
            })
        }
        paginationModal.currentPage += paginationModal.perPage
    }
    
    private func fetchTopStoriesID() {
        self.newsStore.getTopStories({ (ids,error) in
            if error != nil {
                return
            }
            if let ids = ids {
                DispatchQueue.main.async {
                    self.newsIDs = ids
                }
                return
            }
        })
    }
    
}
