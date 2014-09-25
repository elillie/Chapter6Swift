//
//  main.swift
//  Chapter6Swift
//
//  Created by Ethan Lillie on 9/22/14.
//  Copyright (c) 2014 Algorithms. All rights reserved.
//

import Foundation

println("Hello, World!")

class Heap{
    var array = [Int]()
    var heapSize = 0
    init (array anArray: [Int]) {
        array = anArray
        heapSize = anArray.count
        println("heapSize is now \(heapSize)")
    }
}

func exchange<T>(data:[T], i:Int, j:Int) -> [T]
{
    var newData = data
    newData[i] = data[j]
    newData[j] = data[i]
    return newData
}

func parent(i: Int) -> (j: Int)
{
    return (i+1)/2;
}

func left(i: Int) -> (j: Int)
{
    return 2*i
}

func right(i: Int) -> (j: Int)
{
    return 2*i + 1
}

func maxHeapify(A: Heap, i: Int)
{
    println(A.array)
    var l = left(i)
    var r = right(i)
    var largest = Int()
    if l < A.heapSize && A.array[l] > A.array[i]
    {
        largest = l
    }else {
        largest = i
    }
    if r < A.heapSize && A.array[r] > A.array[largest]
    {
        largest = r
    }
    if largest != i
    {
        A.array = exchange(A.array,i,largest)
        maxHeapify(A, largest)
    }
}

func buildMaxHeap(A:Heap)
{
    for i in 0..<Int(A.array.count)/2
        {
            var j = Int(A.array.count/2)-i-1
            maxHeapify(A, j)
        }
}
func heapSort(A:Heap)
{
    for i in 1...A.array.count{
        j = A.array.count - i
        A.array = exchange(A.array, 0, j)
        A.heapSize--
        maxHeapify(A, 0)
    }
}
func heapMaximum(A: Heap) -> Int
{
    return A.array[1]
}

func heapExtractMax(A: Heap) -> Int
{
    assert(A.heapSize >= 1, "You din fucked up bruh")
    var max = A.array[1]
    A.array[1] = A.array[A.heapSize]
    A.heapSize--
    maxHeapify(A, 1)
    return max
}
func heapIncreaseKey(A: Heap, i: Int, key: Int)
{
    assert(key>=A.array[i], "new key smallah!")
    A.array[i] = key
    var j = i
    while j>1 && A.array[parent(j)] < A.array[j] {
        exchange(A.array, parent(j), j)
        j = parent(j)
    }
}
func maxHeapInsert(A: Heap, key: Int)
{
    A.heapSize = A.heapSize + 1
    A.array.append(NSIntegerMax * -1)
    heapIncreaseKey(A, A.heapSize-1, key)
}


var j = parent(4)
println(j)

var A = [3,10,9,8,7,6,5,4,3,2,1]
var heap = Heap(array:A)

maxHeapify(heap, 0)
println(heap.array)

var C = [Int]()

var i = 0

while i < 100 {
    C.append(Int(arc4random())%100)
    i++
}

heap = Heap(array: C)
buildMaxHeap(heap)
println(heap.array)

//heapSort(heap)
println(heap.array)

maxHeapInsert(heap, 6)

println(heap.array)

