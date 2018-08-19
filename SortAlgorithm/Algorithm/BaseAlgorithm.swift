//
//  BaseAlgorithm.swift
//  SortAlgorithm
//
//  Created by cjz on 2018/8/19.
//  Copyright © 2018年 ChenJunzhi. All rights reserved.
//

import UIKit

class BaseAlgorithm {
    
    private var data: [Int]
    
    required init(array: [Int]? = nil) {
        if let a = array {
            self.data = a
        } else {
            data = {
                var result: [Int] = []
                for _ in 0...99 {
                    let random: Int = Int(arc4random() % 1000)
                    result.append(random)
                }
                return result
            }()
        }
    }
    
    //执行排序
    func run() {
        print("排序数量：\(data.count)")
        print(data)
        let beginTime = Date()
        sort(array: &data)
        let endTime = Date()
        let time = endTime.timeIntervalSince(beginTime) * 1000
        print(data)
        print("用时\(time)毫秒")
        let ver = verfication(array: data, isAsscendingOrder: true) ? "success" : "failure"
        print("验证结果：\(ver)")
    }
    
    func sort(array: inout [Int]) {
        
    }
    
    func verfication(array: [Int], isAsscendingOrder: Bool) -> Bool {
        if isAsscendingOrder {
            for i in 0..<array.count-1 {
                if array[i] > array[i+1] {
                    return false
                }
            }
        } else {
            for i in 0..<array.count-1 {
                if array[i] < array[i+1] {
                    return false
                }
            }
        }
        return true
    }
}
