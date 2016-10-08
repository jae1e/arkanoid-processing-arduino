class Box{
  float x, y, l, t, contact, interval;
  int index;
  
  Box(){
    this.x = 0;
    this.y = 0;
    this.contact = 0;
    this.interval = 1;
    this.l = width / box_column;
    this.t = height/ 3 / box_row;
    
  }
  
  void draw(){
    if(this.contact == 0)
      fill(0,0,255);
    else if(this.contact == 1)
      fill(255,0,0);
    else if(this.contact == 2)
      fill(255,0,255);

    rect(this.x + this.interval, this.y + this.interval, this.l - 2*this.interval, this.t - 2*this.interval);
    if(this.contact >= 2){
      this.l = 0;
      this.t = 0;
    }
  }
}
