const bouncingDiagonals = matrix => {
  let weights = getWeights(matrix);
  return sort(weights);
};

const getWeights = matrix => {
  let weights = [];
  let size = matrix.length - 1;
  for (let i = 0; i <= size; i++) {
    let key = matrix[i][0];
    let weight = 0;
    for (let j = 0; j <= size; j++) {
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
    weights.push([key, weight]);
  }
  return weights;
};

const sort = weights => {
  let results = [...weights];
  results.sort((first, second) => {
    // Compare Weights
    if (first[1] > second[1]) return -1;
    if (first[1] < second[1]) return 1;

    // Compare Keys
    if (first[0] < second[0]) return -1;
    if (first[0] > second[0]) return 1;
  });

  return results.map(result => result[0]);
};

module.exports = {
  bouncingDiagonals: bouncingDiagonals,
  getWeights: getWeights,
  sort: sort
};
