const APIUtil = require('./api_util.js');

class UsersSearch {
  
  constructor($el) { 
    //grab input / ul from elements?
    this.$input = $el.find(`input[type=text]`);
    this.$ul = $el.find('ul.users');
    //handle for each input 
    this.$input.on('input', (e) => {
      e.preventDefault();
      this.handleInput(e);
    });
  }
  
  handleInput(event) {
    //each input event call api util 
    APIUtil.searchUsers(this.$input.val()).then((response) => {
      console.log(response);
    });
    //RETURN A LIST OF USERS?
  }
  
  
  
}

module.exports = UsersSearch;