import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_testing_lab/helpers/weather_helper.dart';
import 'package:flutter_testing_lab/widgets/weather_display.dart';

void main() {
  group('WeatherDisplay Tests', () {
    test('Celsius to Fahrenheit', () {
      expect(WeatherHelper.celsiusToFahrenheit(0),32);
      expect(WeatherHelper.celsiusToFahrenheit(100),212);
      expect(WeatherHelper.celsiusToFahrenheit(-40),-40);
      expect(WeatherHelper.celsiusToFahrenheit(37),closeTo(98.6, 0.01));
    });

    test('Fahrenheit to Celsius ', () {
      expect(WeatherHelper.fahrenheitToCelsius(32),0);
      expect(WeatherHelper.fahrenheitToCelsius(212),100);
      expect(WeatherHelper.fahrenheitToCelsius(-40),-40);
      expect(WeatherHelper.fahrenheitToCelsius(98.6),closeTo(37, 0.01));
    });
  });
}
