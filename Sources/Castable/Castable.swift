//
//  File.swift
//  
//
//  Created by Cristian Ortega on 26/8/20.
//

import Foundation

/// Castable protocol
public protocol Castable: Codable {
    // MARK: - Transformations
    
    /// Creates a new instance from given Codable
    /// - Parameter codable: Codable instance to instantiate object from
    static func from<T: Codable>(_ codable: T) -> Self?
    
    /// Initializes a new instance from given Codable
    /// - Parameter codable: Codable to create instance from
    func `as`<T: Codable>(_ codableType: T.Type) -> T?
}

// MARK: - Default implementation
extension Castable {
    /// Creates a new instance from given Codable
    /// - Parameter codable: Codable instance to instantiate object from
    public static func from<T: Codable>(_ codable: T) -> Self? {
        let jsonEncoder: JSONEncoder = JSONEncoder()
        if let data: Data = try? jsonEncoder.encode(codable) {
            let jsonDecoder: JSONDecoder = JSONDecoder()
            return try? jsonDecoder.decode(Self.self, from: data)
        }
        
        return nil
    }
    
    /// Initializes a new instance from given Codable
    /// - Parameter codable: Codable to create instance from
    public func `as`<T: Codable>(_ codableType: T.Type) -> T? {
        let jsonEncoder: JSONEncoder = JSONEncoder()
        if let data: Data = try? jsonEncoder.encode(self) {
            let jsonDecoder: JSONDecoder = JSONDecoder()
            return try? jsonDecoder.decode(T.self, from: data)
        }
        
        return nil
    }
}
