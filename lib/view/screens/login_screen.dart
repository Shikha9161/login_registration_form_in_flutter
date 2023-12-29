import 'package:flutter/material.dart';
import 'package:shikha_demo1/view/screens/signup_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
 bool check=true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: const Text("Login")),
        backgroundColor: Colors.orange,
      ),
      body: Padding(
          padding: EdgeInsets.all(10.0),
          child: Column(
            children: [
              //const Text("create your account",style: TextStyle(color: Colors.lightBlue,fontWeight:FontWeight.bold ),),
              const SizedBox(
                height: 20.0,
              ),
              TextField(
                controller: emailController,
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(
                    labelText: "Email",
                    hintText: "enter your email",
                    prefixIcon: Icon(Icons.mail),
                    suffixIcon: Icon(Icons.cancel),
                    border: OutlineInputBorder()),
              ),
              const SizedBox(
                height: 20.0,
              ),
              TextField(
                obscureText: check,
                controller: passwordController,
                keyboardType: TextInputType.number,
                maxLength: 6,
                decoration:  InputDecoration(
                    counterText: "",
                    labelText: "Password",
                    hintText: "enter your password",
                    prefixIcon: const Icon(Icons.lock),
                    suffixIcon: GestureDetector(onTap:(){check= !check; setState(() {
                      
                    });},child: check? Icon(Icons.visibility_off):Icon(Icons.visibility)),
                    border: const OutlineInputBorder()),
              ),
              const SizedBox(
                height: 20.0,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.red,
                    ),
                    onPressed: () {
                      if (emailController.text.isEmpty) {
                        print("Please enter email id!!");
                      } else {
                        print("user email : ${emailController.text}");
                      }
                      if (passwordController.text.isEmpty) {
                        print("Please enter password");
                      } else if (passwordController.text.length < 6 ||
                          passwordController.text.length < 4) {
                        print("Please enter 6 digit pwd");
                      } else {
                        print("user password : ${passwordController.text}");
                      }
                    },
                    child: const Text("login",
                        style: TextStyle(
                          color: Colors.black,
                        ))),
              ),
              const SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("I don't have account?",
                      style: TextStyle(color: Colors.blueGrey)),
                  GestureDetector(
                    onTap: (){
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) =>  SignupScreen()),
                      );
                    },
                      child: const Text(
                    "Registration",
                    style: TextStyle(
                        color: Colors.blue, fontWeight: FontWeight.bold),
                  ))
                ],
              )
            ],
          )),
    );
  }
}
