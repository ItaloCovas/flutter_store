import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:meta/meta.dart';

class UsersModel {
  Address address;
  int id;
  String email;
  String username;
  String password;
  Name name;
  String phone;
  int iV;

  UsersModel(
      {required this.address,
      required this.id,
      required this.email,
      required this.username,
      required this.password,
      required this.name,
      required this.phone,
      required this.iV});

  factory UsersModel.fromJson(Map<String, dynamic> json) {
    return UsersModel(
      address: (json['address'] != null
          ? new Address.fromJson(json['address'])
          : null!),
      id: json['id'],
      email: json['email'],
      username: json['username'],
      password: json['password'],
      name: (json['name'] != null ? Name.fromJson(json['name']) : null!),
      phone: json['phone'],
      iV: json['__v'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (address != null) {
      data['address'] = address.toJson();
    }
    data['id'] = id;
    data['email'] = email;
    data['username'] = username;
    data['password'] = password;
    if (this.name != null) {
      data['name'] = name.toJson();
    }
    data['phone'] = this.phone;
    data['__v'] = this.iV;
    return data;
  }
}

class Address {
  Geolocation geolocation;
  String city;
  String street;
  int number;
  String zipcode;

  Address(
      {required this.geolocation,
      required this.city,
      required this.street,
      required this.number,
      required this.zipcode});

  factory Address.fromJson(Map<String, dynamic> json) {
    return Address(
      geolocation: (json['geolocation'] != null
          ? Geolocation.fromJson(json['geolocation'])
          : null!),
      city: json['city'],
      street: json['street'],
      number: json['number'],
      zipcode: json['zipcode'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (geolocation != null) {
      data['geolocation'] = geolocation.toJson();
    }
    data['city'] = city;
    data['street'] = street;
    data['number'] = number;
    data['zipcode'] = zipcode;
    return data;
  }
}

class Geolocation {
  String lat;
  String long;

  Geolocation({
    required this.lat,
    required this.long,
  });

  factory Geolocation.fromJson(Map<String, dynamic> json) {
    return Geolocation(
      lat: json['lat'],
      long: json['long'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['lat'] = lat;
    data['long'] = long;
    return data;
  }

  Geolocation copyWith({
    String? lat,
    String? long,
  }) {
    return Geolocation(
      lat: lat ?? this.lat,
      long: long ?? this.long,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'lat': lat,
      'long': long,
    };
  }

  factory Geolocation.fromMap(Map<String, dynamic> map) {
    return Geolocation(
      lat: map['lat'] ?? '',
      long: map['long'] ?? '',
    );
  }
}

class Name {
  String firstname;
  String lastname;

  Name({required this.firstname, required this.lastname});

  factory Name.fromJson(Map<String, dynamic> json) {
    return Name(firstname: json['firstname'], lastname: json['lastname']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['firstname'] = firstname;
    data['lastname'] = lastname;
    return data;
  }
}
