// To parse this JSON data, do
//
//     final welcome = welcomeFromMap(jsonString);

import 'dart:convert';

Welcome welcomeFromMap(String str) => Welcome.fromMap(json.decode(str));

String welcomeToMap(Welcome data) => json.encode(data.toMap());

class Welcome {
  Welcome({
    this.results,
    this.info,
  });

  List<Result> results;
  Info info;

  factory Welcome.fromMap(Map<String, dynamic> json) => Welcome(
    results: json["results"] == null ? null : List<Result>.from(json["results"].map((x) => Result.fromMap(x))),
    info: json["info"] == null ? null : Info.fromMap(json["info"]),
  );

  Map<String, dynamic> toMap() => {
    "results": results == null ? null : List<dynamic>.from(results.map((x) => x.toMap())),
    "info": info == null ? null : info.toMap(),
  };
}

class Info {
  Info({
    this.seed,
    this.results,
    this.page,
    this.version,
  });

  String seed;
  int results;
  int page;
  String version;

  factory Info.fromMap(Map<String, dynamic> json) => Info(
    seed: json["seed"] == null ? null : json["seed"],
    results: json["results"] == null ? null : json["results"],
    page: json["page"] == null ? null : json["page"],
    version: json["version"] == null ? null : json["version"],
  );

  Map<String, dynamic> toMap() => {
    "seed": seed == null ? null : seed,
    "results": results == null ? null : results,
    "page": page == null ? null : page,
    "version": version == null ? null : version,
  };
}

class Result {
  Result({
    this.gender,
    this.name,
    this.location,
    this.email,
    this.login,
    this.dob,
    this.registered,
    this.phone,
    this.cell,
    this.id,
    this.picture,
    this.nat,
  });

  String gender;
  Name name;
  Location location;
  String email;
  Login login;
  Dob dob;
  Dob registered;
  String phone;
  String cell;
  Id id;
  Picture picture;
  String nat;

  factory Result.fromMap(Map<String, dynamic> json) => Result(
    gender: json["gender"] == null ? null : json["gender"],
    name: json["name"] == null ? null : Name.fromMap(json["name"]),
    location: json["location"] == null ? null : Location.fromMap(json["location"]),
    email: json["email"] == null ? null : json["email"],
    login: json["login"] == null ? null : Login.fromMap(json["login"]),
    dob: json["dob"] == null ? null : Dob.fromMap(json["dob"]),
    registered: json["registered"] == null ? null : Dob.fromMap(json["registered"]),
    phone: json["phone"] == null ? null : json["phone"],
    cell: json["cell"] == null ? null : json["cell"],
    id: json["id"] == null ? null : Id.fromMap(json["id"]),
    picture: json["picture"] == null ? null : Picture.fromMap(json["picture"]),
    nat: json["nat"] == null ? null : json["nat"],
  );

  Map<String, dynamic> toMap() => {
    "gender": gender == null ? null : gender,
    "name": name == null ? null : name.toMap(),
    "location": location == null ? null : location.toMap(),
    "email": email == null ? null : email,
    "login": login == null ? null : login.toMap(),
    "dob": dob == null ? null : dob.toMap(),
    "registered": registered == null ? null : registered.toMap(),
    "phone": phone == null ? null : phone,
    "cell": cell == null ? null : cell,
    "id": id == null ? null : id.toMap(),
    "picture": picture == null ? null : picture.toMap(),
    "nat": nat == null ? null : nat,
  };
}

class Dob {
  Dob({
    this.date,
    this.age,
  });

  DateTime date;
  int age;

  factory Dob.fromMap(Map<String, dynamic> json) => Dob(
    date: json["date"] == null ? null : DateTime.parse(json["date"]),
    age: json["age"] == null ? null : json["age"],
  );

  Map<String, dynamic> toMap() => {
    "date": date == null ? null : date.toIso8601String(),
    "age": age == null ? null : age,
  };
}

class Id {
  Id({
    this.name,
    this.value,
  });

  String name;
  String value;

  factory Id.fromMap(Map<String, dynamic> json) => Id(
    name: json["name"] == null ? null : json["name"],
    value: json["value"] == null ? null : json["value"],
  );

  Map<String, dynamic> toMap() => {
    "name": name == null ? null : name,
    "value": value == null ? null : value,
  };
}

class Location {
  Location({
    this.street,
    this.city,
    this.state,
    this.country,
    this.postcode,
    this.coordinates,
    this.timezone,
  });

  Street street;
  String city;
  String state;
  String country;
  dynamic postcode;
  Coordinates coordinates;
  Timezone timezone;

  factory Location.fromMap(Map<String, dynamic> json) => Location(
    street: json["street"] == null ? null : Street.fromMap(json["street"]),
    city: json["city"] == null ? null : json["city"],
    state: json["state"] == null ? null : json["state"],
    country: json["country"] == null ? null : json["country"],
    postcode: json["postcode"],
    coordinates: json["coordinates"] == null ? null : Coordinates.fromMap(json["coordinates"]),
    timezone: json["timezone"] == null ? null : Timezone.fromMap(json["timezone"]),
  );

  Map<String, dynamic> toMap() => {
    "street": street == null ? null : street.toMap(),
    "city": city == null ? null : city,
    "state": state == null ? null : state,
    "country": country == null ? null : country,
    "postcode": postcode,
    "coordinates": coordinates == null ? null : coordinates.toMap(),
    "timezone": timezone == null ? null : timezone.toMap(),
  };
}

class Coordinates {
  Coordinates({
    this.latitude,
    this.longitude,
  });

  String latitude;
  String longitude;

  factory Coordinates.fromMap(Map<String, dynamic> json) => Coordinates(
    latitude: json["latitude"] == null ? null : json["latitude"],
    longitude: json["longitude"] == null ? null : json["longitude"],
  );

  Map<String, dynamic> toMap() => {
    "latitude": latitude == null ? null : latitude,
    "longitude": longitude == null ? null : longitude,
  };
}

class Street {
  Street({
    this.number,
    this.name,
  });

  int number;
  String name;

  factory Street.fromMap(Map<String, dynamic> json) => Street(
    number: json["number"] == null ? null : json["number"],
    name: json["name"] == null ? null : json["name"],
  );

  Map<String, dynamic> toMap() => {
    "number": number == null ? null : number,
    "name": name == null ? null : name,
  };
}

class Timezone {
  Timezone({
    this.offset,
    this.description,
  });

  String offset;
  String description;

  factory Timezone.fromMap(Map<String, dynamic> json) => Timezone(
    offset: json["offset"] == null ? null : json["offset"],
    description: json["description"] == null ? null : json["description"],
  );

  Map<String, dynamic> toMap() => {
    "offset": offset == null ? null : offset,
    "description": description == null ? null : description,
  };
}

class Login {
  Login({
    this.uuid,
    this.username,
    this.password,
    this.salt,
    this.md5,
    this.sha1,
    this.sha256,
  });

  String uuid;
  String username;
  String password;
  String salt;
  String md5;
  String sha1;
  String sha256;

  factory Login.fromMap(Map<String, dynamic> json) => Login(
    uuid: json["uuid"] == null ? null : json["uuid"],
    username: json["username"] == null ? null : json["username"],
    password: json["password"] == null ? null : json["password"],
    salt: json["salt"] == null ? null : json["salt"],
    md5: json["md5"] == null ? null : json["md5"],
    sha1: json["sha1"] == null ? null : json["sha1"],
    sha256: json["sha256"] == null ? null : json["sha256"],
  );

  Map<String, dynamic> toMap() => {
    "uuid": uuid == null ? null : uuid,
    "username": username == null ? null : username,
    "password": password == null ? null : password,
    "salt": salt == null ? null : salt,
    "md5": md5 == null ? null : md5,
    "sha1": sha1 == null ? null : sha1,
    "sha256": sha256 == null ? null : sha256,
  };
}

class Name {
  Name({
    this.title,
    this.first,
    this.last,
  });

  String title;
  String first;
  String last;

  factory Name.fromMap(Map<String, dynamic> json) => Name(
    title: json["title"] == null ? null : json["title"],
    first: json["first"] == null ? null : json["first"],
    last: json["last"] == null ? null : json["last"],
  );

  Map<String, dynamic> toMap() => {
    "title": title == null ? null : title,
    "first": first == null ? null : first,
    "last": last == null ? null : last,
  };
}

class Picture {
  Picture({
    this.large,
    this.medium,
    this.thumbnail,
  });

  String large;
  String medium;
  String thumbnail;

  factory Picture.fromMap(Map<String, dynamic> json) => Picture(
    large: json["large"] == null ? null : json["large"],
    medium: json["medium"] == null ? null : json["medium"],
    thumbnail: json["thumbnail"] == null ? null : json["thumbnail"],
  );

  Map<String, dynamic> toMap() => {
    "large": large == null ? null : large,
    "medium": medium == null ? null : medium,
    "thumbnail": thumbnail == null ? null : thumbnail,
  };
}
