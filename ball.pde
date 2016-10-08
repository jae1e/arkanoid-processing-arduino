class Ball{
  
  float x, y, e, r, vx, vy, box_l, box_t, ball_speed, add_vx;
  Box[] mybox;
  
  Ball(){
     
     this.x = width/2;
     this.y = height/2;
     this.e = 1;
     this.r = 20;
     this.vx = 0;
     this.ball_speed = game_speed;
     this.vy = this.ball_speed;
     this.add_vx = 0.08;
     this.mybox = box;
  }    
 
  void move(){
         
    this.x = this.x + this.vx;
    this.y = this.y + this.vy;
    
    if(this.x < r/3){
      this.vx = -e*this.vx;
      this.x = r/3;
    }
     if(this.x > width - r/3){
      this.vx = -e*this.vx;
      this.x = width - r/3;
    }
    if(this.y > height - r/3){
      life_count -= 1;
      this.x = width/2;
      this.y = height/2;
      this.vx = 0;
      this.vy = ball_speed;
      
    }
    if(this.y < r/3){
      this.vy = -e*this.vy;
      this.y = r/3;  
    }
    
    //bar impact
    float bar_x_range = this.x - bar_x;
    d_x = bar_x - p_x;
    if((bar_x_range < bar_l + r/4) && (bar_x_range > -r/4) && (this.vy > 0))
    {
    if(((this.y - bar_y) < 0) && ((bar_y - this.y) < (this.r/3))){
      this.y = bar_y - this.r/3;
            
      if(d_x < 0){
        this.vx -= bar_v * this.add_vx;
        this.vy = -sqrt(sq(this.ball_speed) - sq(this.vx));
      }
      else if(d_x > 0){
        this.vx += bar_v * this.add_vx;
        this.vy = -sqrt(sq(this.ball_speed) - sq(this.vx));
        }
      
      else
        this.vy = -e*this.vy;
    }
    } 
    
    //box impact
    float side_impact = this.r/3;
    float[] box_x_range = new float[box_count];
    float[] box_y_range = new float[box_count];
    float corner_impact = r/3;
        
    for(int i = 0; i < box_count; i++){
      box_x_range[i] = this.x - this.mybox[i].x;
      box_y_range[i] = this.y - this.mybox[i].y;
      
      }
    
    //upper side
    for(int i = 0; i < box_count; i++){
      
    if((box_x_range[i] < this.mybox[i].l) && (box_x_range[i] > 0) && (this.vy > 0))
    {
    if(((this.y - this.mybox[i].y) < 0) && ((this.mybox[i].y - this.y) < (side_impact))){
      this.y = this.mybox[i].y - side_impact;
      this.vy = -e*this.vy;
      this.mybox[i].contact += 1;
    }
    }
    //left side
    if((box_y_range[i] < this.mybox[i].t) && (box_y_range[i] > 0) && (this.vx > 0))
    {
    if(((this.x - this.mybox[i].x) < 0) && ((this.mybox[i].x - this.x) < (side_impact))){
      this.x = this.mybox[i].x - side_impact;
      this.vx = -e*this.vx;
      this.mybox[i].contact += 1;
    }
    }
    //bottom side
    if((box_x_range[i] < this.mybox[i].l) && (box_x_range[i] > 0) && (this.vy < 0))
    {
    if(((this.y - (this.mybox[i].y + this.mybox[i].t)) > 0) && ((this.y - (this.mybox[i].y + this.mybox[i].t)) < (side_impact))){
      this.y = this.mybox[i].y + this.mybox[i].t + side_impact;
      this.vy = -e*this.vy;
      this.mybox[i].contact += 1;
    }
    }
    //right side
    if((box_y_range[i] < this.mybox[i].t) && (box_y_range[i] > 0) && (this.vx < 0))
    {
    if(((this.x - (this.mybox[i].x + this.mybox[i].l)) > 0) && ((this.x - (this.mybox[i].x + this.mybox[i].l)) < (side_impact))){
      this.x = this.mybox[i].x + this.mybox[i].l + side_impact;
      this.vx = -e*this.vx;
      this.mybox[i].contact += 1;
    }
    }
    //corner
    
    
    if((this.x < this.mybox[i].x) && (this.mybox[i].x - this.x < corner_impact) && (this.y < this.mybox[i].y) && (this.mybox[i].y - this.y < corner_impact)){
      this.x = this.mybox[i].x - corner_impact;
      this.y = this.mybox[i].y - corner_impact;
      swap(this.vx, this.vy);
      this.mybox[i].contact += 1;
    }
    if((this.x < this.mybox[i].x) && (this.mybox[i].x - this.x < corner_impact) && (this.y > this.mybox[i].y + this.mybox[i].t) && (this.y - (this.mybox[i].y + this.mybox[i].t) < corner_impact)){
      this.x = this.mybox[i].x - corner_impact;
      this.y = this.mybox[i].y + this.mybox[i].t + corner_impact;
      swap(this.vx, this.vy);
      this.mybox[i].contact += 1;
    }
    if((this.x > this.mybox[i].x + this.mybox[i].l) && (this.x - (this.mybox[i].x + this.mybox[i].l)< corner_impact) && (this.y < this.mybox[i].y) && (this.mybox[i].y - this.y < corner_impact)){
      this.x = this.mybox[i].x + this.mybox[i].l + corner_impact;
      this.y = this.mybox[i].y - corner_impact;
      swap(this.vx, this.vy);
      this.mybox[i].contact += 1;
    }
    if((this.x > this.mybox[i].x + this.mybox[i].l) && (this.x - (this.mybox[i].x + this.mybox[i].l) < corner_impact) && (this.y > this.mybox[i].y + this.mybox[i].t) && (this.y - (this.mybox[i].y + this.mybox[i].t) < corner_impact)){
      this.x = this.mybox[i].x + this.mybox[i].l + corner_impact;
      this.y = this.mybox[i].y + this.mybox[i].t + corner_impact;
      swap(this.vx, this.vy);
      this.mybox[i].contact += 1;
    }
    }
}
  
  void swap(float x, float y){
    float temp = 0;
    temp = x;
    x = y;
    y = temp;
  }
  

  
  
  void draw(){      
     
     fill(255);
     ellipse(this.x, this.y, this.r, this.r);
  }
}
 


