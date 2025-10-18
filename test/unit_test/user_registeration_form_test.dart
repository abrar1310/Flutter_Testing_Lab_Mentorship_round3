import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_testing_lab/helpers/app_regex.dart';

void main() {
  group('UserRegistrationForm Tests', () {
    test('should return true for valid email', () {
      const validEmails = [
        'test@gmail.com',
        'user.name@domain.co',
        'my_email123@test.org',
      ];

      for (final email in validEmails) {
        final result = AppRegex.isValidEmail(email);
        expect(result, true, reason: 'Expected $email to be valid');
      }
    });

    test('should return false for invalid emails', () {
      const invalidEmails = ['@a', '@b.com', 'plainaddress', 'test@.com'];
      for (final email in invalidEmails) {
        final result = AppRegex.isValidEmail(email);
        expect(result, false, reason: 'Expected $email to be invalid');
      }
    });
  });

  group('UserRegistrationForm - Password Validation', () {
    test('Should return true for strong password', () {
      const strongPassword = 'Abc123@3';
      final result = AppRegex.isValidPassword(strongPassword);
      expect(result, true);
    });

    test('should return false for weak password', () {
      const weakPasswords = ['12345556', 'password', 'abckkfo86868', 'ABc!@#'];
      for (final pwd in weakPasswords) {
        final result = AppRegex.isValidPassword(pwd);
        expect(result, false, reason: 'Expected $pwd to be weak');
      }
    });
  });
}
