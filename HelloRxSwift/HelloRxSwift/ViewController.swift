//
//  ViewController.swift
//  HelloRxSwift
//
//  Created by TOUYA KAWANO on 2019/02/27.
//  Copyright © 2019 Toya Kawano. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class ViewController: UIViewController {
    private let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        /// Subjectを定義する
        let helloWorldSubject = PublishSubject<String>()
        
        // Subjectを購読
        helloWorldSubject
            // onNextの処理を定義
            .subscribe(onNext: { message in
                // onNextにの引数に<String>のエレメントを渡された時、共通処理であるprintを行う
                print("onNext: \(message)")
            }, onCompleted: {
                print("onCompleted")
            }, onDisposed: {
                print("onDisposed")
            })
            .disposed(by: disposeBag)
        
        // イベントの実行
        helloWorldSubject.onNext("Hello World!")
        helloWorldSubject.onNext("Hello World!!")
        helloWorldSubject.onNext("Hello World!!!")
        helloWorldSubject.onCompleted()
    }
}



