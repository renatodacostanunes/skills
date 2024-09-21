// O Princípio do Aberto/Fechado (OCP - Open/Closed Principle) do SOLID afirma que uma classe, módulo ou função deve estar aberta para extensão, mas fechada para modificação. Isso significa que devemos ser capazes de adicionar novas funcionalidades sem alterar o código existente.

// Uma maneira comum de seguir o OCP é usando herança, interfaces ou composição, permitindo que comportamentos sejam estendidos sem precisar modificar o código já implementado.

// Exemplo que viola o OCP
// Aqui temos um exemplo que viola o OCP. Temos uma classe DiscountCalculator que calcula o desconto para diferentes tipos de clientes. No entanto, se precisarmos adicionar um novo tipo de cliente, teremos que modificar o método calculateDiscount, o que quebra o princípio.

class DiscountCalculator {
  double calculateDiscount(String customerType, double price) {
    if (customerType == 'regular') {
      return price * 0.05; // 5% de desconto para clientes regulares
    } else if (customerType == 'vip') {
      return price * 0.2; // 20% de desconto para clientes VIP
    } else {
      return 0; // Sem desconto
    }
  }
}

// Esse código não segue o OCP porque, sempre que um novo tipo de cliente for adicionado (por exemplo, um cliente superVIP), você terá que modificar o método calculateDiscount, o que não é ideal.

// Refatoração para seguir o OCP
// Agora, vamos refatorar o código para seguir o OCP, permitindo a adição de novos tipos de desconto sem alterar o código existente. Vamos usar herança ou interfaces para tornar o código extensível.

// Solução usando Herança e Polimorfismo
// Aqui está uma versão que segue o princípio Aberto/Fechado:

// Classe base para qualquer estratégia de desconto
abstract class Discount {
  double applyDiscount(double price);
}

// Desconto para clientes regulares
class RegularDiscount extends Discount {
  @override
  double applyDiscount(double price) {
    return price * 0.05; // 5% de desconto
  }
}

// Desconto para clientes VIP
class VipDiscount extends Discount {
  @override
  double applyDiscount(double price) {
    return price * 0.2; // 20% de desconto
  }
}

// Calculadora de desconto, que agora depende de uma abstração
class DiscountCalculator1 {
  final Discount discount;

  DiscountCalculator1(this.discount);

  double calculate(double price) {
    return discount.applyDiscount(price);
  }
}

// Exemplo de uso das classes refatoradas:

void main() {
  double price = 100.0;

  // Cliente regular
  Discount regularDiscount = RegularDiscount();
  DiscountCalculator1 regularCalculator = DiscountCalculator1(regularDiscount);
  print("Regular customer discount: \$${regularCalculator.calculate(price)}");

  // Cliente VIP
  Discount vipDiscount = VipDiscount();
  DiscountCalculator1 vipCalculator = DiscountCalculator1(vipDiscount);
  print("VIP customer discount: \$${vipCalculator.calculate(price)}");
}

// Benefícios de Seguir o OCP:

// Extensibilidade: Podemos adicionar novos tipos de desconto sem alterar a classe DiscountCalculator ou o código existente.
// Facilidade de Manutenção: Manter e atualizar o código se torna mais fácil, pois novas funcionalidades podem ser adicionadas sem o risco de introduzir bugs ao modificar código antigo.
// Reutilização: O código é mais modular e reutilizável, já que as novas implementações de desconto podem ser usadas em outros lugares sem alterar a lógica existente.

// Conclusão:

// Seguir o Princípio do Aberto/Fechado nos permite criar sistemas mais flexíveis e modulares, onde novas funcionalidades podem ser introduzidas por meio da extensão de classes e interfaces, sem a necessidade de modificar o código existente. Isso torna o sistema mais robusto, menos sujeito a erros e mais fácil de manter.