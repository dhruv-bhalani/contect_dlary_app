import 'package:contect_dlary_app/screens/android/homepage/model/model.dart';

import 'package:flutter/material.dart';
import 'package:local_auth/local_auth.dart';

class ContactProvider with ChangeNotifier {
  bool isAndiroid = true;
  int SelectedIndex = 0;
  String? imagePath;
  List<Contactmodel> privateContact = [];
  List<Contactmodel> favoriteContact = [];
  List<Contactmodel> contactList = [
    Contactmodel(
        name: 'Himansh',
        number: '1234567890',
        image: 'lib/images/1.jpg',
        email: 'himanshu@123'),
  ];
  DateTime date = DateTime.now();
  void changeDatetime(DateTime datetime) {
    date = datetime;
    notifyListeners();
  }

  void setSelectedIndex(int index) {
    SelectedIndex = index;
    notifyListeners();
  }

  void Favoritecontact(Contactmodel contact) {
    favoriteContact.add(contact);
    contactList.removeAt(SelectedIndex);
    notifyListeners();
  }

  void favoritedeletecontact(int index) {
    favoriteContact.removeAt(index);
    notifyListeners();
  }

  void unfavoritecontact(Contactmodel contact) {
    favoriteContact.removeAt(SelectedIndex);
    contactList.add(contact);
    notifyListeners();
  }

  void hidecontact(Contactmodel contact) {
    privateContact.add(contact);
    contactList.removeAt(SelectedIndex);
    notifyListeners();
  }

  void unhidecontact(Contactmodel contact) {
    privateContact.removeAt(SelectedIndex);
    contactList.add(contact);
    notifyListeners();
  }

  void hidedeletecontact(int index) {
    privateContact.removeAt(index);
    notifyListeners();
  }

  void addcontact(Contactmodel contact) {
    contactList.add(contact);
    notifyListeners();
  }

  void deletecontact(int index) {
    contactList.removeAt(index);
    notifyListeners();
  }

  void updatecontact(Contactmodel contact) {
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
}
