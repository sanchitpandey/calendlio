import 'package:calendlio/api_logic.dart';
import 'package:calendlio/components/button.dart';
import 'package:flutter/material.dart';

import '../constants.dart';

class HomeScreen extends StatelessWidget {
  ApiLogic apiLogic = ApiLogic();

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
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.2,
              ),
              Text("Calendlio", style: kTitleStyle),
              Spacer(),
              GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, "/login")
                        .then((value) => redirect(context));
                  },
                  child: Button("Log In", kDarkBtnStyle, kBlue, kBlue)),
              GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, "/signup")
                        .then((value) => redirect(context));
                  },
                  child: Button(
                      "Sign Up", kLightBtnStyle, Colors.white, kDarkBlue)),
            ],
          ),
        ),
      ),
    );
  }

  redirect(context) {
    apiLogic.getToken().then((token) {
      ACCESS_TOKEN = token;
    });
    if (ACCESS_TOKEN.isNotEmpty) {
      Navigator.pushReplacementNamed(context, "/calendar");
    }
  }
}
