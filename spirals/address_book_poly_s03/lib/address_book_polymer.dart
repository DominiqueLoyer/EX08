/// Copyright (c) 2015, Adam Tremblay. All rights reserved. Use of this source code
/// is governed by a BSD-style license that can be found in the LICENSE file.

library address_book_polymer;

class Contact{
  
  String prenom;
  String nom;
  String courriel;
  String cell;
  
  Contact (this.prenom, this.nom, this.courriel, this.cell){
    prenom= prenom;
    nom= nom;
    courriel= courriel;
    cell= cell;
  }
  
  Contact.fromJson(Map<String, Object> contactMap) {
      prenom = contactMap['prenom'];
      nom = contactMap['nom'];
      courriel = contactMap['courriel'];
      cell = contactMap['cell'];
  }

  Map<String, Object> toJson() {
    var contactMap = new Map<String, Object>();
    contactMap['prenom'] = prenom;
    contactMap['nom'] = nom;
    contactMap['courriel'] = courriel;
    contactMap['cell'] = cell;
    return contactMap;
  } 
/*
  String toString() {
      return '{prenom: ${prenom}, nom: ${nom},courriel: ${courriel},cell: ${cell}}';
  }
  
  int compareTo(Contact contact) {
    if (nom != null && contact.nom != null) {
      return nom.compareTo(contact.nom);
    } else {
      throw new Exception('Un contact');
    }
  }
  
  */
}


class Contacts {
  var _list = new List<Contact>();

   Iterator<Contact> get iterator => _list.iterator;
   bool get isEmpty => _list.isEmpty;

   List<Contact> get internalList => _list;
   set internalList(List<Contact> observableList) => _list = observableList;

   init() {
     var contact1 = new Contact('Adam', 'Tremblay', 'ada@aa.aa', '123456789');
     var contact2 = new Contact('Roger', 'Tremblay', 'ada@aa.as', '098765432');
     var contact3 = new Contact('Sylvain', 'Tremblay', 'ada@aa.sa', '132462457');
     this..add(contact1)..add(contact2)..add(contact3);
   }
   
   bool add(Contact newContact) {
     if (newContact == null) {
       throw new Exception('Un nouveau contact doit exister');
     }
     for (Contact contact in _list) {
       if (newContact.nom == contact.nom && newContact.prenom == contact.prenom) return false;
     }
     _list.add(newContact);
     return true;
   }

   Contact find(String nom,String prenom) {
     for (Contact contact in _list) {
       if (contact.nom == nom && contact.prenom == prenom) return contact;
     }
     return null;
   }

   bool remove(Contact contact) {
     return _list.remove(contact);
   }

   sort() {
     _list.sort();
   }
   
   List<Map<String, Object>> toJson() {
     var contactList = new List<Map<String, Object>>();
     for (Contact contact in _list) {
       contactList.add(contact.toJson());
     }
     return contactList;
   }
   
   fromJson(List<Map<String, Object>> contactList) {
     if (!_list.isEmpty) {
       throw new Exception('Les champs ne sont pas vide.');
     }
     for (Map<String, Object> contactMap in contactList) {
       Contact contact = new Contact.fromJson(contactMap);
       add(contact);
     }
   }
   
  
  
}
