class AppUtils {

  static String splitLongWords(String input) {
  // Split the string by spaces into a list of words
  List<String> words = input.split(' ');

  // Return the first two words if available, joined by a space
  return words.length >= 2 ? '${words[0]} ${words[1]} ${words[2]}' : input;
}

}