class FireStoreModal {
  int id;
  String name;
  String password;
  // List contacts = [];

  FireStoreModal(
      this.id,
      this.name,
      this.password,
      // this.contacts,
      );

  factory FireStoreModal.from({required Map data}) {
    return FireStoreModal(
        data['id'],
        data['name'],
        data['password'],
        // data['contacts']
    );
  }
}