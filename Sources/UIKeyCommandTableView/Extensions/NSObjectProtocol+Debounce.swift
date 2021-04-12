//
//  NSObjectProtocol+Debounce.swift
//  UIKeyCommandTableView
//
//  Created by Pedro Almeida on 15.10.20.
//

import Foundation

extension NSObjectProtocol where Self: NSObject {
    func debounce(_ aSelector: Selector, after delay: TimeInterval, object: Any? = nil) {
        Self.cancelPreviousPerformRequests(
            withTarget: self,
            selector: aSelector,
            object: object
        )
        
        perform(aSelector, with: object, afterDelay: delay)
    }
}
