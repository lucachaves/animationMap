//http://forum.processing.org/one/topic/animation-with-curve.html

PImage map;
MercatorMap mercatorMap;

float distY;
float distX;
int increment=0;
int resolution=200;
float pct = (float) 0.0;
float x = (float) 0.0;
float y = (float) 0.0;
int step = 60;

void setup(){
  size( 1200, 1000, P3D );
  
  map = loadImage("../data/ui/mapbox.light.world.png");
  
  float lon1 = -180.0;
  float lat1 = -85.0;
  float lon2 = 180.0;
  float lat2 = 85.0;
  
  mercatorMap = new MercatorMap(1200, 1000, lat2, lat1, lon1, lon2);
}

void draw(){
  image(map, 0 ,0);
//  myCurve(
//    mercatorMap.getScreenLocation(new PVector(-15.7833f, -47.8667f)),
//    mercatorMap.getScreenLocation(new PVector(38.7f, -9.1833f))
//  );
  myCurve2(
    mercatorMap.getScreenLocation(new PVector(-15.7833f, -47.8667f)),
    mercatorMap.getScreenLocation(new PVector(38.7f, -9.1833f))
  );
}

void myCurve (PVector firstpoint, PVector secondpoint) {
  PVector beginningcontrolpoint = new PVector (0, firstpoint.y+1000, 0);
  PVector endingcontrolpoint = new PVector (0, secondpoint.y+1000, 0);
  stroke (0);
  noFill();
  curve(
    beginningcontrolpoint.x, 
    beginningcontrolpoint.y, 
    beginningcontrolpoint.z,
    firstpoint.x+5, 
    firstpoint.y, 
    firstpoint.z,
    secondpoint.x+5, 
    secondpoint.y, 
    secondpoint.z,
    endingcontrolpoint.x, 
    endingcontrolpoint.y, 
    endingcontrolpoint.z
   );
}

void myCurve2 (PVector firstpoint, PVector secondpoint) {
  float beginX = firstpoint.x;
  float beginY = firstpoint.y;
  float endX = secondpoint.x;
  float endY = secondpoint.y;
  
  distX = endX - beginX;
  distY = endY - beginY;
  
  stroke(0);
  if (increment<=resolution+step){
    increment++;
    int endValue = (increment > resolution)? resolution : increment;
    int startValue = (increment-step)<0 ? 0 : increment-step; 
    
    //curve
//    for (int i=0; i<increment;i++){
    for (int i=startValue; i<endValue;i++){
      float t1 = i / (float)resolution;
      float t2 = (i+1)/ (float)resolution;
      float x1 = curvePoint(beginX-640, beginX, endX, endX-640, t1);
      float y1 = curvePoint(beginY-140, beginY, endY, endY-40, t1);
      float x2 = curvePoint(beginX-640, beginX, endX, endX-640, t2);
      float y2 = curvePoint(beginY-140, beginY, endY, endY-40, t2);
      line(x1+6, y1, x2+6, y2);
    }
    
    //point
//    float t1 = increment / (float)resolution;
//    float t2 = (increment+1)/ (float)resolution;
//    float x1 = curvePoint(beginX-40, beginX, endX, endX-40, t1);
//    float y1 = curvePoint(beginY-40, beginY, endY, endY-40, t1);
//    float x2 = curvePoint(beginX-40, beginX, endX, endX-40, t2);
//    float y2 = curvePoint(beginY-40, beginY, endY, endY-40, t2);
//    line(x1, y1, x2, y2);
  }
}


