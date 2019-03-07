//
//  ViewController.swift
//  Counter
//
//  Created by TOUYA KAWANO on 2019/02/28.
//  Copyright © 2019 Toya Kawano. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var countLabel: UILabel!
    
    private var viewModel: CounterViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel = CounterViewModel()
    }

    @IBAction func countUp(_ sender: UIButton) {
        viewModel.incrementCount(callBack: {[weak self] count in
            self?.updateCountLabel(count)
        })
    }
    
    @IBAction func countDown(_ sender: UIButton) {
        viewModel.decrementCount(callBack: {[weak self] count in
            self?.updateCountLabel(count)
        })
    }
    
    @IBAction func countReset(_ sender: UIButton) {
        viewModel.resetCount(callBack: {[weak self] count in
            self?.updateCountLabel(count)
        })
    }
    
    private func updateCountLabel(_ count: Int) {
        countLabel.text = String(count)
    }
    
}

