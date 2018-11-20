import Foundation

class GenericClass<T> {
    var value: T
    
    init(with value: T) {
        self.value = value
    }
}

let genericClassItem1 = GenericClass<Int>(with: 2)
let genericClassItem2: GenericClass<Int> = GenericClass(with: 2)
let genericClassItem3 = GenericClass(with: 2)

//----------------------------------------------------------------

struct GenericStruct<T> {
    var value: T
}

//----------------------------------------------------------------

enum GenericEnum<T> {
    case value(T)
}

let genericEnum1: GenericEnum<String> = .value("Hola mundo")
let genericEnum2 = GenericEnum.value("Hola mundo 2")

//----------------------------------------------------------------

protocol Idable {
    var id: String { get }
}

class GenericManager<T: Idable> {
    var value: T
    
    init(with value: T) {
        self.value = value
    }
    
    func printIdentifier() {
        print("🔥 \(value.id)")
    }
    
}

class ConcreteClass1: Idable {
    
    var id: String {
        return "class 1"
    }
    
    init() { }
}


let conreteClass = ConcreteClass1()
let manager = GenericManager(with: conreteClass)
manager.printIdentifier()

//----------------------------------------------------------------
