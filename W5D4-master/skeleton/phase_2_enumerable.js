// nstructions
// Again, monkey-patch the following methods to the Array class using swell new language we've been learning.
// 


// Array#myEach(callback) - receives a callback function and executes the callback for each element in the array
// Note that JavaScript's forEach function has no return value (returns undefined)
Array.prototype.myEach = function(callback) {
  for(let i = 0; i < this.length; i++) {
    callback(this[i]);
  }
};

function callBack(dinkleberg){
  console.log(dinkleberg);
  console.log(dinkleberg);
}

let array = ["Dinky", "Twinky", "Tipsy", "Drunky"];
console.log(array.myEach(callBack));

// Array#myMap(callback) - receives a callback function, returns a new array of the results of calling the callback function on each element of the array
// should use myEach and a closure
Array.prototype.myMap = function(callback) {
  let potate = [];
  this.myEach((el) => potate.push(callback(el)));
  return potate;
};

function callBack2(element){
  return element + "y";
}

let array2 = ["Tinky-Winky", "Dipsy", "Lala", "Po"];
console.log(array2.myMap(callBack2));

// Array#myReduce(callback[, initialValue]) - (like Ruby's Array#inject) receives a callback function, and optional initial value, returns an accumulator by applying the callback function to each element and the result of the last invocation of the callback (or initial value if supplied)
// initialValue is optional and should default to the first element of the array if not provided
// examples:
// // without initialValue
// [1, 2, 3].myReduce(function(acc, el) {
//   return acc + el;
// }); // => 6
// 
// // with initialValue
// [1, 2, 3].myReduce(function(acc, el) {
//   return acc + el;
// }, 25); // => 31
// should also use myEach
// NB [initialValue] is the conventional way for documentation to express that the args between [ and ] are optional inputs. Your function definition will not include these square brackets.

Array.prototype.myReduce = function(callback, acc = undefined) {
  let accumulator = acc;
  function func(el) {
    if (accumulator === undefined) {
      accumulator = el;
      return;
    } 
    accumulator = callback(accumulator, el);
  }
  this.myEach(func);
  return accumulator;
};

function neopets(acc, el) {
  return acc + el;
}

console.log([1, 2, 3].myReduce(neopets, 25));

