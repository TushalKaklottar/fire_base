class GetUserModal {
  late int id;
  late String name;
  late String password;

  GetUserModal(
      this.id,
      this.name,
      this.password,
      );

  factory GetUserModal.fromMap({required Map data}) {
    return GetUserModal(
        data['id'],
        data['name'],
        data['password']
    );
  }
}