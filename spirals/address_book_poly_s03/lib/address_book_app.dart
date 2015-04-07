// Copyright (c) 2015, Adam Tremblay. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.
import 'dart:convert';
import 'dart:html';
import 'package:polymer/polymer.dart';
import "package:address_book_polymer/address_book_polymer.dart";

/// My Polymer <address-book-app> element.
@CustomTag("address-book-app")
class AddressBookApp extends PolymerElement {
  var contacts = new Contacts();

  ///Constructeur pour instance de AddressBookApp.
  AddressBookApp.created() : super.created() {
    contacts.internalList = toObservable(contacts.internalList);
    load();
  }

  fromJson(List<Map<String, Object>> contactList) {
      contacts.fromJson(contactList);
    }
  
  load() {
    String json = window.localStorage['contact_list'];
    if (json == null) {
      contacts.init();
    } else {
      fromJson(JSON.decode(json));
    }
  }
}
