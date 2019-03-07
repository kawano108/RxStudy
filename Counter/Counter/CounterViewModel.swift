//
//  CounterViewModel.swift
//  Counter
//
//  Created by TOUYA KAWANO on 2019/02/28.
//  Copyright © 2019 Toya Kawano. All rights reserved.
//

class CounterViewModel {
    private(set) var count = 0
    
    func incrementCount(callBack: (Int) -> ()) {
        count += 1
        callBack(count)
    }
    func decrementCount(callBack: (Int) -> () ) {
        count -= 1
        callBack(count)
    }
    
    func resetCount(callBack: (Int) -> ()) {
        count = 0
        callBack(count)
    }
}
