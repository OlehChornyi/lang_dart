void main(List<String> args) {
  var creator = TopicCreator();
  var poster = AnnouncementPoster();
  creator.create();
  poster.post();
  //---------------
  codeSome(DartCoder(), 100);
  codeSome(GoCoder(), 200);
  //---------------
  watchNormalAds(BannerAds());
  watckAdsWithReward(InterstitialAds());
  //---------------
  FrontendDeveloper().makeFrontend();
  FullstackDeveloper().makeFrontend();
  FullstackDeveloper().makeBackend();
  //---------------
  final manager = RequestManager(SqlDatabase());
  manager.makeARequest('App Monetization');
}

//SINGLE RESPONSIBILITY PRINCIPLE (SEPARATE LOGICS)
class TopicCreator {
  void create() {
    print('Topic created');
  }
}

class AnnouncementPoster {
  void post() async {
    print('Posting announcement');
    await Future.delayed(Duration(seconds: 2));
    print('Announcement posted');
  }
}

//OPEN-CLOSED PRINCIPLE (USE ABSTRACT CLASS WITH IMPLEMENTATION KEYWORD)
abstract class Coder {
  void code(int linesNumber);
}

class DartCoder implements Coder {
  @override
  void code(int linesNumber) {
    print("Dart coder coded $linesNumber lines of code");
  }
}

class GoCoder implements Coder {
  @override
  void code(int linesNumber) {
    print("Go coder coded $linesNumber lines of code");
  }
}

void codeSome(Coder coder, int linesNumber) {
  coder.code(linesNumber);
}

//LISKOV SUBSTITUTION PRINCIPLE
abstract class Ads {
  void request();
}

abstract class RewardedAds extends Ads {
  void receiveRevard();
}

class BannerAds implements Ads {
  @override
  void request() => print('Banner Ads requested');
}

class InterstitialAds implements RewardedAds {
  @override
  void request() => print('Interstitial Ads requested');

  @override
  void receiveRevard() => print('Reward received');
}

void watchNormalAds(Ads ads) {
  ads.request();
}

void watckAdsWithReward(RewardedAds ads) {
  ads.request();
  ads.receiveRevard();
}

//INTERFACE SEGREGATION PRINCIPLE
abstract class Developer {
  void makeFrontend();
  void makeBackend();
}

abstract class Frontend {
  void makeFrontend();
}

abstract class Backend {
  void makeBackend();
}

class FrontendDeveloper implements Frontend {
  @override
  void makeFrontend() => print('Developer makes only frontend');
}

class FullstackDeveloper implements Frontend, Backend {
  @override
  void makeFrontend() => print('Developer makes frontend');

  @override
  void makeBackend() => print('Developer makes backend');
}

//DEPENDENCY INVERDION PRINCIPLE
abstract class Database {
  void query(String topic);
}

class SqlDatabase implements Database {
  @override
  void query(String topic) =>
      print('Query SQL with the following topic: $topic');
}

class RequestManager{
  final Database database;

  RequestManager(this.database);

  void makeARequest(String topic) {
    database.query(topic);
  }
}
