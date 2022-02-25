/*
 * Project: burc-flutter
 * File Created: Tuesday, 29th June 2021 4:15:44 pm
 * Author: Murat Gültürk m.gueltuerk@gmx.de, https://github.com/mgueltuerk
 * Last Modified: Friday, 25th February 2022 9:35:14 am
 * Copyright - 2022, Murat Gültürk
 * Published under GNU Public License (GPL)
 */
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import '/model/burc.dart';
import 'package:palette_generator/palette_generator.dart';

class BurcDetay extends StatefulWidget {
  const BurcDetay({required this.secilenBurc, Key? key}) : super(key: key);

  final Burc secilenBurc;

  @override
  _BurcDetayState createState() => _BurcDetayState();
}

class _BurcDetayState extends State<BurcDetay> {
  Color appbarRengi = Colors.transparent;

  late PaletteGenerator _generator;

  @override
  void initState() {
    super.initState();

    if (kDebugMode) {
      print('init state çalıstı');
    }
    WidgetsBinding.instance!.addPostFrameCallback((_) => appbarRenginiBul());
    // _generator = PaletteGenerator.fromImageProvider(AssetImage(assetName));
  }

  void appbarRenginiBul() async {
    if (kDebugMode) {
      print('build bitti baskın renk bulunacak');
    }
    _generator = await PaletteGenerator.fromImageProvider(
        AssetImage('images/${widget.secilenBurc.burcBuyukResim}'));
    appbarRengi = _generator.vibrantColor!.color;
     if (kDebugMode) {
       print('baskın renk bulundu build metotu tekrar calıstırılacak');
     }
    setState(() {});
    if (kDebugMode) {
      print(appbarRengi);
    }
  }

  @override
  Widget build(BuildContext context) {
    if (kDebugMode) {
      print('build çalıstı');
    }
    return Scaffold(
        body: CustomScrollView(
      slivers: [
        SliverAppBar(
          expandedHeight: 200,
          pinned: true,
          backgroundColor: appbarRengi,
          flexibleSpace: FlexibleSpaceBar(
            title: Text(widget.secilenBurc.burcAdi + " Burcu ve Özellikleri"),
            centerTitle: true,
            background: Image.asset(
              'images/' + widget.secilenBurc.burcBuyukResim,
              fit: BoxFit.fill,
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: Container(
            margin: const EdgeInsets.all(16),
            padding: const EdgeInsets.all(8),
            child: SingleChildScrollView(
              child: Text(
                widget.secilenBurc.burcDetayi,
                style: Theme.of(context).textTheme.headline6,
              ),
            ),
          ),
        ),
      ],
    ));
  }
}
