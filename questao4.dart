//4) Dado o valor de faturamento mensal de uma distribuidora, detalhado por estado:

//• SP – R$67.836,43
//• RJ – R$36.678,66
//• MG – R$29.229,88
//• ES – R$27.165,48
//• Outros – R$19.849,53

//Escreva um programa na linguagem que desejar onde calcule o percentual de representação 
//que cada estado teve dentro do valor total mensal da distribuidora. 

void main() {
  // Dados de faturamento mensal por estado
  Map<String, double> faturamentoMensal = {
    'SP': 67836.43,
    'RJ': 36678.66,
    'MG': 29229.88,
    'ES': 27165.48,
    'Outros': 19849.53
  };

  // Calcular o valor total mensal
  double valorTotalMensal = 0;
  faturamentoMensal.forEach((estado, valor) {
    valorTotalMensal += valor;
  });

  // Calcular o percentual de representação de cada estado
  faturamentoMensal.forEach((estado, valor) {
    double percentual = (valor / valorTotalMensal) * 100;
    print('$estado: ${percentual.toStringAsFixed(2)}%');
  });
}