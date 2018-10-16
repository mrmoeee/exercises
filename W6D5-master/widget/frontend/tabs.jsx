import React from 'react';

  class Header extends React.Component {

  }

  class Tabs extends React.Component {

    constructor(props) {
      super(props);
      this.state = {
        title: "",
        content: ""
      };
    }

    render() {
      return (
        <div className="tab-stuff">
          <div className='tab-box'>
            <div className='tab'>
              Woah
            </div>
          </div>
        </div>
      );
    }


  }

export default Tabs;
