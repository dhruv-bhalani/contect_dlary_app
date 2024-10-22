import 'package:contect_dlary_app/screens/android/homepage/model/model.dart';

import 'package:flutter/material.dart';
import 'package:local_auth/local_auth.dart';

class ContactProvider with ChangeNotifier {
  int SelectedIndex = 0;
  String? imagePath;
  List<Contactmodel> Contactlist = [
    Contactmodel(
        name: 'Himanshu',
        number: '1234567890',
        image: 'lib/images/1.jpg',
        email: 'himanshu@123'),
  ];

  void setSelectedIndex(int index) {
    SelectedIndex = index;
    notifyListeners();
  }

  List<Contactmodel> privatecontact = [];

  List<Contactmodel> favoritecontact = [];

  void Favoritecontact(Contactmodel contact) {
    favoritecontact.add(contact);
    Contactlist.removeAt(SelectedIndex);
    notifyListeners();
  }

  void unfavoritecontact(Contactmodel contact) {
    favoritecontact.removeAt(SelectedIndex);
    Contactlist.add(contact);
    notifyListeners();
  }

  void hidecontact(Contactmodel contact) {
    privatecontact.add(contact);
    Contactlist.removeAt(SelectedIndex);
    notifyListeners();
  }

  void unhidecontact(Contactmodel contact) {
    privatecontact.removeAt(SelectedIndex);
    Contactlist.add(contact);
    notifyListeners();
  }

  void addcontact(Contactmodel contact) {
    Contactlist.add(contact);
    notifyListeners();
  }

  void deletecontact(int index) {
    Contactlist.removeAt(index);
    notifyListeners();
  }

  void hidedeletecontact(int index) {
    Contactlist.remove(index);
    notifyListeners();
  }

  void favoritedeletecontact(int index) {
    favoritecontact.removeAt(index);
    notifyListeners();
  }

  void updatecontact(Contactmodel contact) {
    Contactlist[SelectedIndex] = contact;
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
}
