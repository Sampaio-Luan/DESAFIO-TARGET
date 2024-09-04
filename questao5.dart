void main() {
  // String a ser invertida
  String original = "Espero se contratado, conto com vocês. Grato desde já !!!";

  // Inverter a string
  String invertida = "";
  for (int i = original.length - 1; i >= 0; i--) {
    invertida += original[i];
  }

  // Imprimir a string invertida
  print(invertida);
}
