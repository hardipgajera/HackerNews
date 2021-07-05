//
//  Constant.swift
//  HackerNews
//
//  Created by hardip gajera on 03/07/21.
//

import Foundation

struct Constant {
    
    struct Url { 
        static let baseURL: URL = URL(string: "https://hacker-news.firebaseio.com/v0/")!
        static let topStories: URL = URL(string: "\(baseURL)topstories.json")!
        static let item: URL = URL(string: "\(baseURL)item/")!
    } 
    
    
}
