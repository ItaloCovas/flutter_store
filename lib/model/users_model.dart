import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:meta/meta.dart';

class UsersModel {
  UsersModel({
    required this.address,
    required this.id,
    required this.email,
    required this.username,
    required this.password,
    required this.name,
    required this.phone,
    required this.iV,
  });
  late final Address address;
  late final int id;
  late final String email;
  late final String username;
  late final String password;
  late final Name name;
  late final String phone;
  late final int iV;
  
  UsersModel.fromJson(Map<String, dynamic> json){
    address = Address.fromJson(json['address']);
    id = json['id'];
    email = json['email'];
    username = json['username'];
    password = json['password'];
    name = Name.fromJson(json['name']);
    phone = json['phone'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['address'] = address.toJson();
    _data['id'] = id;
    _data['email'] = email;
    _data['username'] = username;
    _data['password'] = password;
    _data['name'] = name.toJson();
    _data['phone'] = phone;
    _data['__v'] = iV;
    return _data;
  }
}

class Address {
  Address({
    required this.geolocation,
    required this.city,
    required this.street,
    required this.number,
    required this.zipcode,
  });
  late final Geolocation geolocation;
  late final String city;
  late final String street;
  late final int number;
  late final String zipcode;
  
  Address.fromJson(Map<String, dynamic> json){
    geolocation = Geolocation.fromJson(json['geolocation']);
    city = json['city'];
    street = json['street'];
    number = json['number'];
    zipcode = json['zipcode'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['geolocation'] = geolocation.toJson();
    _data['city'] = city;
    _data['street'] = street;
    _data['number'] = number;
    _data['zipcode'] = zipcode;
    return _data;
  }
}

class Geolocation {
  Geolocation({
    required this.lat,
    required this.long,
  });
  late final String lat;
  late final String long;
  
  Geolocation.fromJson(Map<String, dynamic> json){
    lat = json['lat'];
    long = json['long'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['lat'] = lat;
    _data['long'] = long;
    return _data;
  }
}

class Name {
  Name({
    required this.firstname,
    required this.lastname,
  });
  late final String firstname;
  late final String lastname;
  
  Name.fromJson(Map<String, dynamic> json){
    firstname = json['firstname'];
    lastname = json['lastname'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['firstname'] = firstname;
    _data['lastname'] = lastname;
    return _data;
  }
}