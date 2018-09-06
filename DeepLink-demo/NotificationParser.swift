//
//  NotificationParser.swift
//  DeepLink-demo
//
//  Created by NETBIZ on 10/08/18.
//  Copyright © 2018 Netbiz.in. All rights reserved.
//

import Foundation

class NotificationParser {
    static let shared = NotificationParser()
    private init() { }
    
    func handleNotification(_ userInfo: [AnyHashable : Any]) -> DeeplinkType? {
        if let data = userInfo["data"] as? [String: Any] {
            if let messageId = data["messageId"] as? String {
                return DeeplinkType.messages(.details(id: messageId))
            }
        }
        
        return nil
    }
}
