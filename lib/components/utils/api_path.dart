enum ApiPath {
  login,
}

class APIPathHelper {
  static String getValue(ApiPath path) {
    switch (path) {
      case ApiPath.login:
        return "/api/login";

      default:
        return "";
    }
  }
}
