import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:shega_cloth_store_app/database/models/user.dart';

import 'package:shega_cloth_store_app/screens/first-page.dart';
import 'package:shega_cloth_store_app/screens/login.dart';

import '/database/storage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:uuid/uuid.dart';

class authMethod {
  FirebaseAuth _auth = FirebaseAuth.instance;
  FirebaseFirestore _firestore = FirebaseFirestore.instance;
  Map<String, dynamic> userData = {};

  Future<String> UserSignUp(
      {required String userName,
      required String email,
      required String password}) async {
    String res = 'some error occured';
    try {
      UserCredential cred = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      Users user = Users(
        username: userName,
        email: email,
        uid: _auth.currentUser!.uid,
        password: password,
        profileImageUrl:
            "https://firebasestorage.googleapis.com/v0/b/e-commerse-40160.appspot.com/o/profile%2FPngItem_2652659.png?alt=media&token=b9ddf946-bbcc-43f4-a883-2cf496d6c269",
      );

      await _firestore
          .collection('users')
          .doc(
            FirebaseAuth.instance.currentUser!.uid,
          )
          .set(user.tojson());

      res = 'success';
    } catch (e) {
      res = e.toString();
    }
    return res;
  }

  signOut(context) async {
    await _auth.signOut();
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => first()));
  }

  Future<String> UserSignin(
      {required String email, required String password}) async {
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
    required String gender,
    required String color,
    required String brand,
    required String category, // Add category field
  }) async {
    String res = 'some error occurred';
    try {
      String url = await uploadingimage('product', photourl);

      if (title.isNotEmpty &&
          description.isNotEmpty &&
          price.isNotEmpty &&
          photourl != null) {
        String userID = const Uuid().v1();

        await _firestore.collection('products').doc(userID).set({
          'title': title,
          'price': price,
          'description': description,
          'photourl': url,
          'like': like,
          'userID': userID,
          'gender': gender,
          'color': color,
          'brand': brand,
        });
        res = 'success';
      }
    } catch (e) {
      res = e.toString();
    }

    return res;
  }

  //like post code

  Future<void> likepost(String userID, List like) async {
    try {
      final user = FirebaseAuth.instance.currentUser!.uid;
      if (like.contains(user)) {
        await _firestore.collection('products').doc(userID).update({
          'like': FieldValue.arrayRemove([user])
        });
      } else {
        await _firestore.collection('products').doc(userID).update({
          'like': FieldValue.arrayUnion([user])
        });
      }
    } catch (e) {
      print(e.toString());
    }
  }

  Future<void> UserSignOut(BuildContext context) async {
    try {
      await _auth.signOut();
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => signin()),
      );
    } catch (e) {
      print('Error signing out: $e');
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
        'userId': postId,
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
/*
  String AdminName = 'GDSCGROUPONE';
  String AdminEmail = 'GDSCGROUPEmail@gmail.com';

  Map<String, dynamic> tojson() {
    return {
      'adminpassword': AdminName,
      'adminEmail': AdminEmail,
    };
  }*/

  Future<String> adminSignUp({
    required String adminName,
    required String adminEmail,
    required String adminPassword,
  }) async {
    try {
      UserCredential cred = await _auth.createUserWithEmailAndPassword(
        email: adminEmail,
        password: adminPassword,
      );

      await _firestore.collection('admins').doc(_auth.currentUser!.uid).set({
        'adminName': adminName,
        'adminEmail': adminEmail,
        'adminPassword': adminPassword,
        'uid': _auth.currentUser!.uid,
        'profileImageUrl':
            "https://firebasestorage.googleapis.com/v0/b/e-commerse-40160.appspot.com/o/profile%2FPngItem_2652659.png?alt=media&token=b9ddf946-bbcc-43f4-a883-2cf496d6c269",
      });

      return 'success';
    } catch (e) {
      print('Error during admin signup: $e');
      return 'Signup failed. Please try again!';
    }
  }

  Future<String> adminSignIn({
    required String adminEmail,
    required String adminPassword,
  }) async {
    String res = 'some error occurred';
    try {
      await _auth.signInWithEmailAndPassword(
        email: adminEmail,
        password: adminPassword,
      );
      res = 'success';
    } catch (e) {
      res = e.toString();
    }
    return res;
  }
}
