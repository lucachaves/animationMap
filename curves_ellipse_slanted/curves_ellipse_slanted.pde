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
  
  //(10,)
  //(15,-4)
  //(20,)
  //(30,-12)
  //(40,-20)
  //()
  a = 88;  
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
  show(400,400, 100, 200, 30);
  show(700,400, 100, 200, -30);
}


//x = 400;
//a = 100;
//ellipse(x,y,2,2);
//line(x-a,y,x+a,y);
//r1 = radians(1);
//for (float i = radians(0); i < radians(360); i+=r1) {
//  float x1 = (float)(a*Math.cos(i)+x);
//  float y1 = (float)(-b*Math.sin(i)+y);
//  float x2 = (float)(a*Math.cos(i+r1)+x);
//  float y2 = (float)(-b*Math.sin(i+r1)+y);
////  if(i == 0)
////    println(x1,y1,x2,y2);
//  line(x1,y1,x2,y2);
//}
//
//slant = 15;
//slantr = radians(slant);
//a = 96; //-4
//for (float i = 0; i < 360; i++) {
//  float ir = radians(i);
//  float ir2 = radians(i+1); 
//  float x1 = (float)(a*Math.cos(ir)*Math.cos(slantr)-
//                       b*Math.sin(ir)*Math.sin(slantr)+
//                       x);
//  float y1 = (float)(a*Math.cos(ir)*Math.sin(slantr)+
//                       b*Math.sin(ir)*Math.cos(slantr)+
//                       y);
//  float x2 = (float)(a*Math.cos(ir2)*Math.cos(slantr)-
//                       b*Math.sin(ir2)*Math.sin(slantr)+
//                       x);
//  float y2 = (float)(a*Math.cos(ir2)*Math.sin(slantr)+
//                       b*Math.sin(ir2)*Math.cos(slantr)+
//                       y);
////  if(i == 0)
////    println(x1,y1,x2,y2);
//  line(x1,y1,x2,y2);
//}
//
//
//
//x = 400;
//a = 100;
//ellipse(x,y,2,2);
//line(x-a,y,x+a,y);
//r1 = radians(1);
//for (float i = radians(0); i < radians(360); i+=r1) {
//  float x1 = (float)(a*Math.cos(i)+x);
//  float y1 = (float)(-b*Math.sin(i)+y);
//  float x2 = (float)(a*Math.cos(i+r1)+x);
//  float y2 = (float)(-b*Math.sin(i+r1)+y);
////  if(i == 0)
////    println(x1,y1,x2,y2);
//  line(x1,y1,x2,y2);
//}
//
//slant = 40;
//slantr = radians(slant);
//a = 80; //-20
//for (float i = 0; i < 360; i++) {
//  float ir = radians(i);
//  float ir2 = radians(i+1); 
//  float x1 = (float)(a*Math.cos(ir)*Math.cos(slantr)-
//                       b*Math.sin(ir)*Math.sin(slantr)+
//                       x);
//  float y1 = (float)(a*Math.cos(ir)*Math.sin(slantr)+
//                       b*Math.sin(ir)*Math.cos(slantr)+
//                       y);
//  float x2 = (float)(a*Math.cos(ir2)*Math.cos(slantr)-
//                       b*Math.sin(ir2)*Math.sin(slantr)+
//                       x);
//  float y2 = (float)(a*Math.cos(ir2)*Math.sin(slantr)+
//                       b*Math.sin(ir2)*Math.cos(slantr)+
//                       y);
////  if(i == 0)
////    println(x1,y1,x2,y2);
//  line(x1,y1,x2,y2);
//}
//
//
//
//
//x = 400;
//a = 100;
//ellipse(x,y,2,2);
//line(x-a,y,x+a,y);
//r1 = radians(1);
//for (float i = radians(0); i < radians(360); i+=r1) {
//  float x1 = (float)(a*Math.cos(i)+x);
//  float y1 = (float)(-b*Math.sin(i)+y);
//  float x2 = (float)(a*Math.cos(i+r1)+x);
//  float y2 = (float)(-b*Math.sin(i+r1)+y);
////  if(i == 0)
////    println(x1,y1,x2,y2);
//  line(x1,y1,x2,y2);
//}
//
//slant = -40;
//slantr = radians(slant);
//a = 80; //-20
//for (float i = 0; i < 360; i++) {
//  float ir = radians(i);
//  float ir2 = radians(i+1); 
//  float x1 = (float)(a*Math.cos(ir)*Math.cos(slantr)-
//                       b*Math.sin(ir)*Math.sin(slantr)+
//                       x);
//  float y1 = (float)(a*Math.cos(ir)*Math.sin(slantr)+
//                       b*Math.sin(ir)*Math.cos(slantr)+
//                       y);
//  float x2 = (float)(a*Math.cos(ir2)*Math.cos(slantr)-
//                       b*Math.sin(ir2)*Math.sin(slantr)+
//                       x);
//  float y2 = (float)(a*Math.cos(ir2)*Math.sin(slantr)+
//                       b*Math.sin(ir2)*Math.cos(slantr)+
//                       y);
////  if(i == 0)
////    println(x1,y1,x2,y2);
//  line(x1,y1,x2,y2);
//}
