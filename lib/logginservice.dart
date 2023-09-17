import 'package:firebase_auth/firebase_auth.dart';//Esta linea es para importar firebase auth
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:shared_preferences/shared_preferences.dart';


Future<void> initfirebase() async{
    await Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform,
    );
}

Future<bool> loggin(emailAddress, pwd) async {
    try {
        final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
            email: emailAddress,
            password: pwd
        );
        SharedPreferences prefs = await SharedPreferences.getInstance();
        await prefs.setString('user', emailAddress);
        return true;
        print(await prefs.getString('user'));
    } on FirebaseAuthException catch (e) {
        if (e.code == 'user-not-found') {
            print('No user found for that email.');
        } else if (e.code == 'wrong-password') {
            print('Wrong password provided for that user.');
        }
        return false;
    }
}

Future<void> createAccount(emailAddress, pwd, confirmpwd) async {
    if(pwd==confirmpwd){
        try {
            final credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
                email: emailAddress,
                password: pwd,
            );
            print('Cuenta registrada');
        }on FirebaseAuthException catch (e) {
            if (e.code == 'weak-password') {
                print('The password provided is too weak.');
            } else if (e.code == 'email-already-in-use') {
                print('The account already exists for that email.');
            }
        } catch (e) {
            print(e);
        }
    }else{
        print("passwords aren't equals.");
    }
}

Future<String?> isLoggin() async{
    /*if (FirebaseAuth.instance.currentUser != null) {
        return true;
    }else{
        return false;
    }*/
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var email=await prefs.getString('user');
    return email;
}

Future<bool> logout() async{
    try{
        await FirebaseAuth.instance.signOut();
        SharedPreferences prefs = await SharedPreferences.getInstance();
        await prefs.setString('user', '');
        return true;
    }on FirebaseAuthException catch (e) {
        return false;
    }
    
}
