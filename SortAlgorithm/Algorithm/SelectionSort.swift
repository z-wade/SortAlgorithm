//
//  SelectionSort.swift
//  SortAlgorithm
//
//  Created by cjz on 2018/8/19.
//  Copyright © 2018年 ChenJunzhi. All rights reserved.
//

import UIKit

/**
 选择排序（Selection sort）是一种简单直观的排序算法。它的工作原理如下。首先在未排序序列中找到最小（大）元素，存放到排序序列的起始位置，然后，再从剩余未排序元素中继续寻找最小（大）元素，然后放到已排序序列的末尾。以此类推，直到所有元素均排序完毕。
 选择排序的主要优点与数据移动有关。如果某个元素位于正确的最终位置上，则它不会被移动。选择排序每次交换一对元素，它们当中至少有一个将被移到其最终位置上，因此对 {\displaystyle n} n个元素的表进行排序总共进行至多 {\displaystyle n-1} {\displaystyle n-1}次交换。在所有的完全依靠交换去移动元素的排序方法中，选择排序属于非常好的一种。
 Tips:这个算法极其不稳定
 **/
class SelectionSort: BaseAlgorithm {
    
    override func sort(array: inout [Int]) {
        
        //跟冒泡的最大区别：不需要每次都交换数据的位置，而是留到最后查找到最小值再交换数据的位置
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
