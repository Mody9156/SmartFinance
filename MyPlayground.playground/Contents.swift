import UIKit

var greeting = "Hello, playground"


for i in 0..<101 {
    if i % 15 == 0 {
        print("FizzBuzz")
    }
    else if i  % 3 == 0 {
        print("Fizz")
    }
    else if i  % 5 == 0 {
        print("Buzz")
    }else {
        print("\(i)")
    }
    
}
