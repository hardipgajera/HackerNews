//
//  Constant.swift
//  HackerNews
//
//  Created by hardip gajera on 03/07/21.
//

import Foundation

struct Constant {
    
    struct Url { 
        static let baseURL: String = "https://hacker-news.firebaseio.com/v0/"
        static let topStories: String = "\(baseURL)topstories.json"
        static let item: String = "\(baseURL)item/"
    }
    
    
}
