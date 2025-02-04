import 'package:canteen/widgets.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ResetPassword extends StatefulWidget {
  @override
  State<ResetPassword> createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  late String email;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF5F5F8),
      body: Container(
        child: Column(
          children: [
            SizedBox(height: getheight(context, 60)),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: getwidth(context, 26)),
              child: Row(
                children: [
                  Icon(
                    Icons.arrow_back_ios,
                    color: Colors.grey,
                    size: getheight(context, 24),
                  ),
                  Spacer(),
                  const Text(
                    "Reset Password",
                    style: TextStyle(fontSize: 26, fontWeight: FontWeight.w600),
                  ),
                  Spacer(),
                ],
              ),
            ),
            SizedBox(
              height: getheight(context, 50),
            ),
            Center(
              child: Icon(
                Icons.lock,
                size: getheight(context, 50),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Text(
              "Enter your registerd email address!",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Padding(
              padding: EdgeInsets.all(35),
              child: Column(
                children: [
                  TextField(
                      onChanged: (val) {
                        email = val.replaceAll(" ", "");
                      },
                      style: TextStyle(
                          fontSize: 17, fontWeight: FontWeight.normal),
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "Enter Email",
                          hintStyle: TextStyle(
                              fontSize: 16,
                              color: Colors.grey.withOpacity(0.5)))),
                  Divider(
                    height: 2,
                    color: Colors.black,
                  ),
                ],
              ),
            ),
            GestureDetector(
              onTap: () {
                Fluttertoast.showToast(msg: "Reset link sent!");
                FirebaseAuth.instance.sendPasswordResetEmail(email: email);
              },
              child: Container(
                height: getheight(context, 70),
                width: getwidth(context, 310),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: orange_color),
                child: Center(
                  child: Text(
                    "Continue",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 17),
                  ),
                ),
              ),
            ),
            Spacer(),
            Text("Didn't have an account?",
                style: TextStyle(color: Colors.black)),
            SizedBox(
              height: getheight(context, 10),
            ),
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Text("Register",
                  style: TextStyle(
                      color: orange_color,
                      fontSize: 18,
                      fontWeight: FontWeight.bold)),
            ),
            SizedBox(
              height: 30,
            )
          ],
        ),
      ),
    );
  }
}
