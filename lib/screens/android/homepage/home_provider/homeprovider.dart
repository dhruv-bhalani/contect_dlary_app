import 'package:contect_dlary_app/screens/android/homepage/model/model.dart';

import 'package:flutter/material.dart';
import 'package:local_auth/local_auth.dart';

class ContactProvider with ChangeNotifier {
  bool isAndiroid = true;
  bool isdarkmode = true;
  int SelectedIndex = 0;
  String? imagePath;
  List<ContactModel> privateContact = [];
  List<ContactModel> favoriteContact = [];
  List<ContactModel> contactList = [
    ContactModel(
        name: 'Himanshu',
        number: '1234567890',
        image: 'lib/images/1.jpg',
        email: 'himanshu@123'),
  ];
  DateTime date = DateTime.now();
  TimeOfDay t1 = TimeOfDay.now();

  void changeTime(TimeOfDay T1) {
    t1 = T1;
    notifyListeners();
  }

  void changeDatetime(DateTime datetime) {
    date = datetime;
    notifyListeners();
  }

  void setSelectedIndex(int index) {
    SelectedIndex = index;
    notifyListeners();
  }

  void Favoritecontact(ContactModel contact) {
    favoriteContact.add(contact);
    contactList.removeAt(SelectedIndex);
    notifyListeners();
  }

  void favoritedeletecontact(int index) {
    favoriteContact.removeAt(index);
    notifyListeners();
  }

  void unfavoritecontact(ContactModel contact) {
    favoriteContact.removeAt(SelectedIndex);
    contactList.add(contact);
    notifyListeners();
  }

  void hidecontact(ContactModel contact) {
    privateContact.add(contact);
    contactList.removeAt(SelectedIndex);
    notifyListeners();
  }

  void unhidecontact(ContactModel contact) {
    privateContact.removeAt(SelectedIndex);
    contactList.add(contact);
    notifyListeners();
  }

  void hidedeletecontact(int index) {
    privateContact.removeAt(index);
    notifyListeners();
  }

  void addcontact(ContactModel contact) {
    contactList.add(contact);
    notifyListeners();
  }

  void deletecontact(int index) {
    contactList.removeAt(index);
    notifyListeners();
  }

  void updatecontact(ContactModel contact) {
    contactList[SelectedIndex] = contact;
    notifyListeners();
  }

  Future<bool> LockContact() async {
    LocalAuthentication auth = LocalAuthentication();
    bool isBiometrics = await auth.canCheckBiometrics;
    bool isDevice = await auth.isDeviceSupported();
    if (isBiometrics && isDevice) {
      List<BiometricType> types = await auth.getAvailableBiometrics();
      if (types.isEmpty) {
        return false;
      } else {
        return await auth.authenticate(
            localizedReason: "Please authenticate to lock contact");
      }
    } else {
      return false;
    }
  }

  void changeisAndiroid() {
    isAndiroid = !isAndiroid;
    notifyListeners();
  }

  void changeisDarkMode() {
    isdarkmode = !isdarkmode;
    notifyListeners();
  }
}
