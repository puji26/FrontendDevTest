import UIKit

func staircase(n:Int) -> Void {
    var a = ""
    for _ in 0...n - 1 {
        a = a + " "
    }
    
    for _ in 0...n - 1 {
        a.remove(at: a.startIndex)
        a = a + "#"
        print(a)
    }
}

staircase(n: 6)
