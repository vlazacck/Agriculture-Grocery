class usermodel {
  String? uid;
  String? phonenumber;
  String? email;
  String? address;
  String? firstname;

  usermodel(
      {this.uid, this.email, this.firstname, this.phonenumber, this.address});
  //receiving data from server
  factory usermodel.fromMap(Map) {
    return usermodel(
      uid: Map['uid'],
      email: Map['email'],
      firstname: Map['firstname'],
      phonenumber: Map['phonenumber'],
      address: Map['address'],
    );
  }
  //sending data to our server
  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'email': email,
      'firstname': firstname,
      'phonenumber': phonenumber,
      'address': address,
    };
  }
}
