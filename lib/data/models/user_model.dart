class UserModel {
  final String nama;
  final String email;
  final String? fotoProfil;
  final String? negara;
  final String? telepon;

  UserModel({
    required this.nama,
    required this.email,
    this.fotoProfil,
    this.negara,
    this.telepon,
  });

  @override
  String toString() {
    return 'UserModel(nama: $nama, email: $email, fotoProfil: $fotoProfil, negara: $negara, telepon: $telepon)';
  }
}
