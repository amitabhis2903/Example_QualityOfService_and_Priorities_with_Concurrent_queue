//
//  ViewController.swift
//  Example_QualityOfService_and_Priorities_with_Concurrent_queue
//
//  Created by Ammy Pandey on 14/08/17.
//  Copyright © 2017 Ammy Pandey. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var inactiveQueue: DispatchQueue!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        //qualtiyOfService()
        qualityOfservice2()
        if let queue = inactiveQueue{
            queue.activate()
        }
    }
    
    
    // Quality of service and priorities with class "userInteractive" with concurrent queue
    func qualtiyOfService(){
        let queue1 = DispatchQueue(label: "com.load.web", qos: DispatchQoS.userInteractive, attributes: DispatchQueue.Attributes.concurrent)
        
        queue1.async {
            for i in 1..<10{
                print("🚗",i)
            }
        }
        queue1.async {
            for i in 100..<110{
                print("🛵",i)
            }
        }
        queue1.async {
            for i in 1100..<1120{
                print("🚔",i)
            }
        }
    }

    
    // Quality of service and priorities concurrent queue and initalliyInactive
    
    func qualityOfservice2(){
        let anotherQueue2 = DispatchQueue(label: "com.load.web1", qos: .utility, attributes: [.concurrent, .initiallyInactive])
        inactiveQueue = anotherQueue2
        
        anotherQueue2.async {
            for i in 1..<10{
                print("🚗",i)
            }
        }
        anotherQueue2.async {
            for i in 100..<110{
                print("🛵",i)
            }
        }
        anotherQueue2.async {
            for i in 1100..<1120{
                print("🚔",i)
            }
        }

        
    }
    
}

