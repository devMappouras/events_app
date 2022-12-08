import 'package:events_app/screens/register.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginScreen extends StatefulWidget {
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String currentText = "";
  final textControllerUserName = TextEditingController();
  final textControllerPass = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [Colors.purple, Colors.orange])),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Column(
          children: <Widget>[
            const Expanded(
              child: logo(),
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  InkWell(
                    onTap: () {
                      Get.to(RegisterScreen());
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const <Widget>[
                        Text(
                          "Don\'t have an account?",
                          style: TextStyle(
                              color: Color.fromARGB(255, 49, 47, 79),
                              fontSize: 20),
                        ),
                        Text(
                          " SIGN UP",
                          style: TextStyle(
                              color: Color.fromARGB(255, 49, 47, 79),
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.only(left: 40, right: 40, top: 20),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Container(
                          color: Colors.brown[50],
                          child: Row(
                            children: <Widget>[
                              const Padding(
                                padding: EdgeInsets.all(20),
                                child: Icon(
                                  Icons.alternate_email,
                                  color: Color.fromARGB(255, 49, 47, 79),
                                ),
                              ),
                              Expanded(
                                child: TextFormField(
                                  controller: textControllerUserName,
                                  decoration: const InputDecoration(
                                      border: InputBorder.none,
                                      labelText: 'Enter your email'),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(
                          left: 40, right: 40, top: 10, bottom: 10),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Container(
                          color: Colors.brown[50],
                          child: Row(
                            children: <Widget>[
                              const Padding(
                                padding: EdgeInsets.all(20),
                                child: Icon(
                                  Icons.lock,
                                  color: Color.fromARGB(255, 49, 47, 79),
                                ),
                              ),
                              Expanded(
                                child: TextFormField(
                                  controller: textControllerPass,
                                  obscureText: true,
                                  decoration: const InputDecoration(
                                      border: InputBorder.none,
                                      labelText: 'Enter your password'),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      print("forgot password");
                    },
                    child: const Padding(
                      padding: EdgeInsets.only(top: 10),
                      child: Text(
                        'Forgot Password?',
                        style: TextStyle(
                            color: Color.fromARGB(255, 49, 47, 79),
                            fontSize: 20),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(
                          left: 40, right: 40, top: 30, bottom: 20),
                      child: InkWell(
                        onTap: () {
                          print(textControllerUserName.value.text);
                          print(textControllerPass.value.text);
                        },
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Container(
                            color: const Color.fromARGB(255, 49, 47, 79),
                            child: const Center(
                              child: Text('S I G N  I N',
                                  style: TextStyle(
                                      color: Color.fromARGB(255, 255, 164, 122),
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold)),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class logo extends StatelessWidget {
  const logo({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(36.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(32.0),
        child: Image.asset(
          '/images/logos/eventssmall.png',
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}
