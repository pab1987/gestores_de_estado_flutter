import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:form_app/infrastructure/inputs/inputs.dart';
import 'package:form_app/infrastructure/inputs/password.dart';
import 'package:formz/formz.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterFormState> {
  RegisterCubit() : super(const RegisterFormState());

  void onSubmit() {
    emit(state.copiWith(
      formStatus: FormStatus.validating,
      userName: Username.dirty(state.userName.value),
      email: Email.dirty(state.email.value),
      password: Password.dirty(state.password.value),
      isValid: Formz.validate([
        state.userName,
        state.password,
        // TODO: state.email
        
      ])
    ));
    print('Submit: $state');
  }

  void userNameChanged(String value ) {
    final username = Username.dirty(value);

    emit(state.copiWith(
      userName: username,
      isValid: Formz.validate([username, state.password, state.email])
    ));
  } 
  void emailChanged(String value ) {
    final email =  Email.dirty(value);
    emit(state.copiWith(
      email: email,
      isValid: Formz.validate([email, state.password, state.userName])

    ));
  } 
  void passwordChanged(String value ) {
    final password = Password.dirty(value);
    emit(state.copiWith(
      password: password,
      isValid: Formz.validate([password, state.userName, state.email])
    ));
  } 

}
