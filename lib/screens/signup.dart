import 'package:calendlio/components/button.dart';
import 'package:calendlio/components/signup_form.dart';
import 'package:flutter/material.dart';

import '../api_logic.dart';
import '../constants.dart';

class SignUp extends StatelessWidget {
  ApiLogic apiLogic = ApiLogic();

  redirect(context) {
    apiLogic.getToken().then((token) {
      ACCESS_TOKEN = token;
    });
    if (ACCESS_TOKEN.isNotEmpty) {
      Navigator.pushReplacementNamed(context, "/calendar");
    }
  }

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) => redirect(context));

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Column(
            children: [
              Center(
                child: Text("Calendlio",
                    style: kTitleStyle.copyWith(fontSize: 30)),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.05,
              ),
              Expanded(child: SignUpForm()),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.05,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pushReplacementNamed(context, "/login");
                },
                child: Button("Log In", kLightBtnStyle.copyWith(fontSize: 20),
                    Colors.white, kDarkBlue),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
