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
