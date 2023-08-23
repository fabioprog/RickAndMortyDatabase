//
//  Observable.swift
//  RickMortyDatabase
//
//  Created by Fabio Augusto Resende on 15/08/23.
//

import Foundation

public enum RMState {
    case `default`
    case loading
    case success([IndexPath]?)
    case failure(String)
}

public class Observable<T> {

    public typealias ObservableType = (T) -> Void

    private var observables: [ObservableType] = []

    private var value: T {
        didSet {
            executeBinds()
        }
    }

    public init(_ value: T) {
        self.value = value
    }

    public func notify(_ value: T) {
        self.value = value
    }

    public func observe(skip: Bool = false, _ bind: @escaping ObservableType) {
        observables.append(bind)
        if skip { return }
        bind(value)
    }

    private func executeBinds() {
        observables.forEach { [unowned self] bind in
            bind(self.value)
        }
    }
}
