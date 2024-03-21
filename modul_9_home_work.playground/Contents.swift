import UIKit

//1. Создайте класс животного Animal.
//
//2. У животного должны быть характеристики:
//
//энергия,
//вес,
//текущий возраст,
//максимальный возраст,
//имя.
//Энергия, вес, максимальный возраст и имя должны инициализироваться через конструктор.
//
//
//
//3. Добавьте вычисляемое свойство isTooOld — Boolean.
//
//Оно должно сравнивать текущий возраст с максимальным и возвращать true, если текущий возраст равен или больше максимального.
//
//
//
//4. Животное может спать, питаться и передвигаться.
//
//Во время сна:
//
//Энергия животного увеличивается на 5, а возраст — на 1.
//В консоль выводится сообщение: «${имя животного} спит».
//Во время питания:
//
//Энергия животного увеличивается на 3, а вес — на 1.
//Возраст животного может увеличиться на 1.
//В консоль выводится сообщение: «${имя животного} ест».
//Во время передвижения:
//
//Энергия животного уменьшается на 5, а вес — на 1.
//Возраст животного может увеличиться на 1.
//В консоль выводится сообщение: «${имя животного} передвигается».
//
//
//5. Случайное увеличение возраста реализуйте с помощью класса Bool и его метода random()
//
//Пример использования:
//
//if (Bool.random()) {
////увеличить возраст
//}
//Вынесите случайное увеличение возраста в метод — tryIncrementAge
//
//Если животное слишком старое, если не хватает веса или энергии для совершения действия, то ничего не происходит.
//
//
//
// 6. Животное может производить потомство.
//
//Имя и максимальный возраст у рождённого животного такие же, как и у родителя.
//
//Энергия для рождённого животного устанавливается случайно в диапазоне от 1 до 10.
//
//Вес для рождённого животного устанавливается случайно в диапазоне от 1 до 5.
//
//В консоль должно выводиться сообщение о том, какое животное было рождено и какие у него характеристики.
//
//
//
//7. Создайте наследников класса Animal: Bird, Fish, Dog.
//
//8. В каждом из наследников переопределите функцию, отвечающую за передвижение. Для каждого наследника в этой функции необходимо вызвать родительскую реализацию и дополнительно вывести в консоль сообщение:
//
//для Bird — «летит»,
//для Fish — «плывет»,
//для Dog — «бежит».
//По желанию: добейтесь, чтобы дополнительное сообщение выводилось только если выполнилась родительская реализация.
//
//
//
//9. В каждом из наследников переопределите функцию, отвечающую за рождение потомка. Класс Fish должен возвращать объект класса Fish. Аналогично с Bird и Dog.
//
//10. Создайте класс NatureReserve, который представляет из себя заповедник с разными животными.
//
//
//
//11. Инициализируйте заповедник. Изначально в нём должно быть пять птиц, три рыбы, две собаки и несколько обычных животных.
//
//По желанию: создайте дополнительные виды животных и добавьте их в заповедник.
//
//
//
//12. Напишите программу, которая имитирует жизненный цикл животных в заповеднике.
//
//В течение ограниченного числа итераций N каждое животное делает одно случайное действие, которое позволяют сделать его свойства: ест, спит, двигается, рожает.
//
//Когда у животного рождается детёныш, он добавляется к общему количеству животных заповедника.
//
//В конце итерации все животные, у которых возраст превысил максимальный, удаляются из заповедника.
//
//По окончании работы должно выводиться число животных в заповеднике, которые остались живы.
//
//Если все животные исчезли — программа должна прерываться, с выводом соответствующего сообщения.


// 1)
class Animal {
    
    // 2)
    var energy: Int
    var weight: Int
    var currentAge: Int
    var maximumAge: Int
    var name: String
    
    init(energy: Int, weight: Int, currentAge: Int, maximumAge: Int, name: String) {
        self.energy = energy
        self.weight = weight
        self.currentAge = currentAge
        self.maximumAge = maximumAge
        self.name = name
    }
    
    // 3
    var isTooOld: Bool {
        if currentAge == maximumAge || currentAge > maximumAge {
            return true
        } else {
            return false
        }
        //return currentAge >= maximumAge
    }
    
    // 4)
    func duringSleep(){
        energy += 5
        currentAge += 1
        print("\(name) спит")
    }
    
    func duringEating(){
        energy += 3
        weight += 1
        tryIncrementAge()
        print("\(name) есть")
    }
    
    func duringMoving() {
        energy -= 5
        weight -= 1
        tryIncrementAge()
        print("\(name) передвигается")
    }
    
    //5)
    func tryIncrementAge() {
        if Bool.random() && !isTooOld {
            currentAge += 1
        }
    }
    
    //6)
    func giveBirth() -> Animal? {
        let child = Animal(energy: Int.random(in: 1...10), weight: Int.random(in: 1...5), currentAge: currentAge, maximumAge: maximumAge, name: name )
        print("Родилось новое животное")
        return child
    }
    
}
 

// 7)
class Bird: Animal {
    
    // 8)
    override  func duringMoving() {
        print("\(name) летит")
    }
    
    //9)
    override func giveBirth() -> Bird {
        let childenergy = Int.random(in: 1...10)
        let childWeight = Int.random(in: 1...5)
        return Bird(energy:childenergy, weight: childWeight, currentAge: currentAge, maximumAge: maximumAge, name: "птенец")
    }
}

class Fish: Animal {
    
    // 8)
    override func duringMoving() {
        print("\(name) плывет")
    }
    
    //9)
    override func giveBirth() -> Fish {
        let childenergy = Int.random(in: 1...10)
        let childWeight = Int.random(in: 1...5)
        return Fish(energy:childenergy, weight: childWeight, currentAge: currentAge, maximumAge: maximumAge, name: "малек")
    }
}

class Dog: Animal {
    
    // 8)
    override func duringMoving() {
        print("\(name) бежит")
    }
    
    //9)
    override func giveBirth() -> Dog {
        let childenergy = Int.random(in: 1...10)
        let childWeight = Int.random(in: 1...5)
        return Dog(energy:childenergy, weight: childWeight, currentAge: currentAge, maximumAge: maximumAge, name: "щенок")
    }
}


// 10), 11)
class NatureReserve {
    var animals: [Animal]

    init(animals: [Animal]) {
        self.animals = animals
        }
    
    // 12)
    func life() {
        for _ in 1...4 {
            for animal in animals {
                switch Int.random(in: 1...3) {
                case 1: animal.duringMoving()
                case 2: animal.duringEating()
                case 3: animal.duringSleep()
                default: animals.append(animal.giveBirth()!)
                    print("giveBirth animal")
                }
                
                if animals.count == 0 {
                    print("осталось 0 животных")
                }
                    animals.removeAll(where: {$0.isTooOld})
                
            }
        }
    }
}

var rezerve = NatureReserve(animals: [
    Bird(energy: 10, weight: 10, currentAge: 3, maximumAge: 6, name: "сокол"),
    Bird(energy: 5, weight: 5, currentAge: 3, maximumAge: 6, name: "воробей"),
    Fish(energy: 5, weight: 5, currentAge: 3, maximumAge: 4, name: "горбуша"),
    Fish(energy: 5, weight: 5, currentAge: 5, maximumAge: 4, name: "минтай"),
    Dog(energy: 15, weight: 15, currentAge: 11, maximumAge: 10, name: "бульдог"),
    Dog(energy: 20, weight: 20, currentAge: 8, maximumAge: 10, name: "овчарка"),
    Animal(energy: 25, weight: 25, currentAge: 7, maximumAge: 8, name: "волк"),
    Animal(energy: 35, weight: 35, currentAge: 12, maximumAge: 12, name: "лев"),
    Animal(energy: 30, weight: 30, currentAge: 11, maximumAge: 12, name: "тигр")
])

rezerve.life()







    
  
