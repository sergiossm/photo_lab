abstract class IAuthenticationRemoteDataSource {
  Future<String> signUpWithEmailAndPassword(String email, String password);
  Future<String> signInWithEmailAndPassword(String email, String password);
  Future<String?> signInWithGoogle();
  Stream<String?> authStateChanges();
  String? getSignedInUser();
  Future<void> signOut();
}
