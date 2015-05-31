//float x = 400;
//float y = 400;
//float a = 100;
//float b = 200;

void setup(){
  size(1000,800,P3D);
}


void show(float x, float y, float a, float b, float slant){
  //x = a*cos(t)    
  //y = b*sin(t)
  ellipse(x,y,2,2);
  line(x-a,y,x+a,y);
  float r1 = radians(1);
  for (float i = radians(0); i < radians(360); i+=r1) {
    float x1 = (float)(a*Math.cos(i)+x);
    float y1 = (float)(-b*Math.sin(i)+y);
    float x2 = (float)(a*Math.cos(i+r1)+x);
    float y2 = (float)(-b*Math.sin(i+r1)+y);
  //  if(i == 0)
  //    println(x1,y1,x2,y2);
    line(x1,y1,x2,y2);
  }
  
  //(10,-2) 100-2=98
  //(15,-4) 100-4=96
  //(20,-7) 100-7=93
  //(30,-12) 100-12=88
  //(40,-20) 100-20=80
  //(50,-30) 100-30=70
  //(60,-45) 100-45=55
//  println(Math.pow(Math.pow(12,1/30f),slant));
  int diff = (int)Math.ceil(Math.pow(Math.pow(12,1/30f),Math.abs(slant)));
  a = 100-diff-9;  
  float slantr = radians(slant);
  //x' = a*cos(t)*cos(theta) - b*sin(t)*sin(theta) 
  //y' = a*cos(t)*sin(theta) + b*sin(t)*cos(theta)
  for (float i = 0; i < 360; i++) {
    float ir = radians(i);
    float ir2 = radians(i+1); 
    float x1 = (float)(a*Math.cos(ir)*Math.cos(slantr)-
                         b*Math.sin(ir)*Math.sin(slantr)+
                         x);
    float y1 = (float)(a*Math.cos(ir)*Math.sin(slantr)+
                         b*Math.sin(ir)*Math.cos(slantr)+
                         y);
    float x2 = (float)(a*Math.cos(ir2)*Math.cos(slantr)-
                         b*Math.sin(ir2)*Math.sin(slantr)+
                         x);
    float y2 = (float)(a*Math.cos(ir2)*Math.sin(slantr)+
                         b*Math.sin(ir2)*Math.cos(slantr)+
                         y);
  //  if(i == 0)
  //    println(x1,y1,x2,y2);
    line(x1,y1,x2,y2);
  }
}

void draw(){
//  show(700,400, 100, 200, -30);
//  show(700,400, 100, 200, 0);
//  show(700,400, 100, 200, 10);
//  show(700,400, 100, 200, 15);
//  show(700,400, 100, 200, 20);
//  show(700,400, 100, 200, 30);
  
  show(400,400, 90, 200, -30);
  show(400,400, 90, 200, 0);
  show(400,400, 90, 200, 10);
  show(400,400, 90, 200, 15);
  show(400,400, 90, 200, 20);
  show(400,400, 90, 200, 30);
}
