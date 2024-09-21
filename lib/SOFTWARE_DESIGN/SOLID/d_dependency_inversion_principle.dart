// O Princípio da Inversão de Dependências (DIP - Dependency Inversion Principle) é o último dos princípios SOLID e estabelece duas regras principais:

// Módulos de alto nível não devem depender de módulos de baixo nível. Ambos devem depender de abstrações (interfaces ou classes abstratas).
// Abstrações não devem depender de detalhes. Detalhes devem depender de abstrações.
// Em outras palavras, o DIP sugere que devemos depender de interfaces ou abstrações, em vez de implementações concretas. Isso promove maior flexibilidade, desacoplamento e facilita a manutenção e evolução do código.

// Exemplo que viola o DIP
// Aqui, temos uma classe BackendService que faz requisições HTTP diretamente. A classe UserRepository depende diretamente de BackendService, o que torna difícil mudar ou testar o código sem modificar as implementações concretas. Isso viola o DIP, pois o UserRepository está dependendo de uma implementação de baixo nível (BackendService), em vez de uma abstração.

class BackendService {
  void getUserData() {
    print("Fetching user data from server...");
  }
}

class UserRepository {
  final BackendService backendService;

  UserRepository(this.backendService);

  void getUser() {
    backendService.getUserData();
  }
}

void main() {
  // UserRepository depende diretamente de BackendService
  BackendService service = BackendService();
  UserRepository repository = UserRepository(service);

  repository.getUser();

  main2();
}

// Problema:
// Aqui, a classe UserRepository depende diretamente de BackendService. Isso cria um forte acoplamento entre as duas classes, o que torna difícil substituir o serviço por outra implementação (por exemplo, um mock para testes, ou um serviço diferente para outro ambiente).

// Refatoração para seguir o DIP
// Agora, vamos refatorar o código para que a classe UserRepository dependa de uma abstração (interface) em vez de uma implementação concreta. Isso permitirá que diferentes implementações sejam fornecidas ao UserRepository, promovendo maior flexibilidade.

// Interface abstrata que define um contrato para qualquer serviço backend
abstract class BackendService1 {
  void getUserData();
}

// Implementação concreta do BackendService que faz requisições HTTP reais
class HttpBackendService implements BackendService {
  @override
  void getUserData() {
    print("Fetching user data from HTTP server...");
  }
}

// Implementação de um serviço mock para testes ou uso offline
class MockBackendService implements BackendService {
  @override
  void getUserData() {
    print("Fetching user data from mock service...");
  }
}

// UserRepository depende agora de uma abstração (BackendService) e não de uma implementação concreta
class UserRepository1 {
  final BackendService backendService;

  UserRepository1(this.backendService);

  void getUser() {
    backendService.getUserData();
  }
}

void main2() {
  // Usando HttpBackendService no ambiente de produção
  BackendService httpService = HttpBackendService();
  UserRepository1 httpRepository = UserRepository1(httpService);
  httpRepository.getUser();

  // Usando MockBackendService para testes ou ambiente de desenvolvimento
  BackendService mockService = MockBackendService();
  UserRepository1 mockRepository = UserRepository1(mockService);
  mockRepository.getUser();
}

// Como a refatoração segue o DIP:
// A classe UserRepository não depende mais de uma implementação concreta (HttpBackendService). Em vez disso, ela depende da interface BackendService, que define o contrato para qualquer serviço backend.
// Agora podemos trocar a implementação de BackendService por outra (como MockBackendService), sem precisar modificar UserRepository.

// Benefícios de Seguir o DIP:
// Desacoplamento: A classe UserRepository está desacoplada de qualquer implementação específica de backend, tornando o código mais flexível.
// Testabilidade: Podemos facilmente trocar a implementação concreta por um mock, facilitando testes unitários.
// Extensibilidade: Se quisermos adicionar uma nova implementação de backend (por exemplo, um serviço REST ou GraphQL), podemos fazer isso sem modificar o código existente no UserRepository.
// Facilidade de manutenção: O sistema se torna mais fácil de manter, pois mudanças em uma implementação de baixo nível não afetam diretamente os módulos de alto nível.

// Conclusão:
// O Princípio da Inversão de Dependências promove a criação de sistemas mais flexíveis e desacoplados, onde os módulos de alto nível dependem de abstrações e não de implementações concretas. Isso facilita a substituição de implementações, melhora a testabilidade e mantém o código mais modular e fácil de manter.
