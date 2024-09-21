// O Princípio da Responsabilidade Única (SRP - Single Responsibility Principle) do SOLID afirma que uma classe deve ter apenas um motivo para mudar, ou seja, ela deve ter uma única responsabilidade bem definida. Em outras palavras, uma classe deve ser responsável por uma única tarefa ou funcionalidade.

// Vou mostrar um exemplo em Dart que segue o SRP e outro que viola esse princípio, para ilustrar a diferença.

// Exemplo que viola o SRP
// Aqui temos uma classe User que faz múltiplas tarefas: armazena os dados do usuário, valida o e-mail e salva os dados no banco de dados. Essa classe viola o SRP, pois tem mais de uma responsabilidade (armazenar dados, validação, e acesso ao banco de dados).

class User {
  String name;
  String email;

  User(this.name, this.email);

  // Valida se o email é válido
  bool validateEmail() {
    return email.contains('@');
  }

  // Salva o usuário no banco de dados
  void saveToDatabase() {
    print("Saving $name with email $email to the database.");
  }
}

// Neste exemplo, a classe User faz muito mais do que apenas representar um usuário. Ela valida e também salva no banco de dados, o que fere o SRP.

// Refatoração para seguir o SRP
// Agora, vamos aplicar o SRP dividindo essas responsabilidades em classes separadas. Cada classe será responsável por uma única tarefa.

// Classe responsável apenas pelos dados do usuário
class User1 {
  String name;
  String email;

  User1(this.name, this.email);
}

// Classe responsável pela validação de e-mail
class EmailValidator {
  bool isValid(String email) {
    return email.contains('@');
  }
}

// Classe responsável por salvar o usuário no banco de dados
class UserRepository {
  void save(User user) {
    print("Saving ${user.name} with email ${user.email} to the database.");
  }
}

// Agora temos três classes com responsabilidades distintas:

// A classe User é responsável apenas pelos dados do usuário.
// A classe EmailValidator é responsável apenas por validar o e-mail.
// A classe UserRepository é responsável apenas por interagir com o banco de dados.

// Exemplo de uso das classes refatoradas:

void main() {
  // Criação do usuário
  User user = User('John Doe', 'john.doe@example.com');

  // Validação do e-mail
  EmailValidator validator = EmailValidator();
  if (validator.isValid(user.email)) {
    // Salvando no banco de dados
    UserRepository repository = UserRepository();
    repository.save(user);
  } else {
    print("Invalid email for user ${user.name}");
  }
}

// Benefícios de Seguir o SRP:
// Código mais limpo e organizado: Cada classe tem uma responsabilidade única e clara.
// Facilidade de manutenção: Se houver uma mudança na lógica de validação ou na forma de salvar os dados, você só precisa modificar uma classe, sem afetar as outras.
// Reutilização: Agora você pode reutilizar o EmailValidator em outras partes da aplicação sem depender do User ou do UserRepository.
// Testabilidade: Com classes menores e focadas, fica mais fácil escrever testes unitários para cada responsabilidade.
// Esse é um exemplo claro de como o Princípio da Responsabilidade Única melhora a estrutura do código, mantendo-o mais flexível e fácil de entender.