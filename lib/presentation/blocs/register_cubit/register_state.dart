part of 'register_cubit.dart';

//Estados del formulario con emun
enum FormStatus {valid, invalid, validating, posting}

class RegisterFormState extends Equatable {

  final FormStatus formStatus;
  final bool isValid;
  final Username userName;
  final Email email;
  final Password password;

  const RegisterFormState({
    this.isValid = false, 
    this.formStatus = FormStatus.invalid, 
    this.userName = const Username.pure(), 
    this.email = const Email.pure(), 
    this.password = const Password.pure()
  });

  RegisterFormState copiWith({
    FormStatus? formStatus,
    bool? isValid,
    Username? userName,
    Email? email,
    Password? password,
  }) => RegisterFormState(
    formStatus : formStatus ?? this.formStatus,
    isValid: isValid ?? this.isValid,
    userName : userName ?? this.userName,
    email : email ?? this.email,
    password : password ?? this.password,
  );

  @override
  List<Object> get props => [formStatus, userName, email, password]; //Le pasamos las propiedades para validar si son iguales
}
