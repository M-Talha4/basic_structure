import 'package:flutter/material.dart';

ColorScheme colorScheme(context) => Theme.of(context).colorScheme;

TextTheme textTheme(context) => Theme.of(context).textTheme;

final scaffoldMessengerKey = GlobalKey<ScaffoldMessengerState>();

const String isFirstTimeText = 'isFirstTime';
const String isTenantText = 'isTenant';
const String isAdminText = 'isAdmin';
const String isLoggedInText = 'isLoggedIn';
const String landlordPropertyAddedText = 'propertyAdded';
const String emailText = 'email';
const String passwordText = 'password';
