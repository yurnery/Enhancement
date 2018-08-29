//
//  Notification-Observer.swift
//  Enhancement
//
//  Created by Weiwenshe on 2018/8/28.
//  Copyright © 2018 com.weiwenshe. All rights reserved.
//

import Foundation

public extension NotificationCenter {
    static func addObserver(forName name: NSNotification.Name?, object: Any?, queue: OperationQueue?, using closure: @escaping (Notification) -> Void) -> NotificationObserverManager {
        let observer = NotificationCenter.default.addObserver(forName: name, object: object, queue: queue, using: closure)
        return NotificationObserverManager(observer: observer)
    }
    func observer(forName name: NSNotification.Name?, object: Any?, queue: OperationQueue?, using closure: @escaping (Notification) -> Void) -> NotificationObserverManager {
        let observer = addObserver(forName: name, object: object, queue: queue, using: closure)
        return NotificationObserverManager(notificationCenter: self, observer: observer)
    }
    
}

public class NotificationObserverManager {
    private let observer: NSObjectProtocol
    private let notificationCenter: NotificationCenter
    init(notificationCenter: NotificationCenter = .default, observer: NSObjectProtocol) {
        self.observer = observer
        self.notificationCenter = notificationCenter
    }
    
    deinit {
        notificationCenter.removeObserver(observer)
    }
}
