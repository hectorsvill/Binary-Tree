import UIKit

class Node {
    var value: Int
    var left: Node?
    var right: Node?
    
    init(value: Int) {
        self.value = value
    }
    
    var sum: Int {
        return getSum(self)
    }
    
    private func getSum(_ node: Node?) -> Int {
        if node == nil {
            return 0
        } else {
            return node!.value + getSum(node?.left) + getSum(node?.right)
        }
    }
    
    var height: Int {
        return getHeight(self)
    }
    
    private func getHeight(_ node: Node?) -> Int {
        var leftTotal = 0
        var rightTotal = 0
        
        if node == nil {
            return 0
        } else {
            leftTotal = getHeight(node?.left)
            rightTotal = getHeight(node?.right)
            
            if leftTotal >  rightTotal {
                return leftTotal + 1
            } else {
                return rightTotal + 1
            }
        }
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
