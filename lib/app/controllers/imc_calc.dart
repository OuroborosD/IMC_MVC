
import '../models/imc.dart';

class Controller_Imc{
  
  int img(double imc){
    int img;
    if(imc <= 20){
      img = 1;
    }else if(imc <=29.9){
      img = 2;

    }else if(imc <=34.9){
      img = 3;
 
    }else{
      img = 4;
    }

    return img;
  }

  String status(double imc){
    String status="";
    if(imc <= 20){
      status = 'Sobrepeso';
    }else if(imc <=29.9){
      status = 'IMC Normal';

    }else if(imc <=34.9){
      status = 'Obesidade I';
 
    }else{
      status = 'Obesidade II';
    }
    return status;
  }

  

}