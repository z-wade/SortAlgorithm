//
//  SelectionSort.swift
//  SortAlgorithm
//
//  Created by cjz on 2018/8/19.
//  Copyright © 2018年 ChenJunzhi. All rights reserved.
//

import UIKit

class SelectionSort: BaseAlgorithm {
    
    override func sort(array: inout [Int]) {
//        for i in 0...array.count-1 {
//            for j in i+1..<array.count {
//                if array[i] > array[j] {
//                    let temp = array[i]
//                    array[i] = array[j]
//                    array[j] = temp
//                }
//            }
//        }
        
        //优化版本一
        for i in 0...array.count-1 {
            var minIndex = i
            for j in i+1..<array.count {
                if array[minIndex] > array[j] {
                    minIndex = j
                }
            }
            
            if minIndex != i {
                let temp = array[i]
                array[i] = array[minIndex]
                array[minIndex] = temp
            }
        }
    }
    
}
