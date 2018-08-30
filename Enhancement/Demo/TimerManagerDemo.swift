//
//  TimerManagerDemo.swift
//  Demo
//
//  Created by Weiwenshe on 2018/8/30.
//  Copyright © 2018 com.weiwenshe. All rights reserved.
//

import UIKit
import Enhancement

class TimerDemo: UIViewController {
    var timer: Timer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        config(backgroundColor: .white, title: "native timer")
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(task), userInfo: nil, repeats: true)
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let vc = TimerManagerDemo()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc func task() {
        print("native timer task")
    }
    
    deinit {
        timer?.invalidate()
    }

}

class TimerManagerDemo: UIViewController {
    var timer: TimerManager?

    override func viewDidLoad() {
        super.viewDidLoad()
        config(backgroundColor: .red, title: "timermanager timer")
        timer = TimerManager(timeInterval: 1, target: self, selector: #selector(task), userInfo: nil, repeats: true)
    }
    
    @objc func task() {
        print("TimerManagerDemo timer task")
    }
}
