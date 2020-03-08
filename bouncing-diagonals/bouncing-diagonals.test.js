const bouncingDiagonals = require("./bouncing-diagonals");

describe("Bouncing Diagonals", () => {
  it("should return the correctly sorted elements", () => {
    expect(bouncingDiagonals(2)).toEqual(4);
  });
});
