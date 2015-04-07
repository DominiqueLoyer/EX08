// Copyright (c) 2015, Adam Tremblay. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

import 'dart:html';

import 'package:paper_elements/paper_input.dart';
import 'package:polymer/polymer.dart';


/// My Polymer <address-book-app> element.
@CustomTag("address-book-app")
class AddressBookApp extends PolymerElement {
  @observable String titre ='Allo je suis un titre';
  
  ///Constructeur pour instance de AddressBookApp.
  AddressBookApp.created() : super.created();
  
  void changeTitre(Event event, Object object, PaperInput target) {
      titre = target.value;
    }
  
}


