import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:my_first_project/otp_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

 final TextEditingController result = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return   SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Center(child: Image(image: NetworkImage('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQnVf94vD-eTYb_tzS2PuEpZvMM5Vhy19gteg&s'),)),
              const SizedBox(height: 15),
              Text('Glad To See You!',style: Theme.of(context).textTheme.titleLarge),
              const SizedBox(height: 15),
              Text('Please provide your Phone Number',style: Theme.of(context).textTheme.bodyMedium),
              const SizedBox(height: 30),
                TextField(
                  style: Theme.of(context).textTheme.titleMedium,
                 controller: result,
                 decoration:const InputDecoration(
                   hintText: 'phone',
                 ),
                 keyboardType: TextInputType.text,
              ),
              const SizedBox(height: 30),
              ElevatedButton(
                  onPressed: ()async {

                    await FirebaseAuth.instance.verifyPhoneNumber(
                      phoneNumber: result.text,
                      verificationCompleted: (PhoneAuthCredential credential) {},
                      verificationFailed: (FirebaseAuthException e) {},
                      codeSent: (String verificationId, int? resendToken) {
                        Navigator.of(context).push(MaterialPageRoute(builder: (context) => OtpPage(controller: result,verificationId: verificationId),),);
                      },
                      codeAutoRetrievalTimeout: (String verificationId) {},
                    );



                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                    foregroundColor: Colors.white,
                    minimumSize: const Size(double.infinity, 50),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: const Text(
                    'SEND CODE'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}