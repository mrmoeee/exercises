// Phase 1: Arrays
// Overview
// Let's take a little while to create a few (hopefully familiar) functions.
// These should give you some experience iterating over and mutating arrays.
// 
// Instructions
// Monkey-patch the following methods to the Array class. 
//Remember, we want to use prototype here.
// 
// Array#uniq - returns a new array containing only the 
//unique elements of the original array
// the unique elements should be in the order in which they first appear
// should not mutate the original array
// Array#twoSum - returns an array of position pairs where the elements sum to zero
// Array#transpose - where we have a two-dimensional 
//array representing a matrix. returns the transpose
// should not mutate the original array
// Recap
// That was super fun, right?

Array.prototype.uniq = function() {
  let uniqarray = [];
  this.forEach((el) => {
    if(!uniqarray.includes(el)) {
      uniqarray.push(el);
    }
  });
  return uniqarray;
};
// let array = [1,1,1,2,3,3,4,4];
// console.log(array.uniq());

Array.prototype.twoSum = function () {
  let pairs = [];
  for(let i = 0; i < this.length - 1; i++) {
    for(let j = i + 1; j < this.length; j++) {
      if(this[i] + this[j] === 0) {
        pairs.push([i, j]);
      }
    }
  }
  return pairs;
};
// let array1 = [1,1,1,2,3,-3,4,-1];
// console.log(array1.twoSum());

Array.prototype.transpose = function () {
  let transposed = []; 
  for(let i = 0; i < this[0].length; i++) {
    transposed.push([]);
  }
  
  for (let i = 0; i < this.length; i++) {
    for (let j = 0; j < this[i].length; j++) {
      transposed[j].push(this[i][j]);
    }
  }
  return transposed;
};

let array2 = [[1,2,3],[4,5,6],[7,8,9]];
let array3 = [[1,2,3,4],[4,5,6,7],[7,8,9,10]];
console.log(array2.transpose()); 
console.log(array3.transpose()); 
