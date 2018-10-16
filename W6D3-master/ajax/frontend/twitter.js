const FollowToggle = require('./follow_toggle');
const UsersSearch = require('./users_search');
window.FollowToggle = FollowToggle;
window.UsersSearch = UsersSearch;


$(function () {
  $('button.follow-toggle').each( (i, btn) => {
    let button = new FollowToggle($(btn));
  });
  
  $('nav.users-search').each( (i, nav) => {
    let navig = new UsersSearch($(nav)); 
  });
});
