//
//  ViewModel.swift
//  HelloViewModel
//
//  Created by TOUYA KAWANO on 2019/02/28.
//  Copyright © 2019 Toya Kawano. All rights reserved.
//

import Foundation
import RxSwift

class ViewModel {
    
    private let helloWorldSubject = PublishSubject<String>()
    
    var helloWorldObservable: Observable<String> {
        return helloWorldSubject.asObservable()
    }
    
    func updateItem() {
        helloWorldSubject.onNext("Hello World!")
        helloWorldSubject.onNext("Hello World!!")
        helloWorldSubject.onNext("Hello World!!!")
        helloWorldSubject.onCompleted()
    }
}
