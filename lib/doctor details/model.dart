class UserModel1 {
  String? did;
  String? time;
  String? date;


// receiving data
  UserModel1({this.did, this.time, this.date});
  factory UserModel1.fromMap(map) {
    return UserModel1(
        did: map['uid'],
        date: map['date'],
        time: map['time'],

    );
  }
// sending data
  Map<String, dynamic> toMap() {
    return {
      'uid': did,
      'date': date,
      'time': time,

    };
  }
}
