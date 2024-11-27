//
//  QueueBootcamp.swift
//  
//
//  Created by C8V7P2 on 27/11/24.
//

public struct QueueBootcamp {
    public static func run() {
        let queue = Queue<Int>()
        queue.enQueue(1)
        queue.enQueue(2)
        queue.enQueue(3)
        queue.enQueue(4)

        print(queue.items)
        queue.deQueue()
        print(queue.items)

        print("XXXXXXXXXX")

        var queueWithStruct = QueueWithStruct<Int>()

        queueWithStruct.enQueue(1)
        queueWithStruct.enQueue(2)
        queueWithStruct.enQueue(3)
        queueWithStruct.enQueue(4)

        print(queueWithStruct.items)
        queueWithStruct.deQueue()
        print(queueWithStruct.items)

    }
}


//MARK: QUEUE(FIFO): Example -> Queue at Bank
class Queue<T> {
    var items: [T] = []
    
    func enQueue(_ item: T) {  // O(1)
        items.append(item)
    }
    
    func deQueue() { // O(n): because has to shift the array to one place.
        items.removeFirst()
    }
    
    var count: Int {
        items.count
    }
    
    var isEmpty: Bool {
        items.isEmpty
    }
}

struct QueueWithStruct<T> {
    var items: [T] = []
    
    mutating func enQueue(_ item: T) {
        items.append(item)
    }
    
    mutating func deQueue() {
        items.removeFirst()
    }
    
    var count: Int {
        items.count
    }
    
    var isEmpty: Bool {
        items.isEmpty
    }
}
