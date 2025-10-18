
class WeatherHelper {
  /// Converts Celsius to Fahrenheit
  static double celsiusToFahrenheit(double celsius) => celsius * 9 / 5 + 32;

  /// Converts Fahrenheit to Celsius
  static double fahrenheitToCelsius(double fahrenheit) => (fahrenheit - 32) * 5 / 9;
}
