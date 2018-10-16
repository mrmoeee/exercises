const readline = require('readline');

const reader = readline.createInterface({
  input: process.stdin,
  output: process.stdout
});


function addNumbers(sum, numsleft, completionCallback) {
  if (numsleft > 0) {
    reader.question("Give me a number: ", (res) => {
      num = Number(res);
      sum += num;
      console.log(`Partial Sum: ${sum}`);
      addNumbers(sum, numsleft - 1, completionCallback);
    });
  } else if (numsleft === 0) {
    reader.close();
    completionCallback(sum);
  }
}

// addNumbers(1,2,3,4);
addNumbers(0, 3, sum => console.log(`Total Sum: ${sum}`));