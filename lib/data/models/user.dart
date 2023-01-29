class CustomeUser {
  final String uid;
  final String? name;
  final String email;
  final String? phone;

  CustomeUser({
    required this.uid,
    required this.name,
    required this.email,
    required this.phone,
  });

  @override
  String toString() {
    return 'uid: $uid, name: $name, email: $email, phone: $phone\n';
  }
}
