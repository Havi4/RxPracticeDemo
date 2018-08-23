//
//  ViewController.swift
//  RxSwiftPrctice
//
//  Created by Li, Havi X. -ND on 7/22/18.
//  Copyright © 2018 Li, Havi X. -ND. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class ViewController: UIViewController {
    
    let disposeBag = DisposeBag()
    
    
    lazy var tableView: UITableView = {
        let table = UITableView.init(frame: self.view.frame, style: UITableViewStyle.plain)
        table.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")

        return table
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        view.addSubview(tableView)
        bindTableView()
        let dic = ["isDeatult":"0"]
        if let isDefault = dic["isDeatult"], isDefault == "0" {
            print("yes")
        }
        
        let a = [1, 2, 3, 4, 5]
        for x in a.dropLast(2) {
            
        }
        let idx = a.index { (num) -> Bool in
            num == 2
        }
        
    }
    
    func bindTableView() {
        let items = Observable.just(["DayOneViewController","DayTwoViewController","DayThreeController"].map {"\($0)" })
        
        items
            .bind(to: tableView.rx.items(cellIdentifier: "Cell", cellType: UITableViewCell.self)){ (row, element, cell) in
                cell.textLabel?.text = "\(element)"
            }
            .disposed(by: disposeBag)
        
        tableView.rx
            .modelSelected(String.self).subscribe(onNext: {
                print("tap index: \($0)")
                guard let clsName = Bundle.main.infoDictionary!["CFBundleExecutable"] else {
                        print("命名空间不存在")
                        return
                }
                let cls : AnyClass? = NSClassFromString((clsName as! String) + "." + $0)
                let viewController = cls as? UIViewController.Type
                self.navigationController?.pushViewController(viewController!.init(), animated: true)
            })
            .disposed(by: disposeBag)
    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        let dic = ["isDeatult":"0"]
        if let isDefault = dic["isDeatult"], isDefault == "0" {
            
        }
    }


}

extension ViewController: RangeExpression {
    
}

extension ViewController: IteratorProtocol {
    
}

