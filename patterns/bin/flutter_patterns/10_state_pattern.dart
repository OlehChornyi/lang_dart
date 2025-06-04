void main(List<String> args) {
  final context = AuthContext(LoggedOutState());
  print(context.getStatus());

  context.setState(LoggedInState());
  print(context.getStatus());
  //------------------
  final player = MediaPlayer(StoppedState());
  player.play();

  player.setState(PlayingState());
  player.play();
  //------------------
  final user = OnboardingContext(FirstTimeUserState());
  print(user.showScreen());

  user.setState(CompletedState());
  print(user.showScreen());
}

//The State Pattern allows an object to alter its behavior when its 
//internal state changes. It helps keep state-specific logic encapsulated 
//in separate classes, improving maintainability and readability.

//In Flutter, this pattern is useful for managing app states such as 
//authentication, UI states, media playback, etc.

//10.1. User Authentication State
//Handle different UI logic based on user authentication state.
abstract class AuthState {
  String status();
}

class LoggedOutState implements AuthState {
  @override
  String status() => "User is logged out";
}

class LoggedInState implements AuthState {
  @override
  String status() => "User is logged in";
}

class AuthContext {
  AuthState _state;

  AuthContext(this._state);

  void setState(AuthState state) => _state = state;

  String getStatus() => _state.status();
}

//10.2. Media Player State
//Control media behavior based on current playback state.
abstract class PlayerState {
  void pressPlay();
}

class StoppedState implements PlayerState {
  @override
  void pressPlay() {
    print("Starting playback...");
  }
}

class PlayingState implements PlayerState {
  @override
  void pressPlay() {
    print("Already playing!");
  }
}

class MediaPlayer {
  PlayerState _state;

  MediaPlayer(this._state);

  void setState(PlayerState state) => _state = state;

  void play() => _state.pressPlay();
}

//9.3. Button State (Loading, Success, Error)
//Show button behavior based on state.
// abstract class ButtonState {
//   String label();
//   Color color();
// }

// class IdleState implements ButtonState {
//   @override
//   String label() => "Submit";

//   @override
//   Color color() => Colors.blue;
// }

// class LoadingState implements ButtonState {
//   @override
//   String label() => "Loading...";

//   @override
//   Color color() => Colors.grey;
// }

// class SuccessState implements ButtonState {
//   @override
//   String label() => "Success!";

//   @override
//   Color color() => Colors.green;
// }

// class ButtonContext {
//   ButtonState _state;

//   ButtonContext(this._state);

//   void setState(ButtonState state) => _state = state;

//   String get label => _state.label();
//   Color get color => _state.color();
// }

// final buttonContext = ButtonContext(IdleState());

// ElevatedButton(
//   onPressed: () {
//     buttonContext.setState(LoadingState());
//     // simulate async task
//     Future.delayed(Duration(seconds: 2), () {
//       buttonContext.setState(SuccessState());
//     });
//   },
//   style: ElevatedButton.styleFrom(backgroundColor: buttonContext.color),
//   child: Text(buttonContext.label),
// )

//9.4.Theme Switcher (Light/Dark)
//Change theme mode dynamically using the State pattern.
// abstract class ThemeState {
//   ThemeData getTheme();
// }

// class LightThemeState implements ThemeState {
//   @override
//   ThemeData getTheme() => ThemeData.light();
// }

// class DarkThemeState implements ThemeState {
//   @override
//   ThemeData getTheme() => ThemeData.dark();
// }

// class ThemeContext {
//   ThemeState _state;

//   ThemeContext(this._state);

//   void toggleTheme() {
//     _state = (_state is LightThemeState)
//         ? DarkThemeState()
//         : LightThemeState();
//   }

//   ThemeData get currentTheme => _state.getTheme();
// }

// final themeContext = ThemeContext(LightThemeState());

// MaterialApp(
//   theme: themeContext.currentTheme,
//   home: Scaffold(
//     appBar: AppBar(title: Text("State Pattern")),
//     floatingActionButton: FloatingActionButton(
//       onPressed: () {
//         themeContext.toggleTheme();
//       },
//       child: Icon(Icons.brightness_6),
//     ),
//   ),
// );

//9.5. Onboarding Flow (FirstTime, Skipped, Completed)
//Manage onboarding state in an app.
abstract class OnboardingState {
  String screen();
}

class FirstTimeUserState implements OnboardingState {
  @override
  String screen() => "Show Welcome Slides";
}

class SkippedState implements OnboardingState {
  @override
  String screen() => "Skip to Login";
}

class CompletedState implements OnboardingState {
  @override
  String screen() => "Go to Home";
}

class OnboardingContext {
  OnboardingState _state;

  OnboardingContext(this._state);

  void setState(OnboardingState state) => _state = state;

  String showScreen() => _state.screen();
}


