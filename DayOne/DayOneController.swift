//
//  DayOneController.swift
//  RxSwiftPrctice
//
//  Created by Li, Havi X. -ND on 7/24/18.
//  Copyright © 2018 Li, Havi X. -ND. All rights reserved.
//

import Foundation
import UIKit
import RxCocoa
import RxSwift

class DayOneViewController: UIViewController {
    
    lazy var tapButton: UIButton = {
        let button = UIButton.init(type: UIButtonType.custom)
        button.frame = CGRect.init(x: 50, y: 100, width: 200, height: 44)
        button.setTitle("tapedMe", for: UIControlState.normal)
        button.setTitleColor(UIColor.red, for: UIControlState.normal)
        return button
    }()
    
    lazy var resetButton: UIButton = {
        let button = UIButton.init(type: UIButtonType.custom)
        button.frame = CGRect.init(x: 50, y: 155, width: 200, height: 44)
        button.setTitle("reset", for: UIControlState.normal)
        button.setTitleColor(UIColor.red, for: UIControlState.normal)
        return button
    }()
    
    lazy var numberLabel: UILabel = {
        let label = UILabel()
        label.frame = CGRect.init(x: 50, y: 205, width: 200, height: 44)
        return label
    }()
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    
    init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        view.backgroundColor = UIColor.white
        view.addSubview(tapButton)
        view.addSubview(resetButton)
        view.addSubview(numberLabel)
        bindRxData()
    }
    
    func bindRxData() {
        _ = tapButton.rx.tap.subscribe { [weak self] (event) in
            guard let strongSelf = self else {
                return
            }
            
            guard let text = strongSelf.numberLabel.text else {
                return
            }
            guard let number = Int(text) else {
                return
            }
            
            strongSelf.numberLabel.text = String(number+1)
        }
        
        _ = resetButton.rx.tap.subscribe({ [weak self] (event) in
            guard let strongSelf = self else {
                return
            }
            strongSelf.numberLabel.text = "0"
        })
        
    }
    
}
