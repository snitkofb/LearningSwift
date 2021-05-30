import Foundation


	//Do Catch

	let tasks = ["learn", "rest", "chore", "find keys", "listen"]
	var success = true

	for task in tasks {
		do {
			try request(task: task, success: &success)
			print("Attempted \(task). Result: ")
			print(success ? "success!" : "failure!\n")
		} catch BrainError.insufficientMotivation {
			print("Attempted \(task). Result: ")
			print("Sorry, just sounds awful.")
		} catch BrainError.lostItem {
			print("Attempted \(task). Result: ")			
			print("The requested item has been misplaced")
		} catch BrainError.distracted {
			print("Attempted \(task). Result: ")
			print("I'm sorry, I was distracted, come again?")
		} catch {
			print("Attempted \(task). Result: ")
			print("I have no idea what went wrong")
		}
	
	}


func request(task: String, success: inout Bool) throws {
	if task == "learn" 	{
		success = true
		return
	}
	else if task == "rest" {
		success = false
	} else if task == "chore" {
		throw BrainError.insufficientMotivation
	} else if task == "find keys" {
		throw BrainError.lostItem
	} else if task == "listen" {
		throw BrainError.distracted
	} else	{
		success = true
	}
	/* 
	Could also use guard-else here. 
	guard task == learn {}
	else { throw error }
	
	OR
	
	guard let task = taskList[taskNumber] //can throw its own error if it doesn't exist	
	else { throw error }
	*/
}



enum BrainError: Error {

	case insufficientMotivation
	case lostItem
	case distracted

}


