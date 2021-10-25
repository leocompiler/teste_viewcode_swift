//
//  DynamicValue.swift
//  TesteViewCode
//
//  Created by LEONARDO A SILVEIRA on 21/10/21.
//

import Foundation

class DynamicValue<T> {
    
    typealias CompletionHandler = ((T) -> Void)
        
    
    var value : T {
        didSet {
            self.notify()
        }
    }
     
    
    private var observers = [String : CompletionHandler]()
    init(_ value : T) {
        self.value = value
    }
    
    public func addObserver(_ observer: NSObject, completionHandler: @escaping CompletionHandler) {
        observers[observer.description] = completionHandler
    }
    
    public func addAndNotify(observer: NSObject, completionHandler: @escaping CompletionHandler) {
        self.addObserver(observer, completionHandler: completionHandler)
        self.notify()
    }
    
    private func notify() {
        observers.forEach({ $0.value(value) })
    }
    
    deinit {
        observers.removeAll()
    }
}
