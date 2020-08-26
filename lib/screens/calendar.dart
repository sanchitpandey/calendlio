import 'package:flutter/material.dart';

import '../api_logic.dart';
import '../constants.dart';

class Calendar extends StatelessWidget {
  ApiLogic apiLogic = ApiLogic();

  redirect(context) {
    apiLogic.getToken().then((token) {
      ACCESS_TOKEN = token;
    });
    if (ACCESS_TOKEN.isEmpty) {
      Navigator.pushReplacementNamed(context, "/");
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
              Row(
                children: [
                  Text("Calendlio", style: kTitleStyle.copyWith(fontSize: 30)),
                  Spacer(),
                  GestureDetector(
                    onTap: () {
                      apiLogic.setToken("");
                      redirect(context);
                    },
                    child: Image.asset(
                      "assets/logout.png",
                      scale: 15,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
