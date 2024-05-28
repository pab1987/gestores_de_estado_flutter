import 'package:flutter/material.dart';
import 'package:form_app/presentation/widgets/widget.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Nuevo usuario'),
      ),
      body: const _RegisterView(),
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

class  _RegisterForm extends StatefulWidget {
  const _RegisterForm();

  @override
  State<_RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<_RegisterForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String userName = '';
  String email = '';
  String password = '';
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          CustomTextFormField(
            label: 'Nombre de uruario',
            icon: const Icon(Icons.supervised_user_circle_rounded),
            onChanged: (value) => userName = value ,
            validator: (value) {
              if (value ==  null || value.isEmpty ) return 'Campo requerido'; 
              if (value.trim().isEmpty ) return 'Campo requerido'; 
              if (value.length < 6 ) return 'Debe ser más de 6 letras'; 
              return null;
            },

          ),
          const SizedBox(height: 20),
          CustomTextFormField(
            label: 'Correo electrónico',
            icon: const Icon(Icons.email_rounded),
            onChanged: (value) => email = value ,
            validator: (value) {
              if (value ==  null || value.isEmpty ) return 'Campo requerido'; 
              if (value.trim().isEmpty ) return 'Campo requerido'; 
              final emailPattern = RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');
              if (!emailPattern.hasMatch(value)) return 'Debe ingresar un correo valido';

              return null;
            },

          ),

          const SizedBox(height: 20),
          CustomTextFormField(
            label: 'Contraseña',
            icon: const Icon(Icons.lock),
            obscureText: true,
            onChanged: (value) => password = value ,
            validator: (value) {
              if (value ==  null || value.isEmpty ) return 'Campo requerido'; 
              if (value.trim().isEmpty ) return 'Campo requerido'; 
              if (value.length < 6 ) return 'Debe ser más de 6 letras'; 
              return null;
            },

          ),
          const SizedBox(height: 20),
          FilledButton.tonalIcon(
            onPressed: () {
              final isValid = _formKey.currentState!.validate();
              if (!isValid) return;
              // ignore: avoid_print
              print('$userName, $email, $password');
            }, 
            icon: const Icon(Icons.save),
            label: const Text('Crear usuario')
          )
        ],
      ),
    );
  }
}