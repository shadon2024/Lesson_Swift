import UIKit
import Foundation

/*
 Задание 1
 Мы можем воспользоваться массивом строк [String], чтобы по номеру дня недели получать название дня недели: let days = [“Monday”, “Tuesday”, “Wednesday”, “Thursday”, “Friday”, “Saturday”, “Sunday”].

 day[0] — первый день недели

 Теперь нам нужно получить по названию дня недели его номер. Реализуйте словарь, который позволит это сделать.
 */

let days = [0: "Monday", 1: "Tuesday", 2: "Wednesday", 3: "Thursday", 4: "Friday", 5: "Saturday", 6: "Sunday"]
if let one = days[0] {
    print("первый день недели \(one)")
} else {
    print("другой день недели")
}
for (key, value) in days {
    print("\(key): \(value)")
}
for key in days {
    print(key)
}


enum dayWeek {
    case Monday (String, Int)
    case Tuesday (String, Int)
    case Wednesday (String, Int)
    case Thursday (String, Int)
    case Friday (String, Int)
    case Saturday (String, Int)
    case Sunday (String, Int)
}
let direction: dayWeek = .Monday("Monday", 0)
switch direction {
case let .Monday(name, index):
    print("\(name) - \(index)")
case let .Tuesday(name, index):
    print("\(name) - \(index)")
case let .Wednesday(name, index):
    print("\(name) - \(index)")
case let .Thursday(name, index):
    print("\(name) - \(index)")
case let .Friday(name, index):
    print("\(name) - \(index)")
case let .Saturday(name, index):
    print("\(name) - \(index)")
case let .Sunday(name, index):
    print("\(name) - \(index)")
}

/*
Задание 2
С помощью итерирования по созданному словарю выведите названия всех дней недели и их номера.

Вывод должен осуществляться в консоль. Пример вывода: «Четверг — 4».
*/

let daysWeek = [1: "Monday", 2: "Tuesday", 3: "Wednesday", 4: "Thursday", 5: "Friday", 6: "Saturday", 7: "Sunday"]

let name = [4: "четверг"]
switch name {
case [1: "понедельник"]:
    print("понедельник - 1")
case [2: "вторник"]:
    print("вторник - 2")
case [3: "среда"]:
    print("среда - 3")
case [4:"четверг"]:
    print("четверг - 4")
case[5: "пятница"]:
    print("пятница - 5")
case[6: "суббота"]:
    print("суббота - 6")
case[7: "воскресенье"]:
    print("воскресенье - 7")
default:
    print("такой день не существует")
}

for (key, value) in name {
    print("\(key): \(value)")
}
for key in name {
    print(key)
}



/*
Задание 3
Создайте словарь, который будет представлять собой базу данных паролей пользователей. По строке имени пользователя мы будем хранить строку с паролем.

Добавьте в этот словарь три любые записи.
*/


//var dataBaseUser: [Int: String] = [:]

//dataBaseUser[3] = "password3"
//dataBaseUser[2] = "password2"
//dataBaseUser[1] = "password1"

 // или

var dataBaseUser: [String: String] = [:]

dataBaseUser["login3"] = "password3"
dataBaseUser["login2"] = "password2"
dataBaseUser["login1"] = "password1"

print(dataBaseUser)



// Задание 4

/*
 
 import Foundation
 
 enum CustomError: Error, LocalizedError{
     case invalidPassword
    
     public var errorDescription: String?{
         switch self {
     case .invalidPassword:
         return "Неправильный пароль"
         
         }
   }
 }
 
 */


// Выше приведён код, в котором объявляется новый тип ошибки с помощью enum. Добавьте в него ещё два случая ошибки. Назовите их userNotFound и invalidUsername. Не забудьте добавить описание ошибок для новых случаев в соответствующий метод. Ошибка invalidUsername должна иметь ассоциированное значение — некорректный символ в имени пользователя.

enum CustomError: Error, LocalizedError{
    case invalidPassword
    case userNotFound
    case invalidUsername (String)
    //case invalidUsername (Character)

    public var errorDescription: String?{
        switch self {
    case .invalidPassword:
        return "Неправильный пароль"
        case .userNotFound:
            return "Пользователь не найден"
        case let .invalidUsername(name):
            return "\(name)"
        //case let .invalidUsername(char):
            //return "Некорректный символ в имени пользователя \(char)"
            
        }
  }
}

var customError = CustomError.invalidUsername("Некорректный символ в имени пользователя")
customError.errorDescription
print(customError)




//Задание 5
//Напишите функцию обработки имени пользователя и пароля. Функция должна принимать два аргумента и, если такая запись в базе данных отсутствует или имя пользователя неверное, выбрасывать соответствующую ошибку.


func userNamePassword(userName: String, password: String) throws {
    // guard userName.isEmpty || password.description.isEmpty
    guard userName.isEmpty  else {
        throw CustomError.userNotFound
    }
    
    guard password.description.isEmpty else {
        throw CustomError.invalidPassword
    }
    
    for character in userName  {
        guard character.isLetter else {
            throw CustomError.invalidUsername(userName)
        }
    }
}

///
///или
///

func authenticate(user:String, pass:String) throws -> Bool{
    print(user)
    print(pass)
    guard dataBaseUser[user] == pass else {
        throw CustomError.invalidUsername("Некорректный символ в имени пользователя")
    }
    return true
}




//Задание 6
//Напишите код обработки ошибки из функции в задании 5. Выведите описание ошибки, если она произошла, а иначе выведите сообщение, что вход в систему успешно осуществлён.
//Обработку ошибки сделайте двумя способами из лекции:
//С помощью конструкции do-catch.
//С помощью try?.


func errorUserNamePassword(userName: String, password: String) {
    do {
        try authenticate(user: userName, pass: password)
        print(userName, password)
    } catch {
        print(error.localizedDescription)
    }
    
//    print((try? authenticate(user: userName, password: password)) == nil)
}
errorUserNamePassword(userName: "login3", password: "password3")


///
///
/// или
///
///


func errorUserNamePassword1(userName: String, password: String) {
    do {
        try userNamePassword(userName: userName, password: password)
        print(userName, password)
    } catch {
        print(error.localizedDescription)
    }
    
//    print((try? userNamePassword(userName: userName, password: password)) == nil)
}
errorUserNamePassword(userName: "login3", password: "password3")



