import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:handyman_admin_app/Models/category.dart';
import 'package:handyman_admin_app/Models/customer_job_upload.dart';
import 'package:handyman_admin_app/Models/handyman_job_upload.dart';
import 'package:handyman_admin_app/Models/users.dart';
import 'package:handyman_admin_app/constants.dart';

List<dynamic> allUsers = [];
List<dynamic> allCategories = [];
List<dynamic> allCustomerJobUpload = [];
List<dynamic> allHandymanJobUpload = [];

class ReadData {
  Future getUserData() async {
    allUsers.clear();

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

  Future getCategoryData() async {
    allCategories.clear();

    try {
      final querySnapshot =
          await FirebaseFirestore.instance.collection('Category').get();

      if (querySnapshot.docs.isNotEmpty) {
        for (var document in querySnapshot.docs) {
          final documentData = document.data();
          final categoryData = CategoryData(
            id: documentData['Category ID'],
            categoryName: documentData['Category Name'],
            servicesProvided: documentData['Services Provided'],
          );

          allCategories.add(categoryData);
        }
      }
    } on FirebaseException catch (e) {
      print(e.toString());
    } catch (error) {
      print(error.toString());
    }
  }

  Future getAllCustomerJobUploads() async {
    allCustomerJobUpload.clear();
    try {
      final querySnapshot = await FirebaseFirestore.instance
          .collection('Customer Job Upload')
          .get();

      if (querySnapshot.docs.isNotEmpty) {
        for (var document in querySnapshot.docs) {
          final documentData = document.data();
          final deadline = documentData['Job Details']['Deadline'];

          final deadlineDay = '${deadline[0]}${deadline[1]}';
          final deadlineMonth = '${deadline[3]}${deadline[4]}';
          final deadlineYear =
              '${deadline[6]}${deadline[7]}${deadline[8]}${deadline[9]}';
          var status = '';
          final dateNow = DateTime.now();
          if (int.parse(deadlineYear) < dateNow.year) {
            status = 'Expired';
          } else if (int.parse(deadlineMonth) < dateNow.month) {
            status = 'Expired';
          } else if (int.parse(deadlineDay) < dateNow.day) {
            status = 'Expired';
          } else {
            status = 'Active';
          }
          final jobUploadData = CustomerJobUploadData(
              status: status,
              customerID: documentData['Customer ID'],
              portfolio: documentData['Work Detail & Rating']['Portfolio'],
              jobUploadId: documentData['Job ID'],
              serviceProvided: documentData['Service Information']
                  ['Service Provided'],
              seenBy: documentData['Seen By'],
              deadlineDay: deadlineDay,
              deadlineMonth: deadlineMonth,
              deadlineYear: deadlineYear,
              serviceCat: documentData['Service Information']
                  ['Service Category'],
              charge: documentData['Service Information']['Charge'].toString(),
              chargeRate: documentData['Service Information']['Charge Rate'],
              rating: documentData['Work Detail & Rating']['Rating'],
              houseNum: documentData['Address Information']['House Number'],
              region: documentData['Address Information']['Region'],
              town: documentData['Address Information']['Street'],
              street: documentData['Address Information']['Street'],
              portfolioOption: documentData['Optional']['Portfolio Present'],
              referenceOption: documentData['Optional']['References Present'],
              expertise: documentData['Service Information']['Expertise']);

          allCustomerJobUpload.add(jobUploadData);
        }
      }
    } on FirebaseException catch (e) {
      print(e.toString());
    } catch (error) {
      print(error.toString());
    }
  }

  Future getAllHandymanJobUploads() async {
    allHandymanJobUpload.clear();
    try {
      final querySnapshot = await FirebaseFirestore.instance
          .collection('Handyman Job Upload')
          .get();

      if (querySnapshot.docs.isNotEmpty) {
        for (var document in querySnapshot.docs) {
          final documentData = document.data();
          final deadline = documentData['Deadline'];

          final deadlineDay = '${deadline[0]}${deadline[1]}';
          final deadlineMonth = '${deadline[3]}${deadline[4]}';
          final deadlineYear =
              '${deadline[6]}${deadline[7]}${deadline[8]}${deadline[9]}';
          var status = '';
          final dateNow = DateTime.now();
          if (int.parse(deadlineYear) < dateNow.year) {
            status = 'Expired';
          } else if (int.parse(deadlineMonth) < dateNow.month) {
            status = 'Expired';
          } else if (int.parse(deadlineDay) < dateNow.day) {
            status = 'Expired';
          } else {
            status = 'Active';
          }

          final jobUploadData = HandymanJobUploadData(
              experience: documentData['Work Experience & Certification']
                  ['Experience'],
              certification: documentData['Work Experience & Certification']
                  ['Certification'],
              references: documentData['Work Experience & Certification']
                  ['References'],
              status: status,
              customerID: documentData['Customer ID'],
              portfolio: documentData['Work Experience & Certification']
                  ['Portfolio'],
              jobUploadId: documentData['Job ID'],
              serviceProvided: documentData['Service Information']
                  ['Service Provided'],
              seenBy: documentData['Seen By'],
              deadlineDay: deadlineDay,
              deadlineMonth: deadlineMonth,
              deadlineYear: deadlineYear,
              serviceCat: documentData['Service Information']
                  ['Service Category'],
              charge: documentData['Service Information']['Charge'].toString(),
              chargeRate: documentData['Service Information']['Charge Rate'],
              rating: documentData['Work Experience & Certification']['Rating'],
              houseNum: documentData['Address Information']['House Number'],
              region: documentData['Address Information']['Region'],
              town: documentData['Address Information']['Street'],
              street: documentData['Address Information']['Street'],
              expertise: documentData['Service Information']['Expertise']);

          allHandymanJobUpload.add(jobUploadData);
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
