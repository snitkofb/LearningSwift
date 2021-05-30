# Error Handling

## How to Handle Errors

1. Propogate the Error from a function to the code that calls that function
2. Handle the error using a do-catch statement
3. Handle it as an optional
4. Assert that the error will not happen (this seems risky)

(It seems that the basic idea behind error handling in swift is that functions, methods or inits that can throw an error can basically return either an error or the return value.)

### Propagating Errors Using Throwing Functions

```
func canThrowErrors() throws -> String

func cannotThrowErrors() -> String


func vend(itemNamed name: String) throws {

	guard let item = inventory[name] else {
		throw VendingMachineError.invalidSelection
	}

	guard item.count > 0 else {
		throw VendingMachineError.outOfStock
	}

	guard item.price <= coinsDeposited else {
		throw VendingMachineError.insufficientFunds(coinsNeeded: item.price - coinsDeposited)
	}

	coinsDeposited -= item.price

	var newItem = item
	newItem.count -= 1
	inventory[name] = newItem

	print("Dispensing \(name)")
}

try vendinMachine.vend(itemNamed: snackName)

```

### Do Catch

``` 
vendingMachine.coinsDeposited = 8
do {
    try buyFavoriteSnack(person: "Alice", vendingMachine: vendingMachine)
    print("Success! Yum.")
} catch VendingMachineError.invalidSelection {
    print("Invalid Selection.")
} catch VendingMachineError.outOfStock {
    print("Out of Stock.")
} catch VendingMachineError.insufficientFunds(let coinsNeeded) {
    print("Insufficient funds. Please insert an additional \(coinsNeeded) coins.")
} catch {
    print("Unexpected error: \(error).")
}
```

You can also do:

```
do {
	try [a thing]
} catch [pattern 1] where condition {

	things
} catch [pattern 2], [pattern 3] {
	things
} catch [pattern 4], [pattern 5] where condition{
	more things
}
```

For example:

```
catch is VendingMachineError
```

Would catch any error that is a VendingMachineError

### Converting Errors to Optional Values

```
let x = try? canThrowErrors()
```

is functionally equivalent to 

```
let x = Int?
do {
	y = try canThrowErrors()
}catch {
	y = nil
}
```

Now you handle optionals instead of catching all the errors, but this will provide less information to you and the user.

It does let you write concise error handling code if all errors are handled identically. (You know, usually ignored.)

### Disabling Errors Propagation

```
let photo = try! loadImage(atPath: "./Resources/John.jpg")
```

If it doesn't work, it'll crash. So, that's one way to find the error.
