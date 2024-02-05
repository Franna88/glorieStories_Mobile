import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:glorie_stories_mobile/LoginPage/login.dart';

import 'package:uuid/uuid.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  @override
  Widget build(BuildContext context) {
// text editing controllers
    final TextEditingController nameSurnameTextController =
        TextEditingController(text: '');
    // text editing controllers
    final TextEditingController surnameTextController =
        TextEditingController(text: '');
    // text editing controllers
    final TextEditingController emailTextController =
        TextEditingController(text: '');

    Future<void> createUser() async {
      try {
        final CollectionReference storiesCollecion =
            FirebaseFirestore.instance.collection('users');
        var uuid = Uuid();
        var id = uuid.v1();
        await storiesCollecion.doc(id).set({
          'id': id,
          'nameSurname': nameSurnameTextController.text,
          'email': emailTextController.text,
          'pakket': "gratis",
          'uploadDate': DateTime.now(),
        });

        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text('Registered successfully.')));

        Navigator.push(
            context, MaterialPageRoute(builder: (context) => const Login()));
      } catch (error) {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text('Error uploading document.')));
        //Navigator.of(context).pop();
      }
    }

    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          decoration: const BoxDecoration(color: Colors.white),
          child: Column(
            children: [
              Container(
                color: Colors.white,
                child: Stack(
                  children: [
                    Image.asset('imges/signup2.png'),
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 10, bottom: 20),
                child: const Text(
                  'Sign Up',
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
                    Container(
                      margin: const EdgeInsets.only(left: 50, right: 50),
                      child: TextField(
                        controller: nameSurnameTextController,
                        decoration: InputDecoration(
                          prefixIcon: Container(
                            margin: const EdgeInsets.only(left: 20, right: 10),
                            child: const Icon(
                              Icons.person_2_outlined,
                              color: Colors.black,
                            ),
                          ),
                          filled: true,
                          fillColor: const Color(0xFF82E6EB),
                          border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          labelText: 'Name and Surname',
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Container(
                      margin: const EdgeInsets.only(left: 50, right: 50),
                      child: TextField(
                        controller: emailTextController,
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
                    /*  Container(
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
                          labelText: 'Confirm Password',
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                   */

                    MaterialButton(
                      onPressed: () {
                        createUser();
                      },
                      child: Container(
                        margin: const EdgeInsets.only(top: 15),
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
                      margin: const EdgeInsets.only(top: 30, bottom: 50),
                      child: TextButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const Login()));
                        },
                        child: const Text(
                            'Allready have an account? Login Here',
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
