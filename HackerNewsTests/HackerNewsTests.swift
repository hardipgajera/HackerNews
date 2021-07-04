//
//  HackerNewsTests.swift
//  HackerNewsTests
//
//  Created by hardip gajera on 03/07/21.
//

import XCTest
@testable import HackerNews

class HackerNewsTests: XCTestCase {
    
    
    //MARK: For test api working properly
    func testGetAPI() {
        let url = URL(string: Constant.Url.item + "8863.json")!
        let httpUtility = HTTPUtility.shared
        var isValidData: Bool = false
        let expectation = self.expectation(description: "Get_Api_Testing")
        httpUtility.getData(url: url, resultType: NewsModal.self) { (result) in
            switch result {
            case .success(let data):
                if data != nil { isValidData = true }
                expectation.fulfill()
            case .failure(_):
                break
            }
        }
        waitForExpectations(timeout: 5.0,handler: nil)
        XCTAssertTrue(isValidData)
    }
    
    //MARK: For test Top stories getting properly
    func testTopStoriesAPI() {
        let newsStore = NewsStore.shared
        var ids: [String] = []
        let expectation = self.expectation(description: "Top_Stories_Testing")
        newsStore.getTopStories { (id) in
            ids = id.map { String($0) }
            expectation.fulfill()
        }
        waitForExpectations(timeout: 5.0, handler: nil)
        XCTAssertTrue(ids.count != 0)
    }
 
    //MARK: For test Get NewsPost Working properly
    func testGetNewsPost() {
        let newsStore = NewsStore.shared
        var newsModal: NewsModal? = nil
        let expectation = self.expectation(description: "newsModal_Testing")
        newsStore.getStoriesFromID("8863") { (responseNewsModal) in
            newsModal = responseNewsModal
            expectation.fulfill()
        }
        waitForExpectations(timeout: 5.0, handler: nil)
        XCTAssertNotNil(newsModal)
    }
    
}
