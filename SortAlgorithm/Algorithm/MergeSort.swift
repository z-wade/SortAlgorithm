//
//  MergeSort.swift
//  SortAlgorithm
//
//  Created by cjz on 2018/12/4.
//  Copyright © 2018 ChenJunzhi. All rights reserved.
//

import UIKit

class MergeSort: BaseAlgorithm {
    override func sort(array: inout [Int]) {
        sort(array: &array, left: 0, right: array.count-1)
    }
    
    private func sort(array: inout [Int], left: Int, right: Int){
        if left < right {
            let mid = (left + right) / 2
            sort(array: &array, left: left, right: mid)
            sort(array: &array, left: mid+1, right: right)
            merge(array: &array, left: left, right: right, mid: mid)
        }
    }
    
    private func merge(array: inout [Int], left: Int, right: Int, mid: Int){
        var temp: [Int] = []
        var i = left
        var j = mid + 1
        while i <= mid && j <= right {
            if array[i] < array[j] {
                temp.append(array[i])
                i += 1
            } else {
                temp.append(array[j])
                j += 1
            }
        }
        
        while i <= mid {
            temp.append(array[i])
            i += 1
        }
        
        while j <= right {
            temp.append(array[j])
            j += 1
        }
        
        var k = left
        var t = 0
        while k <= right {
            array[k] = temp[t]
            k += 1
            t += 1
        }
        
    }
}
