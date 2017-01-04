//Linked List
indirect enum LinkList<T: Comparable> where T: CustomStringConvertible {
    case empty
    case node(T, LinkList)
    
    var isEmpty: Bool {
        switch self {
        case .node(_, _):
            return false
        case .empty:
            return true
        }
    }
    
    func swapPairs() -> LinkList {
        guard case let .node(value1, next1) = self, case let .node(value2, next2) = next1 else {
            return self
        }
        return LinkList.node(value2, .node(value1, next2.swapPairs()))
    }

    func printList() {
        var toPrint = self
        var isEmpty = false
        while !isEmpty {
            switch toPrint {
            case let .node(value, next):
                print(value)
                toPrint = next
            case .empty:
                print("\r\n")
                isEmpty = true
            }
        }
    }
    
    func reversed() -> LinkList {
        var reversed = LinkList.empty
        var original = self
        var isEmpty = false
        while !isEmpty {
            switch original {
            case let .node(value, next):
                reversed = LinkList.node(value, reversed)
                original = next
            case .empty:
                isEmpty = true
            }
        }
        return reversed
    }
    
    //	func merge(list: LinkList) {
    //
    //	}
    
    mutating func remove(at indexFromEnd: Int) {
        var reversed = self.reversed()
        var result = LinkList.empty
        var index = 0
        while !reversed.isEmpty {
            if case let .node(value, next) = reversed {
                if index != indexFromEnd {
                    result = LinkList.node(value, result)
                }
                reversed = next
            }
            index += 1
        }
        self = result
    }
    
    var isPalindrome: Bool {
        return self.reversed() == self
    }
}

extension LinkList: Sequence, IteratorProtocol {
    mutating func next() -> T? {
        switch self {
        case let .node(value, nextNode):
            self = nextNode
            return value
        case .empty:
            return nil
        }
    }
}

extension LinkList: CustomStringConvertible {
    var description: String {
        return self.map {
            $0.description
        }.joined(separator: " -> ")
    }
}

extension LinkList: Equatable {
    static func == (left: LinkList, right: LinkList) -> Bool {
        switch (left, right) {
        case (.empty, .empty):
            return true
        case (.node(_, _), .empty):
            return false
        case (.empty, .node(_, _)):
            return false
        case let (.node(leftValue, leftNext), .node(rightValue, rightNext)):
            return leftValue == rightValue && leftNext == rightNext
        }
    }
}

var l = LinkList.node("cat", .node("dog", .node("mouse", .empty)))
let a = 1


//-------------------------------------------------------------


