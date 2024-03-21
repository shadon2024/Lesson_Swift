import UIKit
import Foundation
//import Foundation

/*
 Задание 1
 Напишите функцию, которая принимает в качестве параметра массив целых чисел Int (как отрицательных, так и положительных) и возвращает массив, в котором каждое число меньше 0 заменено на 0, а сам массив отсортирован так, чтобы все элементы со значением, равным 0, были в начале.
 Примечание
 Пример создания случайного числа для заполнения массива:
 let randomInt = Int.random(in: -10...10),
 где −10...10 — диапазон, в пределах которого будет сгенерированное число.
 */

let randomInt = Int.random(in: -10...10)

func someInt(randomInt: [Int]) -> [Int]?  {
    for name in randomInt  {
        if name < 0 {
            name == 0
        }
        randomInt.sorted { item1, item2 in item1 < item2}
        print(randomInt)
    }
    return randomInt
}
print(someInt(randomInt: [randomInt]) ?? 0)



//Задание 2
//Напишите функцию, которая принимает в качестве параметра массив и возвращает его в обратном порядке.

let character: [String] = ["A", "B", "C", "D"]
func reversList(character: [String]) -> [String] {
    return character.reversed()
}
let newCharacter = reversList(character: character)
print(newCharacter)





//Задание 3
//Напишите функцию, которая принимает в качестве параметров целое число и замыкание и вызывает внутри себя замыкание для проверки значения.
//Напишите замыкание, которое принимает в качестве параметра целое число и затем печатает в консоль название месяца, порядковый номер которого соответствует переданному параметру.
//Например: если передаётся 1, печатается «январь», 2 — «февраль». Если число выходит за рамки номеров месяцев, то должно печататься: «Такого месяца не бывает».
//Вызовите функцию, передав в неё значения для проверки.

let isNumberEqual10Closure: (Int) -> Void = { number in
    switch number {
    case 1:
        print("1: Январь")
    case 2:
        print("2: Февраль")
    case 3:
        print("3: Март")
    case 4:
        print("4: Апрель")
    case 5:
        print("5: Май")
    case 6:
        print("6: Июнь")
    case 7:
        print("7: Июль")
    case 8:
        print("8: Август")
    case 9:
        print("9: Сентябрь")
    case 10:
        print("10: Октябрь")
    case 11:
        print("11: Ноябрь")
    case 12:
        print("12: Декабрь")
    default:
        print("Такого месяца не бывает")
    }
}

func runSomeClosure(someNumber: Int, closure: (Int) -> Void) {
    closure(someNumber)
}
runSomeClosure(someNumber: 1, closure: isNumberEqual10Closure)








//Задание 4
//Напишите функцию, которая принимает в качестве параметров массив целых чисел и замыкание из задания 3. Внутри функции напишите код, где для каждого элемента в массиве вызывается передаваемое замыкание методом forEach(). Если передаётся пустой массив, то печатается «Месяцев нет».

func runArrayClosure(array: [Int], isNumberEqual10Closure: ([Int]) -> Void) {
    isNumberEqual10Closure (array)
}

runArrayClosure(array: []) { isNumberEqual10Closure in
    if isNumberEqual10Closure == [1] {
        isNumberEqual10Closure.forEach{ element in
            print("1: Январь")
        }
    } else  if isNumberEqual10Closure == [2] {
        isNumberEqual10Closure.forEach{ element in
            print("2: Февраль")
        }
    } else  if isNumberEqual10Closure == [3] {
        isNumberEqual10Closure.forEach{ element in
            print("3: Март")
        }
    } else  if isNumberEqual10Closure == [4] {
        isNumberEqual10Closure.forEach{ element in
            print("4: Апрель")
        }
    } else  if isNumberEqual10Closure == [5] {
        isNumberEqual10Closure.forEach{ element in
            print("5: Май")
        }
    } else  if isNumberEqual10Closure == [6] {
        isNumberEqual10Closure.forEach{ element in
            print("6: Июнь")
        }
    } else  if isNumberEqual10Closure == [7] {
        isNumberEqual10Closure.forEach{ element in
            print("7: Июль")
        }
    } else  if isNumberEqual10Closure == [8] {
        isNumberEqual10Closure.forEach{ element in
            print("8: Август")
        }
    } else  if isNumberEqual10Closure == [9] {
        isNumberEqual10Closure.forEach{ element in
            print("9: Сентябрь")
        }
    } else  if isNumberEqual10Closure == [10] {
        isNumberEqual10Closure.forEach{ element in
            print("10: Октябрь")
        }
    } else  if isNumberEqual10Closure == [11] {
        isNumberEqual10Closure.forEach{ element in
            print("11: Ноябрь")
        }
    } else  if isNumberEqual10Closure == [12] {
        isNumberEqual10Closure.forEach{ element in
            print("12: Декабрь")
        }
    } else {
        print("Месяцев нет")
    }
}



//Задание 5
//Создайте пустое множество строк fruits и добавьте в него фрукты: orange, apple, banana, grapefruit.
//Создайте множество redFood из элементов apple, tomato, grapefruit, strawberry.
//Найдите с помощью операций над множествами множества красных фруктов, множество красных продуктов, но не фруктов, и множество всей еды, кроме красных фруктов.

var fruits: Set<String> = []
fruits.insert("orange")
fruits.insert("apple")
fruits.insert("banana")
fruits.insert("grapefruit")
print(fruits)

var redFood: Set = ["apple", "tomato", "grapefruit", "strawberry"]
print(redFood)


//обьединение множество
let redProduct = fruits.union(redFood)
print(redProduct)


// пересечение множество
let redFruits = fruits.intersection(redFood)
print(redFruits)


//вычитаные множество
let result = redProduct.subtracting(redFruits)
print(result)






//Задание 6 (выполните по желанию)
//Напишите две функции, которые принимают в качестве параметра массив, удаляют из него дубликаты и возвращают массив с уникальными значениями.

//Первая функция не должна использовать свойства множеств для удаления дубликатов, вторая функция — должна.


func someFunc(array: [Int]) -> [Int] {
   var someNumber: [Int] = []
    var result = array.filter{ item in
        if someNumber.contains(item) {
            return false
        } else { someNumber.append(item)
            return true
        }
    }
    return result
}
print(someFunc(array: [1, 1, 2, 2, 3, 3, 5, 5, 4]))



func removeDuplicates<Int: Equatable>(from array: [Int]) -> [Int] {
    var uniqueElements: [Int] = []
    for item in array {
        if !uniqueElements.contains(item) {
            uniqueElements.append(item)
        }
    }
    return uniqueElements
}

let numbers = [1, 2, 3, 1, 3, 5, 6, 2, 5, 3, 4, 7]
let uniqueNumbers = removeDuplicates(from: numbers)
print(uniqueNumbers)


