import 'package:clima/services/networking.dart';
import 'package:geolocator/geolocator.dart';
import 'package:clima/screens/getlocation.dart';

const api_key = '3bd7e8b1363dda996ca4ea61a9f8cadc';

class WeatherModel {
  Future<dynamic> getLocationByCity(String city) async {
    var url = Uri.parse(
        'https://api.openweathermap.org/data/2.5/weather?q=${city}&appid=$api_key');
    Networkhelper networkhelper = await Networkhelper(url);
    var weatherData = await networkhelper.getData();
    return weatherData;
  }

  Future<dynamic> getLocationWeather() async {
    Location location = Location();
    await location.getLocation();

    var url = Uri.parse(
        'https://api.openweathermap.org/data/2.5/weather?lat=${location.latitude}&lon=${location.longitude}&appid=$api_key&units=metric');
    Networkhelper networkhelper = await Networkhelper(url);
    var weatherData = await networkhelper.getData();
    return weatherData;
  }

  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '๐ฉ';
    } else if (condition < 400) {
      return '๐ง';
    } else if (condition < 600) {
      return 'โ๏ธ';
    } else if (condition < 700) {
      return 'โ๏ธ';
    } else if (condition < 800) {
      return '๐ซ';
    } else if (condition == 800) {
      return 'โ๏ธ';
    } else if (condition <= 804) {
      return 'โ๏ธ';
    } else {
      return '๐คทโ';
    }
  }

  String getMessage(int temp) {
    if (temp > 25) {
      return 'It\'s ๐ฆ time';
    } else if (temp > 20) {
      return 'Time for shorts and ๐';
    } else if (temp < 10) {
      return 'You\'ll need ๐งฃ and ๐งค';
    } else {
      return 'Bring a ๐งฅ just in case';
    }
  }
}
