import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_testing_lab/helpers/app_regex.dart';

void main() {

  group('UserRegistrationForm Tests', () {
    test('should return true for valid email', () {
      // Arrange
      const validEmails = [
        'test@gmail.com',
        'user.name@domain.co',
        'my_email123@test.org'
      ];

      for (final email in validEmails) {
        //Act
        final result = AppRegex.isValidEmail(email);

        //Assert
        expect(result, true, reason: 'Expected $email to be valid');

      }

      // Assert
      // expect(result, ...);
      // verify(mockDependency.someMethod()).called(1);

    });

    test('should return false for invalid emails', () {
      // Arrange
      const invalidEmails = ['@a','@b.com','plainaddress', 'test@.com'];
      // Act
      for (final email in invalidEmails) {
        final result = AppRegex.isValidEmail(email);
        // Assert

        expect(result, false, reason: 'Expected $email to be invalid');
      }
    });
  });

  group('UserRegistrationForm - Password Validation', (){
    test('Should return true for strong password',(){
      //Arrange
      const strongPassword = 'Abc123@3';

      //Act
      final result = AppRegex.isValidPassword(strongPassword);

      //Arrange
      expect(result, true);
    });

    test('should return false for weak password', () {
      //Arrange
      const weakPasswords = ['12345556', 'password', 'abckkfo86868', 'ABc!@#'];

      for (final pwd in weakPasswords) {
        //Act
        final result = AppRegex.isValidPassword(pwd);

        //Arrange
        expect(result, false, reason: 'Expected $pwd to be weak');
      }
  });

  });

}
