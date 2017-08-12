//
//  SwiftExtensions.swift
//
//  Created by Kacper Kaliński on 11/06/2017.
//  Copyright © 2017 Kacper Kaliński. All rights reserved.
//

import Foundation

precedencegroup ValueUnwrapPrecedence {
    associativity: left
    higherThan: AssignmentPrecedence
}

infix operator !! : ValueUnwrapPrecedence

public func !!<T>(value: T?, errorMessage: @autoclosure ()->String) -> T {
    guard let unwrapped = value else {
        fatalError(errorMessage())
    }
    return unwrapped
}

infix operator !? : ValueUnwrapPrecedence

public func !?<T>(value: T?, error: Error) throws -> T {
    guard let unwrapped = value else {
        throw error
    }
    return unwrapped
}

precedencegroup OptionalAssignmentPrecedence {
    associativity: left
    lowerThan: AssignmentPrecedence
}

infix operator ?= : OptionalAssignmentPrecedence

public func ?=<T>(lhs: inout T?, rhs: @autoclosure ()->T) {
    if let _ = lhs {
        return
    }
    lhs = rhs()
}

infix operator =? : OptionalAssignmentPrecedence

public func =?<T>(lhs: inout T, rhs:T?) {
    guard let unwrapped = rhs else {
        return
    }
    lhs = unwrapped
}
