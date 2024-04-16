
import Foundation

class ContactsService {
        
    private var allContactslist: [UserInfo] = [
        .init(
            name: "Дмитрий",
            surname: "Иванов",
            phone: "+4(07)283-46-15",
            city: "Ханты-Мансийск"
        ),
        .init(
            name: "Георгий",
            surname: "Ермаков",
            phone: "+71(0879)881-86-56",
            city: "Георгиевск"
        ),
        .init(
            name: "Виктория",
            surname: "Старикова",
            phone: "+761(7989)244-30-81",
            city: "Новоуральск"
        ),
        .init(
            name: "Андрей",
            surname: nil,
            phone: "+6(93)219-49-69",
            city: "Буденновск"
        ),
        .init(
            name: "Александра",
            surname: "Анисимова",
            phone: "+36(56)440-26-57",
            city: nil
        ),
        .init(
            name: "Мария",
            surname: "Беляева",
            phone: "+5(172)754-07-44",
            city: "Славянск-на-Кубани"
        ),
        .init(
            name: "Михаил",
            surname: "Кузьмин",
            phone: "+032(059)631-66-81",
            city: nil
        ),
        .init(
            name: "Даниил",
            surname: "Егоров",
            phone: "+87(0523)783-43-71",
            city: "Георгиевск"
        ),
        .init(
            name: "Ульяна",
            surname: "Фадеева",
            phone: "+14(2079)002-79-40",
            city: "Иваново"
        ),
        .init(
            name: "София",
            surname: "Воронова",
            phone: "+108(2299)243-06-71",
            city: "Горно-Алтайск"
        ),
        .init(
            name: "Мария",
            surname: "Кочергина",
            phone: "+5(123)340-04-40",
            city: nil
        ),
        .init(
            name: "Елисей",
            surname: "Соколов",
            phone: "+6(13)323-45-88",
            city: "Георгиевск"
        ),
        .init(
            name: "Матвей",
            surname: "Кузнецов",
            phone: "+46(5116)447-94-83",
            city: "Георгиевск"
        ),
        .init(
            name: "Александр",
            surname: "Мицев",
            phone: "+965(78)118-66-65",
            city: "Калининград"
        ),
        .init(
            name: "Алиса",
            surname: "Егорова",
            phone: "+1(97)047-58-55",
            city: "Щекино"
        ),
        .init(
            name: "Екатерина",
            surname: nil,
            phone: "+38(24)227-74-85",
            city: "Батайск"
        ),
        .init(
            name: "София",
            surname: "Лебедева",
            phone: "+4(56)760-06-48",
            city: "Санкт-Петербург"
        ),
        .init(
            name: "Таисия",
            surname: "Куприянова",
            phone: "+2(767)901-73-44",
            city: nil
        ),
        .init(
            name: "Олеся",
            surname: "Николаева",
            phone: "+8(69)754-12-01",
            city: "Асбест"
        ),
        .init(
            name: "Фёдор",
            surname: nil,
            phone: "+75(08)855-44-56",
            city: "Кириши"
        ),
        .init(
            name: "Григорий",
            surname: "Панин",
            phone: "+9(79)068-84-33",
            city: nil
        ),
        .init(
            name: "Елизавета",
            surname: "Бирюкова",
            phone: "+64(0223)100-65-51",
            city: "Невинномысск"
        ),
        .init(
            name: "Илья",
            surname: "Постников",
            phone: "+1(020)116-00-03",
            city: "Кингисепп"
        )
        ,
        .init(
            name: "Анастасия",
            surname: nil,
            phone: "+50(2105)265-33-08",
            city: nil
        ),
        .init(
            name: "Артём",
            surname: "Марков",
            phone: "+20(2283)994-00-84",
            city: "Киселевск"
        )
    ]

    
    private var namesLetters: [String] = []
    private var groupedContacts: [String: [UserInfo]] = [:]
    
    init() {
        // Создание списка разбитого на группы
        groupedContacts = Dictionary(grouping: allContactslist, by: { $0.name.first?.uppercased() ?? "" })
        namesLetters = groupedContacts.keys.sorted()
    }
    
    func getKeys() -> [String] {
        // Возвращает список доступных ключей
        return namesLetters
    }
    
//    func getContactsDict() -> [String: [UserInfo]] {
//        return groupedContacts
//    }
    
    func getContacts(by key: String) -> [UserInfo] {
       return groupedContacts[key] ?? []
    }
    
    func addContact(_ contact: UserInfo) {
        guard let firstLetter = contact.name.first?.uppercased() else { return }
        
        var contactsArray = groupedContacts[firstLetter] ?? []
        contactsArray.append(contact)
        groupedContacts.updateValue(contactsArray, forKey: firstLetter)
        if !namesLetters.contains(firstLetter) {
            namesLetters.append(firstLetter)
        }
    
    }
    
    func removeContact(_ contact: UserInfo) {
        guard let firstLetter = contact.name.first?.uppercased() else { return }

        var contactsArray = groupedContacts[firstLetter] ?? []
        contactsArray.removeAll(where: { $0.id == contact.id })
        groupedContacts[firstLetter] = contactsArray
        if contactsArray.isEmpty {
            namesLetters.removeAll(where: { $0 == firstLetter })
        }
    }
}

struct UserInfo {
    let id: String = UUID().uuidString
    let name: String
    let surname: String?
    let phone: String?
    let city: String?
    let email: String? = Bool.random() ? UUID().uuidString.prefix(7) + "@test.ru" : nil
    let birthDateString: String = createBirthDate()
    let infoCreationDate: String = createInfoDate()
    let imageName: String = "icon" + Int.random(in: 1...20).description
    
    static private func createBirthDate() -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd.MM.yyyy"
        
        return formatter.string(from: Date.randomBirthDate())
    }
    
    static private func createInfoDate() -> String {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .short
        
        return formatter.string(from: Date.randomContactCreationDate())
    }
}

extension Date {
    static func randomBirthDate() -> Date {
        
        let date1 = Date(timeIntervalSince1970: 337538136)
        let date2 = Date(timeIntervalSince1970: 1126452936)
        
       return Date(
            timeIntervalSinceNow: .random(
                in: date1.timeIntervalSinceNow...date2.timeIntervalSinceNow
            )
        )
    }
    
    static func randomContactCreationDate() -> Date {
        
        let date1 = Date(timeIntervalSince1970: 1568226287)
        let date2 = Date(timeIntervalSince1970: 1694456687)
        
       return Date(
            timeIntervalSinceNow: .random(
                in: date1.timeIntervalSinceNow...date2.timeIntervalSinceNow
            )
        )
    }
}
