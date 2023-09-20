class UserModal {
  int id;
  String name;
  String password;

  UserModal(
      this.id,
      this.name,
      this.password,
      );

  factory UserModal.fromMap({required Map data}) {
    return UserModal(
      data['id'],
      data['name'],
      data['password'],
    );
  }
}