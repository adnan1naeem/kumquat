

class ConfigurationService {
  static final ConfigurationService _instance =
  ConfigurationService._internal();

  factory ConfigurationService() {
    return _instance;
  }

  ConfigurationService._internal();

  String get host => '';

  String get webServerHost => '';

}
