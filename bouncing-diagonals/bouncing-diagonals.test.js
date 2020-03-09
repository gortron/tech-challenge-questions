const methods = require("./bouncing-diagonals");
const bouncingDiagonals = methods.bouncingDiagonals;
const getWeights = methods.getWeights;
const sort = methods.sort;

describe("Bouncing Diagonals", () => {
  it("should get the correct weights for each starting element", () => {
    let matrix = [[0, 1, 2, 3], [4, 5, 6, 7], [8, 9, 10, 11], [12, 13, 14, 15]];
    expect(getWeights(matrix)).toEqual([[0, 30], [4, 60], [8, 60], [12, 30]]);

    matrix = [[-57, 23, 41], [12, 91, -157], [111, 5, 49]];
    expect(getWeights(matrix)).toEqual([[-57, 83], [12, -262], [111, 243]]);
  });

  it("should sort the weights correctly and return their first elements", () => {
    let weights = [[0, 30], [4, 60], [8, 60], [12, 30]];

    expect(sort(weights)).toEqual([4, 8, 0, 12]);

    weights = [[-57, 83], [12, -262], [111, 243]];
    expect(sort(weights)).toEqual([111, -57, 12]);
  });

  it("should return the correctly sorted first elements", () => {
    let matrix = [[0, 1, 2, 3], [4, 5, 6, 7], [8, 9, 10, 11], [12, 13, 14, 15]];
    expect(bouncingDiagonals(matrix)).toEqual([4, 8, 0, 12]);

    matrix = [[-57, 23, 41], [12, 91, -157], [111, 5, 49]];
    expect(bouncingDiagonals(matrix)).toEqual([111, -57, 12]);
  });
});
