/*
 * Project: burc-flutter
 * File Created: Tuesday, 29th June 2021 4:08:42 pm
 * Author: Murat Gültürk m.gueltuerk@gmx.de, https://github.com/mgueltuerk
 * Last Modified: Friday, 25th February 2022 9:34:49 am
 * Copyright - 2022, Murat Gültürk
 * Published under GNU Public License (GPL)
 */
import 'package:flutter/material.dart';
import '/model/burc.dart';

class BurcItem extends StatelessWidget {
  const BurcItem({required this.listelenenBurc, Key? key}) : super(key: key);

  final Burc listelenenBurc;

  @override
  Widget build(BuildContext context) {
    var myTextStyle = Theme.of(context).textTheme;
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Card(
        elevation: 4,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListTile(
            onTap: () {
              Navigator.pushNamed(context, '/burcDetay',
                  arguments: listelenenBurc);
            },
            leading: Image.asset(
              "images/" + listelenenBurc.burcKucukResim,
            ),
            title: Text(
              listelenenBurc.burcAdi,
              style: myTextStyle.headline5,
            ),
            subtitle: Text(
              listelenenBurc.burcTarihi,
              style: myTextStyle.subtitle1,
            ),
            trailing: const Icon(
              Icons.arrow_forward_ios,
              color: Colors.pink,
            ),
          ),
        ),
      ),
    );
  }
}
