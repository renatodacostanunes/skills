// O Princípio da Substituição de Liskov (LSP - Liskov Substitution Principle), parte dos princípios SOLID, estabelece que subclasses devem poder ser substituídas por suas classes base sem que o comportamento correto do programa seja alterado. Ou seja, objetos de uma classe derivada devem poder substituir objetos de sua classe base sem impactar o funcionamento.

// Se uma classe filha modificar o comportamento da classe base de maneira que quebre a funcionalidade esperada, o LSP está sendo violado.

// Exemplo que viola o LSP
// Vamos começar com um exemplo que viola o LSP. Imagine que temos uma classe Bird e uma subclasse Penguin. A classe Bird possui um método fly(), mas Penguin, como não voa, não pode implementar esse método corretamente.

class Bird {
  void fly() {
    print('Flying');
  }
}

class Penguin extends Bird {
  @override
  void fly() {
    // Viola o LSP, pois um pinguim não pode voar.
    throw Exception('Penguins cannot fly');
  }
}

void main() {
  Bird bird = Bird();
  bird.fly(); // Funciona corretamente

  Bird penguin = Penguin();
  penguin.fly(); // Lança uma exceção, violando o LSP

  main2();
}

// Aqui, ao tentar substituir um objeto da classe Bird por um objeto da subclasse Penguin, o comportamento esperado é quebrado, porque pinguins não voam. O programa falha, pois o método fly() não é aplicável para pinguins.

// Refatoração para seguir o LSP
// Para seguir o princípio de substituição de Liskov, podemos reestruturar o código de forma que Penguin não herde de Bird diretamente, já que nem todos os pássaros podem voar. Podemos introduzir uma classe mais abstrata ou uma interface que representa apenas pássaros que podem voar.

// Classe mais geral para todos os pássaros
class Bird1 {
  void makeSound() {
    print('Bird is making a sound');
  }
}

// Interface para pássaros que podem voar
abstract class FlyingBird extends Bird1 {
  void fly();
}

// Pássaro que pode voar
class Sparrow extends FlyingBird {
  @override
  void fly() {
    print('Sparrow is flying');
  }
}

// Pinguim, que é um pássaro, mas não voa
class Penguin1 extends Bird1 {
  void swim() {
    print('Penguin is swimming');
  }
}

void main2() {
  // Pardal pode ser substituído pela sua classe base sem problemas
  FlyingBird sparrow = Sparrow();
  sparrow.fly(); // Funciona corretamente

  // Pinguim é um pássaro, mas não um pássaro que voa
  Bird1 penguin = Penguin1();
  penguin.makeSound(); // Funciona corretamente
  // penguin.fly(); // Não existe o método 'fly', respeitando o LSP
}

// Como a refatoração segue o LSP:

// Penguin agora é um Bird, mas não um FlyingBird, pois pinguins não podem voar. Assim, Penguin não precisa sobrescrever ou lançar exceções para o método fly().
// Sparrow, que pode voar, herda de FlyingBird, uma interface que define o comportamento de voar.
// Agora podemos substituir qualquer objeto de FlyingBird por qualquer pássaro que possa voar (como Sparrow), sem quebrar o comportamento esperado.

// Benefícios de seguir o LSP:

// Substituibilidade garantida: As subclasses podem substituir suas classes base sem modificar o comportamento esperado da aplicação.
// Código mais robusto e seguro: Evitamos lançar exceções ou ter comportamentos inesperados ao fazer substituições de classes.
// Design mais claro e flexível: O design do código é mais intuitivo e flexível, respeitando as capacidades reais dos objetos.

// Conclusão:

// O Princípio da Substituição de Liskov garante que as subclasses possam ser usadas no lugar de suas classes base sem quebrar o código. Ao seguir o LSP, você evita criar hierarquias de classes onde subclasses introduzem comportamentos inesperados ou lançam exceções desnecessárias, tornando o código mais robusto e fácil de manter.