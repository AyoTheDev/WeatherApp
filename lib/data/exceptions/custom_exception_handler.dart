//TODO Differentiate between different type of exceptions (network, parsing, etc)
class CustomException implements Exception {
  final String message;

  const CustomException(this.message);

  @override
  String toString() => message;
}