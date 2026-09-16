func menu() -> Int? {
    print("""
    Escolha uma opção:
    1. Incluir dados de uma pessoa
    2. Alterar dados de uma pessoa
    3. Apagar dados de uma pessoa
    4. Exibir dados de uma pessoa
    5. Exibir dados de todas as pessoas
    6. Finalizar o programa
    """)
    if let input = readLine() {
        return Int(input) ?? 0
    }
    return nil
}

func addPerson() {
    print("Digite o nome da pessoa:")
    if let name = readLine() {
        if people[name] != nil {
            print("Já existe uma pessoa com esse nome.")
        } else {
            people[name] = readPersonData()
            print("Pessoa adicionada com sucesso!")
        }
    }
}

func readPersonData(_ isNew: Bool = false) -> [String] {
    print("Digite o \(isNew ? "novo email" : "email") da pessoa:")
    let email = readLine() ?? ""
    print("Digite o \(isNew ? "novo telefone" : "telefone") da pessoa:")
    let telefone = readLine() ?? ""
    print("Digite a \(isNew ? "nova idade" : "idade") da pessoa:")
    let idade = readLine() ?? ""
    return [email, telefone, idade]
}

func updatePerson() {
    print("Digite o nome da pessoa que deseja alterar:")
    if let name = readLine() {
        if people[name] == nil {
            print("Pessoa não encontrada.")
        } else {
            people[name] = readPersonData(true)
            print("Dados da pessoa alterados com sucesso!")
        }
    }
}

func deletePerson() {
    print("Digite o nome da pessoa que deseja apagar:")
    if let name = readLine() {
        if people[name] == nil {
            print("Pessoa não encontrada.")
        } else {
            people.removeValue(forKey: name)
            print("Pessoa removida com sucesso!")
        }
    }
}

func printPersonData(_ data: [String]) {
    print("Email: \(data[0])")
    print("Telefone: \(data[1])")
    print("Idade: \(data[2])")
    print()
}

func listAllPeople() {
    print("Dados de todas as pessoas cadastradas:")
    for (name, data) in people {
       print("Nome: \(name)")
       printPersonData(data)
    }
}

func findPerson() {
    print("Digite o nome da pessoa que deseja exibir:")
    if let name = readLine(), let data = people[name] {
        print("Dados de \(name):")
        printPersonData(data)
    } else {
        print("Pessoa não encontrada.")
    }
}

var people: [String: Array<String>] = [:]

while let option = menu(), option != 6 {
    switch option {
        case 1:
            addPerson()   
        case 2:
            updatePerson()
        case 3:
            deletePerson()
        case 4:
            findPerson()
        case 5:
            listAllPeople()
        default:
           break 
    }
    print(people)
    print()
}
print("Programa finalizado.")
