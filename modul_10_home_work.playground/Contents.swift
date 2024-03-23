import UIKit

//Задание 1
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



