import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:scrolls/controller/auth_controller.dart';
import 'package:scrolls/view/screens/auth/login/icon_container.dart';
import 'package:scrolls/view/widgets/glitch.dart';
import 'package:scrolls/view/widgets/text_input.dart';
import 'package:google_fonts/google_fonts.dart';

class SignupScreen extends StatefulWidget {
  SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
 TextEditingController _emailController = new TextEditingController();

  TextEditingController _setpasswordController = new TextEditingController();
  TextEditingController _confirmpasswordController =
      new TextEditingController();
      
      TextEditingController _usernameController =
      new TextEditingController();

  var isHover = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.only(top: 130),
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GlithEffect(
                  child: Text(
                "Welcome To Scrolls",
                style: GoogleFonts.anta(
                  fontWeight: FontWeight.w900,
                  fontSize: 27,
                  letterSpacing: 3,
                ),
              )),
              const SizedBox(
                height: 25,
              ),
              InkWell(
                onTap: (){
                  AuthController.instance.pickImage();
                },
                child: Stack(
                  children: [
                    const CircleAvatar(
                     backgroundImage: AssetImage("assets/default_profile.png"),
                      radius: 47,
                    ),
                    Positioned(
                        bottom: 0,
                        right: 0,
                        child: Container(
                            padding: EdgeInsets.all(5),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(50)),
                            child: const Icon(
                              Icons.edit,
                              size: 20,
                              color: Colors.black,
                            )))
                  ],
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 20),
                child: TextInputField(
                    controller: _emailController,
                    myIcon: Icons.email,
                    myLabelText: "Email"),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 20),
                child: TextInputField(
                  controller: _setpasswordController,
                  myIcon: Icons.lock,
                  myLabelText: "Set Password",
                  tohide: true,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 20),
                child: TextInputField(
                  controller: _confirmpasswordController,
                  myIcon: Icons.lock,
                  myLabelText: "Confirm Password",
                  tohide: true,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 20),
                child: TextInputField(
                    controller: _usernameController,
                    myIcon: Icons.person,
                    myLabelText: "Username"),
              ),
              const SizedBox(
                height: 25,
              ),

              SizedBox(
                height: 45,
                width: 190,
                child: MouseRegion(
                  onHover: (event) {
                    setState(() {
                      isHover = true;
                    });
                  },
                  onExit: (event) {
                    setState(() {
                      isHover = false;
                    });
                  },
                  child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(
                          Color.fromARGB(255, 13, 81, 132)),
                      overlayColor: MaterialStateProperty.resolveWith<Color>(
                        (Set<MaterialState> states) {
                          if (states.contains(MaterialState.pressed)) {
                            return Color.fromARGB(255, 4, 25, 41);
                          }
                          return Colors.transparent;
                        },
                      ),
                    ),
                    onPressed: () {
                      AuthController.instance.SignUp(_usernameController.text, _emailController.text,_setpasswordController.text, AuthController.instance.proimg);
                    },
                    child:  const Center(
                      child: Text(
                        "Sign Up",
                        style: TextStyle(fontSize: 18, color: Colors.white),
                      ),
                    )),
                  ),
                
              ),

              //  InkWell(
              //   onTap: (){},
              //   child: Container(
              //     height: 50,
              //     width: 350,
              //     decoration: BoxDecoration(borderRadius: BorderRadius.circular(50),color: Color.fromARGB(255, 4, 25, 41)),

              //     child: Padding(
              //       padding: const EdgeInsets.symmetric(horizontal: 83,vertical: 8),
              //       child: Row(
              //         children: [
              //           Image.asset("assets/google.png"),
              //           SizedBox(width: 5,),
              //           Text("Sign in with Google",style: TextStyle(fontSize: 16),)
              //         ],
              //       ),
              //     ),
              //   ),
              //  )
            ],
          ),
        ),
      ),
    );
  }
}
