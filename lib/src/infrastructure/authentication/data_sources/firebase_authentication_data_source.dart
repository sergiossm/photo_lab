import 'package:firebase_auth/firebase_auth.dart' as firebase;
import 'package:photo_lab/src/domain/authentication/data_sources/i_authentication_remote_data_source.dart';

class FirebaseAuthenticationDataSource
    implements IAuthenticationRemoteDataSource {
  final firebase.FirebaseAuth _firebaseAuth = firebase.FirebaseAuth.instance;

  @override
  Future<String> signInWithEmailAndPassword(
    String email,
    String password,
  ) async {
    final userCredential = await _firebaseAuth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
    return userCredential.user!.uid;
  }

  @override
  Future<String> signUpWithEmailAndPassword(
    String email,
    String password,
  ) async {
    final userCredential = await _firebaseAuth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
    return userCredential.user!.uid;
  }

  @override
  Stream<String?> authStateChanges() {
    return _firebaseAuth
        .authStateChanges()
        .map((firebase.User? user) => user?.uid);
  }

  @override
  String? getSignedInUser() {
    return _firebaseAuth.currentUser?.uid;
  }

  @override
  Future<void> signOut() async {
    await _firebaseAuth.signOut();
  }
}
