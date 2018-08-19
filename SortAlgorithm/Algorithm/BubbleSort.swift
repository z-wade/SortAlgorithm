//
//  BubbleSort.swift
//  SortAlgorithm
//
//  Created by cjz on 2018/8/19.
//  Copyright © 2018年 ChenJunzhi. All rights reserved.
//

import UIKit

class BubbleSort: BaseAlgorithm {
    
    
    override func sort(array: inout [Int]) {
        for i in 0..<array.count {
            for j in 0..<array.count-1-i {
                if array[j] > array[j+1] {
                    let temp = array[j]
                    array[j] = array[j+1]
                    array[j+1] = temp
                }
            }
        }
    }
}
