import 'package:flutter/material.dart';
import 'package:note_nest/provider/ui_provider/fun_provider.dart';
import 'package:provider/provider.dart';

class StylishLoginScreen extends StatefulWidget {
  const StylishLoginScreen({super.key});

  @override
  State<StylishLoginScreen> createState() => _StylishLoginScreenState();
}

class _StylishLoginScreenState extends State<StylishLoginScreen> {
  @override
  Widget build(BuildContext context) {
    Size mediaQuery = MediaQuery.of(context).size;
    final height = mediaQuery.height;
    final width = mediaQuery.width;
    return Scaffold(
      backgroundColor: Colors.black.withValues(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white.withValues(alpha: 0.4),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(width * .2),
                  bottomRight: Radius.circular(width * .2),
                ),
              ),
              height: height * .6,
              width: width * .85,
              child: Column(
                children: [
                  SizedBox(height: height * 0.04),
                  Center(
                    child: Text(
                      'SignIn to continue',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 25,
                      ),
                    ),
                  ),

                  Spacer(),

                  // email input
                  TextFormFieldComponent(width: width, hintText: 'Email'),
                  Spacer(),
                  // password input
                  TextFormFieldComponent(width: width, hintText: 'Password'),
                  Spacer(),

                  /// button to sign operation
                  Consumer<FunProvider>(
                    builder: (context, provider, child) {
                      return GestureDetector(
                        onTap: () {
                          provider.onTap();
                        },

                        child: Card(
                          elevation: 8,
                          color: Colors.black,
                          shape: StadiumBorder(
                            side: BorderSide(color: Colors.transparent),
                          ),
                          shadowColor: Colors.white.withValues(alpha: 0.2),

                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.white.withValues(alpha: 0.4),
                              borderRadius: BorderRadius.circular(width * .1),
                            ),
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                horizontal: width * 0.22,
                                vertical: 9,
                              ),
                              child: provider.isLoading == true
                                  ? CircularProgressIndicator(
                                      color: Colors.white,
                                    )
                                  : Text(
                                      'SignIn',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 24,
                                      ),
                                    ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                  Spacer(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class TextFormFieldComponent extends StatelessWidget {
  String hintText;
  TextFormFieldComponent({
    super.key,
    required this.width,
    required this.hintText,
  });

  final double width;

  @override
  Widget build(BuildContext context) {
    Size mediaQuery = MediaQuery.of(context).size;
    final height = mediaQuery.height;
    final width = mediaQuery.width;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: width * 0.076),
      child: TextFormField(
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: TextStyle(color: Colors.white),
          fillColor: Colors.white.withValues(alpha: 0.4),
          filled: true,
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(width * .1),
            borderSide: BorderSide(color: Colors.transparent),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(width * .1),
            borderSide: BorderSide(color: Colors.transparent),
          ),
        ),
      ),
    );
  }
}
