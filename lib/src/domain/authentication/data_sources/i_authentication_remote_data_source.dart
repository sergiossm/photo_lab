abstract class IAuthenticationRemoteDataSource {
  Future<String> signInWithEmailAndPassword(String email, String password);
  Future<String> signUpWithEmailAndPassword(String email, String password);
  Stream<String?> authStateChanges();
  String? getSignedInUser();
  Future<void> signOut();
}
