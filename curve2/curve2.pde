//http://forum.processing.org/one/topic/animation-with-curve.html

int centerX = 0, centerY = 0, offsetX = 0, offsetY = 0;
float zoom = 1.5;

PImage map;

float beginX = 428.0;  // Initial x-coordinate
float beginY = 218.0;  // Initial y-coordinate
float endX = 570.0;   // Final x-coordinate
float endY = 320.0;   // Final y-coordinate
float distX;          // X-axis distance to move
float distY;          // Y-axis distance to move
float exponent = 7;   // Determines the curve
float x = 0.0;        // Current x-coordinate
float y = 0.0;        // Current y-coordinate
float step = 0.01;    // Size of each step along the path
float pct = 0.0;      // Percentage traveled (0.0 to 1.0)

Table schedule;
Table schedule2;
int rowCount;

//mini clock

int cx, cy;
float secondsRadius;
float minutesRadius;
float hoursRadius;
float clockDiameter;

PVector Delhi, Mumbai, Chennai;
PVector v1, v2, v3;

static final long MILLIS_PER_DAY = 24 * 60 * 60 * 1000;

void setup() 
{
  size(1024, 709);
  noStroke();
 
//  String[] lines = loadStrings("Indigo Flights.tsv");
  
  //PVectors
  Delhi = new PVector(428,218);
  Mumbai = new PVector(169, 310);
  Chennai = new PVector(219, 437);
  
  v1 = new PVector(random(-2,2),random(-2,2));
  
  map = loadImage("../data/ui/mapbox.pirates.world.png");
  distX = endX - beginX;
  distY = endY - beginY;
  
  //clock
  int radius = min(width, height) / 12;
  secondsRadius = radius * 0.72;
  minutesRadius = radius * 0.60;
  hoursRadius   = radius * 0.50;
  clockDiameter = radius * 1.2;
  
  cx = (width + 10550) / 12;
  cy = height / 12;
   
}

void draw() 
{

  fill(127, 80);
  rect(0, 0, width, height);
 //println(mouseX + "mouse y" +  mouseY);
  pct += step;
  if (pct < 1.0) {
    x = beginX + (pct * distX);
    y = beginY + (pow(pct, exponent) * distY);
  }
  fill(0);
  //strokeWeight(2);

  image(map, 0 ,0);
  
  ellipse(x, y, 10, 10);

  
//  clock();
  display();
}

void mousePressed() {
  pct = 0.0;
  beginX = x;
  beginY = y;
  endX = mouseX;
  endY = mouseY;
  distX = endX - beginX;
  distY = endY - beginY;
  
  println("(" + mouseX/float(width) + "," + mouseY/float(height) + ")");

}

void display() {
}

public void clock() {
  fill(21,37,193);
  noStroke();
  
  ellipse(cx, cy, clockDiameter, clockDiameter);

  float s = map(second(), 0, 60, 0, TWO_PI) - HALF_PI;
  float m = map(minute() + norm(second(), 0, 60), 0, 60, 0, TWO_PI) - HALF_PI; 
  float h = map(hour() + norm(minute(), 0, 60), 0, 24, 0, TWO_PI * 2) - HALF_PI;
  
  stroke(255);
  strokeWeight(1);
  line(cx, cy, cx + cos(s) * secondsRadius, cy + sin(s) * secondsRadius);
  strokeWeight(2);
  line(cx, cy, cx + cos(m) * minutesRadius, cy + sin(m) * minutesRadius);
  strokeWeight(4);
  line(cx, cy, cx + cos(h) * hoursRadius, cy + sin(h) * hoursRadius);
  
  // minute
  strokeWeight(2);
  beginShape(POINTS);
  for (int a = 0; a < 360; a+=6) {
    float angle = radians(a);
    float x = cx + cos(angle) * secondsRadius;
    float y = cy + sin(angle) * secondsRadius;
    vertex(x, y);
  }
  endShape();
}
