import 'package:firebase_auth/firebase_auth.dart';
import 'package:mum_k4/models/users.dart';
import 'package:mum_k4/services/database.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  //create user obj based on FirebaseUser
  User _userFromFirebaseUser(FirebaseUser user) {
    return user != null ? User(uid: user.uid) : null;
  }

  // auth change user stream
  Stream<User> get user {
    return _auth.onAuthStateChanged
        // .map((FirebaseUser user) => _userFromFirebaseUser(user));
        .map(_userFromFirebaseUser);
  }

  //sign in as something

  //sign in Anyno
  Future signInAnno() async {
    try {
      AuthResult result = await _auth.signInAnonymously();
      FirebaseUser user = result.user;

      //create a new document for the uesr with the uid 
      // await DatabaseService(uid: user.uid).updateUserData('Utsav', 'Chodri', 'BSS');
      return _userFromFirebaseUser(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  //sign in with email & password

   Future signInWithEmailAndPassword (String email, String password) async {
    try{
      AuthResult result = await _auth.signInWithEmailAndPassword(email: email, password: password);
      FirebaseUser user = result.user;
      return _userFromFirebaseUser(user);
    }catch(e) {
      print(e.toString());
      return null;
  }
}  


  //register with email & passsword

  Future registerWithEmailAndPassword (String email, String password) async {
    try{
      AuthResult result = await _auth.createUserWithEmailAndPassword(email: email, password: password);
      FirebaseUser user = result.user;

      //create a new documnet for the user with uid
      await DatabaseService(uid: user.uid).updateUserData('Amit', 'Luhar', 'karyakar');
      return _userFromFirebaseUser(user);
    }catch(e) {
      print(e.toString());
      return null;
  }
} 

  //signout
  Future signOut() async {
    try {
      return await _auth.signOut();
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}
