//http://forum.processing.org/one/topic/animation-with-curve.html

PImage map;

void setup()
{
  size( 1200, 1000, P3D );
  map = loadImage("../data/ui/mapbox.light.world.png");
} // setup
void draw()
{
  image(map, 0 ,0);
  // myCurveTest() ;
  PVector firstpoint = new PVector (120, 320, 30);
  PVector secondpoint = new PVector (320, 220, 30);
  myCurve (firstpoint, secondpoint ) ;
  firstpoint = new PVector (420, 220, 30);
  secondpoint = new PVector (620, 120, 30);
  myCurve (firstpoint, secondpoint ) ;
}
void myCurve (
PVector firstpoint,
PVector secondpoint) {
  //x1   float: coordinates for the beginning control point
  //y1   float: coordinates for the beginning control point
    //x2   float: coordinates for the first point
  //y2   float: coordinates for the first point
    //x3   float: coordinates for the second point
  //y3   float: coordinates for the second point
    //x4   float: coordinates for the ending control point
  //y4   float: coordinates for the ending control point
    //z1   float: coordinates for the beginning control point
  //z2   float: coordinates for the first point
  //z3   float: coordinates for the second point
  //z4   float: coordinates for the ending control point
    PVector beginningcontrolpoint = new PVector (120, firstpoint.y+1200, -30);
  PVector endingcontrolpoint = new PVector (720, secondpoint.y+1200, -30);
//  myPointPVector(beginningcontrolpoint, color(255, 0, 0));
//  myPointPVector(firstpoint, color(0, 0, 255)); 
//  myPointPVector(secondpoint, color(0, 0, 255)); 
//  myPointPVector(endingcontrolpoint, color(255, 0, 0));
//  stroke (255);
  stroke (0);
  noFill();
  curve(
  beginningcontrolpoint.x, beginningcontrolpoint.y, beginningcontrolpoint.z,
  firstpoint.x, firstpoint.y, firstpoint.z,
  secondpoint.x, secondpoint.y, secondpoint.z,
  endingcontrolpoint.x, endingcontrolpoint.y, endingcontrolpoint.z);
}
void myCurveTest () {
  //x1   float: coordinates for the beginning control point
  //y1   float: coordinates for the beginning control point
    //x2   float: coordinates for the first point
  //y2   float: coordinates for the first point
    //x3   float: coordinates for the second point
  //y3   float: coordinates for the second point
    //x4   float: coordinates for the ending control point
  //y4   float: coordinates for the ending control point
    //z1   float: coordinates for the beginning control point
  //z2   float: coordinates for the first point
  //z3   float: coordinates for the second point
  //z4   float: coordinates for the ending control point
    PVector beginningcontrolpoint = new PVector (120, 620, -30);
  PVector firstpoint = new PVector (120, 320, -30);
  PVector secondpoint = new PVector (320, 220, -30);
  PVector endingcontrolpoint = new PVector (720, 720, -30);
  myPointPVector(beginningcontrolpoint, color(255, 0, 0));
  myPointPVector(firstpoint, color(0, 0, 255)); 
  myPointPVector(secondpoint, color(0, 0, 255)); 
  myPointPVector(endingcontrolpoint, color(255, 0, 0));
  stroke (255);
  noFill();
  curve(
  beginningcontrolpoint.x, beginningcontrolpoint.y, beginningcontrolpoint.z,
  firstpoint.x, firstpoint.y, firstpoint.z,
  secondpoint.x, secondpoint.y, secondpoint.z,
  endingcontrolpoint.x, endingcontrolpoint.y, endingcontrolpoint.z);
}
void myPointPVector (PVector test, color col1) {
  MyBox(test.x, test.y, test.z,
  test.x+3, test.y, test.z,
  9,
  col1);
}
void MyBox(float x1, float y1, float z1, float x2, float y2, float z2, float weight, color strokeColour)
// was called drawLine; programmed by James Carruthers
// see http://processing.org/discourse/yabb2/YaBB.pl?num=1262458611/0#9
{
  PVector p1 = new PVector(x1, y1, z1);
  PVector p2 = new PVector(x2, y2, z2);
  PVector v1 = new PVector(x2-x1, y2-y1, z2-z1);
  float rho = sqrt(pow(v1.x, 2)+pow(v1.y, 2)+pow(v1.z, 2));
  float phi = acos(v1.z/rho);
  float the = atan2(v1.y, v1.x);
  v1.mult(0.5);
  pushMatrix();
  translate(x1, y1, z1);
  translate(v1.x, v1.y, v1.z);
  rotateZ(the);
  rotateY(phi);
  noStroke();
  fill(strokeColour);
  box(weight, weight, p1.dist(p2)*1.2);
  popMatrix();
}
