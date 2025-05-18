import 'my_oop.dart';
void main(List<String> arguments) {
  print('Hello world of SOLID!');

  //SOLID
  //Single responsibility principle
  //Open-closed principle
  //Liskov substitution principle
  //Interface segregation principle
  //Dependency inversion principle

  Coder coder = Coder();
  //NOT ALLOWED
  // coder._skillsNumber = 10;
  // coder._yearsOfExperiance = 2;
  // print(coder._skillsNumber);
  // print(coder._yearsOfExperiance);
  // print(coder._numberOfSkillsPerYear());
  coder.skillsNumber = 10;
  coder.yearsOfExperiance = 2;
  print(coder.skillsNumber);
  print(coder.yearsOfExperiance);
}
