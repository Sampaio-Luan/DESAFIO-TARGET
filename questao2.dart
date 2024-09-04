//2) Dado a sequência de Fibonacci, onde se inicia por 0 e 1
//e o próximo valor sempre será a soma dos 2 valores anteriores (exemplo: 0, 1, 1, 2, 3, 5, 8, 13, 21, 34...),
//escreva um programa na linguagem que desejar onde, informado um número,
//ele calcule a sequência de Fibonacci e retorne uma mensagem avisando se o número informado pertence ou não a sequência.

void main() {
  print("Digite um número: ");
  int numero = 6;

  bool pertence = fibonacci(numero);

  if (pertence) {
    print("O número $numero pertence à sequência de Fibonacci.");
  } else {
    print("O número $numero não pertence à sequência de Fibonacci.");
  }
}

bool fibonacci(int numero) {
  int a = 0;
  int b = 1;
  int proximo;

  while (true) {
    if (a == numero) {
      return true;
    }
    if (a > numero) {
      return false;
    }
    proximo = a + b;
    a = b;
    b = proximo;
  }
}