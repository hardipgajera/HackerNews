//
//  NewsModal.swift
//  HackerNews
//
//  Created by xrstudio on 03/07/21.
//

import Foundation

//   let newsModal = try? JSONDecoder().decode(NewsModal.self, from: data)
// MARK: - NewsModal
struct NewsModal: Codable {
    let by: String
    let descendants, id: Int
    let kids: [Int]
    let score, time: Int
    let title, type: String
    let url: String
}
