import 'package:amazon_app/model/users_details_model.dart';
import 'package:amazon_app/resources/cloudfirestore_methods.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthenticationMethods {
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  CloudFirestoreClass cloudFirestoreClass = CloudFirestoreClass();

  Future<String> signUpUser({
    required String nome,
    required String endereco,
    required String email,
    required String senha,
  }) async {
    nome.trim();
    endereco.trim();
    email.trim();
    senha.trim();
    String output = "Algo deu errado";

    if (nome != "" && endereco != "" && email != "" && senha != "") {
      try {
        await firebaseAuth.createUserWithEmailAndPassword(
          email: email,
          password: senha,
        );
        UserDetailsModel user = UserDetailsModel(nome: nome, endereco: endereco);
        await cloudFirestoreClass.uploadNameAndAddressToDataBase(
          user: user,
        );
        output = "Sucesso";
      } on FirebaseAuthException catch (e) {
        output = e.message.toString();
      }
    } else {
      output = "Por favor preencha todos os campos.";
    }
    return output;
  }

  Future<String> signInUser({
    required String email,
    required String senha,
  }) async {
    email.trim();
    senha.trim();
    String output = "Algo deu errado";

    if (email != "" && senha != "") {
      try {
        await firebaseAuth.signInWithEmailAndPassword(
          email: email,
          password: senha,
        );
        output = "Sucesso";
      } on FirebaseAuthException catch (e) {
        output = e.message.toString();
      }
    } else {
      output = "Por favor preencha todos os campos.";
    }
    return output;
  }
}
