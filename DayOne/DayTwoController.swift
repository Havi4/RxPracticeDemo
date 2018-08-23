//
//  DayTwoController.swift
//  RxSwiftPrctice
//
//  Created by Li, Havi X. -ND on 7/28/18.
//  Copyright © 2018 Li, Havi X. -ND. All rights reserved.
//

import Foundation
import UIKit

class DayTwoViewController: UIViewController {
    
    init() {
        super.init(nibName: nil, bundle: nil)
        testSynchronous()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func testSynchronous() {
        var array = [1, 2, 3]
        print(array)
        for var number in array {
            number = number + 1
            print(number)
            array = [4,5,6]
        }
        
        print(array)
    }
    
    func testAsy() {
        var array = [1, 2, 3]
        var currentIndex = 0
        
        func printNext(_ sender: Any) {
            print(array[currentIndex])
            if currentIndex != array.count - 1 {
                currentIndex += 1
            }
        }
    }
    
}
