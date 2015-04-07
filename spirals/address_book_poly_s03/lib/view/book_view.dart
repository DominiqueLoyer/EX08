/// Copyright (c) 2015, Adam Tremblay. All rights reserved. Use of this source code
/// is governed by a BSD-style license that can be found in the LICENSE file.
import 'dart:convert';
import 'dart:html';
import 'package:polymer/polymer.dart';
import 'package:address_book_polymer/address_book_polymer.dart';

/// My Polymer <book-view> element.
@CustomTag("book-view")
class BookView extends PolymerElement {
  @published Contacts contacts;
  
  
  ///Constructeur pour instance de BookView.
  BookView.created() : super.created();
  

///section sauvegarde et load  
  
  add(Event e, var detail, Node target) {
      InputElement prenom = shadowRoot.querySelector("#prenom");
      InputElement nom = shadowRoot.querySelector("#nom");
      InputElement courriel = shadowRoot.querySelector("#courriel");
      InputElement cell = shadowRoot.querySelector("#cell");
    
///section erreurs et messages.
      LabelElement message = shadowRoot.querySelector("#message");
      var error = false;
      message.text = '';
      
      
      if (nom.value == '') {
        message.text = 'Vous devez entrez un nom; ${message.text}';
        error = true;
      }
      if (prenom.value ==''){
        message.text = 'Vous devez entrez un prenom; ${message.text}';
        error = true;
      }
      if (courriel.value == '') {
        message.text = 'Vous devez entrer un courriel; ${message.text}';
        error = true;
      }
      ///le champ cell est facultatif donc pas de verification
      ///si pas d'erreur, on continue
      if (!error) {
        var contact = new Contact(prenom.value, nom.value, courriel.value,cell.value);
        if (contacts.add(contact)) {
          contacts.sort();
          save();
        } else {
          message.text = 'Il y a un contact avec ce nom.';
        }
      }
    }
    
    
    
    delete(Event e, var detail, Node target) {
      InputElement prenom = shadowRoot.querySelector("#prenom");
      InputElement nom = shadowRoot.querySelector("#nom");
      LabelElement message = shadowRoot.querySelector("#message");
      ///delete fonctionne maintenant sur une base de 2 valeurs; soit nom et prenom
     
      message.text = '';
      Contact contact = contacts.find(nom.value,prenom.value);
      
      if (contact == null) {
        message.text = 'Ce nom n apparait pas dand le carnet d adresses';
      } else {
        
        if (contacts.remove(contact)) {
          save();
        }
      }
    }
    
    List<Map<String, Object>> toJson() {
       return contacts.toJson();
    }

    save() {      
      window.localStorage['contact_list'] = JSON.encode(toJson());
    }


}