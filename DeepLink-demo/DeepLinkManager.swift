//
//  DeepLinkManager.swift
//  DeepLink-demo
//
//  Created by NETBIZ on 10/08/18.
//  Copyright © 2018 Netbiz.in. All rights reserved.
//
import Foundation
import UIKit

enum DeeplinkType {
    enum Messages {
        case root
        case details(id: String)
    }
    case messages(Messages)
    case activity
    case newListing
    case request(id: String)
}

let deepLinker = DeepLinkManager()

class DeepLinkManager {
    fileprivate init() {}
    
    private var deeplinkType: DeeplinkType?
    
    func handleRemoteNotification(_ notification: [AnyHashable: Any]) {
        deeplinkType = NotificationParser.shared.handleNotification(notification)
    }
    
    @discardableResult
    func handleShortcut(item: UIApplicationShortcutItem) -> Bool {
        deeplinkType = ShortcutParser.shared.handleShortcut(item)
        return deeplinkType != nil
    }
    
    @discardableResult
    func handleDeeplink(url: URL) -> Bool {
        deeplinkType = DeeplinkParser.shared.parseDeepLink(url)
        return deeplinkType != nil
    }
    
    // check existing deepling and perform action
    func checkDeepLink() {
        guard let deeplinkType = deeplinkType else {
            return
        }
        
        DeeplinkNavigator.shared.proceedToDeeplink(deeplinkType)
        
        // reset deeplink after handling
        self.deeplinkType = nil
    }
}

