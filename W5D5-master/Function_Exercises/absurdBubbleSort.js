const readline = require('readline');

const reader = readline.createInterface({
  input: process.stdin,
  output: process.stdout
});

// Write this first.
function askIfGreaterThan(el1, el2, callback) {
  // Prompt user to tell us whether el1 > el2; pass true back to the
  // callback if true; else false.
    reader.question(`Is ${el1} bigger than ${el2}?`, (res) => {
      if (res === 'yes') {
        callback(true);
      } else {        
        callback(false);
      }
  });
}

// askIfGreaterThan(1, 2, function(){ console.log("hi");});
// 
// Once you're done testing askIfGreaterThan with dummy arguments, write this.
function innerBubbleSortLoop(arr, i, madeAnySwaps, outerBubbleSortLoop) {
  if (i === arr.length - 1) {
    outerBubbleSortLoop(madeAnySwaps);
  } else {
    madeAnySwaps = false;
    let num1 = arr[i];
    let num2 = arr[i + 1];
    askIfGreaterThan(num1, num2, (isGreater) => {
      if (isGreater) {
        arr[i] = num2;
        arr[i + 1] = num1;
        madeAnySwaps = true;
      }
      innerBubbleSortLoop(arr, i + 1, madeAnySwaps, outerBubbleSortLoop);
    });
  }
}

function absurdBubbleSort(arr, sortCompletionCallback) {
  function outerBubbleSortLoop(madeAnySwaps) {
    if (madeAnySwaps) {
      innerBubbleSortLoop(arr, 0, madeAnySwaps, outerBubbleSortLoop);
    } else {
      sortCompletionCallback(arr);
    }
  }
  outerBubbleSortLoop(true);
}

absurdBubbleSort([3, 2, 1,8,7], function (arr) {
  console.log("Sorted array: " + JSON.stringify(arr));
  reader.close();
});
// 









