import 'package:flutter/material.dart';
import 'package:glorie_stories_mobile/HomePage/home.dart';
import 'package:glorie_stories_mobile/LoginPage/register.dart';


class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          decoration: const BoxDecoration(color: Colors.white),
          child: Column(
            children: [
              Container(
                color: Colors.white,
                //margin: EdgeInsets.only(top: 200),
                //child: Image.asset('imges/welcomeAndImage.png'),
                child: Image.asset('imges/new_cover.jpeg'),
              ),
              Container(
                margin: const EdgeInsets.only(top: 30),
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
                margin: const EdgeInsets.only(top: 30),
                child: Column(
                  children: [
                    Container(
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
                    ),
                    const SizedBox(height: 10),
                    Container(
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
                    ),
                    const SizedBox(height: 20),
                    Row(
                      children: [
                        Container(
                          margin: const EdgeInsets.only(left: 50, right: 90),
                          child: TextButton(
                            onPressed: () {},
                            child: const Text('Forgot Password?',
                                style: TextStyle(color: Colors.black)),
                          ),
                        ),
                        Spacer(),
                        MaterialButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const Register()));
                          },
                          child: Container(
                            width: 60,
                            height: 25,
                            child: const Center(
                              child: Text(
                                'Register',
                                style: TextStyle(
                                    color: Color.fromARGB(255, 0, 0, 0)),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 20,
                        )
                      ],
                    ),
                    const SizedBox(height: 20),
                    MaterialButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const HomeScreen()));
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
                            'Submit',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 20, bottom: 50),
                      child: TextButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const Register()));
                        },
                        child: const Text('Dont have an account? Signup Here',
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold)),
                      ),
                    )
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
