import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:sexeducation/models/user.dart';

class UserDao {

  final FirebaseFirestore database = FirebaseFirestore.instance;

  List readAll() {
    final docRef = database.collection('users');
    Map data = docRef.get() as Map<String, dynamic>;

    return data.values.toList();
  }

  void insert(UserModel user) async {
    await database.collection('users').add(user.toMap());
  }

  void update(UserModel user) async {
    await database.collection('users').doc(user.id).update(user.toMap());
  }

  void delete(String id) async {
    await database.collection('users').doc(id).delete();
  }

}