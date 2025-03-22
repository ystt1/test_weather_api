class WeatherTodayEntity {
  final String time;
  final double temperature;
  final String condition;
  final String iconUrl;
  final double windSpeed;
  final int humidity;

  WeatherTodayEntity({
    required this.time,
    required this.temperature,
    required this.condition,
    required this.iconUrl,
    required this.windSpeed,
    required this.humidity,
  });

  Map<String, dynamic> toJson() {
    return {
      'time': time,
      'temperature': temperature,
      'condition': condition,
      'iconUrl': iconUrl,
      'windSpeed': windSpeed,
      'humidity': humidity,
    };
  }


  factory WeatherTodayEntity.fromJson(Map<String, dynamic> json) {
    return WeatherTodayEntity(
      time: json['time'],
      temperature: (json['temperature'] as num).toDouble(),
      condition: json['condition'],
      iconUrl: json['iconUrl'],
      windSpeed: (json['windSpeed'] as num).toDouble(),
      humidity: json['humidity'],
    );
  }
}