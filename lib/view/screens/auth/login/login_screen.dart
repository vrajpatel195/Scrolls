import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:scrolls/controller/auth_controller.dart';
import 'package:scrolls/view/screens/auth/login/icon_container.dart';
import 'package:scrolls/view/widgets/glitch.dart';
import 'package:scrolls/view/widgets/text_input.dart';
import 'package:google_fonts/google_fonts.dart';

import '../signup/signup_screen.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController _emailController = new TextEditingController();

  TextEditingController _passwordController = new TextEditingController();

  var isHover = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GlithEffect(
                child: Text(
              "Scrolls",
              style: GoogleFonts.anta(
                fontWeight: FontWeight.w900,
                fontSize: 45,
                letterSpacing: 5,
              ),
            )),
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
                controller: _passwordController,
                myIcon: Icons.lock,
                myLabelText: "Password",
                tohide: true,
              ),
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: TextButton(
                  onPressed: () {},
                  child: const Text(
                    "Forgot Password?",
                    style: TextStyle(fontSize: 16, color: Colors.grey),
                  )),
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
                        Color.fromARGB(255, 4, 25, 41)),
                    overlayColor: MaterialStateProperty.resolveWith<Color>(
                      (Set<MaterialState> states) {
                        if (states.contains(MaterialState.pressed)) {
                          return Color.fromARGB(255, 13, 81, 132);
                        }
                        return Colors.transparent;
                      },
                    ),
                  ),
                  onPressed: () {
                    AuthController.instance
                        .login(_emailController.text, _passwordController.text);
                  },
                  child: Container(
                      margin:
                          EdgeInsets.symmetric(horizontal: 40, vertical: 10),
                      child: Text(
                        "Login",
                        style: TextStyle(fontSize: 18),
                      )),
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Container(
                width: 600,
                decoration: BoxDecoration(
                    border: Border(
                        bottom: BorderSide(
                  color: Colors.grey,
                ))),
                child: Center(
                    child: const Text(
                  "Or",
                  style: TextStyle(fontSize: 18),
                ))),
            const SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => SignupScreen()));
                  },
                  child: const IconContainer(
                    widget: Center(
                      child: Icon(
                        FontAwesomeIcons.google,
                        size: 25,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {},
                  child: const IconContainer(
                    widget: Center(
                      child: Icon(
                        FontAwesomeIcons.apple,
                        size: 25,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
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
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Don't have an account ? Click on ", style: TextStyle(fontSize: 16),),
                InkWell(onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> SignupScreen()));
                }, child: Text("Signup",style: TextStyle(color: Colors.blue,fontSize: 16, fontWeight: FontWeight.bold),))
              ],
            )
          ],
        ),
      ),
    );
  }
}
