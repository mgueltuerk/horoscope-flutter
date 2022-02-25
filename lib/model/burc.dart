/*
 * Project: burc-flutter
 * File Created: Tuesday, 29th June 2021 1:19:32 pm
 * Author: Murat Gültürk m.gueltuerk@gmx.de, https://github.com/mgueltuerk
 * Last Modified: Friday, 25th February 2022 9:35:37 am
 * Copyright - 2022, Murat Gültürk
 * Published under GNU Public License (GPL)
 */
class Burc {
  Burc(this._burcAdi, this._burcTarihi, this._burcDetayi, this._burcKucukResim,
      this._burcBuyukResim);

  final String _burcAdi;
  final String _burcBuyukResim;
  final String _burcDetayi;
  final String _burcKucukResim;
  final String _burcTarihi;

  @override
  String toString() {
    return '$_burcAdi - $_burcBuyukResim';
  }

  get burcAdi => _burcAdi;

  get burcTarihi => _burcTarihi;

  get burcDetayi => _burcDetayi;

  get burcKucukResim => _burcKucukResim;

  get burcBuyukResim => _burcBuyukResim;
}
