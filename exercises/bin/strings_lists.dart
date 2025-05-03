void main(List<String> args) {
    //Ussage of functions
    print(splitWords("Hello Dart world")); 
    print(reverseWords("hello world"));
    print(longWords("This sentence contains some long words"));
    print(vowelCounts("hello world dart"));
    print(joinWords(["Flutter", "is", "awesome"]));
}

//1. Split a Sentence into Words
List<String> splitWords(String sentence) {
  return sentence.split(' ');
}

//2. Reverse Each Word in a Sentence
String reverseWords(String sentence) {
  return sentence
      .split(' ')
      .map((word) => word.split('').reversed.join())
      .join(' ');
}

//3. Find Words Longer Than 4 Characters
List<String> longWords(String sentence) {
  return sentence.split(' ').where((word) => word.length > 4).toList();
}

//4. Count Number of Vowels in Each Word
List<int> vowelCounts(String sentence) {
  return sentence
      .split(' ')
      .map((word) =>
          word.split('').where((ch) => 'aeiouAEIOU'.contains(ch)).length)
      .toList();
}

//5. Join Words Back Into a Sentence
String joinWords(List<String> words) {
  return words.join(' ');
}
