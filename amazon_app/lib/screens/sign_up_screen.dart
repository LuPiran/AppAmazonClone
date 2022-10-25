
import 'package:amazon_app/resources/authentication_methods.dart';
import 'package:amazon_app/screens/sign_in_screen.dart';
import 'package:amazon_app/utils/color_themes.dart';
import 'package:amazon_app/utils/constants.dart';
import 'package:amazon_app/utils/utils.dart';
import 'package:amazon_app/widget/custom_main_button.dart';
import 'package:amazon_app/widget/text_field_widget.dart';
import 'package:flutter/material.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController nomeController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController enderecoController = TextEditingController();
  TextEditingController senhaController = TextEditingController();
  AuthenticationMethods authenticationMethods = AuthenticationMethods();
  bool isLoading = false;

  @override
  void dispose() {
    super.dispose();
    nomeController.dispose();
    emailController.dispose();
    enderecoController.dispose();
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
                  SizedBox(
                    height: screenSize.height * 0.7,
                    child: FittedBox(
                      child: Container(
                        height: screenSize.height * 0.85,
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
                              "Cadastrar",
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 33,
                              ),
                            ),
                            TextFieldWidget(
                              title: "Nome",
                              controller: nomeController,
                              obscureText: false,
                              hintText: "Entrar com o seu nome",
                            ),
                            TextFieldWidget(
                              title: "Endreço",
                              controller: enderecoController,
                              obscureText: false,
                              hintText: "Entrar com o seu endreço",
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
                              obscureText: true,
                              hintText: "Entrar com a sua senha",
                            ),
                            Align(
                              alignment: Alignment.center,
                              child: CustomMainButton(
                                child: const Text(
                                  "Cadastrar",
                                  style: TextStyle(
                                    letterSpacing: 0.6,
                                    color: Colors.black,
                                  ),
                                ),
                                color: yellowColor,
                                isLoading: isLoading,
                                onPressed: () async {
                                  setState(() {
                                    isLoading = true;
                                  });
                                  String output =
                                      await authenticationMethods.signUpUser(
                                    nome: nomeController.text,
                                    endereco: enderecoController.text,
                                    email: emailController.text,
                                    senha: senhaController.text,
                                  );
                                  setState(() {
                                    isLoading = false;
                                  });
                                  if (output == "Sucesso") {
                                    Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute(
                                            builder: (_) =>
                                                const SignInScreen()));
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
                    ),
                  ),
                  CustomMainButton(
                    child: Text(
                      "Voltar",
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
                        return const SignInScreen();
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
    ;
  }
}
