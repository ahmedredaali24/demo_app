import 'package:bloc/bloc.dart';
import 'package:demo_app/bus/cubit/states.dart';

import 'package:flutter/cupertino.dart';


class LoginScreenViewModel extends Cubit<LoginStates> {
  LoginScreenViewModel()
      : super(LoginInitialState());

  var formKey = GlobalKey<FormState>();
  var passwordController = TextEditingController();
  var emailController = TextEditingController();
  bool isObscure = true;

  changeObscure() {
    if (isObscure) {
      isObscure = false;
    } else {
      isObscure = true;
    }
    emit(LoginIsObscureState());
  }

  // void login() async {
  // if(formKey.currentState!.validate()){
  //   emit(LoginLoadingState());
  //   var either = await loginUseCase.invoke(
  //       emailController.text, passwordController.text);
  //   either.fold((l) => emit(LoginErrorState(errorMessage: l.errorMessage)),
  //           (response) => emit(LoginSuccessState());
  // }
  // }


}
