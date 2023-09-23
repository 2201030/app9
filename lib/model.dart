class WeatherModel {
  String city_name;
  String last_date;
  double temp;
  double max_temp;
  double min_temp;
  String weather_condition;
  String image;
  WeatherModel(
      {required this.city_name,
      required this.image,
      required this.last_date,
      required this.max_temp,
      required this.min_temp,
      required this.temp,
      required this.weather_condition});
  factory WeatherModel.origin(map_weather) {
    return WeatherModel(
        city_name: map_weather["location"]["name"],
        image: map_weather["forecast"]["forecastday"][0]["day"] ["condition"]["icon"],
        last_date: map_weather["current"]["last_updated"],
        max_temp: map_weather["forecast"]["forecastday"][0]["day"]["maxtemp_c"],
        min_temp:map_weather["forecast"]["forecastday"][0]["day"]["mintemp_c"],
        temp: map_weather["forecast"]["forecastday"][0]["day"]["avgtemp_c"],
        weather_condition:map_weather["forecast"]["forecastday"][0]["day"]["condition"]["text"]);
  }
}
