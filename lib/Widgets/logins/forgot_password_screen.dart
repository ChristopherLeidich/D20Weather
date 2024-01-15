import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
//import 'package:flutter/services.dart';
//import 'package:google_fonts/google_fonts.dart';
//import 'package:provider/provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
//import 'package:fantasy_weather_app/Widgets/drawer_widget.dart';
//import 'package:firebase_analytics/firebase_analytics.dart';

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({super.key});

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  final TextEditingController _emailController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  String email = '';
  String password = '';
  String username = '';
  bool login = false;

  @override
  void dispose(){
    _emailController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text('Login'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('Recive an email to\n reset your password.',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 24),
                  ),
              const SizedBox(height: 20),
              TextFormField(
                controller: _emailController,
                cursorColor: Colors.white,
                textInputAction: TextInputAction.done,
                decoration: const InputDecoration(labelText: 'E-mail'),
                autovalidateMode: AutovalidateMode.onUserInteraction,
                validator: (email) =>
                email != null && !EmailValidator.validate(email)
                    ? 'Enter a valid email'
                    : null,
                ),
                const SizedBox(height: 20),
              ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size.fromHeight(50),
                  ),
                  icon: const Icon(Icons.email_outlined),
                  label: const Text('Reset Password',
                    style: TextStyle(fontSize: 24),
                  ),
                  onPressed: (){
                    resetPassword();
                  },
              )
            ],
          )
        )
      )
  );
  Future resetPassword() async{
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => const Center(child: CircularProgressIndicator())
    );

    try{
      await FirebaseAuth.instance.sendPasswordResetEmail(email: _emailController.text.trim());

      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Password Reset Email was Send')));
        Navigator.of(context).popUntil((route) => route.isFirst);
      }
    } on FirebaseAuthException catch (e){

      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
            e.message as SnackBar);
        Navigator.of(context).pop();
      }
    }
  }
}
