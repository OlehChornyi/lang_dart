void main(List<String> args) {
  final legacyUser = LegacyUser("Jane Doe", "avatar.png");
  final user = LegacyUserAdapter(legacyUser);

  print("Display: ${user.name} - ${user.profileImage}");
  //-------------------
  final external = ExternalEvent("Meeting", 1685539200000);
  final appEvent = CalendarEventAdapter(external);

  print("Event: ${appEvent.name} at ${appEvent.date}");
  //-------------------
  final adapter = AudioPlayerAdapter(AudioPlugin());
  adapter.play("song.mp3");
  //-------------------
  final external1 = ExternalLocation(37.7749, -122.4194);
  final adapted = LocationAdapter(external1);

  print("Map coordinates: ${adapted.latitude}, ${adapted.longitude}");
  //-------------------
  final article = JsonToNewsAdapter(json);
  print("News: ${article.title} - ${article.content}");
}

//4.1. Adapting Legacy User Model for a Flutter UI
//Use an adapter to convert an old user model into one that fits the UI design.
class LegacyUser {
  final String fullName;
  final String avatarLink;

  LegacyUser(this.fullName, this.avatarLink);
}

class User {
  final String name;
  final String profileImage;

  User(this.name, this.profileImage);
}

class LegacyUserAdapter extends User {
  LegacyUserAdapter(LegacyUser legacy)
      : super(legacy.fullName, legacy.avatarLink);
}

//4.2. Adapting Calendar Events from a Plugin
//Adapt calendar event data from a plugin to app’s calendar model.
class ExternalEvent {
  final String title;
  final int timestamp;

  ExternalEvent(this.title, this.timestamp);
}

class AppEvent {
  final String name;
  final DateTime date;

  AppEvent(this.name, this.date);
}

class CalendarEventAdapter extends AppEvent {
  CalendarEventAdapter(ExternalEvent event)
      : super(event.title, DateTime.fromMillisecondsSinceEpoch(event.timestamp));
}

//4.3. Adapting Audio Player Plugin to Custom Controls
//Adapt third-party audio control to app-specific interface.
class AudioPlugin {
  void playAudio(String path) => print("Playing $path");
}

abstract class MediaPlayer {
  void play(String filename);
}

class AudioPlayerAdapter implements MediaPlayer {
  final AudioPlugin plugin;

  AudioPlayerAdapter(this.plugin);

  @override
  void play(String filename) {
    plugin.playAudio(filename);
  }
}

//4.4. Adapting Map Location Data
//Adapt third-party location data for use in a map UI widget.
class ExternalLocation {
  final double lat;
  final double lng;

  ExternalLocation(this.lat, this.lng);
}

class LatLng {
  final double latitude;
  final double longitude;

  LatLng(this.latitude, this.longitude);
}

class LocationAdapter extends LatLng {
  LocationAdapter(ExternalLocation loc) : super(loc.lat, loc.lng);
}

//4.5. Adapting JSON Data to a Widget Model
//Adapt raw JSON to a model used by a Flutter widget.
Map<String, dynamic> json = {
  "headline": "Breaking News!",
  "body": "Details of the event..."
};

class NewsArticle {
  final String title;
  final String content;

  NewsArticle(this.title, this.content);
}

class JsonToNewsAdapter extends NewsArticle {
  JsonToNewsAdapter(Map<String, dynamic> json)
      : super(json['headline'], json['body']);
}