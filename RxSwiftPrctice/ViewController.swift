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
    }
    
    func bindTableView() {
        let items = Observable.just(["DayOneController"].map {"\($0)" })
        
        items
            .bind(to: tableView.rx.items(cellIdentifier: "Cell", cellType: UITableViewCell.self)){ (row, element, cell) in
                cell.textLabel?.text = "\(element)"
            }
            .disposed(by: disposeBag)
        
        tableView.rx
            .modelSelected(String.self).subscribe(onNext: {
                print("tap index: \($0)")
                let viewController = DayOneViewController()
                self.navigationController?.pushViewController(viewController, animated: true)
            })
            .disposed(by: disposeBag)
    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

