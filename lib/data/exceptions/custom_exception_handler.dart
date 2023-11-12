//TODO Differentiate between different type of exceptions (network, parsing, location etc)
class CustomException implements Exception {
  final String message;

  const CustomException(this.message);

  @override
  String toString() => message;
}