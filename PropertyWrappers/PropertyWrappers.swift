import Foundation

main()


func main() {
	@Versioned var names: String = "Ben"
	names = "James"
	names = "Edna"
	names = "Jessica"
	print($names)
}


@propertyWrapper
struct Versioned<Element> {
	private var value: Element
	var projectedValue: [Element]
	init(_ element: Element) { value = element }
	var wrappedValue: Element {
		get { return value }
		set { 
			value = newValue
			projectedValue.append(newValue)
		}
	}
} 
