//
//  MergeSort.swift
//  SortAlgorithm
//
//  Created by cjz on 2018/12/4.
//  Copyright © 2018 ChenJunzhi. All rights reserved.
//

import UIKit
/**
 归并排序（MERGE-SORT）是利用归并的思想实现的排序方法，该算法采用经典的分治（divide-and-conquer）策略（分治法将问题分(divide)成一些小的问题然后递归求解，而治(conquer)的阶段则将分的阶段得到的各答案"修补"在一起，即分而治之)。
 **/
class MergeSort: BaseAlgorithm {
    
    override func sort(array: inout [Int]) {
        RecursiveImpl.sort(array: &array, left: 0, right: array.count-1)
    }
    
    /** 迭代法 Bottom-up
     **/
    class bottomUpImpl {
        //TODO
    }
    
    /**递归实现 Top-down
     申请空间，使其大小为两个已经排序序列之和，该空间用来存放合并后的序列
     设定两个指针，最初位置分别为两个已经排序序列的起始位置
     比较两个指针所指向的元素，选择相对小的元素放入到合并空间，并移动指针到下一位置
     重复步骤3直到某一指针到达序列尾
     将另一序列剩下的所有元素直接复制到合并序列尾
     **/
    class RecursiveImpl {
        static fileprivate func sort(array: inout [Int], left: Int, right: Int){
            if left < right {
                let mid = (left + right) / 2
                sort(array: &array, left: left, right: mid)
                sort(array: &array, left: mid+1, right: right)
                merge(array: &array, left: left, right: right, mid: mid)
            }
        }
        
        static private func merge(array: inout [Int], left: Int, right: Int, mid: Int){
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
}
