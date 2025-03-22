class WeatherNextDayEntity {
  final String date;
  final double temp;
  final String condition;
  final String iconUrl;
  final double windSpeed;
  final int humidity;

  WeatherNextDayEntity({
    required this.date,
    required this.temp,
    required this.condition,
    required this.iconUrl,
    required this.windSpeed,
    required this.humidity,
  });


  Map<String, dynamic> toJson() {
    return {
      'date': date,
      'temp': temp,
      'condition': condition,
      'iconUrl': iconUrl,
      'windSpeed': windSpeed,
      'humidity': humidity,
    };
  }

  factory WeatherNextDayEntity.fromJson(Map<String, dynamic> json) {
    return WeatherNextDayEntity(
      date: json['date'],
      temp: (json['temp'] as num).toDouble(),
      condition: json['condition'],
      iconUrl: json['iconUrl'],
      windSpeed: (json['windSpeed'] as num).toDouble(),
      humidity: json['humidity'],
    );
  }
}