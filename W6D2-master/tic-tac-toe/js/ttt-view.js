class View {
  constructor(game, $el) {
    this.game = game;
    this.$el = $el;
    this.setupBoard();
    this.bindEvents();
  }

  bindEvents() {
    this.$el.on("click", "li", ( event => {
      const $square = $(event.currentTarget);
      this.makeMove($square);
    }));
  }

  makeMove($square) {
    let pos = $square.data('pos');
    const currentPlayer = this.game.currentPlayer;

    try {
      this.game.playMove(pos);
      // console.log("yus", pos);
    } catch(e) {
      alert(`This ${e.msg.toLowerCase()} !`);
      return ;
    }
    // console.log(currentPlayer);
    // console.log(`SQUARE!:`, $square);

    $square.addClass(currentPlayer);
    if (this.game.isOver()) {
      this.$el.off('click');
      this.$el.addClass("game-over");

      //check for winner
      const winner = this.game.winner();
      const $figcaption = $("<figcaption>");
      // console.log ('Winner!', winner);
      if (winner) {
        this.$el.addClass(`winner-${winner}`);
        $figcaption.html(`Congratulations player ${winner.toUpperCase()}.`);
      } else {
        $figcaption.html(`Congratulations you played yourself.`);
      }
      this.$el.append($figcaption);
    }
  }


  setupBoard() {
    const $ul = $('<ul></ul>');
    for (let i = 0; i < 3; i++) {
      for (let j = 0; j < 3; j++) {
        let $li = $('<li></li>');
        $li.data("pos", [i, j]);

        $ul.append($li);
      }
    }

    this.$el.append($ul);
  }
}

module.exports = View;
