//
//  NewsModal.swift
//  HackerNews
//
//  Created by hardip gajera on 03/07/21.
//

import Foundation

//   let newsModal = try? JSONDecoder().decode(NewsModal.self, from: data)

/// all feilds are optional because we miss any feild  in some id 
// MARK: - NewsModal
struct NewsModal: Codable,Hashable {
    let by: String?
    let descendants, id: Int?
    let kids: [Int]?
    let score, time: Int?
    let title, type: String?
    let url: String?
}
