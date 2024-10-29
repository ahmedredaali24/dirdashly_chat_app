import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dirdashly/data/model/my_user.dart';

class DbFirebase {
  static CollectionReference<MyUser> getUserCollection() {
    return FirebaseFirestore.instance
        .collection(MyUser.collectionName)
        .withConverter<MyUser>(
          fromFirestore: ((snapshot, option) =>
              MyUser.fromJson(snapshot.data()!)),
          toFirestore: (user, options) => user.toJson(),
        );
  }

  static Future<void> register(MyUser user) async {
    return getUserCollection().doc(user.id).set(user);
  }

  static Future<MyUser?> getUser(String userId) async {
    var documentSnapshot =
        await getUserCollection().doc(userId).get();
    return documentSnapshot.data()!;

  }
}
