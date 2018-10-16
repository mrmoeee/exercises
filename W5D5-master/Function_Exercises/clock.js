class Clock {
  
  constructor() {
    this.date = new Date();
    
    setInterval(Clock.prototype._tick.bind(this), 1000);
  }

  printTime() {
    console.log(`${this.date.getHours()}:${this.date.getMinutes()}:${this.date.getSeconds()}`);
  }

  _tick() {
    let current_seconds = this.date.getSeconds();
    this.date.setSeconds(current_seconds + 1);
    this.printTime();
  }

}

const clock = new Clock();