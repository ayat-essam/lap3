import 'package:flutter/material.dart';

class Onboarding extends StatelessWidget {
  const Onboarding({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(
              vertical: 8.0,
              horizontal: 16.0,
          ),
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () {},
                      child: Align(
                        alignment: Alignment.bottomRight,
                        child: const Text('Skip',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18.0,
                        ),
                          ),
                      ))
      ),
            ],
          ),
      ),
      );
  }
}
