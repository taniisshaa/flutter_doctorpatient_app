class UserModel1 {
  String? description;
  String? image;
  String? name;


// receiving data
  UserModel1({this.description, this.image, this.name});
  factory UserModel1.fromMap(map) {
    return UserModel1(
      description: map['description'],
      name: map['name'],
      image: map['patient_img'],

    );
  }
// sending data
  Map<String, dynamic> toMap() {
    return {
      'description': description,
      'name':name,
      'patient_img': image,

    };
  }
}
