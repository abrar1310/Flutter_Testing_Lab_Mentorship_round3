class WeatherData {
  final String city;
  final double temperatureCelsius;
  final String description;
  final int humidity;
  final double windSpeed;
  final String icon;

  WeatherData({
    required this.city,
    required this.temperatureCelsius,
    required this.description,
    required this.humidity,
    required this.windSpeed,
    required this.icon,
  });


  factory WeatherData.fromJson(Map<String, dynamic>? json) {
    if (json == null) {
      throw FormatException('JSON is null');
    }

    final city = json['city'];
    final temp = json['temperature'];
    final description = json['description'];
    final humidity = json['humidity'];
    final windSpeed = json['windSpeed'];
    final icon = json['icon'];

    if (city == null ||
        temp == null ||
        description == null ||
        humidity == null ||
        windSpeed == null ||
        icon == null) {
      throw FormatException('Missing field(s) in weather JSON: $json');
    }

    // Try to coerce numeric types
    double tempDouble;
    if (temp is double) tempDouble = temp;
    else if (temp is int) tempDouble = temp.toDouble();
    else if (temp is String) tempDouble = double.tryParse(temp) ?? (throw FormatException('Invalid temperature value'));
    else throw FormatException('Invalid temperature type');

    double windDouble;
    if (windSpeed is double) windDouble = windSpeed;
    else if (windSpeed is int) windDouble = windSpeed.toDouble();
    else if (windSpeed is String) windDouble = double.tryParse(windSpeed) ?? (throw FormatException('Invalid windSpeed value'));
    else throw FormatException('Invalid windSpeed type');

    int humidityInt;
    if (humidity is int) humidityInt = humidity;
    else if (humidity is double) humidityInt = humidity.toInt();
    else if (humidity is String) humidityInt = int.tryParse(humidity) ?? (throw FormatException('Invalid humidity value'));
    else throw FormatException('Invalid humidity type');

    return WeatherData(
      city: city.toString(),
      temperatureCelsius: tempDouble,
      description: description.toString(),
      humidity: humidityInt,
      windSpeed: windDouble,
      icon: icon.toString(),
    );
  }
}