import 'dart:async';

import 'package:flutter/services.dart';

class EasyContactPicker {
  static const MethodChannel _channel =
      const MethodChannel('plugins.flutter.io/easy_contact_picker');

  /// 获取通讯录列表
  ///
  /// return list[Contact]。
  Future<List> selectContacts() async {
    final List result =
    await _channel.invokeMethod('selectContactList');
    if (result == null) {
      return null;
    }
//     List<Contact> contacts = new List();
//     result.forEach((f){
//       contacts.add(new Contact.fromMap(f));
//     });
    return result;
  }
  /// 获取通话记录1
  ///
  /// return list[Contact]。
  Future<List> selectHistoryList() async {
    final List result =
    await _channel.invokeMethod('callHistoryList');
    if (result == null) {
      return null;
    }
//     List<Contacts> contacts = new List();
//     result.forEach((f){
//       contacts.add(new Contacts.fromMap(f));
//     });
    return result;
  }
  /// 打开原生通讯录
  ///
  /// return [Contact]。
  Future<Contact> selectContactWithNative() async {
    final Map<dynamic, dynamic> result =
    await _channel.invokeMethod('selectContactNative');
    if (result == null) {
      return null;
    }
    return new Contact.fromMap(result);
  }
}

/// Represents a contact selected by the user.
class Contact {
  Contact({this.fullName, this.phoneNumber, this.firstLetter});

  factory Contact.fromMap(Map<dynamic, dynamic> map) => new Contact(
    fullName: map['fullName'],
    phoneNumber: map['phoneNumber'],
    firstLetter: map['firstLetter'],
  );

  /// The full name of the contact, e.g. "Dr. Daniel Higgens Jr.".
  final String fullName;

  /// The phone number of the contact.
  final String phoneNumber;

  /// The firstLetter of the fullName.
  final String firstLetter;

  @override
  String toString() => '$fullName: $phoneNumber';
}
/// Represents a contact selected by the user.
class Contacts {
  Contacts({this.callName, this.callNumber, this.callDateStr,this.callDurationStr});

  factory Contacts.fromMap(Map<dynamic, dynamic> map) => new Contacts(
    callName: map['callName'],
    callNumber: map['callNumber'],
    callDateStr: map['callDateStr'],
    callDurationStr: map['callDurationStr'],
  );

  /// The full name of the contact, e.g. "Dr. Daniel Higgens Jr.".
  final String callName;

  /// The phone number of the contact.
  final String callNumber;

  /// The firstLetter of the fullName.
  final String callDateStr;
  final String callDurationStr;

  @override
  String toString() => '$callName: $callNumber -$callDateStr -$callDurationStr';
}
