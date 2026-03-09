import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../Widgets/text_form_veled.dart';
import '../flutter_secure_storge.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isPasswordHidden = true;

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  final SourceStorge storage = SourceStorge();

  @override
  void dispose(){
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }
  String? saveName;
  String? savePassword;

  void saveData() async{
    await storage.saveData('email', emailController.text);
    await storage.saveData('password', passwordController.text);
  }
  void readData() async {
    saveName = await storage.getData('email');
    savePassword = await storage.getData('password');
    setState(() {});
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      body: SafeArea(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(15.0),
              margin: const EdgeInsets.all(9.0),
              child: const Text("Login",style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),),
            ),
            Container(
              padding: const EdgeInsets.all(9.0),
              margin: const EdgeInsets.all(16.0),
              child: Form(
                key: _formKey,
                  child: Column(
                    children: [
                      TextFormVeled(
                        obscureText: false,
                         validator: (value){
                           if(value == null || value.isEmpty){
                             return 'Please enter E-mail';
                           }
                           return null;
                         },
                        controller: emailController,
                        keyboardType: TextInputType.emailAddress,
                        hintText: '*****@example.com',
                        labelText: 'E-mail',
                        IconD: const Icon(Icons.email),
                      ),

                      const SizedBox(height: 10.0,),
                      TextFormVeled(
                        controller: passwordController,
                        keyboardType: TextInputType.visiblePassword,
                        obscureText: isPasswordHidden,
                        IconD: IconButton(
                          onPressed: (){
                            setState(() {
                              isPasswordHidden = !isPasswordHidden;
                            });
                          },
                          icon: Icon(
                              isPasswordHidden
                                  ? Icons.visibility
                                  : Icons.visibility_off
                          ),
                        ),
                        hintText: '*****',
                        labelText: 'Password',
                        validator: (value){
                          if(value == null || value.isEmpty){
                            return 'Please enter Password';
                          }
                          return null;
                        },
                      ),

                      const SizedBox(height: 10.0,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          ElevatedButton(
                              onPressed: (){
                                if(_formKey.currentState!.validate()){
                                  saveData();
                                  print('Form is valid');

                                }
                              },
                              style: ButtonStyle(
                                backgroundColor: WidgetStateProperty.all(Colors.blueGrey),
                                foregroundColor: WidgetStateProperty.all(Colors.white),
                              ),
                              child: const Text('Login',style: TextStyle(
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold,
                                color: Colors.white70
                              ),)
                          ),
                          const SizedBox(width: 10.0),
                          ElevatedButton(
                              onPressed: readData,
                              style: ButtonStyle(
                                backgroundColor: WidgetStateProperty.all(Colors.blueGrey),
                                foregroundColor: WidgetStateProperty.all(Colors.white),

                              ),
                              child: const Text(
                                'Show Data',style: TextStyle(
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white70
                              ),)
                          ),
                          const SizedBox(width: 10.0),
                          Column(
                            children: [
                              Text('Email: $saveName'),
                              Text('Password: $savePassword'),
                            ],
                          )
                        ],
                      )
                    ],

                  ),
            ),
            ),
          ],
        ),
      ),
    );
  }
}
