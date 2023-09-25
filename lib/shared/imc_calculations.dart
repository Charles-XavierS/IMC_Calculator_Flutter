class IMC {
  double calcularIMC(double peso, double altura) {
    return peso / (altura * altura);
  }

  String interpretarIMC(double imc) {
    final imcResultados = {
      "Magreza grave": (imc) => imc < 16,
      "Magreza moderada": (imc) => imc >= 16 && imc < 17,
      "Magreza leve": (imc) => imc >= 17 && imc < 18.5,
      "Saudável": (imc) => imc >= 18.5 && imc < 25,
      "Sobrepeso": (imc) => imc >= 25 && imc < 30,
      "Obesidade Grau I": (imc) => imc >= 30 && imc < 35,
      "Obesidade Grau II (severa)": (imc) => imc >= 35 && imc < 40,
      "Obesidade Grau III (mórbida)": (imc) => imc >= 40,
    };

    for (var resultado in imcResultados.keys) {
      if (imcResultados[resultado]!(imc)) {
        String imFinal = imc.toStringAsFixed(2);
        return "$imFinal - $resultado";
      }
    }

    return "IMC não classificado"; // Caso não caia em nenhuma categoria
  }
}
