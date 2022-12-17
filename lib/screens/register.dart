import 'package:animated_custom_dropdown/custom_dropdown.dart';
import 'package:events_app/core/models/customer.dart';
import 'package:events_app/screens/login.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/auth_controller.dart';

class RegisterScreen extends StatefulWidget {
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  String currentText = "";
  String selectedCountryName = '';
  final firstNameTextController = TextEditingController();
  final lastNameTextController = TextEditingController();
  final emailTextController = TextEditingController();
  final passwordTextController = TextEditingController();
  AuthController authController = Get.find();
  TextEditingController controller1 = TextEditingController(text: '');

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [Colors.purple, Colors.orange])),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.transparent,
        body: Column(
          children: <Widget>[
            const SizedBox(
              height: 140,
              child: logo(),
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  const alreadyHaveAnAccount(),
                  Expanded(
                    child: Padding(
                      padding:
                          const EdgeInsets.only(left: 40, right: 40, top: 20),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Container(
                          color: Colors.brown[50],
                          child: Row(
                            children: <Widget>[
                              Expanded(
                                child: Obx(() => CustomDropdown.search(
                                      hintText: 'Select Country',
                                      items: authController.countriesNamesList,
                                      onChanged: (String newValue) {
                                        print(newValue);
                                        selectedCountryName = newValue;
                                      },
                                      controller: controller1,
                                    )),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding:
                          const EdgeInsets.only(left: 40, right: 40, top: 20),
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
                                  controller: firstNameTextController,
                                  decoration: const InputDecoration(
                                      border: InputBorder.none,
                                      labelText: 'First Name'),
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
                      padding:
                          const EdgeInsets.only(left: 40, right: 40, top: 20),
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
                                  controller: lastNameTextController,
                                  decoration: const InputDecoration(
                                      border: InputBorder.none,
                                      labelText: 'Last Name'),
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
                      padding:
                          const EdgeInsets.only(left: 40, right: 40, top: 20),
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
                                  controller: emailTextController,
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
                      padding:
                          const EdgeInsets.only(left: 40, right: 40, top: 20),
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
                                  controller: passwordTextController,
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
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(
                          left: 40, right: 40, top: 20, bottom: 20),
                      child: InkWell(
                        onTap: () {
                          authController.registerCustomer(Customer(
                              firstName: firstNameTextController.value.text,
                              lastName: lastNameTextController.value.text,
                              email: emailTextController.value.text,
                              countryName: selectedCountryName,
                              password: passwordTextController.value.text));
                        },
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Container(
                            color: Color.fromARGB(255, 49, 47, 79),
                            child: const Center(
                              child: Text('R E G I S T E R',
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

class alreadyHaveAnAccount extends StatelessWidget {
  const alreadyHaveAnAccount({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.to(() => LoginScreen());
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const <Widget>[
          Text(
            "Already have an account?",
            style:
                TextStyle(color: Color.fromARGB(255, 49, 47, 79), fontSize: 20),
          ),
          Text(
            " LOG IN",
            style: TextStyle(
                color: Color.fromARGB(255, 49, 47, 79),
                fontSize: 20,
                fontWeight: FontWeight.bold),
          )
        ],
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
      padding: const EdgeInsets.only(left: 10, right: 10, top: 20),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(60.0),
        child: Image.asset(
          'assets/images/logos/eventsText.png',
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}
