import 'package:firebase_auth/firebase_auth.dart';

class FirebaseAuthService {
  final FirebaseAuth _firebaseAuth;

  FirebaseAuthService({FirebaseAuth? firebaseAuth})
      : _firebaseAuth = firebaseAuth ?? FirebaseAuth.instance;

  Future<User?> signInAnonymouslyIfNeeded() async {
    final User? existingUser = _firebaseAuth.currentUser;
    if (existingUser != null) {
      return existingUser;
    }
    final UserCredential credential = await _firebaseAuth.signInAnonymously();
    return credential.user;
  }

  User? get currentUser => _firebaseAuth.currentUser;
}

