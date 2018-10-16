const readline = require('readline');

const reader = readline.createInterface({
  input: process.stdin,
  output: process.stdout
});


class Game {
  run(completionCallback) {
    while (!this.isWon()) {
      this.promptMove(function(callback) {
        callback(function(moves) {
          console.log(moves);
          this.move(moves);
        });
      });
    }
    completionCallback();
  }
  constructor() {
    this.towers = [[1,2,3], [], []];
  }
  
  move(startTowerIdx, endTowerIdx) {
    if (this.isValidMove(startTowerIdx, endTowerIdx)) {
      this.towers[endTowerIdx].unshift(this.towers[startTowerIdx].shift);
    }
  }
  
  print() {
    console.log(this.towers);
  }
  promptMove(callback) {
    this.print();
    const newCallback = function () {
      let moveFrom, moveTo;
      reader.question("What tower do you want to move from?", (res) => {
        moveFrom = Number(res);
        reader.question("What tower do you want to move to?", (res) => {
          moveTo = Number(res);
          reader.close();
        });
      });
      return [moveFrom, moveTo];
    };
    callback(newCallback);
  }
  // promptMove(callback) {
  //   this.print();
  //   let moveFrom, moveTo;
  //   reader.question("What tower do you want to move from?", (res) => {
  //     moveFrom = Number(res);
  //     reader.question("What tower do you want to move to?", (res) => {
  //       moveTo = Number(res);
  //       reader.close();
  //       callback(moveFrom, moveTo);
  //     });
  //   });
  // }
  
  isWon() {
    if (this.towers[1].length > 2 || this.towers[2].length > 2) {
      return true;
    }
    return false;
  }
  
  isValidMove(startTowerIdx, endTowerIdx) {
    if (startTowerIdx >= this.towers.length || endTowerIdx >= this.towers.length ||
    startTowerIdx < 0 || endTowerIdx < 0) {
      throw 'Out of bounds.';
    }
    const start = this.towers[startTowerIdx][0];
    const end = this.towers[endTowerIdx][0];
    
    if (!end || start < end) {
      return true;
    } else {
      throw 'Out of bounds.';
    }
  }
}

let game = new Game();
game.run(() => {console.log('You win good job timmy.');});
