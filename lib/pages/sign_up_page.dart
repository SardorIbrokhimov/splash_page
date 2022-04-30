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
  late String email1, email2, password1, password2;

  final userPost = GlobalKey<FormState>();

  _doSignUp() {
    if (userPost.currentState!.validate()) {
      userPost.currentState!.save();
    }
  }

  Icon open = Icon(Icons.visibility);
  Icon close = Icon(Icons.visibility_off);
  bool on = true;
  bool on2 = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Sign Up",
          style: TextStyle(fontFamily: "Cyberspace"),
        ),
        backgroundColor: Colors.pink,
      ),
      body: SingleChildScrollView(
        child: Form(
          key: userPost,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Column(
              children: [
                SizedBox(
                  height: 20,
                ),
                Text(
                  "Creat New Account",
                  style: TextStyle(
                      fontSize: 30, color: Colors.black, fontFamily: "Hamlet"),
                ),
                SizedBox(
                  height: 40,
                ),
                TextFormField(
                  validator: (input) => input!.contains("@")
                      ? "Please enter a valid email"
                      : null,
                  onSaved: (input) => email1 = input!,
                  obscureText: true,
                  decoration: InputDecoration(
                    hintText: "@Username",
                  ),
                ),
                SizedBox(
                  height: 40,
                ),
                TextFormField(
                  onSaved: (input) => email2 = input!,
                  obscureText: false,
                  decoration: InputDecoration(
                    hintText: "Email",
                  ),
                ),
                SizedBox(
                  height: 40,
                ),
                TextFormField(
                  validator: (input) =>
                      input!.length < 8 ? "Must be at least 8 character" : null,
                  onSaved: (input) => password1 = input!,
                  obscureText: on,
                  decoration: InputDecoration(
                    hintText: "Password",
                    suffixIcon: IconButton(
                      onPressed: () {
                        count++;
                        setState(() {
                          if (count.isEven) {
                            on = true;
                          } else {
                            on = false;
                          }
                        });

                        print(count);
                      },
                      icon: count.isOdd ? close : open,
                    ),
                  ),
                ),
                SizedBox(
                  height: 40,
                ),
                TextFormField(
                  validator: (input) =>
                      int.parse(input!) - int.parse(password1) == 0
                          ? "Please check password"
                          : null,
                  onSaved: (input) => password2 = input!,
                  obscureText: on2,
                  decoration: InputDecoration(
                      hintText: "Confirm Password",
                      suffixIcon: IconButton(
                        onPressed: () {
                          count2++;
                          setState(() {
                            if (count2.isEven) {
                              on2 = true;
                            } else {
                              on2 = false;
                            }
                          });

                          print(count2);
                        },
                        icon: count2.isOdd ? close : open,
                      )),
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Text(
                      "By singing up you accept the ",
                      style: TextStyle(fontSize: 15),
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: Text(
                        "term of service",
                        style: TextStyle(fontSize: 15, color: Colors.blue),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Text(
                      "and",
                      style: TextStyle(fontSize: 15),
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: Text(
                        "Privacy Policy",
                        style: TextStyle(fontSize: 15, color: Colors.blue),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  padding: EdgeInsets.only(left: 10, right: 10),
                  height: 50,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.redAccent,
                  ),
                  child: FlatButton(
                      onPressed: _doSignUp,
                      child: Text(
                        "Sign Up",
                        style: TextStyle(fontSize: 22, color: Colors.white),
                      )),
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Already have an account?"),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushReplacementNamed(context, SignInPage.id);
                      },
                      child: Text(
                        "Sign In",
                        style: TextStyle(color: Colors.blue),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
