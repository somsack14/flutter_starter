import 'package:flutter/foundation.dart';

const String kBaseURL = "";
const String kAppVersion = '1.3.5';
const String kNewBaseURL = 'https://ncccallbackpord.nccnaga.com';

const int kConnectTimeout = 50000;
const int kReceiveTimeout = 60000;

class ApiBase {
  static String get baseURL {
    if (kReleaseMode) {
      return kBaseURL;
    } else {
      return kBaseURL;
    }
  }
}

class NewBaseAPI {
  static String get baseURL {
    if (kReleaseMode) {
      return kNewBaseURL;
    } else {
      return kNewBaseURL;
    }
  }
}
