import 'dart:io';
// ignore: unused_import
import 'dart:math';

double numinput() {
  print("enter the number for operation: ");
  double mynumber = double.parse(stdin.readLineSync()!);
  return mynumber;
}

String opreandchoice() {
  print("enter an operand e.g'+','-','/''*'");
  String operandinput = stdin.readLineSync()!;
  return operandinput;
}

void main() {
  double num1 = numinput();
  double num2 = numinput();

  String choice = opreandchoice();
  double answer = 0.0;

  if (choice == '+') {
    answer = num1 + num2;
  } else if (choice == '-') {
    answer = num1 - num2;
  } else {
    print('invalid input,please review');
  }
  print("${num1} ${choice} ${num2} = ${answer}");
}
