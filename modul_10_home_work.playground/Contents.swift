import UIKit

// MARK: Задание 1
//Объявите три сущности, которые реализует предоставленный вам протокол. После этого для всех сущностей вызовите все методы и свойства, объявленные в протоколе.

//Протокол:

//protocol CalorieCountProtocol {
//     var calories: Int { get }
//     func description() -> String
//}
 

//Должны выполняться следующие условия:

//Объявлены класс, структура и перечисления enum, которые реализует данный протокол.
//Реализация протокола может быть любой.
//Вызваны все свойства и методы протокола у каждого экземпляра из пункта 1.
//Задание сделано без изменения протокола.


protocol CalorieCountProtocol {
     var calories: Int { get }
     func description() -> String
}


class Apple: CalorieCountProtocol {
    var calories: Int = 89
    func description() -> String {
        "Apple, \(calories) cal"
    }
}

struct Banana: CalorieCountProtocol {
    var calories: Int = 69
    func description() -> String {
        "Banana, \(calories) cal"
    }
}

class Ananas: CalorieCountProtocol {
    var calories: Int = 32
    func description() -> String {
        "Ananas, \(calories) cal"
    }
}

enum CalorieCount: CalorieCountProtocol {
    case Apricot
//    var calories: Int {
//        switch self {
//        case .Apricot: return 22
//        }
//    }
    var calories: Int {
        return 22
    }
    
    func description() -> String {
        "Apricot, \(calories) cal"
    }
}


let calorieCount: [CalorieCountProtocol] = [Apple(), Banana(), Ananas(), CalorieCount.Apricot]

calorieCount.forEach { item in
    print(item.description())
}





// MARK: Задание 2

//Поработайте с протоколом Equatable, который нужен для сравнения сущностей.

//Вам предоставлены структура и класс, которые нужно сравнить. Добавьте в объявление этих сущностей протокол Equatable. При необходимости реализуйте недостающий метод.

//Структура:

//enum BalanceType {
//    case positive, negative, neutral
//}

//struct Balance {
//    let type: BalanceType
//    let amount: Int
//}


//Класс:

//class BalanceObject {
//    var amount: Int = 0
//}

//Должны выполняться следующие условия:

//Структура и класс реализуют протокол Equatable.
//Проведена проверка, что протокол реализуется. Для этого сравните экземпляры этих сущностей с помощью оператора ‘==’.


// Структура:

enum BalanceType {
    case positive, negative, neutral
}

struct Balance: Equatable {
    let type: BalanceType
    let amount: Int
}
 
 // Класс:

class BalanceObject: Equatable {
    static func == (lhs: BalanceObject, rhs: BalanceObject) -> Bool {
        return lhs.amount == rhs.amount
    }

    var amount: Int = 0
}

var balance0 = Balance(type: .positive, amount: 5)
var balance = Balance(type: .positive, amount: 5)
var balance2 = Balance(type: .negative, amount: 3)
var balance3 = Balance(type: .neutral, amount: 4)
//var balance4 = BalanceObject()

balance == balance2
balance == balance3
balance2 == balance3
balance0 == balance


// balance == balance4
// Binary operator '==' cannot be applied to operands of type 'Balance' and 'BalanceObject'
