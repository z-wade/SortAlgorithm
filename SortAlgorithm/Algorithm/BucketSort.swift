//
//  BucketSort.swift
//  SortAlgorithm
//
//  Created by cjz on 2018/12/4.
//  Copyright © 2018 ChenJunzhi. All rights reserved.
//

import UIKit

/**
 桶排序
 优化点：可以区间的值放到每一个桶里面，再对桶进行插入排序
 **/
class BucketSort: BaseAlgorithm {
    override func sort(array: inout [Int]) {
        var max: Int = 0
        var min: Int = 0
        for item in array {
            if item > max {
                max = item
            }
            
            if item < min {
                min = item
            }
        }
        
        let count = max - min + 1
        var buckList: [[Int]] = Array(repeating: [], count: count)
        
        for index in 0..<array.count {
            let value = array[index]
            var buck = buckList[value]
            buck.append(value)
            buckList[value] = buck
        }
        var tempArray: [Int] = []
        for buck in buckList {
            for item in buck {
                tempArray.append(item)
            }
        }
        array = tempArray
    }
}
