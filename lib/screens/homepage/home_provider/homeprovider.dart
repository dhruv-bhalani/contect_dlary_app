import 'package:contect_dlary_app/screens/homepage/model/model.dart';
import 'package:flutter/material.dart';

class ContactProvider with ChangeNotifier {
  List<Contactmodel> Contactlist = [
    Contactmodel(
        name: 'Abhishek', number: '1234567890', image: 'lib/images/1.jpg'),
    Contactmodel(
        name: 'Shubham', number: '1234567890', image: 'lib/images/2.jpg'),
  ];

  void addcontact(Contactmodel contact) {
    Contactlist.add(contact);
    notifyListeners();
  }

  void deletecontact(int index) {
    Contactlist.removeAt(index);
    notifyListeners();
  }

  void updatecontact(Contactmodel contact) {
    Contactlist[Contactlist.indexOf(contact)];
    notifyListeners();
  }
}
