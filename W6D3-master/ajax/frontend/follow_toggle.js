const APIUtil = require('./api_util.js');

class FollowToggle {
  
  constructor($el) {
    this.$el = $el;
    this.userId = this.$el.data('user-id');
    this.followState = this.$el.data('initial-follow-state');
    this.render();
    this.handleClick();
  }
  
  render() {
    console.log(this.followState);
    if (this.followState === "unfollowing") {
      this.$el.html('follow');
      this.$el.prop("disabled", false);
    } else {
      this.$el.html('unfollow');
      this.$el.prop("disabled", false);
    }
  }
  
  handleClick() {
    this.$el.on("click", (e) => {
      e.preventDefault();
      if (this.followState === 'unfollowing') {
        this.$el.prop("disabled", true);
        APIUtil.followUser(this.userId).then(() => {
          this.followState = 'following';
          this.render();
        });
      } else {
        this.$el.prop("disabled", true);
        APIUtil.unfollowUser(this.userId).then(() => {
          this.followState = 'unfollowing';
          this.render();
        });
      }
    });
  }
}

module.exports = FollowToggle;