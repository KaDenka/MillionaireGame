//
//  Observable.swift
//  MillionaireGame
//
//  Created by Denis Kazarin on 27.09.2021.
//

import Foundation

public struct ObservableOptions: OptionSet, CustomStringConvertible {

    public static let initial = ObservableOptions(rawValue: 1 << 0)
    public static let old = ObservableOptions(rawValue: 1 << 1)
    public static let new = ObservableOptions(rawValue: 1 << 2)

    public var rawValue: Int

    public init(rawValue: Int) {
        self.rawValue = rawValue
    }
    
    public var description: String {
        switch self {
        case .initial:
            return "initial"
        case .old:
            return "old"
        case .new:
            return "new"
        default:
            return "ObservableOptions(rawValue: \(rawValue))"
        }
    }
}

public class Observable<T> {

    fileprivate class Callback {
        fileprivate weak var observer: AnyObject?
        fileprivate let options: [ObservableOptions]
        fileprivate let closure: (T, ObservableOptions) -> Void

        fileprivate init(observer: AnyObject,
                         options: [ObservableOptions],
                         closure: @escaping (T, ObservableOptions) -> Void) {
            self.observer = observer
            self.options = options
            self.closure = closure
        }
    }

    // MARK: - Properties
    public var value: T {
        didSet {
            removeNilObserverCallbacks()
            notifyCallbacks(value: oldValue, option: .old)
            notifyCallbacks(value: value, option: .new)
        }
    }

    // MARK: - Object Lifecycle
    public init(_ value: T) {
        self.value = value
    }

    // MARK: - Managing Observers
    private var callbacks: [Callback] = []

    public func addObserver(_ observer: AnyObject,
                            removeIfExists: Bool = true,
                            options: [ObservableOptions] = [.new],
                            closure: @escaping (T, ObservableOptions) -> Void) {
        if removeIfExists {
            removeObserver(observer)
        }

        let callback = Callback(observer: observer,
                                options: options,
                                closure: closure)
        callbacks.append(callback)

        if options.contains(.initial) {
            closure(value, .initial)
        }
    }
    public func removeObserver(_ observer: AnyObject) {
           callbacks = callbacks.filter { $0.observer !== observer }
       }

       // MARK: - Private

       private func removeNilObserverCallbacks() {
           callbacks = callbacks.filter { $0.observer != nil }
       }

       private func notifyCallbacks(value: T,
                                    option: ObservableOptions) {
           let callbacksToNotify = callbacks.filter {
               $0.options.contains(option)
           }
           callbacksToNotify.forEach { $0.closure(value, option) }
       }
   }
