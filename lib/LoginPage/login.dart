import 'package:flutter/material.dart';
import 'package:glorie_stories_mobile/HomePage/home.dart';
import 'package:glorie_stories_mobile/LoginPage/register.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  Future<void> _signIn() async {
    try {
      UserCredential userCredential =
          await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => const HomeScreen()));
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: size.height,
          decoration: const BoxDecoration(color: Colors.white),
          child: Column(
            children: [
              Container(
                height: size.height / 2.1,
                color: Colors.white,
                child: Image.asset('imges/new_cover.jpeg'),
              ),
              Container(
                margin: const EdgeInsets.only(top: 10),
                child: const Text(
                  'Login',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 10),
                child: Column(
                  children: [
                    EmailEntry(
                      emailController: emailController,
                    ),
                    const SizedBox(height: 10),
                    PasswordEntry(
                      passwordController: passwordController,
                    ),
                    const SizedBox(height: 5),
                    const ForgotAndRegister(),
                    const SizedBox(height: 5),
                    SubmitBtn(
                      emailController: emailController,
                      passwordController: passwordController,
                      onPressed: _signIn,
                    ),
                    const SizedBox(height: 10),
                    const RegisterBtn(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SignUpTextBtn extends StatelessWidget {
  const SignUpTextBtn({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 5, bottom: 50),
      child: TextButton(
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const Register()));
        },
        child: const Text('Dont have an account? Signup Here',
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
      ),
    );
  }
}

class SubmitBtn extends StatelessWidget {
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final VoidCallback onPressed;
  const SubmitBtn({
    required this.emailController,
    required this.passwordController,
    required this.onPressed,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: () {
        onPressed;
        // Navigator.push(context,
        //     MaterialPageRoute(builder: (context) => const HomeScreen()));
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: const Color(0xFF19898D),
        ),
        width: 330,
        height: 50,
        child: const Center(
          child: Text(
            'Log In',
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}

class RegisterBtn extends StatelessWidget {
  const RegisterBtn({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => const Register()));
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: const Color(0xFF19898D),
        ),
        width: 330,
        height: 50,
        child: const Center(
          child: Text(
            'Register',
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}

class ForgotAndRegister extends StatelessWidget {
  const ForgotAndRegister({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 50, right: 90),
      child: TextButton(
        onPressed: () {},
        child: const Text('Forgot Password?',
            style: TextStyle(color: Colors.black)),
      ),
    );
  }
}

class PasswordEntry extends StatelessWidget {
  final TextEditingController passwordController;
  const PasswordEntry({
    required this.passwordController,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 50, right: 50),
      child: TextField(
        decoration: InputDecoration(
          prefixIcon: Container(
            margin: const EdgeInsets.only(left: 20, right: 10),
            child: const Icon(
              Icons.lock,
              color: Colors.black,
            ),
          ),
          filled: true,
          fillColor: const Color(0xFF82E6EB),
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(20),
          ),
          labelText: 'Password',
        ),
      ),
    );
  }
}

class EmailEntry extends StatelessWidget {
  final TextEditingController emailController;
  const EmailEntry({
    required this.emailController,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 50, right: 50),
      child: TextField(
        decoration: InputDecoration(
          prefixIcon: Container(
            margin: const EdgeInsets.only(left: 20, right: 10),
            child: const Icon(
              Icons.email,
              color: Colors.black,
            ),
          ),
          filled: true,
          fillColor: const Color(0xFF82E6EB),
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(20),
          ),
          labelText: 'Email',
        ),
      ),
    );
  }
}
