class Imc {
  int? _height;
  double? _weight;

  int get height {
    return _height != null ? _height! : 5;
  }

  double get weight {
    return _weight != null ? _weight! : 5;
  }

  void set height(int height) {
    if (height > 0 && height <= 250) {
      _height = height;
    } else {
      _height = 0;
    }
  }

  void set weight(double weight) {
    if (weight > 0 && weight <= 400) {
      _weight = weight;
    } else {
      _weight = 0;
    }

  }

  Imc(); // não coloca o this no construtor

  double imc_calc() {
    double height_Meters = _height! / 100;
    double imc = _weight! / (height_Meters * height_Meters);
    return imc;
  }
}
