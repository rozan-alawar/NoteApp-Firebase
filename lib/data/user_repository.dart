abstract class UserRepository {
  Future signIn(String email, String password);
  Future signUp(
      {required String email,
      required String phone,
      required String name,
      required String password});
  logOut();
}
