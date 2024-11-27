//
//  LinkedList.swift
//
//
//  Created by C8V7P2 on 27/11/24.
//

public struct LinkedListBootcamp {
    public static func run() {
        //MARK: Simple LinkedList
        //        let node3 = Node(3)
        //        let node2 = Node(2, node3)
        //        let node1 = Node(1, node2)
        //        printNodes(node1)
        
        
        //MARK: LinkList Operations
        
        //let linkedList = LinkList()
        //linkedList.addFront(3)
        //linkedList.addFront(2)
        //linkedList.addFront(1)
        
        //linkedList.printLinkedList()
        //print(linkedList.getFirst()!)
        
        
        //linkedList.addFront(4)
        //linkedList.printLinkedList()
        //print(linkedList.getFirst()!)
        
        //linkedList.addLast(4)
        //linkedList.addFront(2)
        //linkedList.addLast(6)
        //linkedList.printLinkedList()
        //print(linkedList.getLast()!)
        //
        //linkedList.insert(at: 0, value: 20)
        //linkedList.insert(at: 4, value: 8)
        //linkedList.printLinkedList()
        //
        //linkedList.deleteFirst()
        //linkedList.printLinkedList()
        //
        //linkedList.deleteLast()
        //linkedList.printLinkedList()
        //
        //linkedList.addFront(20)
        //linkedList.addLast(30)
        //linkedList.addFront(22)
        //
        //linkedList.printLinkedList()
        //linkedList.delete(at: 6)
        //linkedList.printLinkedList()
        //
        //print(linkedList.isEmpty)
        //linkedList.clear()
        //linkedList.printLinkedList()
        //print(linkedList.isEmpty)
        
        let node6 = Node(6)
        let node5 = Node(5, node6)
        let node4 = Node(4, node5)
        let node3 = Node(3, node4)
        let node2 = Node(2, node3)
        let node1 = Node(1, node2)
        
        //print(length(nil))
        //print(length(node1))
        
        
        
        let node10 = Node(10, node4)
        let node9 = Node(9, node10)
        let node8 = Node(8, node9)
        let node7 = Node(7, node8)
        
        print("------")
        
        printNodes(node7)
        printNodes(node1)
        
        //print("Merge Point: \(findMergePointBrutForce(a: node1, b: node7))")
        
        //print("Merge Point: \(findMergePointSpaceTime(a: node1, b: node7))")
        
        //print("Merge Point: \(findMergePointInsightfulWithTimeAndSpacing(a: node1, b: node7))")
        
        print("Has Cycle ? : \(hasCycle(node1))")
        node6.next = node4
        print("Has Cycle ? : \(hasCycle(node1))")
    }
    
    static func printNodes(_ head: Node?) {
        guard let head else {
            return
        }
        var results = [Int]()
        var currentNode:Node? = head
        results.append(head.value)
        
        while currentNode?.next != nil {
            results.append(currentNode?.next?.value ?? 0)
            currentNode = currentNode?.next
        }
        
        print(results)
    }
}

class Node {
    let value: Int
    var next: Node?
    
    init(_ value: Int, _ next: Node? = nil) {
        self.value = value
        self.next = next
    }
}

class LinkList {
    var head: Node?
    
     func addFront(_ value: Int) {
        let newNode = Node(value)
        newNode.next = head
        head = newNode
    }
    
     func addLast(_ value: Int) {
        let newNode = Node(value)
        
        if head == nil {
            head = newNode
            return
        }
        
        var node = head!
        
        while node.next != nil {
            node = node.next!
        }
        
        node.next = newNode
    }
    
     func insert(at position: Int, value: Int) {
        if position == 0 {
            addFront(value)
            return
        }
        
        let newNode = Node(value)
        var currentNode = head
        
        for _ in 0..<position-1 {
            currentNode = currentNode?.next
        }
        
        newNode.next = currentNode?.next
        currentNode?.next = newNode
    }
    
     func deleteFirst() {
        head = head?.next
    }
    
     func deleteLast() {
        var nextNode = head
        var previousNode: Node?
        
        while nextNode?.next != nil {
            previousNode = nextNode
            nextNode = nextNode?.next
        }
        
        previousNode?.next = nil
    }
    
     func delete(at position: Int) {
        if position == 0 {
            deleteFirst()
            return
        }
        
        var nextNode = head
        var previousNode: Node?
        
        for _ in 0..<position {
            previousNode = nextNode
            nextNode = nextNode?.next
        }
        
        previousNode?.next = nextNode?.next
    }
    
     func getFirst() -> Int? {
        guard let head else {
            return nil
        }
        
        return head.value
    }
    
     func getLast() -> Int? {
        if head == nil {
            return nil
        }
        
        var node = head!
        
        while node.next != nil {
            node = node.next!
        }
        
        return node.value
    }
    
     func printLinkedList() {
        guard var head else { return }
        var results = [Int]()
        results.append(head.value)
        
        while head.next != nil {
            guard let nextNode = head.next else { return }
            results.append(nextNode.value)
            head = nextNode
        }
        
        print(results)
    }
    
     var isEmpty: Bool {
        head == nil
    }
    
     func clear() {
        head = nil
    }
}



//MARK: Linked List Interview Questions
//MARK: Question1 : Find the length of Linked List
func length(_ head: Node?) -> Int {
    // DO your work
    if head == nil  { return 0 }
    
    var count = 0
    var current = head
    
    while(current != nil) {
        count+=1
        current = current?.next
    }
    
    return count
}

//MARK: Question2: Find the Merge Point of two Nodes (Option1: Brutforce)
func findMergePointBrutForce(a: Node, b: Node) -> Int? { // O(n^2)
    let aLen = length(a)
    let bLen = length(b)
    
    print(aLen, bLen)
    
    var aCurrent: Node? = a
    
    for _ in 0..<aLen {
        var bCurrent: Node? = b
        for _ in 0..<bLen {
            print("a: \(aCurrent!.value),  b: \(bCurrent!.value)")
            bCurrent = bCurrent?.next
            
            if aCurrent?.value == bCurrent?.value {
                return aCurrent?.value
            }
        }
        
        aCurrent = aCurrent?.next
    }
    return nil
}

//MARK: Quetion:2: Find the Merge Point of two Nodes (Option2: Optimize performance not space)
func findMergePointSpaceTime(a: Node, b: Node) -> Int? {
    var aDictionary = [Int?: Bool]()
    var aHead:Node? = a
    var bHead:Node? = b
    let aLength = length(a)
    let bLength = length(b)
    
    for _ in 0..<aLength {
        aDictionary[aHead?.value] = true
        aHead = aHead?.next
    }
    
    for _ in 0..<bLength {
        if aDictionary[bHead?.value] == true {
            return bHead?.value
        }
        bHead = bHead?.next
    }
    
    return nil
}

//MARK: Quetion2: Find the Merge Point of two Nodes (Option2: Optimize performance & space)
func findMergePointInsightfulWithTimeAndSpacing(a:Node, b: Node) -> Int? {
    // Get Linked list length.
    let aLength = length(a)
    let bLength = length(b)
    
    var aHead: Node? = a
    var bHead:Node? = b
    
    //Swaping if the first array count is less than the second array
    if aLength < bLength {
        let temp = bHead
        bHead = aHead
        aHead = temp
    }
    
    let d = abs(aLength - bLength)
    
    
    for _ in 0..<d {
        aHead = aHead?.next
    }
    
    
    for _ in d..<aLength {
        let aValue = aHead?.value
        let bValue = bHead?.value
        
        if aValue == bValue {
            return aValue
        }
        
        aHead = aHead?.next
        bHead = bHead?.next
    }
    
    return nil
}

//MARK: Question3: Find does linked list has cycle. Use the Tortoise and Hare solution.
//Tortoise & Hare solution.
func hasCycle(_ head: Node?) -> Bool {
    var slow = head
    var fast = head
    
    while fast != nil && fast?.next != nil {
        slow = slow?.next
        fast = fast?.next?.next
        
        if slow?.value == fast?.value {
            return true
        }
    }
    
    return false
}

