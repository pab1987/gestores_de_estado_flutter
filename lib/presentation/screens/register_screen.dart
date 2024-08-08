import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:form_app/presentation/blocs/register_cubit/register_cubit.dart';
import 'package:form_app/presentation/widgets/widget.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Nuevo usuario'),
      ),
      //* Hay que envolver el arbol de widgets en el provider que vamos a usar
      //* Así tendremos acceso a este gestor de estado
      body: BlocProvider(
        create: (context) => RegisterCubit(),
        child: const _RegisterView()
      ),
    );
  }
}

class _RegisterView extends StatelessWidget {
  const _RegisterView();

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: SingleChildScrollView(
          child:  Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
               FlutterLogo(size: 100,),
              _RegisterForm(),
            ],
          ),
        ),
      ),
    );
  }
}

class  _RegisterForm extends StatelessWidget {
  const _RegisterForm();

  @override
  Widget build(BuildContext context) {
    //*Referencia a nuestro cubit
    final registerCubit = context.watch<RegisterCubit>();
    final username = registerCubit.state.userName;
    final email = registerCubit.state.email;
    final password = registerCubit.state.password;
    return Form(
      child: Column(
        children: [
          CustomTextFormField(
            label: 'Nombre de uruario',
            icon: const Icon(Icons.supervised_user_circle_rounded),
            onChanged: registerCubit.userNameChanged,
            errorMessage: username.errorMessage

          ),
          const SizedBox(height: 20),
          CustomTextFormField(
            label: 'Correo electrónico',
            icon: const Icon(Icons.email_rounded),
            onChanged: registerCubit.emailChanged,
            errorMessage: email.errorMessage

          ),

          const SizedBox(height: 20),
          CustomTextFormField(
            label: 'Contraseña',
            icon: const Icon(Icons.lock),
            obscureText: true,
            onChanged: registerCubit.passwordChanged,
            errorMessage: password.errorMessage

          ),
          const SizedBox(height: 20),
          FilledButton.tonalIcon(

            onPressed: () {
              registerCubit.onSubmit();
            }, 
            icon: const Icon(Icons.save),
            label: const Text('Crear usuario')
          )
        ],
      ),
    );
  }
}