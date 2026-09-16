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

func add() {
    print("Digite o nome da pessoa:")
    if let name = readLine() {
        if people[name] != nil {
            print("Já existe uma pessoa com esse nome.")
        } else {
            people[name] = addInfo()
            print("Pessoa adicionada com sucesso!")
        }
    }
}

func addInfo() -> [String] {
    print("Digite o email da pessoa:")
    let email = readLine() ?? ""
    print("Digite o telefone da pessoa:")
    let telefone = readLine() ?? ""
    print("Digite a idade da pessoa:")
    let idade = readLine() ?? ""
    return [email, telefone, idade]
}

func update() {
    print("Digite o nome da pessoa que deseja alterar:")
    if let name = readLine() {
        if people[name] == nil {
            print("Pessoa não encontrada.")
        } else {
            people[name] = addInfo()
            print("Dados da pessoa alterados com sucesso!")
        }
    }
}

func delete() {
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

func display(_ name: String, _ info: [String]) {
    print("Nome: \(name)")
    print("Email: \(info[0])")
    print("Telefone: \(info[1])")
    print("Idade: \(info[2])")
    print()
}

func showAll() {
    print("Dados de todas as pessoas cadastradas:")
    for (name, info) in people {
        display(name, info)
    }
}

func show() {
    print("Digite o nome da pessoa que deseja exibir:")
    if let name = readLine(), let info = people[name] {
        print("Dados de \(name):")
        display(name, info)
    } else {
        print("Pessoa não encontrada.")
    }
}

var people: [String: Array<String>] = [:]

while let option = menu(), option != 6 {
    switch option {
        case 1:
            add()   
        case 2:
            update()
        case 3:
            delete()
        case 4:
            show()
        case 5:
            showAll()
        default:
           break 
    }
    print(people)
    print()
}
print("Programa finalizado.")
