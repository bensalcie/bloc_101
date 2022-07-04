// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'dart:io';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:injectable/injectable.dart';

/// Checks if client has internet access
abstract class NetworkInfo {
  Future<bool> get isConnected;
}

@LazySingleton(as: NetworkInfo)
class NetworkInfoImpl implements NetworkInfo {
  final Connectivity connectivity;
  NetworkInfoImpl(this.connectivity);

  @override
  Future<bool> get isConnected async {
    var _connectivityResult = await Connectivity().checkConnectivity();
    try {
      if (_connectivityResult == ConnectivityResult.mobile ||
          _connectivityResult == ConnectivityResult.wifi) {
        try {
          final result = await InternetAddress.lookup('google.com');
          if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
            return true;
          }
        } on SocketException catch (_) {
          return false;
        }
        return false;
      }
    } catch (e) {
      return false;
    }
    return false;
  }
}
