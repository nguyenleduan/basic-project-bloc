class KeyCacheConfig{
  KeyCacheConfig._();
  static final KeyCacheConfig _instance = KeyCacheConfig._();
  static KeyCacheConfig get instance => _instance;
  String get keyLogin =>  'keyLogin';
  String get keyLoginFB =>  'keyLoginFB';
  String get keyVerUpdate =>  'keyVerUpdate';
  String get keyEnvironment =>  'keyEnvironment';


}