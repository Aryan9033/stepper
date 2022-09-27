import 'package:flutter/material.dart';

import 'Global.dart';

class SecondScreen extends StatefulWidget {
  const SecondScreen({Key? key}) : super(key: key);

  @override
  State<SecondScreen> createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  TextStyle titelStyle = const TextStyle(
    fontSize: 16,
    color: Colors.black,
    fontWeight: FontWeight.w700,
  );

  TextStyle titelStyle1 = const TextStyle(
    fontSize: 14,
    color: Colors.grey,
  );

  int initalStepperIndex = 0;
  final GlobalKey<FormState> StapperFormKey = GlobalKey<FormState>();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController EmailController = TextEditingController();
  final TextEditingController PasswordController = TextEditingController();
  final TextEditingController ConfirmPasswordController =
      TextEditingController();

  final GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();
  final TextEditingController UsernameController = TextEditingController();
  final TextEditingController loginPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StatefulBuilder(builder: (context, setState) {
        return Stepper(
          currentStep: initalStepperIndex,
          controlsBuilder: (context, details) {
            return (initalStepperIndex == 2)
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              elevation: 3,
                              backgroundColor: Colors.green,
                              behavior: SnackBarBehavior.floating,
                              content: Container(
                                color: Colors.green,
                                child: const Text("Successfully Logged In"),
                              ),
                            ),
                          );
                        },
                        child: const Text("ADD"),
                      ),
                      OutlinedButton(
                          onPressed: () {
                            setState(() {
                              if (initalStepperIndex > 0) {
                                initalStepperIndex--;
                              }
                            });
                          },
                          child: const Text("cancel"))
                    ],
                  )
                : Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          setState(() {
                            if (initalStepperIndex < 2) {
                              initalStepperIndex++;
                            }
                          });
                        },
                        child: const Text("Continue"),
                      ),
                      OutlinedButton(
                        onPressed: () {},
                        child: const Text("cancel"),
                      ),
                    ],
                  );
          },
          steps: <Step>[
            Step(
              isActive: initalStepperIndex >= 0,
              title: const Text(
                "SignUp",
                style: TextStyle(fontSize: 16),
              ),
              // subtitle: const Text("Enter Name"),
              content: Container(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Form(
                  key: StapperFormKey,
                  child: Column(
                    children: [
                      TextFormField(
                        controller: nameController,
                        onSaved: (val) {
                          setState(() {
                            Global.name = val;

                            print(Global.name);
                          });
                        },
                        validator: (val) {
                          if (val!.isEmpty) {
                            return "Enter Your Name First";
                          }
                          return null;
                        },
                        decoration: const InputDecoration(
                            hintText: "Full Name",
                            icon: Icon(Icons.person_outline_outlined),
                            border: OutlineInputBorder(
                              borderSide: BorderSide.none,
                            ),
                            focusColor: Colors.blueAccent,
                            fillColor: Colors.red),
                      ),
                      TextFormField(
                        controller: EmailController,
                        onSaved: (val) {
                          setState(() {
                            Global.Email = val;

                            print(Global.Email);
                          });
                        },
                        validator: (val) {
                          if (val!.isEmpty) {
                            return "Enter Your Name First";
                          }
                          return null;
                        },
                        decoration: const InputDecoration(
                            hintText: "Email-id",
                            icon: Icon(Icons.mail_outline_outlined),
                            border: OutlineInputBorder(),
                            focusColor: Colors.blueAccent,
                            fillColor: Colors.red),
                      ),
                      TextFormField(
                        controller: PasswordController,
                        onSaved: (val) {
                          setState(() {
                            Global.Password = val;

                            print(Global.Password);
                          });
                        },
                        validator: (val) {
                          if (val!.isEmpty) {
                            return "Enter Your Name First";
                          }
                          return null;
                        },
                        decoration: const InputDecoration(
                            hintText: "Password",
                            icon: Icon(Icons.lock_outline),
                            border: OutlineInputBorder(),
                            focusColor: Colors.blueAccent,
                            fillColor: Colors.red),
                      ),
                      TextFormField(
                        controller: ConfirmPasswordController,
                        onSaved: (val) {
                          setState(() {
                            Global.ConformPassword = val;

                            print(Global.ConformPassword);
                          });
                        },
                        validator: (val) {
                          if (val!.isEmpty) {
                            return "Enter Your Name First";
                          }
                          return null;
                        },
                        decoration: const InputDecoration(
                            hintText: "Confom Password",
                            icon: Icon(Icons.lock_outline),
                            border: OutlineInputBorder(),
                            focusColor: Colors.blueAccent,
                            fillColor: Colors.red),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Step(
              isActive: initalStepperIndex >= 1,
              title: const Text(
                "Login",
                style: TextStyle(fontSize: 16),
              ),
              //    subtitle: const Text("Enter Descripation"),
              content: Container(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Form(
                  key: loginFormKey,
                  child: Column(
                    children: [
                      TextFormField(
                        controller: UsernameController,
                        validator: (val) {
                          if (val!.isEmpty) {
                            return "Enter your Description first..";
                          }
                          return null;
                        },
                        onSaved: (val) {
                          setState(() {
                            Global.UserName = val;
                          });
                        },
                        decoration: const InputDecoration(
                          icon: Icon(Icons.person_outline_outlined),
                          border: OutlineInputBorder(),
                          hintText: "User Name",
                          focusColor: Colors.blueAccent,
                          fillColor: Colors.red,
                        ),
                      ),
                      TextFormField(
                        controller: loginPasswordController,
                        validator: (val) {
                          if (val!.isEmpty) {
                            return "Enter your Description first..";
                          }
                          return null;
                        },
                        onSaved: (val) {
                          setState(() {
                            Global.PasswordLogin = val;
                          });
                        },
                        decoration: const InputDecoration(
                          icon: Icon(Icons.lock_outline),
                          border: OutlineInputBorder(),
                          hintText: "Password",
                          focusColor: Colors.blueAccent,
                          fillColor: Colors.red,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Step(
              isActive: initalStepperIndex >= 2,
              title: const Text(
                "Home",
                style: TextStyle(fontSize: 16),
              ),
              //  subtitle: const Text("Enter Name"),
              content: Container(),
            ),
          ],
        );
      }),
    );
  }
}
