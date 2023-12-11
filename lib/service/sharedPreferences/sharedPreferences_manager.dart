
import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../../config/key_cache_config.dart';
import '../../model/account_model.dart';

const int CACHE_TIMEOUT = 9999; // minute
class SharedPreferencesManager {
  Future<SharedPreferences> get _storage => SharedPreferences.getInstance();
  SharedPreferencesManager._();
  static final SharedPreferencesManager instance = SharedPreferencesManager._();

  Map<String, CacheSlot> _buffer = {};

  T get<T>(String key, T defaultValue) {
    if (_buffer.containsKey(key)) {
      try {
        final slot = _buffer[key] as CacheSlot<T?>;
        if (slot.timeout == 0) {
          return slot.data ?? defaultValue;
        } else {
          final lastUpdated = DateTime.fromMillisecondsSinceEpoch(slot.updated!);
          final expireTime = lastUpdated.add(Duration(minutes: slot.timeout!));
          if (expireTime.isAfter(DateTime.now())) {
            // print('~~~ invalid after: $expireTime');
            return slot.data ?? defaultValue;
          } else {
            // print('~~~ Cache expired: $k - last updated $expireTime');
            _buffer.remove(key);
            _storage.then((inst) => inst.remove(key));
            return defaultValue;
          }
        }
      } catch (e) {
        print('error: $e');
      }
    }
    return defaultValue;
  }

  set<T>(String key, T data, [int timeout = 0]) {
    try{
      final _slot = CacheSlot<T>(
        data: data,
        timeout: timeout,
        updated: DateTime.now().millisecondsSinceEpoch,
      );
      _buffer[key] = _slot;
      _storage.then((inst) => inst.setString(key, _slot.toJson()));
      print('Save SharedPreferencesManager -------- $key');
    }catch(e){
      print('SharedPreferencesManager error ---$key--- $e');
    }
  }

  init() async {
    _buffer.clear();
    final sto = await _storage;
    await sto.reload();
    sto.getKeys().forEach((k) {
      try {
        String? raw = sto.getString(k);
        // if (k.startsWith(KeyCacheConfig.instance.keyLogin)) {
        //   _buffer[k] = _accountModel(raw!);
        // }
        if (k.startsWith(KeyCacheConfig.instance.keyVerUpdate)) {
          _buffer[k] = _version(raw!);
        }
        if (k.startsWith(KeyCacheConfig.instance.keyEnvironment)) {
          _buffer[k] = _environment(raw!);
        }
      } catch (e) {
        print('~~~ failed key: $k = ${sto.get(k)}');
        print(e);
      }
      // print(_buffer);
    });
  }
  // CacheSlot<AccountModel> _accountModel(String raw) {
  //   final slot = CacheSlot<AccountModel>.fromJson(raw, (dynamic rawList) {
  //     return  AccountModel.fromJson(rawList);
  //   });
  //   return slot;
  // }
  // CacheSlot<UserInfoModel> _userModel(String raw) {
  //   final slot = CacheSlot<UserInfoModel>.fromJson(raw, (dynamic rawList) {
  //     return  UserInfoModel.fromJson(rawList);
  //   });
  //   return slot;
  // }
  // CacheSlot<List<AddressIDModel>> _ward(String raw) {
  //   final slot = CacheSlot<List<AddressIDModel>>.fromJson(raw, (dynamic rawList) {
  //     return (rawList as List).map((e) => AddressIDModel.fromJson(e)).toList();
  //   });
  //   return slot;
  // }
  CacheSlot<String?> _version(String raw) => CacheSlot<String?>.fromJson(raw, (data) => data);
  CacheSlot<int?> _environment(String raw) => CacheSlot<int?>.fromJson(raw, (data) => data);
  CacheSlot<String?> _refreshToken(String raw) => CacheSlot<String?>.fromJson(raw, (data) => data);

  clear([String prefix = '']) async {
    if (prefix.isNotEmpty) {
      final _keys = _buffer.keys;
      _keys.forEach((k) {
        if (k.startsWith(prefix)) {
          _buffer.remove(k);
        }
      });
      await _storage.then((inst) => inst.getKeys().forEach((k) {
        if (k.startsWith(prefix)) {
          inst.remove(k);
        }
      }));
    } else {
      _buffer.clear();
      await _storage.then((inst) => inst.clear());
    }
  }
}

class CacheSlot<T> {
  final int? timeout; // in minute
  final int? updated;
  final T? data;
  CacheSlot({
    this.timeout = 0,
    this.updated = 0,
    this.data,
  });

  Map<String, dynamic> toMap() {
    return {
      'timeout': timeout,
      'updated': updated,
      'data': data,
    };
  }

  factory CacheSlot.fromMap(Map<String, dynamic> map) {
    return CacheSlot(
      timeout: map['timeout'],
      updated: map['updated'],
      data: map['data'],
    );
  }

  String toJson() => json.encode(toMap());

  factory CacheSlot.fromJson(String source, T Function(dynamic data) fnParser) {
    final rawSlot = CacheSlot.fromMap(json.decode(source));
    final parsedData = fnParser.call(rawSlot.data);
    return rawSlot.copyWith<T>(data: parsedData);
  }

  CacheSlot<T> copyWith<T>({
    int? timeout,
    int? updated,
    T? data,
  }) {
    return CacheSlot<T>(
      timeout: timeout ?? this.timeout,
      updated: updated ?? this.updated,
      data: data ?? this.data as T?,
    );
  }
}
