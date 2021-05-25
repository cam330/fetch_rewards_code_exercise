//
//  NetworkRequests.swift
//  fetch_rewards_code_exercise
//
//  Created by Cameron Wilcox on 5/24/21.
//

import Foundation

class NetworkRequests {
    static func getRequest(withSearch searchText: String?, completion: @escaping(Result<Events, Error>) -> Void) {
        guard var component = URLComponents(string: "https://api.seatgeek.com/2/events") else { return }
        component.queryItems = [
            URLQueryItem(name: "q", value: searchText ?? ""),
            URLQueryItem(name: "client_id", value: "MjE5NjA3MzN8MTYyMTQzOTc2Ni4yMTQyMTk2")
        ]
        let request = URLRequest(url: component.url!)
        let session = URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                completion(.failure(error))
            }
            if let data = data {
                decodeData(data: data) { result in
                    switch result {
                    case .failure(let error):
                        completion(.failure(error))
                    case .success(let events):
                        completion(.success(events))
                    }
                }
            }
        }
        session.resume()
    }
    
    /*
     Decode data into Events object structure
     */
    private static func decodeData(data: Data, completion: @escaping(Result<Events, Error>) -> Void) {
        let decoder = JSONDecoder()
        do {
            let eventData = try decoder.decode(Events.self, from: data)
            completion(.success(eventData))
        } catch {
            completion(.failure(error))
        }
    }
}
