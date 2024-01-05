
import 'dart:io';

void main() {
  List<String> board = List.generate(9, (index) => ' ');

  printBoard(board);

  bool isPlayer1Turn = true;

  while (true) {
    int move = getPlayerMove(isPlayer1Turn);

    if (isValidMove(board, move)) {
      board[move] = isPlayer1Turn ? 'X' : 'O';
      printBoard(board);

      if (checkWinner(board, isPlayer1Turn ? 'X' : 'O')) {
        print('Player ${isPlayer1Turn ? 1 : 2} wins!');
        break;
      }

      if (board.every((cell) => cell != ' ')) {
        print('It\'s a draw!');
        break;
      }

      isPlayer1Turn = !isPlayer1Turn;
    } else {
      print('Invalid move. Please try again.');
    }
  }
}

void printBoard(List<String> board) {
  print(' ${board[0]} | ${board[1]} | ${board[2]} ');
  print('---+---+---');
  print(' ${board[3]} | ${board[4]} | ${board[5]} ');
  print('---+---+---');
  print(' ${board[6]} | ${board[7]} | ${board[8]} ');
}

int getPlayerMove(bool isPlayer1Turn) {
  int playerNumber = isPlayer1Turn ? 1 : 2;
  stdout.write('Player $playerNumber, enter your move (1-9): ');
  int move = int.parse(stdin.readLineSync()!) - 1;
  return move;
}

bool isValidMove(List<String> board, int move) {
  return board[move] == ' ';
}

bool checkWinner(List<String> board, String player) {
  // Check rows
  for (int i = 0; i < 3; i++) {
    if (board[i * 3] == player &&
        board[i * 3 + 1] == player &&
        board[i * 3 + 2] == player) {
      return true;
    }
  }

  // Check columns
  for (int i = 0; i < 3; i++) {
    if (board[i] == player && board[i + 3] == player && board[i + 6] == player) {
      return true;
    }
  }

  // Check diagonals
  if (board[0] == player && board[4] == player && board[8] == player) {
    return true;
  }

  if (board[2] == player && board[4] == player && board[6] == player) {
    return true;
  }

  return false;
}
