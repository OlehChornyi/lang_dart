void main(List<String> args) {
  // Interprets (5 + 3) * 2 = 16
  Expression expression = Multiply(
    Add(Number(5), Number(3)),
    Number(2),
  );

  print("Result: ${expression.interpret()}");
  //--------------
  var expr = OrExpression(
    BooleanValue(false),
    AndExpression(BooleanValue(true), BooleanValue(true)),
  );

  print("Result: ${expr.interpret()}"); 
  //-------------
  var context1 = Context({'x': 4, 'y': 3});
  var expression1 = Sum(Var('x'), Var('y'));

  print("Result: ${expression1.interpret(context1)}"); 
  //-------------
  var input = 'V';
  var value = RomanFive().interpret(input) + RomanOne().interpret(input);

  print("Value of $input is $value"); 
  //-------------
  var commands = [
    'PRINT Hello Dart!',
    'REPEAT 3 Welcome',
  ];

  for (var line in commands) {
    Interpreter.parse(line).execute();
  }
}

//The Interpreter Pattern defines a way to evaluate language grammar 
//or expressions. It’s used to interpret sentences in a language, such 
//as mathematical expressions or commands.

//19.1. Arithmetic Expression Interpreter
//Parse and evaluate a simple arithmetic expression.
abstract class Expression {
  int interpret();
}

class Number implements Expression {
  final int value;

  Number(this.value);

  @override
  int interpret() => value;
}

class Add implements Expression {
  final Expression left, right;

  Add(this.left, this.right);

  @override
  int interpret() => left.interpret() + right.interpret();
}

class Multiply implements Expression {
  final Expression left, right;

  Multiply(this.left, this.right);

  @override
  int interpret() => left.interpret() * right.interpret();
}

//19.2. Boolean Logic Interpreter
abstract class BooleanExpression {
  bool interpret();
}

class BooleanValue implements BooleanExpression {
  final bool value;

  BooleanValue(this.value);

  @override
  bool interpret() => value;
}

class AndExpression implements BooleanExpression {
  final BooleanExpression left, right;

  AndExpression(this.left, this.right);

  @override
  bool interpret() => left.interpret() && right.interpret();
}

class OrExpression implements BooleanExpression {
  final BooleanExpression left, right;

  OrExpression(this.left, this.right);

  @override
  bool interpret() => left.interpret() || right.interpret();
}

//19.3. Context-Based Variable Expression
class Context {
  final Map<String, int> variables;

  Context(this.variables);

  int getValue(String name) => variables[name] ?? 0;
}

abstract class VarExpression {
  int interpret(Context context);
}

class Var implements VarExpression {
  final String name;

  Var(this.name);

  @override
  int interpret(Context context) => context.getValue(name);
}

class Sum implements VarExpression {
  final VarExpression left, right;

  Sum(this.left, this.right);

  @override
  int interpret(Context context) =>
      left.interpret(context) + right.interpret(context);
}

//19.4. Roman Numeral Interpreter (Basic I-V)
abstract class RomanExpression {
  int interpret(String input);
}

class RomanOne extends RomanExpression {
  @override
  int interpret(String input) => input == 'I' ? 1 : 0;
}

class RomanFive extends RomanExpression {
  @override
  int interpret(String input) => input == 'V' ? 5 : 0;
}

//19.5. Custom Command Interpreter (mini DSL)
//Interpret simple commands like PRINT Hello, REPEAT 3 Hello
abstract class Command {
  void execute();
}

class PrintCommand implements Command {
  final String message;

  PrintCommand(this.message);

  @override
  void execute() => print(message);
}

class RepeatCommand implements Command {
  final int times;
  final String message;

  RepeatCommand(this.times, this.message);

  @override
  void execute() {
    for (var i = 0; i < times; i++) {
      print(message);
    }
  }
}

class Interpreter {
  static Command parse(String input) {
    var parts = input.split(' ');
    if (parts[0] == 'PRINT') {
      return PrintCommand(parts.sublist(1).join(' '));
    } else if (parts[0] == 'REPEAT') {
      return RepeatCommand(int.parse(parts[1]), parts.sublist(2).join(' '));
    } else {
      throw Exception("Unknown command");
    }
  }
}
