/*
 * Project: burc-flutter/
 * File Created: Tuesday, 29th June 2021 4:10:52 pm
 * Author: Murat Gültürk m.gueltuerk@gmx.de, https://github.com/mgueltuerk
 * Last Modified: Friday, 25th February 2022 9:34:05 am
 * Copyright - 2022, Murat Gültürk
 * Published under GNU Public License (GPL)
 */

// ignore_for_file: non_constant_identifier_names

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'burc_detay.dart';
import 'burc_listesi.dart';
import '/model/burc.dart';

class RouteGenerator {
  static Route<dynamic>? routeGenerator(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(
          builder: (context) => BurcListesi(),
        );

      case '/burcDetay':
        final Burc secilen = settings.arguments as Burc;
        return MaterialPageRoute(
          builder: (context) => BurcDetay(secilenBurc: secilen),
        );
    }
    return null;
  }

  static Route? FluentPageRoute({required RouteSettings settings,
    Widget Function(dynamic context)? builder}) {
    return null;
  }

  static Route<dynamic>? _routeOlustur(Widget gidilecekWidget,
      RouteSettings settings) {
    if (defaultTargetPlatform == TargetPlatform.iOS) {
      return CupertinoPageRoute(
        settings: settings,
        builder: (context) => gidilecekWidget,
      );
    } else if (defaultTargetPlatform == TargetPlatform.android) {
      return MaterialPageRoute(
        settings: settings,
        builder: (context) => gidilecekWidget,
      );
    } else if (defaultTargetPlatform == TargetPlatform.windows) {
      return FluentPageRoute(
        settings: settings,
        builder: (context) => gidilecekWidget,
      );
    } else if (defaultTargetPlatform == TargetPlatform.macOS) {
      return CupertinoPageRoute(
        settings: settings,
        builder: (context) => gidilecekWidget,
      );
    } else if (defaultTargetPlatform == TargetPlatform.linux) {
      return FluentPageRoute(
        settings: settings,
        builder: (context) => gidilecekWidget,
      );
    } else {
      return FluentPageRoute(
        settings: settings,
        builder: (context) => gidilecekWidget,
      );
    }
  }
}
