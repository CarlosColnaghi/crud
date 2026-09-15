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
    if let input = readLine(), let option = Int(input), option >= 1 && option <= 6 {
        return option
    }
    return nil
}

func addPerson() -> (name: String, email: String, telefone: String, idade: String) {
    var person: (name: String, email: String, telefone: String, idade: String) = ("", "", "", "")
    print("Digite o nome da pessoa que deseja alterar:")
    if let name = readLine() {
        person.name = name
    }
    print("Digite o email da pessoa:")
    if let email = readLine() {
        person.email = email 
    }
    print("Digite o telefone da pessoa:")
    if let telefone = readLine() {
        person.telefone = telefone
    }
    print("Digite a idade da pessoa:")
    if let idade = readLine() {      
        person.idade = idade
    }
    return person
}


var people: [String: Array<String>] = [:]

while let option = menu(), option != 6 {
    switch option {
    case 1:
       let person: (name: String, email: String, telefone: String, idade: String) = addPerson()
       if !people.keys.contains(person.name) {
            people[person.name] = [person.email, person.telefone, person.idade]
            print("Pessoa adicionada com sucesso!")
       }
    case 2:
       let person: (name: String, email: String, telefone: String, idade: String) = addPerson()
        break 
    default:
       break 
    }
    print(people)    
}
