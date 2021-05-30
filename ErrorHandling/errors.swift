import Foundation

@main







enum VendingMachineError: Error {

	case invalidSelection
	case insufficientFunds(coinsNeeded: Int)
	case outOfStock

}


