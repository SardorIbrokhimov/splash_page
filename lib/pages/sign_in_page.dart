import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:splash_page/pages/sign_up_page.dart';
import 'package:splash_page/splash_page.dart';

class SignInPage extends StatefulWidget {
  static const String id = "sign_in";

  const SignInPage({Key? key}) : super(key: key);

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  TextEditingController emailController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();

  _doSignIn() {
    String email = emailController.text;
    String password = passwordController.text;

    if (email.isNotEmpty && password.isNotEmpty) {
      //Navigator.pushReplacementNamed(context, HomePage.id);
    }
  }

  late String email, password;

  final userPost = GlobalKey<FormState>();

  Icon open = Icon(Icons.visibility);
  Icon close = Icon(Icons.visibility_off);
  bool on = true;

  int count = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {
            Navigator.pushReplacementNamed(context, SplashPage.id);
          },
          icon: Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
        ),
        elevation: 0,
      ),
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
                    "Log in to your account",
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
                //signin container
                Container(
                  margin: EdgeInsets.only(left: 20, right: 20, top: 15),
                  height: 48,
                  decoration: BoxDecoration(
                    color: Color(0xff193889),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: FlatButton(
                    onPressed: _doSignIn,
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
                    Center(
                      child: Text(
                        "or sign in with",
                        style: TextStyle(fontSize: 15),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // google image
                        GestureDetector(
                          child: Container(
                            margin: EdgeInsets.only(top: 10,bottom: 20),
                            height: 50,
                            width: 50,
                            child: Image.asset("assets/images/google.jpg",fit: BoxFit.cover,),
                          ),
                        ),
                      // facebook image
                      GestureDetector(
                        child:   Container(
                          margin: EdgeInsets.only(top: 10,right: 70,bottom: 20,left: 60),
                          height: 35,
                          width: 40,
                          child: Image.asset("assets/images/facebook.png",fit: BoxFit.cover,),
                        ),
                      ),
                        // twitter image
                        GestureDetector(
                          child: Container(
                            margin: EdgeInsets.only(top: 10,right:20,bottom: 20),
                            height: 30,
                            width: 30,
                            child: Image.asset("assets/images/twitter.jpg",fit: BoxFit.cover,),
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
                        "Don't you have account?",
                        style: TextStyle(fontSize: 16),
                      ),
                      GestureDetector(
                        child: Text(
                          "SignUp",
                          style: TextStyle(color: Colors.blue, fontSize: 16),
                        ),
                        onTap: () {
                          Navigator.pushReplacementNamed(context, SignUpPage.id);
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
