void main(List<String> args) {
  final remote = RemoteControl(LightOnCommand(Light()));
  remote.pressButton();
}

//8. Command Pattern
//Encapsulate a request as an object.
abstract class Command {
  void execute();
}

class Light {
  void turnOn() => print("Light is ON");
}

class LightOnCommand implements Command {
  final Light light;

  LightOnCommand(this.light);

  @override
  void execute() => light.turnOn();
}

class RemoteControl {
  Command command;

  RemoteControl(this.command);

  void pressButton() => command.execute();
}