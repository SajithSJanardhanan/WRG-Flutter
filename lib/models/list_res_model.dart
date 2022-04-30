
import 'package:hive/hive.dart';
part 'list_res_model.g.dart';

@HiveType(typeId: 0)
class ListRespModel {
  @HiveField(0)
  int? _id;
  @HiveField(1)
  String? _name;

  @HiveField(2)
  String? _username;
  @HiveField(9)
  String? _profileImage;
  @HiveField(3)
  String? _email;
  Address? _address;
  @HiveField(4)
  String? _addressConcated;

  @HiveField(5)
  String? _latLng;
  @HiveField(6)
  String? _phone;
  @HiveField(7)
  String? _website;
  Company? _company;
  @HiveField(8)
  String? _companyConcated;


  String? get latLng => _latLng;

  set latLng(String? value) {
    _latLng = value;
  }

  String? get companyConcated => _companyConcated;
  int? get id => _id;
  String? get name => _name;
  String? get username => _username;
  String? get profileImage => _profileImage;
  String? get email => _email;
  Address? get address => _address;
  String? get addressConcated => _addressConcated;

  set addressConcated(String? value) {
    _addressConcated = value;
  }

  String? get phone => _phone;
  String? get website => _website;
  Company? get company => _company;

  ListRespModel({
    int? id,
    String? name,
    String? profileImage,
    String? username,
    String? email,
    Address? address,
    String? addressConcat,
    String? latLng,
    String? phone,
    String? website,
    Company? company,
    String? companyConcat,
  }){
    _id = id;
    _name = name;
    _username = username;
    _profileImage = profileImage;
    _email = email;
    _address = address;
    _latLng=latLng;
    _phone = phone;
    _website = website;
    _company = company;
    _addressConcated=addressConcat;
    _companyConcated=companyConcat;
  }

  ListRespModel.fromJson(dynamic json) {
    _id = json['id'];
    _name = json['name'];
    _username = json['username'];
    _profileImage = json['profile_image'];
    _email = json['email'];
    _address = json['address'] != null ? Address.fromJson(json['address']) : null;
    _latLng="";
    _phone = json['phone'];
    _website = json['website'];
    _company = json['company'] != null ? Company.fromJson(json['company']) : null;
    _addressConcated = "";
    _companyConcated = "";
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map['id'] = _id;
    map['name'] = _name;
    map['username'] = _username;
    map['email'] = _email;
    if (_address != null) {
      map['address'] = _address?.toJson();
    }
    map['phone'] = _phone;
    map['website'] = _website;
    if (_company != null) {
      map['company'] = _company?.toJson();
    }
    return map;
  }

  set companyConcated(String? value) {
    _companyConcated = value;
  }
}

/// name : "Romaguera-Crona"
/// catchPhrase : "Multi-layered client-server neural-net"
/// bs : "harness real-time e-markets"

class Company {
  String? _name;
  String? _catchPhrase;
  String? _bs;

  String? get name => _name;
  String? get catchPhrase => _catchPhrase;
  String? get bs => _bs;

  Company({
    String? name,
    String? catchPhrase,
    String? bs}){
    _name = name;
    _catchPhrase = catchPhrase;
    _bs = bs;
  }

  Company.fromJson(dynamic json) {
    _name = json['name'];
    _catchPhrase = json['catchPhrase'];
    _bs = json['bs'];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map['name'] = _name;
    map['catchPhrase'] = _catchPhrase;
    map['bs'] = _bs;
    return map;
  }

}

/// street : "Kulas Light"
/// suite : "Apt. 556"
/// city : "Gwenborough"
/// zipcode : "92998-3874"
/// geo : {"lat":"-37.3159","lng":"81.1496"}

class Address {
  String? _street;
  String? _suite;
  String? _city;
  String? _zipcode;
  Geo? _geo;

  String? get street => _street;
  String? get suite => _suite;
  String? get city => _city;
  String? get zipcode => _zipcode;
  Geo? get geo => _geo;

  Address({
    String? street,
    String? suite,
    String? city,
    String? zipcode,
    Geo? geo}){
    _street = street;
    _suite = suite;
    _city = city;
    _zipcode = zipcode;
    _geo = geo;
  }

  Address.fromJson(dynamic json) {
    _street = json['street'];
    _suite = json['suite'];
    _city = json['city'];
    _zipcode = json['zipcode'];
    _geo = json['geo'] != null ? Geo.fromJson(json['geo']) : null;
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map['street'] = _street;
    map['suite'] = _suite;
    map['city'] = _city;
    map['zipcode'] = _zipcode;
    if (_geo != null) {
      map['geo'] = _geo?.toJson();
    }
    return map;
  }

}

/// lat : "-37.3159"
/// lng : "81.1496"

class Geo {
  String? _lat;
  String? _lng;

  String? get lat => _lat;
  String? get lng => _lng;

  Geo({
    String? lat,
    String? lng}){
    _lat = lat;
    _lng = lng;
  }

  Geo.fromJson(dynamic json) {
    _lat = json['lat'];
    _lng = json['lng'];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map['lat'] = _lat;
    map['lng'] = _lng;
    return map;
  }

}