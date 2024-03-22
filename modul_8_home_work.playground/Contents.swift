import UIKit

///Задание 1
//Дана структура Person:

//struct Person {
//    var name: String
//    var age: Int
//
//
//    func getAgeComparisonString(_ p: Person) -> String {
//        // Ваш код должен быть здесь
//    }
//}



//Допишите метод в структуре Person, который сравнивает возраст.

//Должны выполняться следующие условия:

    //1. Формат строки со сравнением:

//{Имя другого человека} {старше меня / моложе меня / такого же возраста, как я}.

 

    //2. Ваш код должен работать следующим образом:

/*
 p1 = Person("Антон", 24)
 p2 = Person("Андрей", 36)
 p3 = Person("Ольга", 24)

 p1.getAgeComparisonString(p2) ➞ "Андрей старше меня"
 p2.getAgeComparisonString(p1) ➞ "Антон младше меня"
 p1.getAgeComparisonString(p3) ➞ "Ольга такого же возраста, как и я"
 */


struct Person {
    var name: String
    var age: Int
    
    lazy var PersonInfo: String = {
        
        let yearsWord = (age % 10 == 1 && age % 100 != 11) ? "год" : ((age % 10 >= 2 && age % 10 <= 4 && (age % 100 < 10 || age % 100 >= 20)) ? "года" : "лет")

            return "\(name) \(age) \(yearsWord)"
        
    }()
    
    
    func getAgeComparisonString(_ p: Person) -> String {
        if self.age < p.age {

                return "\(p.name) старше меня"

            } else if self.age > p.age {

                return "\(p.name) младше меня"

            } else {

                return "\(p.name) такого же возраста, как и я"

            }
    }
}


var p1 = Person(name: "Антон", age: 24)
var p2 = Person(name: "Андрей", age: 36)
var p3 = Person(name: "Ольга", age: 24)


p1.getAgeComparisonString(p2)
p2.getAgeComparisonString(p1)
p1.getAgeComparisonString(p3)





//Задание 2
//Добавьте в структуру Person ленивое свойство, которое возвращает человека в виде строки следующего формата {Имя} {Возраст} {года/лет}.

//Пример:
 p1 = Person(name: "Антон", age: 24)
//p1.info -> Антон 24 года
p1.PersonInfo

p2 = Person(name: "Андрей", age: 36)
//p2.info -> Андрей 36 лет
p2.PersonInfo



//Задание 3
//Создайте класс Hero. Добавьте свойство «количество жизней» — lifeCount. Количество жизней задаётся при создании героя в инициализаторе. Добавьте метод «попадание», который уменьшает количество жизней, — hit().

//Задание 4
//Добавьте в класс Hero вычисляемое свойство, жив или нет герой, — isLive. Если количество жизней больше 0, то возвращает true, в остальных случаях false.
//Задание 5
//Поставьте модификатор доступа private рядом с переменной «количество жизней» в классе Hero, чтобы менять количество жизней можно было только с помощью метода hit().


////Задание 6
////Отнаследуйтесь от класса Hero, создав дочерний класс SuperHero. Переопределите метод «попадание» для нового класса так, чтобы SuperHero не получал повреждения.

// 3,4,5
class Hero {
    
    private var lifeCount: Int
    
    var isLive: Bool {
        return lifeCount > 0
    }
    
    func hit() {
        lifeCount -= 1
    }
    
    init(lifeCount: Int ) {
        self.lifeCount = lifeCount
    }
}

let hero = Hero(lifeCount: 5)
hero.hit()
print(hero.hit())


// 6
class SuperHero: Hero {
    override func hit(){
        // // Переопределение, чтобы SuperHero не получал повреждений.
    }
}

let superHero = SuperHero(lifeCount: 5)
superHero.isLive
print(superHero.isLive)

print(superHero.hit())
