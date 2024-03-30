import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthRepo {
  final _googleSignIn = GoogleSignIn();
  final _auth = FirebaseAuth.instance;

  Future<User?> signInWithGoogle() async {
    try {
      final googleUser = await _googleSignIn.signIn();
      final googleAuth = await googleUser?.authentication;

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );

      final userCredential = await _auth.signInWithCredential(credential);

      if (userCredential.user == null) {
        return null;
      }

      return userCredential.user;
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<void> signOut() async {
    try {
      final user = await _googleSignIn.signOut();
      if (user == null) {
        await _auth.signOut();
      } else {
        throw Exception('Failed to Sign Out: Please try again.');
      }
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<User?> isSignIn() async {
    try {
      final result = await _googleSignIn.isSignedIn();
      if (result) {
        if (_auth.currentUser == null) {
          return null;
        }
        return _auth.currentUser;
      } else {
        return null;
      }
    } catch (e) {
      throw Exception(e);
    }
  }
}
