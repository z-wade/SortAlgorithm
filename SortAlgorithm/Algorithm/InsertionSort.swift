//
//  InsertionSort.swift
//  SortAlgorithm
//
//  Created by cjz on 2018/8/19.
//  Copyright © 2018年 ChenJunzhi. All rights reserved.
//

import UIKit


/// 直接插入排序
/// 把每个值插入当前有序的序列。

class InsertionSort: BaseAlgorithm {
    
    override func sort(array: inout [Int]) {
        for i in 1...array.count-1 {
            //在前面的有序组里面找到位置
            for j in 0..<i {
                if array[j] > array[i] {
                    let temp = array[i]
                    
                    var k = i
                    //数组向后移动
                    while k > j {
                        array[k] = array[k-1]
                        k = k - 1
                    }
                    array[j] = temp
                    break
                }
            }
        }
    }
    
}
