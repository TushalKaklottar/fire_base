class UserModal {
  int id;
  String password;

  UserModal(
      this.id,
      this.password,
      );

  factory UserModal.fromMap({required Map data}) {
    return UserModal(
      data['id'],
      data['password'],
    );
  }
}