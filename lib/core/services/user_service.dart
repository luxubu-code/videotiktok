import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:videotiktok/routes/api_endpoint.dart';

class UserService {
  final http.Client _client;

  UserService({http.Client? client}) : _client = client ?? http.Client();

  Future<Map<String, dynamic>> post(Map<String, dynamic> body) async {
    final url = Uri.parse('${ApiEndpoint.login}');
    final headers = {'Content-Type': 'application/json'};

    try {
      final response =
          await _client.post(url, headers: headers, body: json.encode(body));
      final responseData = json.decode(response.body);
      if (response.statusCode == 200) {
        return responseData;
      }
      throw HttpException(responseData['message'] ?? 'Request failed');
    } catch (e) {
      throw Exception('Network error: $e');
    }
  }
// Future<Map<String, dynamic>?> signInWithGoogle() async {
//   // Kiểm tra xem đã có người dùng đăng nhập sẵn chưa
//   try {
//     final GoogleSignInAccount? currentUser =
//         await googleSignIn.signInSilently();
//     final token = tokenService.getToken();
//
//     if (currentUser != null) {
//       print("Người dùng đã đăng nhập sẵn: ${currentUser.email}");
//       return await _handleSignIn(currentUser);
//     }
//     if (token == null) {
//       await googleSignIn.signOut();
//       print("không có token");
//     }
//
//     final GoogleSignInAccount? googleUser = await googleSignIn.signIn();
//     if (googleUser == null) {
//       print("Người dùng đã hủy đăng nhập");
//       return null;
//     }
//     return await _handleSignIn(googleUser);
//   } catch (e) {
//     print('Lỗi chi tiết: $e');
//   }
// }
//
// Future<Map<String, dynamic>> _handleSignIn(
//     GoogleSignInAccount googleUser) async {
//   final GoogleSignInAuthentication googleAuth =
//       await googleUser.authentication;
//   final idToken = googleAuth.idToken;
//   final response = await http.post(
//     Uri.parse(ApiEndpoint.login),
//     body: {'idToken': googleAuth.idToken},
//   );
//   print(googleAuth.idToken);
//   if (response.statusCode == 200) {
//     final Map<String, dynamic> data = json.decode(response.body);
//     await tokenService.saveToken(data['token']);
//     // User user = User.fromJson(data['user']);
//     // await tokenService.saveUser(user);
//     return data;
//   } else {
//     print('Server responded with status: ${response.statusCode}');
//     print('Response body: ${response.body}');
//     throw Exception('Failed to authenticate with server');
//   }
// }
}
