import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:handyman_admin_app/Models/users.dart';
import 'package:handyman_admin_app/constants.dart';

List<dynamic> allUsers = [];

class ReadData {
  Future getUserData() async {
    allUsers.clear();
    print(loggedInUserId);
    try {
      final querySnapshot = await FirebaseFirestore.instance
          .collection('users')
          .where('User ID', isNotEqualTo: loggedInUserId)
          .get();
      if (querySnapshot.docs.isNotEmpty) {
        for (var document in querySnapshot.docs) {
          final documentData = document.data();
          final userData = UserData(
            id: documentData['User ID'],
            firstName: documentData['First Name'],
            lastName: documentData['Last Name'],
            email: documentData['Email Address'],
            role: documentData['Role'],
            number: documentData['Mobile Number'],
          );

          allUsers.add(userData);
        }
      }
    } on FirebaseException catch (e) {
      print(e.toString());
    } catch (error) {
      print(error.toString());
    }
  }
}
