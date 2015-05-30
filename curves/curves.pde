size(1000,500,P3D);

//rotateX(radians(40));
int xo = 100;
int xe = 300;
int yo = 250;
int ye = 250;
float xr = (xo+xe)/2;
float yr = (yo+ye)/2;
float radius = dist(xo, yo, xe, ye)/2;

float x0 = (float)Math.cos(radians(120))*radius+xr;
float x1 = xo;
float x2 = (float)-Math.cos(radians(120))*radius+xr;
float x3 = xr;
float x4 = (float)-Math.cos(radians(60))*radius+xr;
float x5 = xe;
float x6 = (float)Math.cos(radians(60))*radius+xr;
float y0 = (float)Math.sin(radians(60))*radius+yr;
float y1 = yo;
float y2 = (float)-Math.sin(radians(60))*radius+yr;
float y3 = yr-radius;
float y4 = (float)-Math.sin(radians(120))*radius+yr;
float y5 = ye;
float y6 = (float)Math.sin(radians(120))*radius+yr;

//ellipse(x0, y0, 10, 10);
//ellipse(x1, y1, 10, 10);
//ellipse(x2, y2, 10, 10);
//ellipse(x3, y3, 10, 10);
//ellipse(x4, y4, 10, 10);
//ellipse(x5, y5, 10, 10);
//ellipse(x6, y6, 10, 10);

//noFill();
//arc(xr, yr, radius*2, radius*2, PI, TWO_PI);

//bezier
//bezier(x1, y1, x1, y1-1.3*radius, x5, y5-1.3*radius, x5, y5);
//bezier(x1, y1, x1, y1-4*radius, x5, y5-4*radius, x5, y5);

//torus

//line
//rotateX(radians(-40));
//rotateY(radians(-40));
//translate(300,200);
//scale(0.5f);
//xo = 100;
//xe = 300;
//yo = 250;
//ye = 400;
//ellipse(xo, yo, 10, 10);
//ellipse(xe, ye, 10, 10);
//float degree = 0;
//if((ye>yo && xe<xo)||(ye<yo && xe>xo))
//  degree = (float)+Math.toDegrees(Math.atan(Math.abs((ye-yo)/(float)(xe-xo))));
//else if((ye>yo && xe>xo)||(ye<yo && xe<xo))
//  degree = (float)-Math.toDegrees(Math.atan(Math.abs((ye-yo)/(float)(xe-xo))));
//else if(ye == yo)
//  degree = 0;
//radius = dist(xo, yo, xe, ye)/2;
//xr = (xo+xe)/2;
//yr = (yo+ye)/2;
//for (float i = 180-degree; i < 360-degree; i++) {
//  x1 = (float)(Math.cos(radians(i))*radius+xr);
//  y1 = (float)(0.9*Math.sin(radians(i))*radius+yr);
//  x2 = (float)(Math.cos(radians(i+1))*radius+xr);
//  y2 = (float)(0.9*Math.sin(radians(i+1))*radius+yr);
//  line(x1,y1,x2,y2);
//}
//
//xo = 500;
//xe = 300;
//yo = 200;
//ye = 400;
//ellipse(xo, yo, 10, 10);
//ellipse(xe, ye, 10, 10);
//degree = 0;
//if((ye>yo && xe<xo)||(ye<yo && xe>xo))
//  degree = (float)+Math.toDegrees(Math.atan(Math.abs((ye-yo)/(float)(xe-xo))));
//else if((ye>yo && xe>xo)||(ye<yo && xe<xo))
//  degree = (float)-Math.toDegrees(Math.atan(Math.abs((ye-yo)/(float)(xe-xo))));
//else if(ye == yo)
//  degree = 0;
//radius = dist(xo, yo, xe, ye)/2;
//xr = (xo+xe)/2;
//yr = (yo+ye)/2;
//for (float i = 180-degree; i < 360-degree; i++) {
//  x1 = (float)(Math.cos(radians(i))*radius+xr);
//  y1 = (float)(0.9*Math.sin(radians(i))*radius+yr);
//  x2 = (float)(Math.cos(radians(i+1))*radius+xr);
//  y2 = (float)(0.9*Math.sin(radians(i+1))*radius+yr);
//  line(x1,y1,x2,y2);
//}

//curve(x1, y1, x2, y2, x3, y3, x4, y4);
//curve(x0, y0, x1, y1, x5, y5, x6, y6);

//noFill();
//beginShape();
//  curveVertex(x0, y0);
//  curveVertex(x1, y1);
//  curveVertex(x2, y2);
//  curveVertex(x3, y3);
//  curveVertex(x4, y4);
//  curveVertex(x5, y5);
//  curveVertex(x6, y6);
//endShape();

//int steps = 6;
//for (int i = 0; i <= steps; i++) {
//  float t = i / float(steps);
//  float x = curvePoint(x1, x2, x3, x4, t);
//  float y = curvePoint(y1, y2, y3, y4, t);
//  ellipse(x, y, 5, 5);
//}
