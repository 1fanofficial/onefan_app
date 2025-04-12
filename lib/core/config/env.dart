class Env {
  static const String appName = String.fromEnvironment('APP_NAME', defaultValue: '1FAN');
  static const String baseUrl = String.fromEnvironment('BASE_URL');
  static const String environment = String.fromEnvironment('ENVIRONMENT', defaultValue: 'dev');

  static const bool isProduction = environment == 'prd';
  static const bool isDevelopment = environment == 'dev';
  static const bool isStaging = environment == 'stg';
}
