void game(){
    switch(set_no){
      case 1 : start_game();
        break;
      case 2 : ready();
        break;
      case 3 : draw_game();
        break;
      case 4 : finish();  
    }
}
void start_game(){
  
  int offsetX = width/2;
  int offsetY = height/5*2;
  textAlign(CENTER);
  fill(255);
  textFont(font1, 70);
  text("A R K A N O I D", offsetX, offsetY);
  textFont(font2, 20);
  text("copyright JI Park, 2012", offsetX, height-20);
  textFont(font2, 30);
  text("Press any key to start game", offsetX, offsetY + 120);
  if(keyPressed)
    set_no = 2;
  
}


void ready(){
    
    fill(0);
    rect(0,0,width,height);
    int offsetX = width/2;
    int offsetY = height/2;
    textAlign(CENTER);
    fill(255);
    textFont(font1, 50);
    text("R E A D Y", offsetX, offsetY);
    i += 1;
    if(i >= 70){
      i = 100;
      set_no = 3;
    } 
}


void init_game(){

    box = new Box[box_count];
    for(int i = 0; i < box_count; i++)
      box[i] = new Box();
    ball = new Ball();
    
}
void draw_game(){

    fill(0);
    rect(0,0,width,height);
    fill(255);
    textAlign(RIGHT);
    textFont(font2, 20);
    text("Life : " + life_count , width - 50 , height - 20);
    
    if(life_count <= 0)
      set_no = 4;
    for(int p = 0; p < box_row; p++){
      for(int q = 0; q < box_column; q++)
      {
        box[p*box_column + q].x = box[p*box_column + q].l * q;
        box[p*box_column + q].y = box[p*box_column + q].t * p;
      }
    }
    
    ball.draw();
    bar_draw();
    for(int p = 0; p < box_row; p++){
      for(int q = 0; q < box_column; q++)
      {
        box[p*box_column + q].draw();
      }
     
    }
    ball.move();
    
    int is_cleared = 0;
    for(int i = 0; i < box_count; i++)
    {
      is_cleared += box[i].l;
    }
    if(is_cleared <= 0){
      fill(0);
      rect(0,0,width,height);
      textAlign(CENTER);
      fill(255);
      textFont(font1, 50);
      text("C L E A R !", width/2, height/2);
      noLoop();
    }    
}
     
    


void finish(){
  fill(0);
  rect(0,0,width,height);
  textAlign(CENTER);
    fill(255);
    textFont(font1, 50);
    text("G A M E  O V E R", width/2, height/2);
         
}
  
