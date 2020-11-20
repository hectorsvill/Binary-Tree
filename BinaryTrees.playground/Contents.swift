import Foundation
import XCTest

class Node {
    var value: Int
    var left: Node?
    var right: Node?
    
    init(value: Int) {
        self.value = value
    }
    
    var sum: Int {
        return value + (right?.sum ?? 0) + (left?.sum ?? 0)
    }
    
    var height: Int {
        var leftTotal = 0
        var rightTotal = 0
        
        leftTotal = (left?.height ?? 0)
        rightTotal = (right?.height ?? 0)
        
        if leftTotal > rightTotal {
            return leftTotal + 1
        } else {
            return rightTotal + 1
        }
    }
    
    var leafCount: Int {
        if left == nil && right == nil {
            return 1
        } else {
            return (left?.leafCount ?? 0) + (right?.leafCount ?? 0)
        }
    }
    
    func contains(_ item: Int) -> Bool {
        if value == item {
            return true
        }
        
        return right?.contains(item) ?? false || left?.contains(item) ?? false
    }
    
    func printInOrder() {
        print(value)
        right?.printInOrder()
        left?.printInOrder()
    }
    
    func printPostOrder() {
        print(value)
        left?.printInOrder()
        right?.printInOrder()
    }
}
let root = Node(value: 0)
let left = Node(value: 1)
let right = Node(value: 2)
root.right = right
root.left = left

root.left?.left = Node(value: 5)
root.left?.left?.right = Node(value: 7)

root.left?.left?.right?.left = Node(value: 8)
root.left?.left?.right?.right = Node(value: 9)
root.left?.left?.right?.right?.right = Node(value: 10)

right.left = Node(value: 3)
right.right = Node(value: 4)
right.right?.right = Node(value: 6)


let targetSum = 55
XCTAssertEqual(root.sum, targetSum, "root.sum != \(targetSum)")


let targetHeight = 6
XCTAssertEqual(root.height, targetHeight, "root.height != \(targetHeight)")

let targetNumber = 10
XCTAssertEqual(root.contains(10), true, "root.contains != \(targetNumber)")

let targetLeafCount = 4
XCTAssertEqual(root.leafCount, 4, "root.leafCount != \(targetLeafCount)")

//root.printInOrder()
//root.printPostOrder()
