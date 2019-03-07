//
//  ViewController.swift
//  RxCounter
//
//  Created by TOUYA KAWANO on 2019/03/05.
//  Copyright © 2019 Toya Kawano. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class ViewController: UIViewController {

    @IBOutlet weak var countLabel: UILabel!
    @IBOutlet weak var countUpButton: UIButton!
    @IBOutlet weak var countDownButton: UIButton!
    @IBOutlet weak var countRestButton: UIButton!
    
    let disposeBag = DisposeBag()
    
    private var viewModel: CounterRxViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViewModel()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    private func setupViewModel() {
        viewModel = CounterRxViewModel()
        let input = CounterViewModelInput (
            countUpButton: countUpButton.rx.tap.asObservable(),
            countDownButton: countDownButton.rx.tap.asObservable(),
            counterResetButton: countRestButton.rx.tap.asObservable()
        )
        viewModel.setup(input: input)
        viewModel.outputs?.counterText
            .drive(countLabel.rx.text)
            .disposed(by: disposeBag)
    }
}

