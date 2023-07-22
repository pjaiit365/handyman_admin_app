import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
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

  Future delete(int index) async {
    final userDoc = await FirebaseFirestore.instance
        .collection('users')
        .where('User ID', isEqualTo: allUsers[index].id)
        .get();

    if (userDoc.docs.isNotEmpty) {
      final docID = userDoc.docs.single.id;
      await FirebaseFirestore.instance.collection('users').doc(docID).delete();
    }

    final document = await FirebaseFirestore.instance
        .collection('profile')
        .where('User ID', isEqualTo: allUsers[index].id)
        .get();

    if (document.docs.isNotEmpty) {
      final docID = document.docs.single.id;
      await FirebaseFirestore.instance
          .collection('profile')
          .doc(docID)
          .delete();
    }

    final custUploadDoc = await FirebaseFirestore.instance
        .collection('Customer Job Upload')
        .where('Customer ID', isEqualTo: allUsers[index].id)
        .get();

    if (custUploadDoc.docs.isNotEmpty) {
      for (var document in custUploadDoc.docs) {
        final docID = document.id;
        await FirebaseFirestore.instance
            .collection('Customer Job Upload')
            .doc(docID)
            .delete();
      }
    }

    final handymanUploadDoc = await FirebaseFirestore.instance
        .collection('Handyman Job Upload')
        .where('Customer ID', isEqualTo: allUsers[index].id)
        .get();

    if (handymanUploadDoc.docs.isNotEmpty) {
      for (var document in handymanUploadDoc.docs) {
        final docID = document.id;
        await FirebaseFirestore.instance
            .collection('Handyman Job Upload')
            .doc(docID)
            .delete();
      }
    }

    final bookmarkDoc = await FirebaseFirestore.instance
        .collection('Bookmark')
        .where('User ID', isEqualTo: allUsers[index].id)
        .get();

    if (bookmarkDoc.docs.isNotEmpty) {
      final docID = document.docs.single.id;
      await FirebaseFirestore.instance
          .collection('Bookmark')
          .doc(docID)
          .delete();
    }
  }

  Future deleteFiles(String path) async {
    final directoryRef = FirebaseStorage.instance.ref().child(path);

    try {
      final querySnapshot = await directoryRef.listAll();
      querySnapshot.items.forEach((file) async {
        await file.delete();
      });

      querySnapshot.prefixes.forEach((folder) async {
        await deleteFilesInFolders(folder);
      });
    } catch (e) {
      print(e.toString());
    }
  }

  Future deleteFilesInFolders(Reference directoryRef) async {
    try {
      final querySnapshot = await directoryRef.listAll();
      querySnapshot.items.forEach((file) async {
        await file.delete();
      });

      querySnapshot.prefixes.forEach((folder) async {
        await deleteFilesInFolders(folder);
      });
    } catch (e) {
      print(e.toString());
    }
  }
}
