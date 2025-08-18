import 'package:firebase_auth/firebase_auth.dart';

class FirebaseAuthService {
  final FirebaseAuth _firebaseAuth;

  FirebaseAuthService({FirebaseAuth? firebaseAuth})
      : _firebaseAuth = firebaseAuth ?? FirebaseAuth.instance;

  Future<UserCredential> signInAnonymouslyIfNeeded() async {
    final User? currentUser = _firebaseAuth.currentUser;
    if (currentUser != null) {
      return UserCredential(
        additionalUserInfo: null,
        credential: null,
        user: currentUser,
      );
    }
    return _firebaseAuth.signInAnonymously();
  }

  User? get currentUser => _firebaseAuth.currentUser;
}

