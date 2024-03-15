import 'package:cloud_firestore/cloud_firestore.dart';

class Users {
  final String username;
  final String email;
  final String password;
  final String uid;

  Users({
    required this.username,
    required this.email,
    required this.password,
    required this.uid,
  });

  Map<String, dynamic> tojson() => {
        'username': username,
        'password': password,
        'email': email,
        'uid': uid,
      };

  static Users fromsnap(DocumentSnapshot snap) {
    final snapshot = snap.data() as Map<String, dynamic>;
    return Users(
      username: snapshot['username'] ?? 'yaredd',
      email: snapshot['email'] ?? 'yared@gmail.com',
      password: snapshot['password'] ?? '7253yared',
      uid: snapshot['uid'] ?? '12345678910',
    );
  }
}
