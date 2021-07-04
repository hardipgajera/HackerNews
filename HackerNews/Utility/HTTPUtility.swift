//
//  HTTPUtility.swift
//  HackerNews
//
//  Created by hardip gajera on 03/07/21.
//

import Foundation

struct HTTPUtility {
    
    
    static let shared = HTTPUtility()
    private init() {}
    
    
    public enum HttpMethod : String {
        case get = "GET"
        case post = "POST"
        case put = "PUT"
        case delete = "DELETE"
    }
    
    private func makeRequest<T: Decodable>(requestUrl: URLRequest, responseType: T.Type, completionHandler:@escaping(Result<T?,Error>) -> Void) {
        URLSession.shared.dataTask(with: requestUrl) { (data, httpUrlResponse, error) in
            if (error == nil && data != nil && data?.count != 0) {
                do {
                    let response = try JSONDecoder().decode(T.self, from: data!)
                    completionHandler(.success(response))
                } catch (let error) {
                    completionHandler(.failure(error))
                }
            } else {
                if let error = error {
                    completionHandler(.failure(error))
                }
            }
        }.resume()
    }
    
    
    //MARK: Get data
    func getData<T:Decodable>(url: URL, resultType: T.Type, completionHandler:@escaping(Result<T?, Error>)-> Void) {
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = HttpMethod.get.rawValue
        makeRequest(requestUrl: urlRequest, responseType: T.self, completionHandler: completionHandler)
    }
    
}
