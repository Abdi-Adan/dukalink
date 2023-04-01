
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dukalink/domain/models/users/user.dart';
import 'package:dukalink/infrastructure/remote_repository/dukalink_firestore.dart';
import 'package:dukalink/infrastructure/remote_repository/users/firebase_auth.dart';

class UserRepository {
  static final _collection = globalFirestoreInstance.collection('Users');
  static final _currentUserID = globalFirebaseAuthInstance.currentUser!.uid;
  static final _userCollectionRef = _collection.doc(_currentUserID);

  Stream<QuerySnapshot> getStream() {
    return _collection.snapshots();
  }

  Future<void> addUser(DukalinkUser user) {
    return _userCollectionRef.set(user.toJson());
  }

  void updateUser(DukalinkUser user) async {
    await _userCollectionRef.update(user.toJson());
  }

  void deleteUser(DukalinkUser user) async {
    await _userCollectionRef.delete();
  }
}
