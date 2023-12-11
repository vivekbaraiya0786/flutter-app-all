import 'package:flutter/material.dart';
import 'package:projects/Modals/contact_diary/contact_modal.dart';
import 'package:projects/utils/attributes/attributes.dart';
import 'package:shared_preferences/shared_preferences.dart';

class contact_Provider extends ChangeNotifier {
  Add_Contact_Modal addContact;

  contact_Provider({required this.addContact});

  addValue() async {
    addContact.FirstName.add(firstName!);
    addContact.LastName.add(lastName!);
    addContact.EmailId.add(emailId!);
    addContact.PhoneNumber.add(phoneNumber!);
    addContact.Images.add(allimage.toString());

    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setStringList('firstname', addContact.FirstName);
    prefs.setStringList('lastName', addContact.LastName);
    prefs.setStringList('emailId', addContact.EmailId);
    prefs.setStringList('phoneNumber', addContact.PhoneNumber);
    prefs.setStringList('allimage', addContact.Images);
    notifyListeners();
  }
}
