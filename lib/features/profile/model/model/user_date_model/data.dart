class Data {
  num? id;
  String? name;
  String? mobile;
  String? email;
  String? profilePhotoPath;
  num? roleId;
  String? profilePhotoUrl;

  Data({
    this.id,
    this.name,
    this.mobile,
    this.email,
    this.profilePhotoPath,
    this.roleId,
    this.profilePhotoUrl,
  });

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
      id: num.tryParse(json['id'].toString()),
      name: json['name']?.toString(),
      mobile: json['mobile']?.toString(),
      email: json['email']?.toString(),
      profilePhotoPath: json['profile_photo_path']?.toString(),
      roleId: num.tryParse(json['role_id'].toString()),
      profilePhotoUrl: json['profile_photo_url']?.toString(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (mobile != null) 'mobile': mobile,
      if (email != null) 'email': email,
      if (profilePhotoPath != null) 'profile_photo_path': profilePhotoPath,
      if (roleId != null) 'role_id': roleId,
      if (profilePhotoUrl != null) 'profile_photo_url': profilePhotoUrl,
    };
  }
}
