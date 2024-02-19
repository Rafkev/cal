import 'dart:io';

void main() {
  print('Welcome to Dart Calculator App!');

  while (true) {
    print('\nEnter an expression (e.g., 2 + 3) or type "exit" to quit:');
    var input = stdin.readLineSync();

    if (input?.toLowerCase() == 'exit') {
      print('Exiting...');
      break;
    }

    try {
      var parts = input!.split(RegExp(r'\s+'));
      if (parts.length != 3) {
        throw FormatException('Invalid expression format.');
      }

      var num1 = double.parse(parts[0]);
      var operator = parts[1];
      var num2 = double.parse(parts[2]);

      var result;
      switch (operator) {
        case '+':
          result = num1 + num2;
          break;
        case '-':
          result = num1 - num2;
          break;
        case '*':
          result = num1 * num2;
          break;
        case '/':
          if (num2 == 0) {
            throw Exception('Division by zero is not allowed.');
          }
          result = num1 / num2;
          break;
        default:
          throw Exception('Invalid operator.');
      }

      print('Result: $result');
    } catch (e) {
      print('Error: $e');
    }
  }
}
