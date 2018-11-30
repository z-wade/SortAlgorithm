//
//  QuickSort.swift
//  SortAlgorithm
//
//  Created by cjz on 2018/9/4.
//  Copyright © 2018年 ChenJunzhi. All rights reserved.
//

import UIKit

class QuickSort: BaseAlgorithm {
    
    override func sort(array: inout [Int]) {
//        quickSort1(array: &array, left: 0, right: array.count - 1)
        quickSort2(array: &array, left: 0, right: array.count - 1)
    }
    
    
    private func quickSort2(array: inout [Int], left: Int, right: Int) {
        if left > right {
            return
        }
        
        let index = partition2(array: &array, left: left, right: right)
        quickSort2(array: &array, left: left, right: index-1)
        quickSort2(array: &array, left: index+1, right: right)
    }
    
    
    /// 左右指针法：
    /// 1、从左边找第一个大于基准值的位置，
    /// 2、从右边找到第一个小于基准值的位置
    /// 3、交换左右两边找到的位置
    /// 4、重复查找2、3，直接两指针相遇
    /// 5、比较指针所在的值和基准值，基准值比较大时，则直接交换位置。否则，交换指针-1的位置
    private func partition2(array: inout [Int], left: Int, right: Int) -> Int {
        var i = left
        var j = right
        let temp = array[left]
        while i < j {
            
            while i < j && temp <= array[j] {
                j = j - 1
            }
            
            while i < j &&  temp >= array[i] {
                i = i + 1
            }

            if i < j {
                let a = array[i]
                array[i] = array[j]
                array[j] = a
            }
        }
        
        array[left] = array[i]
        array[i] = temp
        
        return i
    }
    
    
    private func quickSort1(array: inout [Int], left: Int,right: Int) {
        if left > right {
            return
        }
        let index = partition1(array: &array, left: left, right: right)
        quickSort1(array: &array, left: left, right: index - 1)
        quickSort1(array: &array, left: index + 1, right: right)
    }
    
    
    /// 挖坑法，取出基准值(取最左边的值)，基准值留出一个位置。
    /// 1、先从右找起，把第一个比基准值小的值填入基准值原来的位置。同理，这里就留出一个位置
    /// 2、再从左边向右找，把第一个大于基准值的值填入1中留出的位置。
    /// 1与2重复多次，直到左右的值和右边的值一样，结束分值。基准值填入i/j所在的位置,两者位置相等
    ///
    private func partition1(array: inout [Int], left: Int,right: Int) -> Int {
        var i = left
        var j = right
        let tmp = array[left] //取最左边的数值为基准
        while (i < j) {
            //从右边向左边找起，和第一个比基准小的值交换位置(把小的放到前面)
            while (i < j && array[j] > tmp) {
                j = j - 1
            }
            if (i < j) {
                array[i] = array[j]
                i = i + 1
            }
            
            while (i < j && array[i] < tmp) {
                i = i + 1
            }
            
            if (i < j) {
                array[j] = array[i]
                j = j - 1
            }
        }
        array[i] = tmp;
        return i;
    }
}
