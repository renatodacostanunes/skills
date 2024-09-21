// O Princípio da Segregação de Interfaces (ISP - Interface Segregation Principle) afirma que nenhum cliente deve ser forçado a depender de métodos que não utiliza. Em outras palavras, é melhor ter várias interfaces pequenas e específicas do que uma interface grande e genérica.

// Esse princípio ajuda a evitar que classes sejam obrigadas a implementar métodos que não fazem sentido para elas, mantendo o design do sistema mais flexível e modular.

// Exemplo que viola o ISP
// Imagine que temos uma interface Worker que define três métodos: work(), eat(), e sleep(). Agora, tanto uma classe HumanWorker quanto uma classe RobotWorker implementam essa interface. O problema é que, no caso de RobotWorker, o método eat() e sleep() não faz sentido, pois robôs não comem nem dormem.

// Interface grande que contém métodos que nem todos os trabalhadores precisam
abstract class Worker {
  void work();
  void eat();
  void sleep();
}

// Trabalhador humano que implementa todos os métodos
class HumanWorker implements Worker {
  @override
  void work() {
    print('Human is working');
  }

  @override
  void eat() {
    print('Human is eating');
  }

  @override
  void sleep() {
    print('Human is sleeping');
  }
}

// Trabalhador robô que não precisa dos métodos 'eat' e 'sleep'
class RobotWorker implements Worker {
  @override
  void work() {
    print('Robot is working');
  }

  @override
  void eat() {
    // Não faz sentido para um robô
    throw Exception('Robots do not eat');
  }

  @override
  void sleep() {
    // Não faz sentido para um robô
    throw Exception('Robots do not sleep');
  }
}

void main() {
  Worker human = HumanWorker();
  human.work();
  human.eat();
  human.sleep();

  Worker robot = RobotWorker();
  robot.work();
  // robot.eat(); // Isso lança uma exceção
}

// Problema:
// Aqui, a classe RobotWorker é forçada a implementar métodos como eat() e sleep(), que não fazem sentido para um robô, o que viola o ISP. O robô não deveria precisar implementar métodos irrelevantes.

// Refatoração para seguir o ISP
// Agora, vamos aplicar o ISP, criando interfaces menores e mais específicas. Vamos segregar a interface Worker em várias interfaces que representem diferentes responsabilidades.

// Interface para qualquer entidade que pode trabalhar
abstract class Workable {
  void work();
}

// Interface para entidades que podem comer
abstract class Eatable {
  void eat();
}

// Interface para entidades que podem dormir
abstract class Sleepable {
  void sleep();
}

// Trabalhador humano, que implementa todas as interfaces
class HumanWorker1 implements Workable, Eatable, Sleepable {
  @override
  void work() {
    print('Human is working');
  }

  @override
  void eat() {
    print('Human is eating');
  }

  @override
  void sleep() {
    print('Human is sleeping');
  }
}

// Trabalhador robô, que apenas implementa a interface de trabalho
class RobotWorker1 implements Workable {
  @override
  void work() {
    print('Robot is working');
  }
}

void main2() {
  Workable humanWorker = HumanWorker1();
  humanWorker.work();

  Eatable humanEater = HumanWorker1();
  humanEater.eat();

  Sleepable humanSleeper = HumanWorker1();
  humanSleeper.sleep();

  Workable robotWorker = RobotWorker1();
  robotWorker.work(); // Robô só trabalha, sem erros
}

// Como a refatoração segue o ISP:
// Criamos três interfaces específicas: Workable, Eatable, e Sleepable. Cada uma define apenas um comportamento específico.
// HumanWorker implementa todas as três interfaces, pois humanos podem trabalhar, comer e dormir.
// RobotWorker implementa apenas a interface Workable, já que robôs apenas trabalham e não precisam das responsabilidades de comer ou dormir.

// Benefícios de Seguir o ISP:
// Classes mais coesas: Cada classe implementa apenas os métodos que realmente utiliza.
// Facilidade de manutenção: Se um novo tipo de trabalhador (como um robô avançado) precisar apenas trabalhar e dormir, ele pode implementar apenas as interfaces relevantes, sem precisar implementar métodos que não fazem sentido.
// Reutilização de código: Agora podemos adicionar novos comportamentos facilmente, sem inflar uma interface única com métodos que muitas classes não vão usar.

// Conclusão:
// Seguindo o Princípio da Segregação de Interfaces, dividimos interfaces grandes em várias interfaces menores e mais específicas, garantindo que as classes implementem apenas os métodos que realmente fazem sentido para elas. Isso torna o código mais flexível, fácil de manter e evita dependências desnecessárias entre componentes do sistema.
