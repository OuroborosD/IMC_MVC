
import '../models/imc.dart';

class Controller_Imc{
  
  String img(double imc){
    String img='';
    if(imc <= 20){
      img = 'assets/images/sobrepeso.png';
    }else if(imc <=29.9){
      img = 'assets/images/normal.png';

    }else if(imc <=34.9){
      img = 'assets/images/obeso1.png';
 
    }else{
      img = 'assets/images/obeso2.png';
    }

    return img;
  }

  String status(double imc){
    String status="";
    if(imc <= 20){
      status = 'Sobrepeso';
    }else if(imc <=29.9){
      status = 'peso normal';

    }else if(imc <=34.9){
      status = 'obesidade moderada';
 
    }else{
      status = 'obesidade severa';
    }
    return status;
  }

  

}