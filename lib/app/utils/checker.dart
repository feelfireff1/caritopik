class Checker {
  static bool isAllSpaces(String input) {
    String output = input.replaceAll(' ', '');
    if (output == '') {
      return true;
    }
    return false;
  }
}
