# KeyPaths
### These are a way to send functions a place to look for more a value
This is useful, especially in extensions of things.

'''
extension Sequence {
    func sorted<T: Comparable>(by keyPath: KeyPath<Element, T>) -> [Element] {
        return sorted { a, b in
            return a[keyPath: keyPath] < b[keyPath: keyPath]
        }
    }
}
'''

### This is functional, albeit nonsensical example that compiles

'''
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
'''

The value here is that we can create functions that are ignorant about a great deal of information related to our struct, and just say, here, take this list of things, and do something with this value that you didn't know about until now. 

For example: 

'''
playlist.songs.sorted(by: \.name)
playlist.songs.sorted(by: \.dateAdded)
playlist.songs.sorted(by: \.ratings.worldWide)
'''

You can get more information in [this](https://www.swiftbysundell.com/articles/the-power-of-key-paths-in-swift/) pretty good write up.