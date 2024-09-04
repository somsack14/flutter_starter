import 'dart:collection';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../utils/langs/st_en_us.dart';
import '../utils/langs/st_lo_lo.dart';
import '../utils/langs/st_th_th.dart';
import '../utils/langs/st_vi_vn.dart';

class LocalizationService extends Translations {
// locale sẽ được get mỗi khi mới mở app (phụ thuộc vào locale hệ thống hoặc bạn có thể cache lại locale mà người dùng đã setting và set nó ở đây)
  static final locale = _getLocaleFromLanguage();

// fallbackLocale là locale default nếu locale được set không nằm trong những Locale support
  static const fallbackLocale = Locale('en', 'US');

// language code của những locale được support
  static final langCodes = [
    'en',
    'lo',
    'vi',
    'th',
  ];

// các Locale được support
  static final locales = [
    const Locale('en', 'US'),
    const Locale('lo', 'LO'),
    const Locale('vi', 'VN'),
    const Locale('th', 'TH'),
  ];

// cái này là Map các language được support đi kèm với mã code của lang đó: cái này dùng để đổ data vào Dropdownbutton và set language mà không cần quan tâm tới language của hệ thống
  static final langs = LinkedHashMap.from({
    'en': 'English',
    'lo': 'ພາສາລາວ',
    'vi': 'Tiếng Việt',
    'th': 'ภาษาไทย',
  });

  @override
  Map<String, Map<String, String>> get keys => {
        'en_US': en,
        'lo_LO': lo,
        'vi_VN': vi,
        'th_TH': th,
      };

// function change language nếu bạn không muốn phụ thuộc vào ngôn ngữ hệ thống
  static void changeLocale(String? langCode) {
    // print('langcode : $langCode');
    final locale = _getLocaleFromLanguage(langCode: langCode);
    Get.updateLocale(locale!);
  }

  static Locale? _getLocaleFromLanguage({String? langCode}) {
    var deviceLangs = Get.deviceLocale!.languageCode;
    var lang = langCode ?? deviceLangs;
    for (int i = 0; i < langCodes.length; i++) {
      if (lang == langCodes[i]) {
        return locales[i];
      }
    }
    return Get.locale;
  }
}
