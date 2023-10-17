import 'package:flutter/material.dart';

enum NavBarAction {
  search,
  shopCart,
  logout,
  button
}

class SportMoldeEvent {
  SportMoldeEvent({this.event,this.actionBlock});
  String? event;
  ValueChanged<NavBarAction>? actionBlock;
  
  SportMoldeEvent.fromJson(Map<String, dynamic> json) {
    event = json['event'];
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['event'] = event;
    return data;
  }
}