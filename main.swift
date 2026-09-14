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

func addPerson() -> (String, String, String, String) {
    let person: (name: String, email: String, telefone: String, idade: String)
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
        person.telefone = readLine()
    }
    print("Digite a idade da pessoa:")
    if let idade = readLine() {
        
    person.idade = readLine()
    }
    return person
}

let people: [String: Array<String>] = [:]

while let option = menu(), option != 6 {
    switch option {
    case 1:
       addPerson() 
    default:
       break 
    }
    
}
