//float x = 400;
//float y = 400;
//float a = 100;
//float b = 200;

int i = 0;

void setup(){
  size(1000,800,P3D);
}


void show(float x, float y, float a, float b, float slant, float a2){
  
  //x = a*cos(t)    
  //y = b*sin(t)
  ellipse(x,y,2,2);
//  line(x-a,y,x+a,y);
  float r1 = radians(1);
  for (float i = radians(0); i < radians(180-1); i+=r1) {
    float x1 = (float)(a*Math.cos(i)+x);
    float y1 = (float)(-b*Math.sin(i)+y);
    float x2 = (float)(a*Math.cos(i+r1)+x);
    float y2 = (float)(-b*Math.sin(i+r1)+y);
//    if(i == 0)
//      println(x1,y1,x2,y2);
    line(x1,y1,x2,y2);
  }
  
  //a = 100
  //(10,-2) 100-2=98
  //(15,-4) 100-4=96
  //(20,-7) 100-7=93
  //(30,-12) 100-12=88
  //(40,-20) 100-20=80
  //(50,-30) 100-30=70
  //(60,-45) 100-45=55
//  int diffS = (int)Math.ceil(Math.pow(Math.pow(12,1/30f),Math.abs(slant)));
//  a -= diffS;

//  a = (float)(500/Math.sin(radians(slant)));
//  b = (float)(500/Math.cos(radians(slant)));
//    a = 100;
  a = a2;
  
  float slantr = radians(slant+20);
  //slanted, rotated
  //x' = a*cos(t)*cos(theta) - b*sin(t)*sin(theta) 
  //y' = a*cos(t)*sin(theta) + b*sin(t)*cos(theta)
  for (float i = 0; i <360; i++) {
    float ir = radians(i);
    float ir2 = radians(i+1); 
    float x1 = (float)(a*Math.cos(ir)*Math.cos(slantr)-
                         b*Math.sin(ir)*Math.sin(slantr)+
                         x);
    float y1 = (float)(-(a*Math.cos(ir)*Math.sin(slantr)+
                         b*Math.sin(ir)*Math.cos(slantr))+
                         y);
    float x2 = (float)(a*Math.cos(ir2)*Math.cos(slantr)-
                         b*Math.sin(ir2)*Math.sin(slantr)+
                         x);
    float y2 = (float)(-(a*Math.cos(ir2)*Math.sin(slantr)+
                         b*Math.sin(ir2)*Math.cos(slantr))+
                         y);
  //  if(i == 0)
  //    println(x1,y1,x2,y2);
    if(y2<=y)
      line(x1,y1,x2,y2);
  }
}

void draw(){
  
//  float x = width/2; 
//  float y = height/2;
//  float a = 100;
//  float b = i;
//  int slant = -30;
//  int stop = (int)y;
//  int stop = (int)100-1;
//  float slantr = radians(slant);
//  float ir = radians(30);
//  float x1 = (float)(a*Math.cos(ir)*Math.cos(slantr)+b*Math.sin(ir)*Math.sin(slantr)+x);
//  float y1 = (float)(-(a*Math.cos(ir)*Math.sin(slantr)+b*Math.sin(ir)*Math.cos(slantr))+y);
//  float x2 = (float)(a*Math.cos(ir)+x);
//  float y2 = (float)(-b*Math.sin(ir)+y);
  
//  
//  println(i, b*Math.sin(ir)*Math.sin(slantr), a*Math.cos(ir)*Math.cos(slantr), x1);
//  println(i, /*x1, x2,*/ "     "+(x1-x2));
//  println(i, /*y1, y2,*/ "     "+(y1-y2));
//  println(x,y, a, b, slant);
  
//  delay(100);
//  background(255);
  //  show(width/2,height/2, i, 200, -30);
  
//  show(x , y, a, b, slant);
//  fill(0);
//  ellipse(x1+a,y,5,5);
//  ellipse(x+a,y,5,5);
//  ellipse(x,y1,5,5);
//  ellipse(x,y2,5,5);
  
//  if(i >= stop){
//    i = stop;
//  }else{
//    i++;
//  }

//  show(700,400, 100, 200, -30);
//  show(700,400, 100, 200, 0);
//  show(700,400, 100, 200, 10);
//  show(700,400, 100, 200, 15);
//  show(700,400, 100, 200, 20);
//  show(700,400, 100, 200, 30);  
  
  
  int a  = 150; 
//  show(400,400, a, 100, -30, 153);
//  a  = 200;
//  show(400,400, a, 100, -30, 210);
//  a  = 300; 
//  show(400,400, a, 100, -25, 310);
//  a  = 350; 
//  show(400,400, a, 100, -25, 364);

  a  = 350; 
  show(400,400, a, 100, -25, 364);



//  show(400,400, a, 200, 0);
//  show(400,400, a, 200, 10);
//  show(400,400, a, 200, 15);
//  show(400,400, a, 200, 20);
//  show(400,400, a, 200, 30);
}
