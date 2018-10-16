// range(start, end) - receives a start and end value, returns an array from start up to end
function range(start, end) {
  if (start > end) {
    return [];
  } 
  let ranges = range(start+ 1, end);  
  ranges.unshift(start);
  return ranges;
}
// console.log(range(-3,2));
// sumRec(arr) - receives an array of numbers and recursively sums them
function sumRec(arr) {
  if (arr.length < 1) {
    return nil;
  } else if (arr.length < 2) {
    return arr[0];
  }
  return arr[0] + sumRec(arr.slice(1, arr.length));
}
// console.log(sumRec([1,2,3,4,5]));
// exponent(base, exp) - receives a base and exponent, returns the base raise to the power of the exponent (base ^ exp)
function exp1(base, exp) {
  if(exp === 0) {
    return 1;
  }
  return base * exp1(base, exp - 1);
}

// write two versions:
// # this is math, not Ruby methods.
// 
// # version 1
// exp(b, 0) = 1
// exp(b, n) = b * exp(b, n - 1)
// 
// # recursion 2
// exp(b, 0) = 1
// exp(b, 1) = b
// exp(b, n) = exp(b, n / 2) ** 2             [for even n]
// exp(b, n) = b * (exp(b, (n - 1) / 2) ** 2) [for odd n]
function exp2(base, exp) {
  if(exp === 0) { 
    return 1;
  } else if (exp === 1) {
    return base;
  } else if (exp % 2 === 0) {
    return Math.pow(exp2(base, exp / 2), 2);
  } else {
    return base * Math.pow(exp2(base, (exp - 1) / 2), 2);
  }
}
// 
// console.log(exp1(2, 2));
// console.log(exp2(2, 3));

// fibonacci(n) - receives an integer, n, and returns the first n Fibonacci numbers
function fib(n) {
  if (n < 0) {
    return undefined;
  } else if (n < 1) {
    return [];
  } else if (n < 2) {
    return [1];
  } else if (n < 3) {
    return [1, 1];
  }
  let arr = fib(n - 1);
  arr.push(arr[arr.length - 1] + arr[arr.length - 2]);
  return arr;
}

// console.log(fib(3));
// deepDup(arr) - deep dup of an Array!
function deepDup(array) {
  function closuree(element) {
    if(element instanceof Array){
      // console.log(element);
      return deepDup(element);
    } 
    return element;
  }
  // console.log(array);
  return array.map(closuree);
}
Object.prototype.toString.call([]); 

// console.log(deepDup([1,2,3,4,5,[[[6]]],[[7,8]]]));
// console.log(deepDup([[1,2,3,4,5],[[[6]]],[[7,8]]]));
// 💡 Aside: type-checking in javascript
// Type checking in JS can get a very strange at times and it is best practice to avoid it if at all possible. Check out the Typeof operator section of this article. For this problem though, we will need to do it. Use the getType method from the True Object types section in that same article to see a clever way to type-check. This method may not make a whole lot of sense now, but it will in a few days.
// 
// bsearch(arr, target) - receives a sorted array, returns the index of the target or -1 if not found
// 💡 Another aside: Why -1?
// In case you are wondering, returning -1 is a common practice when returning the index of an element that does not exist. The reasoning behind this is to return the same type (-1 is also a number) as if the element was found; that way we can still bracket into the array, but will get undefined back. Though this was not the case with Ruby, you will likely see this in other programming languages. Try this on your own if you are curious.
function bsearch(arr, target) {
  if (arr.length < 1) {
    return -1;
  }
  let middle = Math.floor(arr.length / 2);
  if(arr[middle] === target) {
    return middle;
  }
  if(target < arr[middle]) {
    return bsearch(arr.slice(0, middle), target);
  }
  result = bsearch(arr.slice(middle + 1), target);
  if (result !== -1) {
    return result + middle + 1;
  }
  return result;
}

// console.log(bsearch([1,2,5,8,10,14,90,101,1012], 14));
// mergesort(arr) - receives an array, returns a sorted copy of the array by implementing merge sort sorting algorithm
function mergesort(arr) {
  if(arr.length < 1) {
    return [];
  }
  if(arr.length < 2) {
    return arr;
  }
  let middle = Math.floor(arr.length / 2);
  let left = mergesort(arr.slice(0,middle));
  let right = mergesort(arr.slice(middle));

  

  result = [];
  while(left.length > 0 && right.length > 0) {
    if (left[0] < right[0]) {
      result.push(left.shift());
    } else if (right[0] < left[0]) {
      result.push(right.shift());
    } else {
      result.push(left.shift());
    }
  }
  
  console.log(result);
  return result.concat(left).concat(right);
}

console.log(mergesort([5,1,10,7,6,8]));
// subsets(arr) - receives an array, returns an array containing all the subsets of the original array