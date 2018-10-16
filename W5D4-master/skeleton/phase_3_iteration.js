// Instructions
// Write the following functions:
// 
// Array#bubbleSort - receives an array, returns a sorted array by implementing bubble sort sorting algorithm

Array.prototype.bubbleSort = function() {
  let bubble = Object.assign([], this);
  let sorted = false;
  while(!sorted) {
    sorted = true;
    for(let i = 0; i < bubble.length - 1; i++) {
      if(bubble[i + 1] < bubble[i]) {
        current = bubble[i];
        bubble[i] = bubble[i + 1];
        bubble[i + 1] = current;
        sorted = false;
      }
    }
  }
  return bubble;
};

// arr = [1,4,2,6,5,9,4,3,3,7,-1,23,4];
// console.log(arr.bubbleSort());
// console.log(arr);

// String#substrings - receives a string, returns an array of all substrings

String.prototype.substring = function() {
  let subbies = [];
  for(let i = 0; i < this.length; i++){
    for(let j = i + 1; j <= this.length; j++){
      subbies.push(this.slice(i,j));
    }
  }
  return subbies;
};

console.log("Twinky".substring());