import 'package:flutter_dotenv/flutter_dotenv.dart';

final String apiKey = dotenv.env['API_KEY']??'';
final String token = dotenv.env['TOKEN']??'';