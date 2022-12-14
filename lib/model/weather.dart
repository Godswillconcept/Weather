class Weather {
	num? lat;
	num? lon;
	String? timezone;
	num? timezoneOffset;
	Current? current;
	List<Map<String, dynamic>>? minutely;
	List<Hourly>? hourly;
	List<Daily>? daily;

	Weather({this.lat, this.lon, this.timezone, this.timezoneOffset, this.current, this.minutely, this.hourly, this.daily});

	Weather.fromJson(json) {
		lat = json['lat'];
		lon = json['lon'];
		timezone = json['timezone'];
		timezoneOffset = json['timezone_offset'];
		current = json['current'] != null ? Current.fromJson(json['current']) : null;
		if (json['minutely'] != null) {
			minutely = <Map<String, dynamic>>[];
			json['minutely'].forEach((v) { minutely!.add(v); });
		}
		if (json['hourly'] != null) {
			hourly = <Hourly>[];
			json['hourly'].forEach((v) { hourly!.add(Hourly.fromJson(v)); });
		}
		if (json['daily'] != null) {
			daily = <Daily>[];
			json['daily'].forEach((v) { daily!.add(Daily.fromJson(v)); });
		}
	}
  
	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = {};
		data['lat'] = lat;
		data['lon'] = lon;
		data['timezone'] = timezone;
		data['timezone_offset'] = timezoneOffset;
		if (current != null) {
      data['current'] = current!.toJson();
    }
		if (minutely != null) {
      data['minutely'] = minutely!.toList();
    }
		if (hourly != null) {
      data['hourly'] = hourly!.map((v) => v.toJson()).toList();
    }
		if (daily != null) {
      data['daily'] = daily!.map((v) => v.toJson()).toList();
    }
		return data;
	}
}

class Current {

  num? dt;
  num? sunrise;
  num? sunset;
  num? temp;
  num? feelsLike;
  num? pressure;
  num? humidity;
  num? dewPoint;
  num? uvi;
  num? cloud;
  num? visibility;
  num? windSpeed;
  num? windDeg;
  List<CurrentWeather>? weather;

  Current({this.dt, this.sunrise, this.sunset, this.temp, this.feelsLike, this.pressure, this.humidity, this.dewPoint, this.uvi, this.cloud, this.visibility, this.windSpeed, this.windDeg, this.weather});
  
  Current.fromJson(json){
    dt = json['dt'];
    sunrise = json['sunrise'];
    sunset = json['sunset'];
    temp = json['temp'];
    feelsLike = json['feelsLike'];
    pressure= json['pressure'];
    humidity= json['humidity'];
    dewPoint= json['dewPoint'];
    uvi = json['uvi'];
    cloud = json['cloud'];
    visibility = json['visibility'];
    windSpeed = json['windSpeed'];
    windDeg = json['windDeg'];
    if(json['weather'] != null){
      weather = <CurrentWeather>[];
			json['weather'].forEach((v) { weather!.add(CurrentWeather.fromJson(v)); });
    }
  }

  Map<String, dynamic> toJson(){
    Map<String, dynamic> json = {};
    json['dt'] = dt;
    json['sunrise'] = sunrise;
    json['sunset'] = sunset;
    json['temp'] = temp;
    json['feelsLike'] = feelsLike;
    json['pressure'] = pressure;
    json['humidity'] = humidity;
    json['dewPoint'] = dewPoint;
    json['uvi'] = uvi;
    json['cloud'] = cloud;
    json['visibility'] = visibility;
    json['windSpeed'] = windSpeed;
    json['windDeg'] = windDeg;
    if(weather?.isEmpty ?? false){
      json['weather'] = weather!.map((v) => v.toJson).toList();
    }
    return json;
  }
}

class Hourly {
	num? dt;
	num? temp;
	num? feelsLike;
	num? pressure;
	num? humidity;
	num? dewPoint;
	num? uvi;
	num? clouds;
	num? visibility;
	num? windSpeed;
	num? windDeg;
	num? windGust;
	List<Weather>? weather;
	num? pop;
	Rain? rain;

	Hourly({this.dt, this.temp, this.feelsLike, this.pressure, this.humidity, this.dewPoint, this.uvi, this.clouds, this.visibility, this.windSpeed, this.windDeg, this.windGust, this.weather, this.pop, this.rain});

	Hourly.fromJson(json) {
		dt = json['dt'];
		temp = json['temp'];
		feelsLike = json['feels_like'];
		pressure = json['pressure'];
		humidity = json['humidity'];
		dewPoint = json['dew_point'];
		uvi = json['uvi'];
		clouds = json['clouds'];
		visibility = json['visibility'];
		windSpeed = json['wind_speed'];
		windDeg = json['wind_deg'];
		windGust = json['wind_gust'];
		if (json['weather'] != null) {
			weather = <Weather>[];
			json['weather'].forEach((v) { weather!.add(Weather.fromJson(v)); });
		}
		pop = json['pop'];
		rain = json['rain'] != null ? Rain.fromJson(json['rain']) : null;
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = <String, dynamic>{};
		data['dt'] = dt;
		data['temp'] = temp;
		data['feels_like'] = feelsLike;
		data['pressure'] = pressure;
		data['humidity'] = humidity;
		data['dew_point'] = dewPoint;
		data['uvi'] = uvi;
		data['clouds'] = clouds;
		data['visibility'] = visibility;
		data['wind_speed'] = windSpeed;
		data['wind_deg'] = windDeg;
		data['wind_gust'] = windGust;
		if (weather != null) {
      data['weather'] = weather!.map((v) => v.toJson()).toList();
    }
		data['pop'] = pop;
		if (rain != null) {
      data['rain'] = rain!.toJson();
    }
		return data;
	}
}

class CurrentWeather {
	num? id;
	String? main;
	String? description;
	String? _icon;

	CurrentWeather({this.id, this.main, this.description, icon}){    
    _icon = icon;
  }

	CurrentWeather.fromJson(json) {
		id = json['id'];
		main = json['main'];
		description = json['description'];
		_icon = json['icon'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = <String, dynamic>{};
		data['id'] = id;
		data['main'] = main;
		data['description'] = description;
		data['icon'] = _icon;
		return data;
	}

  get icon {
    return (_icon?.isEmpty ?? true) ? '' : "http://openweathermap.org/img/wn/$_icon@2x.png";
  }
}

class Rain {
	num? d1h;

	Rain({this.d1h});

	Rain.fromJson(json) {
		d1h = json['1h'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = <String, dynamic>{};
		data['1h'] = d1h;
		return data;
	}
}

class Daily {
	num? dt;
	num? sunrise;
	num? sunset;
	num? moonrise;
	num? moonset;
	num? moonPhase;
	Temp? temp;
	FeelsLike? feelsLike;
	num? pressure;
	num? humidity;
	num? dewPoint;
	num? windSpeed;
	num? windDeg;
	num? windGust;
	List<Weather>? weather;
	num? clouds;
	num? pop;
	num? rain;
	num? uvi;

	Daily({this.dt, this.sunrise, this.sunset, this.moonrise, this.moonset, this.moonPhase, this.temp, this.feelsLike, this.pressure, this.humidity, this.dewPoint, this.windSpeed, this.windDeg, this.windGust, this.weather, this.clouds, this.pop, this.rain, this.uvi});

	Daily.fromJson(json) {
		dt = json['dt'];
		sunrise = json['sunrise'];
		sunset = json['sunset'];
		moonrise = json['moonrise'];
		moonset = json['moonset'];
		moonPhase = json['moon_phase'];
		temp = json['temp'] != null ? Temp.fromJson(json['temp']) : null;
		feelsLike = json['feels_like'] != null ? FeelsLike.fromJson(json['feels_like']) : null;
		pressure = json['pressure'];
		humidity = json['humidity'];
		dewPoint = json['dew_point'];
		windSpeed = json['wind_speed'];
		windDeg = json['wind_deg'];
		windGust = json['wind_gust'];
		if (json['weather'] != null) {
			weather = <Weather>[];
			json['weather'].forEach((v) { weather!.add(Weather.fromJson(v)); });
		}
		clouds = json['clouds'];
		pop = json['pop'];
		rain = json['rain'];
		uvi = json['uvi'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = <String, dynamic>{};
		data['dt'] = dt;
		data['sunrise'] = sunrise;
		data['sunset'] = sunset;
		data['moonrise'] = moonrise;
		data['moonset'] = moonset;
		data['moon_phase'] = moonPhase;
		if (temp != null) {
      data['temp'] = temp!.toJson();
    }
		if (feelsLike != null) {
      data['feels_like'] = feelsLike!.toJson();
    }
		data['pressure'] = pressure;
		data['humidity'] = humidity;
		data['dew_point'] = dewPoint;
		data['wind_speed'] = windSpeed;
		data['wind_deg'] = windDeg;
		data['wind_gust'] = windGust;
		if (weather != null) {
      data['weather'] = weather!.map((v) => v.toJson()).toList();
    }
		data['clouds'] = clouds;
		data['pop'] = pop;
		data['rain'] = rain;
		data['uvi'] = uvi;
		return data;
	}
}

class Temp {
	num? day;
	num? min;
	num? max;
	num? night;
	num? eve;
	num? morn;

	Temp({this.day, this.min, this.max, this.night, this.eve, this.morn});

	Temp.fromJson(json) {
		day = json['day'];
		min = json['min'];
		max = json['max'];
		night = json['night'];
		eve = json['eve'];
		morn = json['morn'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = {};
		data['day'] = day;
		data['min'] = min;
		data['max'] = max;
		data['night'] = night;
		data['eve'] = eve;
		data['morn'] = morn;
		return data;
	}
}

class FeelsLike {
	num? day;
	num? night;
	num? eve;
	num? morn;

	FeelsLike({this.day, this.night, this.eve, this.morn});

	FeelsLike.fromJson(json) {
		day = json['day'];
		night = json['night'];
		eve = json['eve'];
		morn = json['morn'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = <String, dynamic>{};
		data['day'] = day;
		data['night'] = night;
		data['eve'] = eve;
		data['morn'] = morn;
		return data;
	}
}
