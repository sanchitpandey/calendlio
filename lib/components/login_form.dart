import 'dart:convert';

import 'package:calendlio/api_logic.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../constants.dart';
import 'button.dart';
import 'input.dart';

class LogInForm extends StatefulWidget {
  @override
  LogInFormState createState() {
    return LogInFormState();
  }
}

class LogInFormState extends State<LogInForm> {
  ApiLogic apiLogic = ApiLogic();
  final _formKey = GlobalKey<FormState>();
  final phone = TextEditingController(), otp = TextEditingController();

  @override
  void dispose() {
    phone.dispose();
    otp.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Form(
          key: _formKey,
          child: Column(children: <Widget>[
            Input(
              Icons.phone,
              "Phone Number",
              phone,
              type: TextInputType.phone,
            ),
            SizedBox(
              height: 30,
            ),
            GestureDetector(
              onTap: () {
                if (_formKey.currentState.validate()) {
                  apiLogic.sendOTP(phone.text).then((value) {
                    if (value.statusCode == 204) {
                      Fluttertoast.showToast(
                        msg: "OTP Sent",
                        toastLength: Toast.LENGTH_SHORT,
                      );
                      showDialog(
                        context: context,
                        child: new SimpleDialog(
                          title: Center(child: Text("OTP Verification")),
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 5),
                              child: Column(
                                children: [
                                  TextFormField(
                                    keyboardType: TextInputType.number,
                                    decoration: new InputDecoration(
                                        hintText: "OTP",
                                        fillColor: Colors.grey),
                                    controller: otp,
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 20),
                                    child: GestureDetector(
                                      onTap: () {
                                        apiLogic
                                            .login(phone.text, otp.text)
                                            .then((value) {
                                          print(value.statusCode);
                                          if (value.statusCode == 200) {
                                            apiLogic.setToken(json.decode(
                                                value.body)['auth_token']);
                                            Navigator.pop(context);
                                            Navigator.pushReplacementNamed(
                                                context, "/calendar");
                                          } else {
                                            Navigator.pop(context);
                                            Fluttertoast.showToast(
                                              msg: "Error Occurred",
                                              toastLength: Toast.LENGTH_SHORT,
                                            );
                                          }
                                        });
                                      },
                                      child: Button(
                                          "Verify",
                                          kDarkBtnStyle.copyWith(fontSize: 18),
                                          kPink,
                                          kPink),
                                    ),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      );
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
                child: Button("Log In", kDarkBtnStyle.copyWith(fontSize: 20),
                    kBlue, kBlue),
              ),
            ),
          ])),
    );
  }
}
