import 'package:firebase_auth/firebase_auth.dart' as firebase;
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:photo_lab/src/domain/authentication/data_sources/i_authentication_remote_data_source.dart';

class FirebaseAuthenticationDataSource
    implements IAuthenticationRemoteDataSource {
  final firebase.FirebaseAuth _firebaseAuth = firebase.FirebaseAuth.instance;
  final _googleSignIn = GoogleSignIn(
    scopes: <String>[
      'email',
      'profile',
    ],
  );

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
  Future<String?> signInWithGoogle() async {
    final googleUser = await _googleSignIn.signIn();

    // Obtain the auth details from the request
    final googleAuth = await googleUser?.authentication;
    if (googleAuth == null) return null;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    // Once signed in, return the UserCredential
    final userCredential =
        await FirebaseAuth.instance.signInWithCredential(credential);
    return userCredential.user?.uid;
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
