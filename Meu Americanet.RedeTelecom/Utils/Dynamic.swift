
import Foundation

class Dynamic<T> {
    
    var bind :(T) -> () = { _ in }
    
    var value :T? {
        didSet {
            print("Dynamic====> \(String(describing: value))")
            bind(value!)
        }
    }
    
    init(_ v :T) {
        value = v
    }
    
}


