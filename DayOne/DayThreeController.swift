//
//  DayThreeController.swift
//  RxSwiftPrctice
//
//  Created by Li, Havi X. -ND on 8/12/18.
//  Copyright © 2018 Li, Havi X. -ND. All rights reserved.
//

import Foundation
import UIKit

class DayThreeController: UIViewController {
    
    init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        view.backgroundColor = UIColor.white
        let name = ["havi","wang","lwenqiangd"]
        let a = name.last { $0.hasPrefix("h") }
        print(a)
        let aNumArr = [0, 1, 2, 3, 5]
        let aSum = aNumArr.reduce(0) { (result, num) -> Int in
            result + num
        }
        print("sum:\(aSum)")
        aNumArr.indices
        (1..<10).forEach{ num in
            print(num)
            if num > 2 { return }
            print("af\(num)")
        }
        let slice = aNumArr[3...]
        print("\(slice)type:")
        let aSequence = [1, 2, 3, 4, 5, 6]
        let aSet: Set = [1]
        let a : IndexSet
    }
}

extension Array where Element: Equatable {
    func last(where prediate: (Element) -> Bool) -> Element? {
        for element in reversed() where prediate(element) {
            return element
        }
        return nil
    }
    
    func index_forEach(of element: Element) -> Int? {
        self.indices.filter { idx in
            self[idx] == element
        }.forEach { $0 }
        return nil
    }
}


