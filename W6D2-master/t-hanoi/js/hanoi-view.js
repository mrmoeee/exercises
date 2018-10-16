class HanoiView {

  constructor(game, $el) {
    this.game = game;
    this.$el = $el;
    this.setupTowers();
  }

  setupTowers() {
    const $ul = $('<ul></ul>');
    const $ul2 = $('<ul></ul>');
    const $ul3 = $('<ul></ul>');
    for (let i = 0; i < 3; i++) {
      let $li = $('<li></li>');
      let $li2 = $('<li></li>');
      let $li3 = $('<li></li>');
      $li.data("pos", i);
      $li2.data("pos", i);
      $li3.data("pos", i);
      $ul.append($li);
      $ul2.append($li2);
      $ul3.append($li3);
    }

    this.$el.append($ul);
    this.$el.append($ul2);
    this.$el.append($ul3);
  }
}

module.exports = HanoiView;
