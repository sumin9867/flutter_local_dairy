import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:local_telephone_dairy/core/theme/app_color.dart';
import 'package:local_telephone_dairy/features/auth/presentation/sign_up/sign_up_form.dart';


class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return SingleChildScrollView(
      child: Scaffold(
        body: Stack(
          children: [
            Align(
              alignment: Alignment.topCenter,
              child: Column(
                children: [
                  SizedBox(height: screenHeight * .08),
                  const Text(
                    "Welcome to",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                  ),
                  Text(
                    "Pet Care",
                    style: GoogleFonts.pacifico(
                      textStyle: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: screenHeight * .04,
                        color: AppColor.primaryColor,
                      ),
                    ),
                  )
                ],
              ),
            ),
            Positioned(
              top: screenHeight * .16,
              left: screenWidth * 0.2,
              child: SvgPicture.asset(
                "assets/cat.svg",
                height: screenWidth * 0.6,
              ),
            ),
            Positioned(
              bottom: screenHeight * .9,
              left: screenWidth * 0.78,
              child: SvgPicture.asset(
                "assets/ornage_paw.svg",
                height: screenHeight * .15,
              ),
            ),
            const SignUpForm(),
            Positioned(
              top: screenHeight * .29,
              left: screenWidth * 0.39,
              child: SvgPicture.asset(
                "assets/white_paw.svg",
                height: screenWidth * 0.5,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
