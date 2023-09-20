import 'package:flutter/material.dart';
import 'logginservice.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Loggin extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Inicio de Sesión'),
          automaticallyImplyLeading: false,
        ),
        body: LoginForm(),
      ),
    );
  }
}

class LoginForm extends StatefulWidget {
    const LoginForm ({super.key});
  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

    Future<void> redirecionar() async{
        var email=await isLoggin();
        if(email!=null&&email!=""){
            Navigator.pushReplacementNamed(context, "/");
        }
    }

    @override
    void initState(){
        super.initState();
        redirecionar();
    // Realiza tus inicializaciones aquí, como suscripciones o configuración inicial de datos.
    // Por ejemplo:
    // myInitializationFunction();

    }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Inicio de Sesión'),
          automaticallyImplyLeading: false,
        ),
        body: Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                    TextFormField(
                        controller: _emailController,
                        decoration: InputDecoration(labelText: 'Correo Electrónico'),
                    ),
                    TextFormField(
                        controller: _passwordController,
                        obscureText: true,
                        decoration: InputDecoration(labelText: 'Contraseña'),
                    ),
                    SizedBox(height: 16.0),
                    ElevatedButton(
                        onPressed: () async{
                        // Lógica de inicio de sesión aquí
                            var bandera=await loggin(_emailController.text, _passwordController.text);
                            if(bandera){
                                Navigator.pushReplacementNamed(context, "/");
                            }
                            print(bandera);
                        },
                        child: Text('Iniciar Sesión'),
                    ),
                    TextButton(
                        onPressed: () {
                            Navigator.pushReplacementNamed(context, "/create-account");
                        },
                        child: Text('¿No tienes una cuenta? Regístrate'),
                    ),
                    Text(
                      "\nOr\n"
                    ),
                    SizedBox(
                      width:250,
                      child:ElevatedButton(
                        onPressed: () async{
                        // Lógica de inicio de sesión aquí
                            await signInWithGoogle();
                            final bandera=await googleAccess();
                            if(bandera){
                                Navigator.pushReplacementNamed(context, "/");
                            }
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children:<Widget>[
                            Text(
                              "Loggin with google "
                            ),
                            Image.asset('assets/google.png'),
                          ],
                        ),
                    ),
                    ),
                    
                ],
            ),
        ),
    );
  }
}