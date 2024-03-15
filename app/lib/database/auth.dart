import 'dart:typed_data';

import '/database/storage.dart';
import 'user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:uuid/uuid.dart';

class authMethod {
  FirebaseAuth _auth = FirebaseAuth.instance;
  FirebaseFirestore _firestore = FirebaseFirestore.instance;

//sign up the user

  Future<String> UserSignUp({
    required String userName,
    required String email,
    required String password,
  }) async {
    String res = 'some error occured';
    try {
      UserCredential cred = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      Users user = Users(
        username: userName,
        email: email,
        password: password,
        uid: _auth.currentUser!.uid,
      );

      await _firestore
          .collection('users')
          .doc(
            FirebaseAuth.instance.currentUser!.uid,
          )
          .set(
            user.tojson(),
          );
      res = 'success';
    } catch (e) {
      res = e.toString();
    }
    return res;
  }

  //sign in the user

  Future<String> UserSignin({
    required String email,
    required String password,
  }) async {
    String res = 'some error occured';
    try {
      await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      res = 'success';
    } catch (e) {
      res = e.toString();
    }
    return res;
  }

  //add products to the page

  Future<String> addProduct({
    required String price,
    required String description,
    required String title,
    required Uint8List photourl,
    required List like,
  }) async {
    String res = 'some error occured';
    try {
      String url = await uploadingimage('product', photourl);

      if (title.isNotEmpty &&
          description.isNotEmpty &&
          price.isNotEmpty &&
          photourl != null) {
        String postId = const Uuid().v1();

        await _firestore.collection('products').doc(postId).set({
          'title': title,
          'price': price,
          'description': description,
          'photourl': url,
          'like': like,
          'postId': postId,
        });
        res = 'success';
      }
    } catch (e) {
      res = e.toString();
    }

    return res;
  }

  //like post code

  Future<void> likepost(String postId, List like) async {
    try {
      if (like.contains(postId)) {
        await _firestore.collection('products').doc(postId).update({
          'like': FieldValue.arrayRemove([postId])
        });
      } else {
        await _firestore.collection('products').doc(postId).update({
          'like': FieldValue.arrayUnion([postId])
        });
      }
    } catch (e) {
      print(e.toString());
    }
  }
//deleting posts

  Future<void> deletingPosts(String postId) async {
    try {
      await _firestore.collection('products').doc(postId).delete();
    } catch (e) {
      print(e.toString());
    }
  }

//updating product list

  Future<void> updatingPosts(
    String postId,
    String title,
    String price,
    String description,
    Uint8List file,
  ) async {
    String url = await uploadingimage('product', file);
    try {
      await _firestore.collection('products').doc(postId).update({
        'title': title,
        'price': price,
        'discription': description,
        'like': [],
        'userId': postId,
        'photourl': url,
      });
    } catch (e) {
      print(e.toString());
    }
  }

  // add to cart

  Future<String> toCart({
    required String imageurl,
    required String title,
    required String price,
  }) async {
    String res = 'some error ocurred';
    try {
      String postId = const Uuid().v1();
      await _firestore
          .collection('cart')
          .doc(_auth.currentUser!.uid)
          .collection('cart')
          .doc(
            postId,
          )
          .set({
        'imageurl': imageurl,
        'title': title,
        'price': price,
      });
      res = 'success';
    } catch (e) {
      res = e.toString();
    }
    return res;
  }

  //deleting carts

  Future<void> deletingcarts(String postId) async {
    try {
      await _firestore
          .collection('cart')
          .doc(_auth.currentUser!.uid)
          .collection('cart')
          .doc(postId)
          .delete();
    } catch (e) {
      print(
        e.toString(),
      );
    }
  }

  //sign in admin

  String AdminName = 'GDSCGROUPONE';
  String AdminEmail = 'GDSCGROUPEmail@gmail.com';

  Map<String, dynamic> tojson() {
    return {
      'adminpassword': AdminName,
      'adminEmail': AdminEmail,
    };
  }
}
