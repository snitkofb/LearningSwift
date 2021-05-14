struct SomeStructure {
    var someValue: Int
}

let s = SomeStructure(someValue: 12)
let t = SomeStructure(someValue: 42)

let pathToProperty = \SomeStructure.someValue

let value = s[keyPath: pathToProperty]
print(value)

// value is 12

print(t[keyPath: pathToProperty])

//The type name can be omitted in contexts where type inference can determine the 
//implied type. The following code uses \.someProperty instead of \SomeClass.someProperty:

/*class SomeClass: NSObject {
    @objc dynamic var someProperty: Int
    init(someProperty: Int) {
        self.someProperty = someProperty
    }
}

let c = SomeClass(someProperty: 10)
c.observe(\.someProperty) { object, change in
    // ...
}
*/