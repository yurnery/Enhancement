//
//  Timer-TaskManager.swift
//  Enhancement
//
//  Created by Weiwenshe on 2018/8/29.
//  Copyright © 2018 com.weiwenshe. All rights reserved.
//

import Foundation

/// 用来管理定时器任务:
/// 例如一个页面需要使用一个定时器, 需要在其退出页面的时候进行移除定时器, 普通在定时器页面 deinit 里移除是没用的, 因为不会执行 deinit 方法, timer 和 vc互相持有
public class TimerManager {
    private weak var  target: AnyObject?
    private let selector: Selector
    private var timer: Timer?
    private var result: Unmanaged<AnyObject>? = nil
    
    public init(timeInterval: TimeInterval, target: AnyObject, selector: Selector, userInfo: Any? = nil, repeats: Bool = true) {
        self.target = target
        self.selector = selector
        self.timer = Timer.scheduledTimer(timeInterval: timeInterval, target: self, selector: #selector(task), userInfo: userInfo, repeats: repeats)
    }
    
    @objc private func task() {
        target?.perform(selector)
    }
    
    public func stop() {
        timer?.invalidate()
        timer = nil
    }
}
