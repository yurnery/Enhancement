//
//  Notification-ObserverDemo.swift
//  Demo
//
//  Created by Weiwenshe on 2018/8/29.
//  Copyright © 2018 com.weiwenshe. All rights reserved.
//

import UIKit

class NotificationObserverDemo: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        config(backgroundColor: .white, title: "Notification")
        
        let button = UIButton(frame: CGRect(x: 100, y: 100, width: 100, height: 100))
        button.backgroundColor = .red
        button.setTitle("send notification", for: .normal)
        view.addSubview(button)
        button.addTarget(self, action: #selector(sendNotification), for: .touchUpInside)
    }
    
    @objc func sendNotification () {
        NotificationCenter.default.post(name: .testNotification, object: nil)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let vc = A()
        navigationController?.pushViewController(vc, animated: true)
    }
    
}

class A: UIViewController {
    var observer: Any?
    var observer1: Any?
    override func viewDidLoad() {
        super.viewDidLoad()
        config(backgroundColor: .red, title: "CLASS A")
        
        observer = NotificationCenter.addObserver(forName: .testNotification, object: nil, queue: nil) {[unowned self] (_) in
            print("recieve notification")
            print(self)
        }
        
        observer1 = NotificationCenter.default.observer(forName: .testNotification, object: nil, queue: nil) {[unowned self] (_) in
            print("observer1 recieve notification")
            print("observer1", self)
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let vc = B()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    deinit {
        print("class A deinit 😆😆😆😆")
    }
    
    
}

class B: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        config(backgroundColor: .yellow, title: "CLASS B")
        NotificationCenter.default.post(name: .testNotification, object: nil)
    }
}

extension UIViewController {
    func config(backgroundColor: UIColor, title: String) {
        view.backgroundColor = backgroundColor
        self.title = title
    }
}

extension NSNotification.Name {
    static var testNotification: NSNotification.Name {
        return NSNotification.Name("testNotification")
    }
}
