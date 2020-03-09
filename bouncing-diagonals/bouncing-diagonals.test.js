const bouncingDiagonals = require("./bouncing-diagonals");

describe("Bouncing Diagonals", () => {
  it("should return the correctly sorted elements", () => {
    let matrix = [[0, 1, 2, 3], [4, 5, 6, 7], [8, 9, 10, 11], [12, 13, 14, 15]];
    expect(bouncingDiagonals(matrix)).toEqual([4, 8, 0, 12]);
  });
});
