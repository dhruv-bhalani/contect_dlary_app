import 'package:contect_dlary_app/screens/homepage/model/model.dart';
import 'package:flutter/material.dart';

class ContactProvider with ChangeNotifier {
  List<Contactmodel> Contactlist = [
    Contactmodel(
        name: "sai", number: "1234567890", image: "assets/image/1.jpg"),
  ];
  int SelectedIndex = 0;

  void setSelectedIndex(int index) {
    SelectedIndex = index;
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

  void updatecontact(Contactmodel contact) {
    Contactlist[SelectedIndex] = contact;
    notifyListeners();
  }
}
