class timer {

  int time, duration;
  boolean paused;
  boolean completed; 
  String display;
  
  // The argument dur is in seconds, but the variables duration and time_ellapsed are in loops, i.e. seconds * 60
  timer (int dur) {
    paused = true;
    completed = false;
    duration = 60 * dur;
    time = 0;
    display = "00:00:00";
  }
  
  void update () {
      this.time += 1;
      display = nf (int (time / 3600), 2) + ":" + nf (int ((time % 3600) / 60), 2) + ":" + nf (int (time % 60), 2);
      if (this.time >= this.duration) {
        this.paused = true;
        this.completed = true;
      }
    }
  
  void pause () {
    this.paused = true;
  }
  
  void unpause () {
    this.paused = false;
  }
  
  void reset (int dur) {
    this.paused = true;
    this.time = 0;
    duration = 60 * dur;
  }
  
  

} 