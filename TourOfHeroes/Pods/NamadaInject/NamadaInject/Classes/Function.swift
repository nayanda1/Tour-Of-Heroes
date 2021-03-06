//
//  Function.swift
//  NamadaInject
//
//  Created by Nayanda Haberty (ID) on 02/09/20.
//

import Foundation

/// Function to get instance from provider that throw catchable error
/// - Parameter anyType: Type of instance
/// - Throws: NamadaInjectionError, mostly if provider is not there
/// - Returns: The provided instance
public func tryInject<T>(of anyType: T.Type, ifNoMatchUse rules: InjectionRules = .nearestType) throws -> T {
    try NamadaInjector.shared.getInstance(of: anyType, ifNoMatchUse: rules)
}

/// Function to get instance from provider that throw uncatchable error
/// - Parameter anyType: Type of instance
/// - Returns: The provided instance
public func inject<T>(of anyType: T.Type, ifNoMatchUse rules: InjectionRules = .nearestType) -> T {
    try! NamadaInjector.shared.getInstance(of: anyType, ifNoMatchUse: rules)
}

/// Function to get instance from provider that throw catchable error
/// - Throws: NamadaInjectionError, mostly if provider is not there
/// - Returns: The provided instance
public func tryInject<T>(ifNoMatchUse rules: InjectionRules = .nearestType) throws -> T {
    try NamadaInjector.shared.getInstance(of: T.self, ifNoMatchUse: rules)
}

/// Function to get instance from provider that throw uncatchable error
/// - Returns: The provided instance
public func inject<T>(ifNoMatchUse rules: InjectionRules = .nearestType) -> T {
    try! NamadaInjector.shared.getInstance(of: T.self, ifNoMatchUse: rules)
}
