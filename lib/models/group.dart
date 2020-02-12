import 'dart:convert';

/// Supply the raw (pre-decoded) response body to this method
List<Group> groupsFromJson(String str) =>
    List<Group>.from(json.decode(str).map((x) => Group.fromJson(x)));

class Group {
  final int familyid;
  final int groupsize;
  final int caravan;

  Group({
    this.familyid,
    this.groupsize,
    this.caravan,
  });

  factory Group.fromJson(Map<String, dynamic> json) => Group(
        familyid: json['familyid'],
        groupsize: json['groupsize'],
        caravan: json['caravan'],
      );
}
