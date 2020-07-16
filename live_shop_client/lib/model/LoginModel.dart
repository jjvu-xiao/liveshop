// class LoginModel {
//   int code;
//   String msg;
//   Data data;

//   LoginModel({this.code, this.msg, this.data});

//   LoginModel.fromJson(Map<String, dynamic> json) {
//     code = json['code'];
//     msg = json['msg'];
//     data = json['data'] != null ? new Data.fromJson(json['data']) : null;
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['code'] = this.code;
//     data['msg'] = this.msg;
//     if (this.data != null) {
//       data['data'] = this.data.toJson();
//     }
//     return data;
//   }
// }

// class Data {
//   User user;
//   Token token;

//   Data({this.user, this.token});

//   Data.fromJson(Map<String, dynamic> json) {
//     user = json['user'] != null ? new User.fromJson(json['user']) : null;
//     token = json['token'] != null ? new Token.fromJson(json['token']) : null;
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     if (this.user != null) {
//       data['user'] = this.user.toJson();
//     }
//     if (this.token != null) {
//       data['token'] = this.token.toJson();
//     }
//     return data;
//   }
// }

// class User {
//   int id;
//   String name;
//   String nickName;
//   String avatar;
//   String passwd;
//   String salt;
//   String email;
//   String mobile;
//   int status;
//   int deptId;
//   String createBy;
//   String createTime;
//   String lastUpdateBy;
//   String lastUpdateTime;
//   int delFlag;

//   User(
//       {this.id,
//       this.name,
//       this.nickName,
//       this.avatar,
//       this.passwd,
//       this.salt,
//       this.email,
//       this.mobile,
//       this.status,
//       this.deptId,
//       this.createBy,
//       this.createTime,
//       this.lastUpdateBy,
//       this.lastUpdateTime,
//       this.delFlag});

//   User.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     name = json['name'];
//     nickName = json['nickName'];
//     avatar = json['avatar'];
//     passwd = json['passwd'];
//     salt = json['salt'];
//     email = json['email'];
//     mobile = json['mobile'];
//     status = json['status'];
//     deptId = json['deptId'];
//     createBy = json['createBy'];
//     createTime = json['createTime'];
//     lastUpdateBy = json['lastUpdateBy'];
//     lastUpdateTime = json['lastUpdateTime'];
//     delFlag = json['delFlag'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['id'] = this.id;
//     data['name'] = this.name;
//     data['nickName'] = this.nickName;
//     data['avatar'] = this.avatar;
//     data['passwd'] = this.passwd;
//     data['salt'] = this.salt;
//     data['email'] = this.email;
//     data['mobile'] = this.mobile;
//     data['status'] = this.status;
//     data['deptId'] = this.deptId;
//     data['createBy'] = this.createBy;
//     data['createTime'] = this.createTime;
//     data['lastUpdateBy'] = this.lastUpdateBy;
//     data['lastUpdateTime'] = this.lastUpdateTime;
//     data['delFlag'] = this.delFlag;
//     return data;
//   }
// }

// class Token {
//   List<Null> authorities;
//   Details details;
//   bool authenticated;
//   String principal;
//   String credentials;
//   String token;
//   String name;

//   Token(
//       {this.authorities,
//       this.details,
//       this.authenticated,
//       this.principal,
//       this.credentials,
//       this.token,
//       this.name});

//   Token.fromJson(Map<String, dynamic> json) {
//     if (json['authorities'] != null) {
//       authorities = new List<Null>();
//       json['authorities'].forEach((v) {
//         authorities.add(new Null.fromJson(v));
//       });
//     }
//     details =
//         json['details'] != null ? new Details.fromJson(json['details']) : null;
//     authenticated = json['authenticated'];
//     principal = json['principal'];
//     credentials = json['credentials'];
//     token = json['token'];
//     name = json['name'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     if (this.authorities != null) {
//       data['authorities'] = this.authorities.map((v) => v.toJson()).toList();
//     }
//     if (this.details != null) {
//       data['details'] = this.details.toJson();
//     }
//     data['authenticated'] = this.authenticated;
//     data['principal'] = this.principal;
//     data['credentials'] = this.credentials;
//     data['token'] = this.token;
//     data['name'] = this.name;
//     return data;
//   }
// }

// class Details {
//   String remoteAddress;
//   String sessionId;

//   Details({this.remoteAddress, this.sessionId});

//   Details.fromJson(Map<String, dynamic> json) {
//     remoteAddress = json['remoteAddress'];
//     sessionId = json['sessionId'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['remoteAddress'] = this.remoteAddress;
//     data['sessionId'] = this.sessionId;
//     return data;
//   }
// }