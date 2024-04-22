import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:sexeducation/database/user_dao.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  late UserDao _userDao = UserDao();

  Future<User?> signInWithEmailAndPassword(
      String email, String password) async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return userCredential.user;
    } catch (e) {
      print('Erro ao fazer login: $e');
      return null;
    }
  }

  Future<String?> getImageUser() async {
    String? userEmail = _auth.currentUser?.email;
    if (userEmail != null) {
      return await _userDao.getImage(userEmail);
    }
    return '';
  }

  Future<String?> getNickname() async {
    String? userEmail = _auth.currentUser?.email;
    if (userEmail != null) {
      return await _userDao.getNickname(userEmail);
    }
    return '';
  }

  Future<void> updateNickname(String nickname) async {
    try {
      String? currentUser = _auth.currentUser?.email;
      if (currentUser != null) {
        QuerySnapshot query = await FirebaseFirestore.instance
            .collection('users')
            .where('email', isEqualTo: currentUser)
            .limit(1)
            .get();

        if (query.docs.isNotEmpty) {
          String userId = query.docs.first.id;
          await FirebaseFirestore.instance
              .collection('users')
              .doc(userId)
              .update({'nickname': nickname});
        }
      }
    } catch (e) {
      print('Erro ao atualizar o apelido do usuário: $e');
    }
  }

  Future<void> updateAvatar(String urlImage) async {
    try {
      String? currentUser = _auth.currentUser?.email;
      if (currentUser != null) {
        QuerySnapshot query = await FirebaseFirestore.instance
            .collection('users')
            .where('email', isEqualTo: currentUser)
            .limit(1)
            .get();

        if (query.docs.isNotEmpty) {
          String userId = query.docs.first.id;
          await FirebaseFirestore.instance
              .collection('users')
              .doc(userId)
              .update({'avatar': urlImage});
        }
      }
    } catch (e) {
      print('Erro ao atualizar o apelido do usuário: $e');
    }
  }
}
