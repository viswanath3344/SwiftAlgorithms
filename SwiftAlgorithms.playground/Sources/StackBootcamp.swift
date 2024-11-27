//
//  StackBootcamp.swift
//
//
//  Created by C8V7P2 on 27/11/24.
//

public struct StackBootcamp {
    public static func run() {
        let stack = Stack<Int>()
        stack.push(1)
        stack.push(2)
        stack.push(3)

        print(stack.items)
        stack.pop()

        print(stack.items)

        print("XXXXXXXXXXXX")

        var stackWithStruct = StackWithStruct<Int>()
        stackWithStruct.push(1)
        stackWithStruct.push(2)
        stackWithStruct.push(3)

        print(stackWithStruct.items)
        stackWithStruct.pop()

        print(stackWithStruct.items)

    }
}


//MARK: STACK(LIFO) : Example -> plates arrange: Which is in last goes first
class Stack<T> {
    var items: [T] = []
    
    func push(_ item: T) { // O(1)
        items.append(item)
    }
    
    func pop() {   // O(1)
        items.removeLast()
    }
    
    var count: Int {
        items.count
    }
    
    var isEmpty: Bool {
        items.isEmpty
    }
}


struct StackWithStruct<T> {
    var items: [T] = []
    
    mutating func push(_ item: T) { // O(1)
        items.append(item)
    }
    
    mutating func pop() {   // O(1)
        items.removeLast()
    }
    
    var count: Int {
        items.count
    }
    
    var isEmpty: Bool {
        items.isEmpty
    }
}

