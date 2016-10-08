PFont font1;
PFont font2;
int set_no = 1;
int i = 0;
int game_speed = 5;
int start_key = 0;
int life_count = 3;
int p = 0;

float p_x = 0;
float d_x = 0;

float bar_y = 630;
float bar_l = 100;
float bar_x = 350 - bar_l/2;
float bar_t = bar_l/10;
float bar_v = 15;


Ball ball;
Box[] box;
int box_row = 7;
int box_column = 9;
int box_count = box_row * box_column;
