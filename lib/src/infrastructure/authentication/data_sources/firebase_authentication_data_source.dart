import 'package:firebase_auth/firebase_auth.dart' as firebase;
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:photo_lab/src/domain/authentication/data_sources/i_authentication_remote_data_source.dart';
import 'package:photo_lab/src/domain/authentication/dtos/i_authentication_user_dto.dart';
import 'package:photo_lab/src/infrastructure/authentication/dtos/authentication_user_dto.dart';

class FirebaseAuthenticationDataSource implements IAuthenticationRemoteDataSource {
  final firebase.FirebaseAuth _firebaseAuth = firebase.FirebaseAuth.instance;
  final _googleSignIn = GoogleSignIn(
    scopes: <String>[
      'email',
      'profile',
    ],
  );

  @override
  Future<IAuthenticationUserDto?> signInWithGoogle() async {
    final googleUser = await _googleSignIn.signIn();

    // Obtain the auth details from the request
    final googleAuth = await googleUser?.authentication;
    if (googleAuth == null) return null;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    // Once signed in, return the AuthenticationUserDto
    final user = (await FirebaseAuth.instance.signInWithCredential(credential)).user;
    final id = user?.uid;
    final email = user?.email;
    final displayName = user?.displayName;
    final photoUrl = user?.photoURL;
    if (id == null || email == null) return null;

    return AuthenticationUserDto(
      id: id,
      email: email,
      displayName: displayName,
      photoUrl: photoUrl,
    );
  }

  @override
  IAuthenticationUserDto? getSignedInUser() {
    final user = _firebaseAuth.currentUser;
    if (user == null) return null;

    return AuthenticationUserDto.fromFirebaseUser(user);
  }

  @override
  Stream<IAuthenticationUserDto?> authStateChanges() {
    return _firebaseAuth.authStateChanges().map((firebase.User? user) {
      if (user == null) return null;
      return AuthenticationUserDto.fromFirebaseUser(user);
    });
  }

  @override
  Future<void> signOut() async {
    await _googleSignIn.disconnect();
    await _firebaseAuth.signOut();
  }
}
