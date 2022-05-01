import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:videocall/model/store_user.dart';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'package:videocall/utils/utilities.dart';

class FirebaseMethods {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  static final FirebaseFirestore firestore = FirebaseFirestore.instance;
  static final CollectionReference _userCollection =
      firestore.collection("users");
  //user class
  Userlar user = Userlar();

  Future<User> getCurrentUser() async {
    User currentUser;
    currentUser = _auth.currentUser;
    return currentUser;
  }

  Future<Userlar> getUserDetails() async {
    User currentUser = await getCurrentUser();

    DocumentSnapshot documentSnapshot =
        await _userCollection.doc(currentUser.uid).get();

    return Userlar.fromMap(documentSnapshot.data());
  }

  Future<bool> authenticateUser(User user) async {
    QuerySnapshot result = await firestore
        .collection("users")
        .where("email", isEqualTo: user.email)
        .get();

    final List<DocumentSnapshot> docs = result.docs;

    //if user is registered then length of list > 0 or else less than 0
    return docs.length == 0 ? true : false;
  }

  Future<void> addDataToDb(User currentUser, {String name = "isimsiz"}) async {
    String username = Utils.getUsername(currentUser.email);

    user = Userlar(
        uid: currentUser.uid,
        email: currentUser.email,
        name: currentUser.displayName ?? name,
        profilePhoto: currentUser.photoURL ??
            'https://cdn-icons-png.flaticon.com/512/149/149071.png',
        username: username,
        isLive: true);

    firestore.collection("users").doc(currentUser.uid).set(user.toMap(user));
  }

  Future<List<Userlar>> fetchAllUsers(User currentUser) async {
    List<Userlar> userList = [];

    QuerySnapshot querySnapshot = await firestore.collection("users").get();
    for (var i = 0; i < querySnapshot.docs.length; i++) {
      if (querySnapshot.docs[i].id != currentUser.uid) {
        userList.add(Userlar.fromMap(querySnapshot.docs[i].data()));
      }
    }
    return userList;
  }

  Future<void> updateUserName(User user, String name) async {
    await _auth.currentUser.updateProfile(displayName: name);
    await firestore.collection("users").doc(user.uid).update({"name": name});
  }

  Future<void> updateLiveStatus(String userUid, bool isLive) async {
    await firestore.collection("users").doc(userUid).update({"isLive": isLive});
  }
}
