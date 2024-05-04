void main() {
  int n = 3;

  List<List<int>> spiralMatrix = generateSpiralMatrix(n);

  print("SPIRAL MATRIX\n");

  for (List<int> row in spiralMatrix) {
    print(row);
  }

  print('\n');
  print("SUM OF DIAGONAL NUMBERS\n");

  callculateDiagonalSam(spiralMatrix, n);
}

callculateDiagonalSam(List<List<int>> mat, int n) {
  int principal = 0, secondary = 0;
  for (int i = 0; i < n; i++) {
    for (int j = 0; j < n; j++) {
      // Condition for principal diagonal
      if (i == j) principal += mat[i][j];
      // Condition for secondary diagonal
      if ((i + j) == (n - 1)) secondary += mat[i][j];
    }
  }

  secondary = secondary - 1;

  print("Principal Diagonal: $principal");
  print("Secondary Diagonal: $secondary");

  int sumDiagonals = principal + secondary;

  print("Sum of Diagonal: $sumDiagonals");
}

List<List<int>> generateSpiralMatrix(int n) {
  List<List<int>> results = List.generate(n, (index) => List<int>.filled(n, 0));
  int counter = n * n;
  int startColumn = 0;
  int endColumn = n - 1;
  int startRow = 0;
  int endRow = n - 1; // 1

  while (startColumn <= endColumn && startRow <= endRow) {
    // Top row
    for (int i = endColumn; i >= startColumn; i--) {
      results[startRow][i] = counter;
      counter--;
    }

    startRow++;

    // Left column
    for (int i = startRow; i <= endRow; i++) {
      results[i][startColumn] = counter;
      counter--;
    }
    startColumn++;

    // Bottom row
    for (int i = startColumn; i <= endColumn; i++) {
      results[endRow][i] = counter;
      counter--;
    }
    endRow--;

    // Right column
    for (int i = endRow; i >= startRow; i--) {
      results[i][endColumn] = counter;
      counter--;
    }
    endColumn--;
  }
  return results;
}
