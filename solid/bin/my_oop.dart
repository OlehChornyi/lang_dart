void main(List<String> args) {
  Learner student = Student();
  student.learn();
  //---------------
  Coder coder = Coder();
  coder._skillsNumber = 10;
  coder._yearsOfExperiance = 2;
  print(coder._skillsNumber);
  print(coder._yearsOfExperiance);
  print(coder._numberOfSkillsPerYear());
  //---------------
  Person person = Person('Oleh');
  person.describeHuman();
  //--------------
  HigherEducation he = HigherEducation();
  he.sructure();
}

//ABSTRACTION
abstract class Learner {
  void learn();
}

class Student implements Learner {
  @override
  void learn() {
    print('Student is learning...');
  }
}

//ENCAPSULATION
class Coder {
  int _skillsNumber = 0;
  int _yearsOfExperiance = 0;

  int get skillsNumber => _skillsNumber;
  int get yearsOfExperiance => _yearsOfExperiance;

  set skillsNumber(int value) {
    _skillsNumber += value;
  }

  set yearsOfExperiance(int value) {
    _yearsOfExperiance += value;
  }

  int _numberOfSkillsPerYear() {
    return (_skillsNumber/_yearsOfExperiance).ceil();
  }
}

//INHERITANCE
class HumanBeing {
  String name;
  HumanBeing(this.name);
  
  void describeHuman() {
    print('This human being is called $name');
  }
}

class Person extends HumanBeing{
  // Person(String name): super(name);
    Person(super.name);

    @override
  void describeHuman() {
    super.describeHuman();
    print('This human being ($name) is a real person!');
  }
}

//POLYMORPHISM
class Education {
  void sructure() {
    print('The education structure must be researched');
  }
}

class HigherEducation extends Education{
  @override
  void sructure() {
    super.sructure();
    print('Higher education has relatively complex structure');
  }
}