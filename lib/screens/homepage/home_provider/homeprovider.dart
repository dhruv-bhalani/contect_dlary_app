import 'package:contect_dlary_app/screens/homepage/model/model.dart';
import 'package:flutter/material.dart';
import 'package:local_auth/local_auth.dart';

class ContactProvider with ChangeNotifier {
  int SelectedIndex = 0;

  List<Contactmodel> Contactlist = [
    Contactmodel(name: 'Himanshu', number: '1234567890'),
  ];

  void setSelectedIndex(int index) {
    SelectedIndex = index;
    notifyListeners();
  }

  List<Contactmodel> privatecontact = [];

  List<Contactmodel> favoritecontact = [];

  // void someMethod(Contactmodel contact) {
  //   (Favoritecontact != hidecontact)
  //       ? Favoritecontact(contact)
  //       : hidecontact(contact);
  //   notifyListeners();
  // }

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
    Contactlist.remove(index);
    notifyListeners();
  }

  void updatecontact(Contactmodel contact) {
    Contactlist[SelectedIndex] = contact;
    notifyListeners();
  }

  Future<bool> lockcontact() async {
    LocalAuthentication auth = LocalAuthentication();
    bool isBiometricAvailable = await auth.canCheckBiometrics;
    bool isDeviceSupported = await auth.isDeviceSupported();

    if (isBiometricAvailable && isDeviceSupported) {
      List<BiometricType> availableBiometrics =
          await auth.getAvailableBiometrics();
      if (availableBiometrics.isEmpty) {
        return false;
      } else {
        await auth.authenticate(
          localizedReason: 'Scan your fingerprint to authenticate',
        );
      }
    } else {
      return false;
    }
    return false;
    notifyListeners();
  }
}
