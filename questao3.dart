import 'dart:convert';
import 'dart:io';

class Faturamento {
  int? dia;
  double? valor;

  Faturamento({required this.dia, required this.valor});

  Faturamento.fromJson(Map<String, dynamic> json) {
    dia = json['dia'];
    valor = json['valor'];
  }
}

void main() {
  print("Calculando faturamento mensal...");

  // Ler dados do arquivo JSON
  String json = File('dados.json').readAsStringSync();

  List<dynamic> data = jsonDecode(json);
  List<Faturamento> dados = [];
  print('dia   valor');
  for (int i = 0; i < data.length; i++) {
    dados.add(Faturamento.fromJson(data[i]));
    print('${dados[i].dia}   ${dados[i].valor}');
  }

  
  //Calcular faturamento mensal

  double totalFaturamento = 0;
  List<double> diasFaturados = [];
  List<int> diasFaturamentoAcimaMedia = [];
  double mediaFaturamento = 0;
  double menorFaturamento = dados[0].valor!;
  double maiorFaturamento = dados[0].valor!;

  for (var elemento in dados) {
    if (elemento.valor != null && elemento.valor! > 0) {
      totalFaturamento += elemento.valor!;
      diasFaturados.add(elemento.valor!);
      if (elemento.valor! < menorFaturamento) {
        menorFaturamento = elemento.valor!;
      }
      if (elemento.valor! > maiorFaturamento) {
        maiorFaturamento = elemento.valor!;
      }
    }
  }

  // Calcular média mensal
  mediaFaturamento = totalFaturamento / (diasFaturados.length);

  // Calcular dias com faturamento acima da média
  int diasAcimaMedia = 0;
  for (var elemento in dados) {
    if (elemento.dia != null && elemento.valor! > mediaFaturamento) {
      diasFaturamentoAcimaMedia.add(elemento.dia!);
      diasAcimaMedia++;
    }
  }


  print("O menor valor de faturamento ocorrido em um dia do mês: R\$${menorFaturamento.toStringAsFixed(2)}");
  print("O maior valor de faturamento ocorrido em um dia do mês: R\$${maiorFaturamento.toStringAsFixed(2)}");
  print("$diasAcimaMedia dias (${diasFaturamentoAcimaMedia.join(', ')}) tiveram o faturamento acima da média mensal R\$${mediaFaturamento.toStringAsFixed(2)} ");
}
