import React from 'react';

class Clock extends React.Component {

  constructor(props) {
    super(props);
    this.state = {
      date: new Date()
    };
    // this.hours = this.date.getHours();
    // this.minutes = this.date.getMinutes();
    // this.seconds = this.date.getSeconds();
    this.tick = this.tick.bind(this);
  }

  render() {
    return (
      <div className="clock-stuff">
        <h1>Clock</h1>
        <div className="clock-box">
          <div className="clock-time">
            <div>Time: </div>
            <div>{this.addPadding(this.state.date.getHours())}:{this.addPadding(this.state.date.getMinutes())}:{this.addPadding(this.state.date.getSeconds())} PDT</div>
          </div>



          <div className="clock-date">
            <div>Date: </div>
            <div>{this.state.date.toDateString()}</div>
          </div>
        </div>
      </div>
    );
  }

  addPadding(time) {
    if (time < 10) {
      return `0${time}`;
    } else {
      return time;
    }
  }

  tick() {
    this.setState({date: new Date()});
  }

  componentDidMount() {
    this.intervalID = setInterval(this.tick, 1000);
  }

  componentWillUnmount() {
    this.interval = clearInterval(this.intervalID);
  }
}

export default Clock;


// Write a method, tick that uses setState to set the time to a
//new Date()
// You'll use setInterval to call tick every second,
//but you should wait until the component is actually on the page.
//For this, you can define a componentDidMount function.
// You'll also want to store that interval's id so you can
//cancel it in componentWillUnmount, which gets called just
// before the component is removed. Don't store this in the component's state since it doesn't affect the UI. Instead, just store it directly on this.
// In your render method, display the current hours, minutes, and seconds.
//Check out all of the methods you can use to display the date and time
//in a human-readable string.
