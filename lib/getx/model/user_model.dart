class UserModel{

  int? id;
  String? username;
  String? email;
  String? mobile_no;
  String? address;
  String? password;
  String? School_name;
  String? college_name;
  String? createdAt;
  String? updatedAt;


  UserModel({
    required this.id,
    required this.username,
    required this.email,
    required this.mobile_no,
    required this.address,
    required this.School_name,
    required this.college_name,
    required this.createdAt,
    required this.updatedAt
 });

  factory UserModel.fromjson(Map<String, dynamic> json){
    return UserModel(
        id: json['id'] ?? 0,
        username: json['username'] ?? "",
        email: json['email'] ?? "",
        mobile_no: json['mobile_no'] ?? "",
        address: json['address'] ?? "",
        School_name: json['School_name'] ?? "",
        college_name: json['college_name'] ?? "",
        createdAt: json['createdAt'] ?? "",
        updatedAt: json['updatedAt'] ?? ""
    );
  }

  //web use below "Map toJson" for post model
  Map tojson = {"id": 1, "username": "kapil"};
}