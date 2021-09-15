
import Foundation
 
class Observable<T> {
    typealias Listener = (T) -> Void
    private var listener: Listener?
    var value: T {
        didSet {
            print("Observable=========> \(value)")
            self.listener?(value)
        }
    }
    init(_ value: T) {
        
        self.value = value
    }
    func bind(listener: Listener?) { 
        self.listener = listener
        listener?(value)
    }
}
