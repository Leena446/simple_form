import 'package:flutter/material.dart';

class SignInForm extends StatefulWidget {
  const SignInForm({Key? key}) : super(key: key);

  @override
  _SignInFormState createState() => _SignInFormState();
}

class _SignInFormState extends State<SignInForm> {

  String? _email;
  String? _password;

  final GlobalKey<FormState>_formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sign In Page'),
      ),
      body: Container(
        margin: const EdgeInsets.all(25.0),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Email',
                  prefixIcon: Icon(Icons.email),
                ),
                validator: (String? value){
                  if(value!.isEmpty) {
                    return 'Email is Required';
                  }
                },
                onSaved: (String? value){
                  _email = value ;
                },
              ),
              TextFormField(
                obscureText: true,
                decoration: const InputDecoration(
                  labelText: 'Password',
                  prefixIcon: Icon(Icons.lock),
                ),
                keyboardType: TextInputType.visiblePassword,
                validator: (String? value){
                  if(value!.isEmpty) {
                    return 'Password is Required';
                  }
                },
                onSaved: (String? value){
                  _password = value ;
                },
              ),
              Padding(
                padding: const EdgeInsets.only(top: 60),
                child: ElevatedButton(
                  onPressed: () {
                    if (!_formKey.currentState!.validate()) {
                      return;
                    }
                    _formKey.currentState!.save();
                    print(_email);
                    print(_password);

                    showDialog(
                      context: context,
                      builder: (_) => const AlertDialog(
                        title: Text(
                          'Done!',
                        ),
                        content: SizedBox(
                          height: 150,
                          width: 250,
                          child: Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text('The Form is submitted successfully',
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.teal
                            ),),
                          ),
                        ),
                      ),
                    );
                  },
                  child: const Text(
                    'Submit',
                    style: TextStyle(
                      fontSize: 10.0,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
