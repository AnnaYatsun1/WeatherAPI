//
//  NetworkManager.swift
//  WetherApI2
//
//  Created by Anna Yatsun on 14/01/2019.
//  Copyright © 2019 Student. All rights reserved.
//

import Foundation

class NetworkManager<Value>: ObservableObject<NetworkManager.State> where Value: Decodable {
    
    public enum State {
        case notWorking
        case didStartLoading
        case didLoad
        case didFailedWithError(_ error: Error?)
    }
    
    var model: Value?
    
    private(set) var state: State = .notWorking {
        didSet {
            DispatchQueue.main.async {
                self.notify(new: self.state)
            }
        }
    }
    
    func requestData(url: URL) {
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            let information = data.flatMap { try? JSONDecoder().decode(Value.self, from: $0) }
            information.do {
                self.model = $0
                self.state = .didLoad
            }
            error.do { self.state = State.didFailedWithError($0) }
            }.resume()
    }
}
