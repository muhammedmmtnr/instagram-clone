import 'package:cloud_firestore/cloud_firestore.dart';

class Usermodel {
  final String email;
  final String uid;
  final String photoUrl;
  final String username;
  final String bio;
  final List followers;
  final List following;

  const Usermodel(
      {required this.username,
      required this.uid,
      required this.photoUrl,
      required this.email,
      required this.bio,
      required this.followers,
      required this.following});

  static Usermodel fromSnap(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;

    return Usermodel(
      username: snapshot["username"].toString(),
      uid: snapshot["uid"].toString(),
      email: snapshot["email"].toString(),
      photoUrl: snapshot["photoUrl"].toString(),
      bio: snapshot["bio"].toString(),
      followers: snapshot["followers"].toList(),
      following: snapshot["following"].toList(),
    );
  }

  Map<String, dynamic> toJson() => {
        "username": username,
        "uid": uid,
        "email": email,
        "photoUrl": photoUrl,
        "bio": bio,
        "followers": followers,
        "following": following,
      };
}