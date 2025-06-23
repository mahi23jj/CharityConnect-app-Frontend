import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travel/autentication/Login/logindata.dart';
import 'package:travel/autentication/login.dart';

class Loginprovider extends Cubit<user>{

  Loginprovider() :super(user(name: '', email: '', phone: '', Password: ''));

  
  List<user> users=[];

  void signup(String name, String email, String phone, String Password) {
    user person= user(name: name, email: email, phone: phone, Password: Password);
    users.add(person);
    emit(person);
  }

void signin(String name, String email, String phone, String Password){
  user person= user(name: name, email: email, phone: phone, Password: Password);
  if(users.contains(person)){
    emit(person) ;
  }else{
    print('user doesn\'t exist');
  }
}
 

 

}