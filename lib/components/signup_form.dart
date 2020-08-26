import 'package:calendlio/api_logic.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../constants.dart';
import 'button.dart';
import 'input.dart';

class SignUpForm extends StatefulWidget {
  @override
  SignUpFormState createState() {
    return SignUpFormState();
  }
}

class SignUpFormState extends State<SignUpForm> {
  ApiLogic apiLogic = ApiLogic();
  final _formKey = GlobalKey<FormState>();
  final fname = TextEditingController(),
      lname = TextEditingController(),
      address = TextEditingController(),
      email = TextEditingController(),
      phone = TextEditingController();

  @override
  void dispose() {
    fname.dispose();
    lname.dispose();
    address.dispose();
    phone.dispose();
    email.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Form(
          key: _formKey,
          child: Column(children: <Widget>[
            Input(Icons.person, "First Name", fname),
            SizedBox(
              height: kDiff,
            ),
            Input(Icons.person, "Last Name", lname),
            SizedBox(
              height: kDiff,
            ),
            Input(Icons.home, "Address", address),
            SizedBox(
              height: kDiff,
            ),
            Input(
              Icons.phone,
              "Phone",
              phone,
              type: TextInputType.phone,
            ),
            SizedBox(
              height: kDiff,
            ),
            Input(
              Icons.mail_outline,
              "Email",
              email,
              type: TextInputType.emailAddress,
            ),
            SizedBox(
              height: kDiff * 3,
            ),
            GestureDetector(
              onTap: () {
                if (_formKey.currentState.validate()) {
                  apiLogic
                      .register(fname.text, lname.text, address.text,
                          phone.text, email.text)
                      .then((value) {
                    if (value.statusCode == 201) {
                      Fluttertoast.showToast(
                        msg: "Created Account",
                        toastLength: Toast.LENGTH_SHORT,
                      );
                      Navigator.pushReplacementNamed(context, "/login");
                    } else {
                      Fluttertoast.showToast(
                        msg: "Error Occurred",
                        toastLength: Toast.LENGTH_SHORT,
                      );
                    }
                  });
                }
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Button("Sign Up", kDarkBtnStyle.copyWith(fontSize: 20),
                    kBlue, kBlue),
              ),
            ),
          ])),
    );
  }
}
