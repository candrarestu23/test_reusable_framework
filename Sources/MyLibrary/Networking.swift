//
//  Networking.swift
//  MyLibrary
//
//  Created by Iglo-macpro on 08/03/21.
//

import Foundation

protocol NetworkSession {
    func get(from url: URL, completionHandler: @escaping (Data?, Error?) -> Void)
}

extension URLSession: NetworkSession {
    func get(from url: URL, completionHandler: @escaping (Data?, Error?) -> Void) {
        let task = dataTask(with: url) { data, _, error in
            completionHandler(data, error)
        }
        task.resume()
    }
}

extension MyLibrary {
    public class Networking {
        
        
        /// Responsible for handling all networking calls
        public class Manager {
            public init() {}
            
            internal var session: NetworkSession = URLSession.shared
            
            /// Update API from URL Session
            /// - Parameters:
            ///   - url: url
            ///   - completionHandler: completion Handler
            public func loadData(from url: URL, completionHandler: @escaping (NetworkResult<Data>) -> Void) {
                session.get(from: url) { data, error in
                    let result = data.map(NetworkResult<Data>.success) ?? .failure(error)
                    completionHandler(result)
                }
            }
        }
        
        public enum NetworkResult<Value> {
            case success(Value)
            case failure(Error?)
        }
    }
}
