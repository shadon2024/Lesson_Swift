import UIKit
/*
Задание 1
Напишите функцию, которая принимает на вход два целых числа и выводит в консоль, равны они или нет. Должны выполняться следующие условия:

Если первое число равно второму числу, надо вывести в консоль слово «равно».
Если первое число больше второго, то вывести слово «больше».
Если первое число меньше, то вывести слово «меньше».
*/

func someNumber(_ sum1: Int, _ sum2: Int) {
    if sum1 == sum2 {
        print("равно")
    } else if sum1 > sum2 {
        print("больше")
    } else if sum1 < sum2 {
        print("меньше")
    }
}
someNumber(1, 1)
someNumber(3, 1)
someNumber(1, 3)



/*
 Задание 2
 Напишите функцию func summ(toValue: Int), которая посчитает и выведет сумму всех нечётных чисел от 1 до заданного числа.
 Для определения нечётного числа нужно использовать оператор остатка от целочисленного деления %. Если остаток от деления на 2 не равен 0, это число нечётное.
 Пример работы программы:
 let result = summ(toValue: 100)
 print(result)
 Вывод в консоль: 2500
 */

func summ(toValue: Int)   {
    var sum = [Int]()
    for name in 1...toValue {
        if (name % 2) != 0 {
            sum.append(name)
        } else {
            //print(name)
        }
    var evenSum1 = 0
    for name in sum {
        evenSum1 += name
    }
        print(evenSum1)
    }
    //print(evenSum1)
}
summ(toValue: 100)
//var result: () = summ(toValue: 100)
//print(result)


/*
Задание 3
Напишите функцию, которая будет принимать целое число, а выводить все целые числа, квадраты которых меньше или равны переданному параметру. Квадрат числа — это результат умножения числа на самого себя. Например, 9 — это квадрат числа 3.
Пример:
n = 10
вывод в консоль:
1
2
3
*/

func getSquare(some: Int) {
    let sum = some * some
    var sum1 = 0
    for sumK in 0...some  {
        sum1 += sumK
        if sum1 <= some || sum1 == some  {
            print(sumK)
        }
    }
}
getSquare(some:10)



/*
 Задание 4
 Напишите функцию func handleDiceRoll(result: Int) для обработки значений одного брошенного кубика с помощью оператора switch. На вход функция получает число от 1 до 6 включительно. Если значение 1, 2 или 3, нужно вывести в консоль слово «проигрыш». Если значение 4, 5 или 6 — слово «победа».
 Примеры использования:
 handleDiceRoll(result: 2)
 Вывод в консоль: Проигрыш
 handleDiceRoll(result: 5)
 Вывод в консоль: Победа
 */

func handDiceRoll(result: Int) {
    switch result {
    case 1,2,3:
        print("Вывод: Проигрыш")
//    case 2:
//        print("Вывод: Проигрыш")
//    case 3:
//        print("Вывод: Проигрыш")
    case 4,5,6:
        print("Вывод: Победа")
//    case 5:
//        print("Вывод: Победа")
//    case 6:
//        print("Вывод: Победа")
    default:
        break
    }
    return
}
handDiceRoll(result: 2)
handDiceRoll(result: 5)
