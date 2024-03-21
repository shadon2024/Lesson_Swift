import Foundation

/// Создайте переменную, которая будет хранить строку «Hello, Skillbox» и напечатайте её содержимое с помощью команды print().
var variableString = "Hello, Skillbox"
print(variableString)

/// Создайте константу, которая будет хранить строку «Hello, Skillbox» и напечатайте её содержимое с помощью команды print().
let constantString = "Hello, Skillbox "
print(constantString)

/// Создайте переменную с явным указанием типа, присвойте ей значение 0.5 и напечатайте её содержимое с помощью команды print().
var varTest : Double = 0.5
varTest += 0.5
print(varTest)

///Возьмите optional-переменную ниже, извлеките из неё значение (раскройте optional) и напечатайте её значение. Результат не должен содержать обозначения optional.
///var swiftString: String? = "Swift"
var swiftString: String? = "Swift"
swiftString
print(swiftString ?? "Swift")
//print(swiftString!) // такой тип небезопасный

///Напишите код, который складывает два числа: 10 и 0,5. Выведите результат командой print().
let a = 10
let b = 0.5
var varNumber = Double(a) + b
print(varNumber)

/// это  необязательно
let authorName = "Shodon Rizoev"
print(authorName)
let todayDate = Date()
print(todayDate)

// test
