// Copyright (c) 2015, Adam Tremblay. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

import 'dart:html';

import 'package:paper_elements/paper_input.dart';
import 'package:polymer/polymer.dart';


/// My Polymer <address-book-app> element.
@CustomTag("address-book-app")
class AddressBookApp extends PolymerElement {
  @observable String prenom ='Entrez Prenom';
  @observable String nom ='Entrez  Nom';
  @observable String courriel ='Entrez  Courriel';
  @observable String cell ='Entrez Cell';
  
  ///Constructeur pour instance de AddressBookApp.
  AddressBookApp.created() : super.created();
  
  void changePrenom(Event event, Object object, PaperInput target) {
      prenom = target.value;
    }
  void changeNom(Event event, Object object, PaperInput target) {
        nom = target.value;
      }
  void changeCourriel(Event event, Object object, PaperInput target) {
        courriel = target.value;
      }
  void changeCell(Event event, Object object, PaperInput target) {
        cell = target.value;
      }
  
}


