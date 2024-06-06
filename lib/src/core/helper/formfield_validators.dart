import 'package:flutter/material.dart';

class FormfieldValidators{

  static FormFieldValidator<String>? get userNameValidator =>(String? value){
    String? required = isEmpty!(value);
    if(required != null){
      return required;
    }else{
      return null;
    }
  };

  static FormFieldValidator<String>? get passwordValidator =>(String? value) {
    String input = value!.trim();
    if (input.isEmpty) return 'This field is required';
    if (!input.contains(RegExp(r'^.{8,}$'))) {
      return ' Must be at least 8 characters in length ';
    } else if (!input.contains(RegExp(r'^(?=.*[A-Z])'))) {
      return 'should contain at least one upper case';
    } else if (!input.contains(RegExp(r'^(?=.*[a-z])'))) {
      return 'should contain at least one lower case';
    } else if (!input.contains(RegExp(r'^(?=.*?[0-9])'))) {
      return 'should contain at least one digit';
    } else if (!input.contains(RegExp(r'^(?=.*?[0-9])'))) {
      return 'should contain at least one digit';
    } else if (!input.contains(RegExp(r'^(?=.*?[!@#\$&*~])'))) {
      return 'should contain at least one Special character';
    }
    return null;
  };

  static FormFieldValidator<String>? get isEmpty => (String? val){
    return val!.isEmpty ? 'The field is required' : null;
  };

}