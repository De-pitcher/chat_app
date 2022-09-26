// import 'dart:async';
// import 'dart:io';
// import 'package:chat_app/common/core/data/app_firebase_auth.dart';
// import 'package:connectivity_plus/connectivity_plus.dart';
// import 'package:internet_connection_checker/internet_connection_checker.dart';

// class ConnectionUtil {
//   static final ConnectionUtil _singleton = ConnectionUtil._internal();
//   ConnectionUtil._internal();

//   static ConnectionUtil getInstance() => _singleton;

//   bool hasConnection = false;

//   StreamController connectionChangeController = StreamController();

//   final Connectivity _connectivity = Connectivity();

//   AppFirebaseAuth firebaseAuth = AppFirebaseAuth();
//   void initialize() {
//     _connectivity.onConnectivityChanged.listen(_connectionChange);
//   }

//   void _connectionChange(ConnectivityResult result) {
//     _hasInternetInternetConnection();
//   }

//   Stream get connectionChange => connectionChangeController.stream;
//   Future<bool> _hasInternetInternetConnection() async {
//     bool previousConnection = hasConnection;
//     var connectivityResult = await (Connectivity().checkConnectivity());
//     try {
//       if (connectivityResult == ConnectivityResult.mobile ||
//           connectivityResult == ConnectivityResult.wifi) {
//         // this is the different
//         if (await InternetConnectionChecker().hasConnection) {
//           await firebaseAuth.updateStatus(true);
//           hasConnection = true;
//           print('connected');
//         } else {
//           await firebaseAuth.updateStatus(false);
//           hasConnection = false;
//           print('disconnected');
//         }
//       }
//     } on SocketException {
//       await firebaseAuth.updateStatus(false);
//       hasConnection = false;
//           print('disconnected');
//     }

//     if (previousConnection != hasConnection) {
//       connectionChangeController.add(hasConnection);
//     }
//     return hasConnection;
//   }
// }
