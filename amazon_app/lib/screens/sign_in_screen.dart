import 'package:amazon_app/resources/authentication_methods.dart';
import 'package:amazon_app/screens/sign_up_screen.dart';
import 'package:amazon_app/utils/color_themes.dart';
import 'package:amazon_app/utils/constants.dart';
import 'package:amazon_app/utils/utils.dart';
import 'package:amazon_app/widget/custom_main_button.dart';
import 'package:amazon_app/widget/text_field_widget.dart';
import 'package:flutter/material.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController senhaController = TextEditingController();
  AuthenticationMethods authenticationMethods = AuthenticationMethods();
  bool isLoading = false;

  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    senhaController.dispose();
  }

 

  @override
  Widget build(BuildContext context) {
    Size screenSize = Utils().getScreenSize();
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: SizedBox(
          height: screenSize.height,
          width: screenSize.width,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.network(
                    amazonLogo,
                    height: screenSize.height * 0.10,
                  ),
                  Container(
                    height: screenSize.height * 0.6,
                    width: screenSize.width * 0.8,
                    padding: const EdgeInsets.all(25),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey, width: 1),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Login",
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 33,
                          ),
                        ),
                        TextFieldWidget(
                          title: "Email",
                          controller: emailController,
                          obscureText: false,
                          hintText: "Entrar com o seu e-mail",
                        ),
                        TextFieldWidget(
                          title: "Senha",
                          controller: senhaController,
                          obscureText: isLoading,
                          hintText: "Entrar com a sua senha",
                        ),
                        Align(
                          alignment: Alignment.center,
                          child: CustomMainButton(
                            child: const Text(
                              "Login",
                              style: TextStyle(
                                letterSpacing: 0.6,
                                color: Colors.black,
                              ),
                            ),
                            color: yellowColor,
                            isLoading: false,
                            onPressed: () async {
                              setState(() {
                                isLoading = true;
                              });
                              String output =
                                  await authenticationMethods.signInUser(
                                email: emailController.text,
                                senha: senhaController.text,
                              );
                              setState(() {
                                isLoading = false;
                              });
                              if (output == "Sucesso") {
                              } else {
                                Utils().showSnackBar(
                                  context: context,
                                  content: output,
                                );
                              }
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          height: 1,
                          color: Colors.grey,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Text(
                          "Novo na Amazon?",
                          style: TextStyle(
                            color: Colors.grey,
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          height: 1,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                  CustomMainButton(
                    child: Text(
                      "Crie uma conta Amazon",
                      style: TextStyle(
                        letterSpacing: 0.6,
                        color: Colors.black,
                      ),
                    ),
                    color: Colors.grey[400]!,
                    isLoading: false,
                    onPressed: () {
                      Navigator.pushReplacement(context,
                          MaterialPageRoute(builder: (context) {
                        return const SignUpScreen();
                      }));
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
