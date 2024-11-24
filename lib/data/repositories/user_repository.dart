import 'package:google_sign_in/google_sign_in.dart';
import 'package:videotiktok/core/services/user_service.dart';

import '../../core/services/token_service.dart';
import '../models/user.dart';

class UserRepository {
  final UserService _userService;
  final TokenService _tokenService;
  final GoogleSignIn _googleSignIn;

  UserRepository(
      {required UserService userService,
      required TokenService tokenService,
      GoogleSignIn? googleSignIn})
      : _userService = userService,
        _tokenService = tokenService,
        _googleSignIn = googleSignIn ?? GoogleSignIn();

  Future<User?> loginWithGoogle() async {
    try {
      final googleSignInResult = await GoogleSignIn().signIn();
      if (googleSignInResult == null) return null;
      final googleAuth = await googleSignInResult.authentication;
      final idToken = googleAuth.idToken;
      if (idToken == null) {
        throw Exception('Failed to get ID token');
      }
      final response = await _userService.post({'idToken': idToken});
      await _tokenService.saveToken(response['data']['token']);
      return User.fromJson(response['data']['user']);
    } catch (e) {
      print('error in User Repository ${e}');
      throw Exception('error in User Repository ${e}');
    }
  }
}
