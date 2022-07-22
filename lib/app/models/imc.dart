
class Imc{
   int _height;
   double _weight;

   int get height{
      return _height;
   }

   double get weigth{
      return _weight;
   }

  set height(int height){
    if(height > 0 && height <= 250){
        _height = height;
    }
  }
  set weight(double weight){
    if(weight > 0 && weight <= 400){
      _weight = weight;    
    }
  }

  Imc(this._height,  this._weight);

  double imc_calc(){
    double height_Meters = this._height/100;
    double imc = this._weight/(height_Meters*height_Meters);
    return imc;
  }

}
