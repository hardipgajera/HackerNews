//
//  NewsStore.swift
//  HackerNews
//
//  Created by hardip gajera on 03/07/21.
//

import Foundation

protocol NewsStoreHandler {
    func getTopStories(_ completionHandler: @escaping ([Int]?,Error?) -> ())
    func getStoryFromID(_ id: Int, completionHandler: @escaping ((NewsModal?) -> () ))
}

class NewsStore: NewsStoreHandler {
    
    func getTopStories(_ completionHandler: @escaping ([Int]?,Error?) -> ()) {
        let url = Constant.Url.topStories
        HTTPUtility.shared.getData(url: url, resultType: [Int].self) { (result) in
            switch result {
            case .success(let topStories):
                if let topStories = topStories {
                    completionHandler(topStories, nil)
                }
            case .failure(let error):
                completionHandler(nil, error)
            }
        }
    }
    
    func getStoryFromID(_ id: Int, completionHandler: @escaping ((NewsModal?) -> () )) {
        let url = Constant.Url.item.appendingPathComponent("\(id).json")
        HTTPUtility.shared.getData(url: url, resultType: NewsModal.self) { (result) in
            switch result {
            case .success(let newsModal):
                if let newsModal = newsModal {
                    completionHandler(newsModal)
                }
            case .failure(let error):
                print("error: \(error.localizedDescription)")
                completionHandler(nil)
            }
        }
    }
    
}
