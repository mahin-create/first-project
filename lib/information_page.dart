import 'package:flutter/material.dart';
import 'package:my_first_project/home_page.dart';

class InformationPage extends StatefulWidget {
  const InformationPage({super.key});

  @override
  State<InformationPage> createState() => _InformationPageState();
}

class _InformationPageState extends State<InformationPage> {
  final TextEditingController emailController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();

  final TextEditingController codeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          body: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Center(child: Image(image: NetworkImage('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQnVf94vD-eTYb_tzS2PuEpZvMM5Vhy19gteg&s'),)),
                const SizedBox(height: 15),
                Text('Let\'s begin',style: Theme.of(context).textTheme.titleLarge),
                const SizedBox(height: 10),
                Text('Please enter your credentials to proceed',style: Theme.of(context).textTheme.bodyMedium),
                const SizedBox(height: 30),
                 TextField(
                  controller: emailController,
                  decoration: const InputDecoration(
                    hintText: 'Your Email',
                  ),
                ),
                const SizedBox(height: 15),
                 TextField(
                   controller: passwordController,
                  decoration: const InputDecoration(
                    hintText: 'create password',
                    suffixIcon: Icon(Icons.remove_red_eye,color: Colors.grey),
                  ),
                ),
                const SizedBox(height: 15),
                 TextField(
                   controller: codeController,
                  decoration: const  InputDecoration(
                    hintText: 'Referral code (optional)',
                  ),
                ),
              ],
            ),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) => const HomePage(),),);
            },
            backgroundColor: Colors.red[900],
            child: const Icon(Icons.arrow_forward,color: Colors.white),
          ),
        )
    );
  }
}
