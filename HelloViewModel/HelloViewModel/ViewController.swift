//
//  ViewController.swift
//  HelloViewModel
//
//  Created by TOUYA KAWANO on 2019/02/28.
//  Copyright © 2019 Toya Kawano. All rights reserved.
//

import UIKit
import RxSwift

class ViewController: UIViewController {
    
    private let disposeBag = DisposeBag()
    private var viewModel: ViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        viewModel = ViewModel()
        
        viewModel.helloWorldObservable
            .subscribe(onNext: { [weak self] value in
                print("value = \(value)")
            })
            .disposed(by: disposeBag)
        
        viewModel.updateItem()
    }


}

