const View = require('./ttt-view.js');// require appropriate file
const Game = require('../solution/game.js');// require appropriate file
window.View = View;
window.Game = Game;
$( () => {
  // Your code here
  const game = new Game();
  let ttt = $(".ttt");
  const view = new View(game, ttt);
});
