import Foundation

//----------------------------------------------------------------

func createNewStringArray(with element: String) -> [String] {
    let newArray: [String] = [element]
    return newArray
}

func createNewIntArray(with element: Int) -> [Int] {
    let newArray: [Int] = [element]
    return newArray
}

let stringArray = createNewStringArray(with: "String")
let intArray = createNewIntArray(with: 2)

//----------------------------------------------------------------

func createNewGenericArray<T>(with element: T) -> [T] {
    let newArray: [T] = [element]
    return newArray
}

let stringArrayCool = createNewGenericArray(with: "Hola")

class User {
    init() {}
}

let userArray = createNewGenericArray(with: User())

