// inspired by: http://tom.lokhorst.eu/2017/07/strongly-typed-identifiers-in-swift

import Foundation

public struct StringIdentifier<T>: RawRepresentable, Hashable {
    
    public let rawValue: String
    public init(rawValue: String) { self.rawValue = rawValue }
    
    public var hashValue: Int {
        return rawValue.hashValue
    }
}

extension StringIdentifier : ExpressibleByStringLiteral {
    
    public init(stringLiteral value: String) {
        self.init(rawValue: value)
    }
}

public protocol Identifable : Hashable {
    
    typealias Identifier = StringIdentifier<Self>
    
    var identifier: Identifier { get }
}

extension Identifable {
    
    public var hashValue: Int {
        return identifier.rawValue.hashValue
    }
}



