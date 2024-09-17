
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:my_first_project/information_page.dart';


class OtpPage extends StatefulWidget {
  final TextEditingController controller;
  final String verificationId;

  const OtpPage({super.key,
    required this.controller ,
    required this.verificationId,
  });

  @override
  State<OtpPage> createState() => _OtpPageState();
}

class _OtpPageState extends State<OtpPage> {
  final TextEditingController otpController=TextEditingController();

  @override
  Widget build(BuildContext context) {
    return  SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Image(image: NetworkImage('https://static.vecteezy.com/system/resources/thumbnails/023/128/305/small/otp-one-time-password-login-code-verification-concept-icon-in-line-style-design-isolated-on-white-background-editable-stroke-vector.jpg'),),
              const SizedBox(height: 10),
              Text('OTP Verification',style: Theme.of(context).textTheme.titleLarge),
              const SizedBox(height: 10),
              Text('we have send a unique OTP number\nto your mobile +91${widget.controller.text}',style: Theme.of(context).textTheme.bodyMedium),
              const SizedBox(height: 10),
              TextField(
                controller: otpController,
                keyboardType: TextInputType.number,
              ),
              ElevatedButton(
                onPressed: () async {
                  FirebaseAuth auth = FirebaseAuth.instance;
                  PhoneAuthCredential credential = PhoneAuthProvider.credential(
                      verificationId: widget.verificationId,
                      smsCode: otpController.text,
                  );

                  // Sign the user in (or link) with the credential
                  await auth.signInWithCredential(credential);
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => const InformationPage(),),);
                },

                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                  foregroundColor: Colors.white,
                  minimumSize: const Size(double.infinity, 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                  child: const Text('Signin'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
