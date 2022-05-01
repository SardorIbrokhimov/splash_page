import 'package:flutter/material.dart';
import 'package:splash_page/pages/sign_in_page.dart';

class SignUpPage extends StatefulWidget {
  static const String id = "sign_up";

  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  int count = 0;
  int count2 = 0;
  late String email, password1, password2;

  final userPost = GlobalKey<FormState>();

  TextEditingController emailController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();
  TextEditingController confirmpasswordController = new TextEditingController();

  _doSignIn() {
    String email = emailController.text;
    String password = passwordController.text;

    if (email.isNotEmpty && password.isNotEmpty) {
      //Navigator.pushReplacementNamed(context, HomePage.id);
      print("not empty");
    }
  }

  Icon open = Icon(Icons.visibility);
  Icon close = Icon(Icons.visibility_off);
  bool on = true;
  bool on2 = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(
          top: 20,
        ),
        child: SingleChildScrollView(
          child: Form(
            key: userPost,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Container(
                    margin: EdgeInsets.only(top: 90),
                    height: 60,
                    width: 120,
                    child: Image(
                      image: AssetImage(
                        "assets/images/cignifi.jpg",
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),

                Container(
                  margin: EdgeInsets.only(right: 20, left: 20, top: 60),
                  child: Text(
                    "Creat new account",
                    style: TextStyle(fontSize: 20, color: Colors.black),
                  ),
                ),

                //email container
                Container(
                  margin: EdgeInsets.only(left: 20, right: 20, top: 15),
                  height: 48,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: Colors.grey[200],
                  ),
                  child: TextFormField(
                    validator: (input) =>
                        input!.contains("@") ? null : "there is not '@' ",
                    onSaved: (input) => email = input!,
                    controller: emailController,
                    style: TextStyle(fontSize: 16),
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.all(10),
                      border: new OutlineInputBorder(
                        borderSide: new BorderSide(color: Colors.teal),
                      ),
                      hintText: "Email",
                      hintStyle: TextStyle(color: Colors.grey),
                    ),
                  ),
                ),

                //password container
                Container(
                  margin: EdgeInsets.only(left: 20, right: 20, top: 15),
                  height: 48,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: Colors.grey[200],
                  ),
                  child: TextFormField(
                    validator: (input) => input!.length < 8
                        ? "Must be at least 8 character"
                        : null,
                    onSaved: (input) => password1 = input!,
                    obscureText: on,
                    controller: passwordController,
                    style: TextStyle(fontSize: 16),
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.all(10),
                      border: new OutlineInputBorder(
                        borderSide: new BorderSide(color: Colors.teal),
                      ),
                      suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              on = !on;
                            });
                          },
                          icon: on ? open : close),
                      hintText: "Password",
                      hintStyle: TextStyle(color: Colors.grey),
                    ),
                  ),
                ),

                //corfirm password container
                Container(
                  margin: EdgeInsets.only(left: 20, right: 20, top: 15),
                  height: 48,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: Colors.grey[200],
                  ),
                  child: TextFormField(
                    obscureText: on2,
                    controller: confirmpasswordController,
                    style: TextStyle(fontSize: 16),
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.all(10),
                      border: new OutlineInputBorder(
                        borderSide: new BorderSide(color: Colors.teal),
                      ),
                      suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              on2 = !on2;
                            });
                          },
                          icon: on2 ? open : close),
                      hintText: "Password",
                      hintStyle: TextStyle(color: Colors.grey),
                    ),
                    validator: (input) {
                      if (input!.isEmpty) {
                        return "Please re-enter password";
                      }
                      if (passwordController.text !=
                          confirmpasswordController.text) {
                        return "Password do not match";
                      }
                    },
                  ),
                ),
                //signin container
                Container(
                  margin: EdgeInsets.only(left: 20, right: 20, top: 15),
                  height: 48,
                  decoration: BoxDecoration(
                    color: Color(0xff193889),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: FlatButton(
                    onPressed: () {
                      if (userPost.currentState!.validate()) {
                        Navigator.pushReplacementNamed(context, SignInPage.id);
                      }
                      else {

                      }
                    },
                    child: Container(
                      child: Center(
                        child: Text(
                          "Sign in",
                          style: TextStyle(fontSize: 20, color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 50,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // google image
                        GestureDetector(
                          child: Container(
                            margin: EdgeInsets.only(top: 10, bottom: 20),
                            height: 50,
                            width: 50,
                            child: Image.asset(
                              "assets/images/google.jpg",
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        // facebook image
                        GestureDetector(
                          child: Container(
                            margin: EdgeInsets.only(
                                top: 10, right: 70, bottom: 20, left: 60),
                            height: 35,
                            width: 40,
                            child: Image.asset(
                              "assets/images/facebook.png",
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        // twitter image
                        GestureDetector(
                          child: Container(
                            margin:
                                EdgeInsets.only(top: 10, right: 20, bottom: 20),
                            height: 30,
                            width: 30,
                            child: Image.asset(
                              "assets/images/twitter.jpg",
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),

                Container(
                  margin: EdgeInsets.only(top: 60),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Already have you an account? ",
                        style: TextStyle(fontSize: 16),
                      ),
                      GestureDetector(
                        child: Text(
                          "Sign In",
                          style: TextStyle(color: Colors.blue, fontSize: 16),
                        ),
                        onTap: () {
                          Navigator.pushReplacementNamed(
                              context, SignInPage.id);
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
