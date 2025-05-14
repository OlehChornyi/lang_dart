void main(List<String> arguments) {
printFibonacci(10);
print(isPrime(2));
reverseString('hello');
print(factorial(3));
print(sumOfDigits(1234));
}

//1. Print Fibonacci Series (First N Numbers)
void printFibonacci(int n) {
  int a = 0, b = 1;
  for (int i = 0; i < n; i++) {
    print(a);
    int temp = a + b;
    a = b;
    b = temp;
  }
}

//2. Check Prime Number
bool isPrime(int number) {
  if (number < 2) return false;
  for (int i = 2; i <= number ~/ 2; i++) {
    if (number % i == 0) return false;
  }
  return true;
}

//3. Reverse a String
String reverseString(String input) {
  String reversed = '';
  for (int i = input.length - 1; i >= 0; i--) {
    reversed += input[i];
  }
  return reversed;
}

//4.Calculate the factorial of a number using recursion.
int factorial(int n) {
  if (n <= 1) return 1;
  return n * factorial(n - 1);
}
///The factorial function is a mathematical formula 
///represented by an exclamation mark "!". 
///In the Factorial formula, you must multiply all the 
///integers and positives that exist between the number 
///that appears in the formula and the number 1. Here's an 
///example: 7! = 1 * 2 * 3 * 4 * 5 * 6 * 7 = 5.040.

//5.Write a function that returns the sum of the digits of a number.
int sumOfDigits(int number) {
  int sum = 0;
  while (number > 0) {
    sum += number % 10;
    print(sum);
    number ~/= 10;
  }
  return sum;
}