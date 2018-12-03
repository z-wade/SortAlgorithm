//
//  ShellSort.swift
//  SortAlgorithm
//
//  Created by cjz on 2018/12/3.
//  Copyright © 2018 ChenJunzhi. All rights reserved.
//

import UIKit

/**
 希尔排序
 希尔排序是把记录按下标的一定增量分组，对每组使用直接插入排序算法排序；随着增量逐渐减少，每组包含的关键词越来越多，当增量减至1时，整个文件恰被分成一组，算法便终止。
 
 例如：[8,9,1,7,2,3,5,4,6,0]
 一开始增是 gap = length/2 = 5 ，
      所以整个数组可分为5数组：
        [8,3]
        [9,5]
        [1,4]
        [7,6]
        [2,0]
    对上面的每一个小数组进行插入排序得到的结果是
        [3,8]
        [5,9]
        [1,4]
        [6,7]
        [0,2]
    对应的原来数组就是 [3,5,1,6,0,8,9,4,7,2]，此时gap = gap / 2 = 2
    所以又产生了两个数组：
        [3,1,0,9,7]
        [5,6,8,4,2]
    对上面两数组排序就：
        [0,1,3,9,7]
        [2,4,5,6,8]
    在原来的数组上实际是：
    [0,2,1,4,3,5,7,6,9,8]，此时的gap = gap/2 = 1
    上面这个数组，几乎排好了，使用插入排序是较快的
 
 **/
class ShellSort: BaseAlgorithm {
    
    override func sort(array: inout [Int]) {
        shellSort(array: &array)
    }
    
    private func shellSort(array: inout [Int]) {
        var setp: Int = array.count / 2
        while setp >= 1 {
            
            var i = setp
            while i < array.count {
                
                var j = i - setp
                let temp = array[i]
                while j >= 0 && array[j] > temp {
                    array[j+setp] = array[j]
                    j = j - setp
                }
                array[j + setp] = temp
                
                i += 1
            }
            
            setp = setp / 2
        }
    }
    
}
