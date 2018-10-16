const APIUtil = {
  followUser: id => {
    return $.ajax({
        type: "POST", 
        url: `/users/${id}/follow`,
        dataType: "json", 
        error: function (errMsg) {
          console.log(errMsg);
        }
      });
  },

  unfollowUser: id => {
    return $.ajax({
      type: "DELETE",
      url: `/users/${id}/follow`,
      dataType: "json",
      error: function (errMsg) {
        console.log(errMsg);
      }
    });
  },
  
  searchUsers: query => {
    return $.ajax({
      type: "GET",
      url: '/users/search',
      data: {query: query}, 
      dataType: "json",
      error: function(errMsg) {
        console.log(errMsg);
      }
    });
  }
};


module.exports = APIUtil;

