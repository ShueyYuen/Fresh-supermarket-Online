class Config {
  static final String PROTOCOL = "http";
//  static final String IP = "192.168.42.224";
  static final String IP = "203.195.149.30";
//  static final String PORT = "6080";
  static final String PORT = "8010";
  static final String API_VERSION = "api";

  static String baseUrl() {
    return PROTOCOL + "://" + IP + ":" + PORT + "/" + API_VERSION + "/";
  }
}
