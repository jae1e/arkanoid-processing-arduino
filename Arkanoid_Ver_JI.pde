import cc.arduino.*;

import processing.serial.*;

Arduino my_arduino;

void setup(){
  
  size(700,700);
  my_arduino = new Arduino(this, Arduino.list()[1] , 57600);
  my_arduino.pinMode(13, Arduino.OUTPUT);
  
  background(0);
  frameRate(120);
  smooth();
  font1 = loadFont("Georgia-24.vlw");
  font2 = loadFont("Verdana-10.vlw");
  noStroke();
  init_game();
  
}

void draw(){
  my_arduino.digitalWrite(13, Arduino.HIGH);
  float value = my_arduino.analogRead(0)/4;
  bar_x = value/256*(705-bar_l);
  //println(bar_x);
  
  
    

  game();
  println(d_x);
  p_x = bar_x;
}


