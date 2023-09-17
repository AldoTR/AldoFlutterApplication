import 'package:flutter/material.dart';
import 'logginservice.dart';

/*class CreateAccount extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Registro de Cuenta'),
        ),
        body: SignUpForm(),
      ),
    );
  }
}*/

class SignUpForm extends StatefulWidget {
    const SignUpForm ({super.key});
  @override
  _SignUpFormState createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Registro de Cuenta'),
          automaticallyImplyLeading: false,
        ),
        body: Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                    TextFormField(
                        controller: _emailController,
                        decoration: InputDecoration(labelText: 'Correo Electrónico'),
                        keyboardType: TextInputType.emailAddress,
                    ),
                    TextFormField(
                        controller: _passwordController,
                        decoration: InputDecoration(labelText: 'Contraseña'),
                        obscureText: true,
                    ),
                    TextFormField(
                        controller: _confirmPasswordController,
                        decoration: InputDecoration(labelText: 'Confirmar Contraseña'),
                        obscureText: true,
                    ),
                    SizedBox(height: 16.0),
                    ElevatedButton(
                        onPressed: () async{
                            // Lógica de registro de cuenta aquí
                            String email = _emailController.text;
                            String password = _passwordController.text;
                            String confirmPassword = _confirmPasswordController.text;

                            // Realiza el registro de la cuenta con los datos proporcionados
                            // Puedes utilizar Firebase Auth u otra solución de registro
                            // Aquí puedes agregar la lógica para registrar la cuenta

                            await createAccount(email, password, confirmPassword);
                            Navigator.pushReplacementNamed(context, "/loggin");
                        },
                        child: Text('Registrar Cuenta'),
                    ),
                    TextButton(
                        onPressed: () {
                        Navigator.pushReplacementNamed(context, "/loggin");
                        },
                        child: Text('Volver'),
                    ),
                ],
            ),
        ),
    );
  }
}