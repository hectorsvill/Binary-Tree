import Foundation

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
}

let root = Node(value: 0)
let left = Node(value: 1)
let right = Node(value: 2)
root.right = right
root.left = left
right.left = Node(value: 3)
right.right = Node(value: 4)
right.right?.right = Node(value: 6)

print("sum: \(root.sum)")
print("height: \(root.height)")
let value = 3
print("contains \(value) \(root.contains(value))")
root.printInOrder()

