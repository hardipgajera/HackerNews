//
//  NewsStore.swift
//  HackerNews
//
//  Created by hardip gajera on 03/07/21.
//

import Foundation

class NewsStore {
    
    static let shared = NewsStore()
    private init() {}
    
    func getTopStories(_ completionHandler: @escaping ([Int]) -> ()) {
        let url = URL(string: Constant.Url.topStories)!
        HTTPUtility.shared.getData(url: url, resultType: [Int].self) { (result) in
            switch result {
            case .success(let topStories):
                if let topStories = topStories {
                    completionHandler(topStories)
                }
            case .failure(let error):
                fatalError("Top story couldn't get Error: \(error.localizedDescription)")
            }
        }
    }
    
    func getStoriesFromID(_ id: String, completionHandler: @escaping ((NewsModal) -> () )) {
        let url = URL(string: Constant.Url.item + "\(id).json")!
        let httpUtility = HTTPUtility.shared
        httpUtility.getData(url: url, resultType: NewsModal.self) { (result) in
            switch result {
            case .success(let newsModal):
                if let newsModal = newsModal {
                    completionHandler(newsModal)
                }
            case .failure(let error):
                fatalError("Top story couldn't get Error: \(error.localizedDescription)")
            }
        }
    }
    
}
