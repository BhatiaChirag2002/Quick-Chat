class ChatUserModel {
  String? about;
  String? createdAt;
  String? email;
  String? id;
  String? image;
  bool? isOnline;
  String? lastActive;
  String? name;
  String? pushToken;

  ChatUserModel({
    this.about,
    this.createdAt,
    this.email,
    this.id,
    this.image,
    this.isOnline,
    this.lastActive,
    this.name,
    this.pushToken,
  });

  factory ChatUserModel.fromJson(Map<String, dynamic> json) => ChatUserModel(
        about: json['about'] as String?,
        createdAt: json['created_at'] as String?,
        email: json['email'] as String?,
        id: json['id'] as String?,
        image: json['image'] as String?,
        isOnline: json['is_online'] as bool?,
        lastActive: json['last_active'] as String?,
        name: json['name'] as String?,
        pushToken: json['push_token'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'about': about,
        'created_at': createdAt,
        'email': email,
        'id': id,
        'image': image,
        'is_online': isOnline,
        'last_active': lastActive,
        'name': name,
        'push_token': pushToken,
      };
}
