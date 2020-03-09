const bouncingDiagonals = matrix => {
  // let weights = new Map();
  let weights = getWeights(matrix);
  return (results = sort(weights));
};

const getWeights = matrix => {
  let size = matrix.length - 1;
  for (let i = 0; i <= size; i++) {
    let key = matrix[i][0];
    let weight = 0;
    for (let j = 0; j <= size; j++) {
      console.log(i, j, weight);
      if (i === 0) {
        weight += matrix[j][j];
      } else if (i === size) {
        weight += matrix[size - j][j];
      } else {
        let diagonalUp = Math.abs(j - i);
        let diagonalDown = size - (Math.abs(size - (i + j)) % size);
        weight += matrix[diagonalUp][j];
        weight += matrix[diagonalDown][j];
      }
    }
    results.push([key, weight]);
  }
  return weights;
};

const sort = arr => {
  let results = [...arr];
  results.sort((first, second) => {
    // Compare Weights
    if (first[1] > second[1]) return -1;
    if (first[1] < second[1]) return 1;

    // Compare Keys
    if (first[0] < second[0]) return -1;
    if (first[0] > second[0]) return 1;
  });
  return results;
};

let matrix = [[0, 1, 2, 3], [4, 5, 6, 7], [8, 9, 10, 11], [12, 13, 14, 15]];

// module.exports = bouncingDiagonals;

// [row col] [i j]
// [0, 0] [1, 1] [2, 2] [3, 3]
// [3, 0] [2, 1] [1, 2] [0, 3]
//
// i = 1
// j = 0      1      2      3
// [1, 0] [0, 1] [1, 2] [2, 3]
// [1, 0] [2, 1] [3, 2] [2, 3]
//
// i = 2
// j = 0      1      2      3
// [2, 0] [1, 1] [0, 2] [1, 3]
// [2, 0] [3, 1] [2, 2] [1, 3]
