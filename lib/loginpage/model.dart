class UserModel {
  String? email;
  String? password;
  String? uid;
  String? name;
  String? Specilization;
  String? image;

// receiving data
  UserModel({this.uid, this.email, this.password, this.name , this.Specilization,this.image});
  factory UserModel.fromMap(map) {
    return UserModel(
      uid: map['uid'],
      email: map['email'],
      name: map['name'],
      password: map['password'],
      Specilization: map['Specilization'],
      image: map['image']
    );
  }
// sending data
  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'name': name,
      'email': email,
      'password': password,
      'Specilization':Specilization,
      'image':image,
    };
  }
}
