import 'package:firebase_auth/firebase_auth.dart';
import 'package:videocall/model/store_user.dart';
import 'package:videocall/model/user.dart';
import 'package:videocall/service/firebase_methods.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthServices {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  // User _user;
  final GoogleSignIn googleSignIn = GoogleSignIn();

  Users _takeAnParamaterFromUser(User user) {
    return user != null ? Users(uid: user.uid) : null;
  }

  FirebaseMethods _firebaseMethods = FirebaseMethods();

  Future<User> getCurrentUser() => _firebaseMethods.getCurrentUser();

  Future<Userlar> getUserDetails() => _firebaseMethods.getUserDetails();

  Future<bool> authenticateUser(User user) =>
      _firebaseMethods.authenticateUser(user);

  Future<void> addDataToDb({User user, String name}) =>
      _firebaseMethods.addDataToDb(user, name: name);
  Future<List<Userlar>> fetchAllUsers(User user) =>
      _firebaseMethods.fetchAllUsers(user);

  Stream<Users> get usert {
    return _auth
        .authStateChanges()
        //.map((FirebaseUser user) => _userFromFirebaseUser(user));
        .map(_takeAnParamaterFromUser);
  }

  Future signInAnony() async {
    try {
      UserCredential result = await _auth.signInAnonymously();
      User user = result.user;
      return _takeAnParamaterFromUser(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  Future signInWithEmailandPassaword(String email, String password) async {
    try {
      UserCredential result = await _auth.signInWithEmailAndPassword(
          email: email, password: password);

      User user = result.user;
      FirebaseMethods().updateLiveStatus(user.uid, true);
      return user;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
      // Handle err
    } catch (e) {
      print(e);
      return null;
    }
  }

  Future registerWithEmailandPassaword(
      String email, String password, String name) async {
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      User user = result.user;
      FirebaseMethods().updateUserName(user, name);
      return _takeAnParamaterFromUser(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  Future signInWithGoogle() async {
    final GoogleSignInAccount googleSignInAccount = await googleSignIn.signIn();
    final GoogleSignInAuthentication googleSignInAuthentication =
        await googleSignInAccount.authentication;

    final AuthCredential credential = GoogleAuthProvider.credential(
      accessToken: googleSignInAuthentication.accessToken,
      idToken: googleSignInAuthentication.idToken,
    );

    final UserCredential authResult =
        await _auth.signInWithCredential(credential);
    final User user = authResult.user;
    FirebaseMethods().updateLiveStatus(user.uid, true);
    return _takeAnParamaterFromUser(user);
  }

  Future signOut(String userUid) async {
    try {
      FirebaseMethods().updateLiveStatus(userUid, false);
      await googleSignIn.signOut();
      await _auth.signOut();
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}
