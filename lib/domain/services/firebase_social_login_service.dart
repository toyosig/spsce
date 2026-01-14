import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'dart:io';
import 'package:the_apple_sign_in/the_apple_sign_in.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class FirebaseSocialLoginService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  static bool _googleSignInInitialized = false;

  Future<void> _ensureGoogleSignInInitialized() async {
    if (!_googleSignInInitialized) {
      await GoogleSignIn.instance.initialize(
        serverClientId: dotenv.env['GOOGLE_SERVER_CLIENT_ID'],
        clientId: dotenv.env['GOOGLE_CLIENT_ID'],
      );
      _googleSignInInitialized = true;
    }
  }

  Future<Map<String, dynamic>> signInWithGoogle() async {
    await _ensureGoogleSignInInitialized();
    final GoogleSignInAccount googleUser = await GoogleSignIn.instance
        .authenticate(scopeHint: ['email', 'profile']);
    final String? idToken = googleUser.authentication.idToken;

    final credential = GoogleAuthProvider.credential(idToken: idToken);

    final userCredential = await _auth.signInWithCredential(credential);
    final user = userCredential.user;
    if (user == null) throw Exception('Google sign-in failed');
    String? dateOfBirth = '1990-01-01'; // get from user or OAuth if available

    return {
      'provider': 'google',
      'providerId': googleUser.id,
      'email': user.email,
      'fullName': user.displayName,
      'username': user.displayName?.split(' ')[0],
      'profilePic': user.photoURL,
      if (dateOfBirth.isNotEmpty) 'dateOfBirth': dateOfBirth,
      // 'idToken': idToken,
    };
  }

  Future<Map<String, dynamic>> signInWithApple() async {
    if (!Platform.isIOS) {
      throw Exception('Apple Sign-In is only available on iOS devices');
    }

    try {
      final result = await TheAppleSignIn.performRequests([
        AppleIdRequest(requestedScopes: [Scope.email, Scope.fullName]),
      ]);

      switch (result.status) {
        case AuthorizationStatus.authorized:
          final appleIdCredential = result.credential!;

          // Check if we have the required tokens
          if (appleIdCredential.identityToken == null) {
            throw Exception('Apple Sign-In failed: No identity token received');
          }

          final oAuthProvider = OAuthProvider('apple.com');
          final credential = oAuthProvider.credential(
            idToken: String.fromCharCodes(appleIdCredential.identityToken!),
            accessToken: appleIdCredential.authorizationCode != null
                ? String.fromCharCodes(appleIdCredential.authorizationCode!)
                : null,
          );

          final userCredential = await _auth.signInWithCredential(credential);
          final user = userCredential.user;
          if (user == null) {
            throw Exception('Apple sign-in failed: No user returned');
          }

          String? fullName;

          // 1. Try Apple credential fullName
          if (appleIdCredential.fullName != null) {
            final given = appleIdCredential.fullName!.givenName ?? '';
            final family = appleIdCredential.fullName!.familyName ?? '';
            fullName = ('$given $family').trim();
          }

          // 2. If still empty, try Firebase user displayName
          if (fullName == null || fullName.isEmpty) {
            fullName = user.displayName;
          }

          // 3. If still empty, use email prefix
          if (fullName == null || fullName.isEmpty) {
            if (user.email != null && user.email!.contains('@')) {
              fullName = user.email!.split('@')[0];
            }
          }

          // 4. Fallback
          if (fullName == null || fullName.isEmpty) {
            fullName = 'User';
          }

          String? dateOfBirth = '';
          // If you have logic to get the real date of birth, set it here. Otherwise, keep as empty string.

          return {
            'provider': 'apple',
            'providerId': user.uid, // Firebase UID as unique providerId
            'email': user.email,
            'fullName': fullName,
            'username': fullName.split(' ')[0],
            'profilePic': user.photoURL,
            'dateOfBirth': dateOfBirth,
          };

        case AuthorizationStatus.error:
          throw Exception(
            'Apple Sign-In error: ${result.error?.localizedDescription ?? 'Unknown error'}',
          );
        case AuthorizationStatus.cancelled:
          throw Exception('Sign in aborted by user');
      }
    } catch (e) {
      if (e.toString().contains(
        'identity provider configuration is not found',
      )) {
        throw Exception(
          'Apple Sign-In is not configured in Firebase Console. Please configure Apple provider in Firebase Authentication settings.',
        );
      }
      rethrow;
    }
  }
}
