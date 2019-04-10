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

//----------------------------------------------------------------

func createNewArray<T>(with element: T) -> [T] {
    let newArray: [T] = [element]
    return newArray
}

let arrayString = createNewArray(with: "hola")
let arrayInt = createNewArray(with: 23)
