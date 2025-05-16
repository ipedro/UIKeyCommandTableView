//
//  UIKeyCommand+Init.swift
//  UIKitOptions
//
//  Created by Pedro on 12.04.21.
//

import UIKit

// MARK: - Convenience Inits

public extension UIKeyCommand {
    /// Creates and returns a new key command object that matches the specified input and has a title.
    /// - Parameters:
    ///   - options: Options that describe the input keys, modifier flags, and discoverability title.
    ///   - action: The action method to execute on the responder object.
    @available(iOS 13.0, *)
    convenience init(_ options: Options, title: String, action: Selector) {
        self.init(
            title: title,
            image: options.image,
            action: action,
            input: options.input,
            modifierFlags: options.modifierFlags,
            discoverabilityTitle: options.discoverabilityTitle,
            attributes: options.menuAttributes,
            state: options.menuState
        )
    }
    
    /// Creates and returns a new key command object that matches the specified input and has a title.
    /// - Parameters:
    ///   - options: Options that describe the input keys, modifier flags, and discoverability title.
    ///   - action: The action method to execute on the responder object.
    convenience init(_ options: Options, action: Selector) {
        guard let discoverabilityTitle = options.discoverabilityTitle else {
            self.init(
                input: options.input,
                modifierFlags: options.modifierFlags,
                action: action
            )
            return
        }
        
        if #available(iOS 13.0, *) {
            self.init(
                title: discoverabilityTitle,
                image: options.image,
                action: action,
                input: options.input,
                modifierFlags: options.modifierFlags,
                discoverabilityTitle: discoverabilityTitle,
                attributes: options.menuAttributes,
                state: options.menuState
            )
        }
        else {
            self.init(
                input: options.input,
                modifierFlags: options.modifierFlags,
                action: action,
                discoverabilityTitle: discoverabilityTitle
            )
        }
    }
}
