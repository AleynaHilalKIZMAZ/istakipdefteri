import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';

import '../../data/src/colors.dart';
import '../../data/src/strings.dart';
import 'info_controller.dart';

class InfoPage extends GetWidget<InfoController> {
  const InfoPage({Key? key}) : super(key: key);

  static const String routeName='/views/info/info_page';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(infoAppBarText),
        backgroundColor: mainColor,
      ),
      body: Center(
        child: Text('BU UYGULAMADA AMAÇ İŞİNİZİ DÜZENLEYECEĞİNİZ '
            'DİJİTAL BİR İŞ TAKİP DEFTERİNE SAHİP OLMAK DAHA DÜZENLİ VE DAHA ÜRETKEN OLMANIZI SAĞLAYABİLMEKTİR. '
            'İYİ BİR İŞ TAKİP DEFTERİ UYGULAMASI İLE NEREDE OLURSANIZ OLUN, HERHENGİ BİR İŞ HAKKINDA NOTLAR ALABİLİR VE '
            'BUNLARI TÜM CİHAZLARINIZLA SEKRONİZE EDEBİLİRSİNİZ.'
            'İŞ TAKİP DEFTERİ UYGULAMASI HIZLI VE KULLANIMI KOLAYDIR.İSTER DİZÜSTÜ BİLGİSAYARINIZ,İSTER MASANIZDA OLUN,'
            'İSTER HAVADA UÇARKEN, İŞ TAKİP DEFTERİ HER ZAMAN HAZIR OLARAK BEKLER.'),
      ),
    );
  }
}