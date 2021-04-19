import Foundation

// The object has the @propertyWrapper prefix when it's defined
@propertyWrapper
struct Versioned<Element> {
    private var currentValue: Element
    private(set) var history: [Element] = []
    
    init(wrappedValue: Element) { currentValue = wrappedValue }
    
    //it needs a wrapped value which can modify the stored value or place limits on it.
    var wrappedValue: Element {
        get { return currentValue }
        set {
            history.append(currentValue)
            currentValue = newValue
        }
    }
    
    //ProjectedValue is accessed with a $ before the variable. It can return self to get access to more variables.
    var projectedValue: [Element] {
        return history
    }
}

struct User {
    //You can't use property wrappers at the top level or at local levels. They have to be in a struct, enum, or class for now.
    @Versioned var name: String = ""
}

main()


func main() {
    var user = User()
    user.name = "Ben"
    user.name = "James"
    user.name = "Edna"
    user.name = "Jessica"
    print(user.$name)
}





