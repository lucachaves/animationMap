int centerX = 0, centerY = 0, offsetX = 0, offsetY = 0;
float zoom = (float) 1.5;
PImage map;
float beginX = (float) 428.0;  // Initial x-coordinate
float beginY = (float) 218.0;  // Initial y-coordinate
float endX = (float) 570.0;   // Final x-coordinate
float endY = (float) 320.0;   // Final y-coordinate
float distX;          // X-axis distance to move
float distY;          // Y-axis distance to move
float exponent = 71;   // Determines the curve
float x = (float) 0.0;        // Current x-coordinate
float y = (float) 0.0;        // Current y-coordinate
float step = (float) 0.01;    // Size of each step along the path
float pct = (float) 0.0;      // Percentage traveled (0.0 to 1.0)
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
int resolution=100;
int increment=0;
public void setup()
{
  size(1024, 709);
  noStroke();
  //String[] lines = loadStrings("Indigo Flights.tsv");
  //PVectors
  Delhi = new PVector(428, 218);
  Mumbai = new PVector(169, 310);
  Chennai = new PVector(219, 437);
  v1 = new PVector(random(-2, 2), random(-2, 2));
  map = loadImage("map2.jpg");
  distX = endX - beginX;
  distY = endY - beginY;
  //clock
  int radius = min(width, height) / 12;
  secondsRadius = (float) (radius * 0.72);
  minutesRadius = (float) (radius * 0.60);
  hoursRadius   = (float) (radius * 0.50);
  clockDiameter = (float) (radius * 1.2);
  cx = (width + 10550) / 12;
  cy = height / 12;
}
public void draw()
{
  fill(127, 80);
  rect(0, 0, width, height);
  fill(0);
  //strokeWeight(2);
  //image(map, 0 ,0);
  clock();
  display();
}
public void mousePressed()
{
  increment=0;
  pct = (float) 0.0;
  beginX = x;
  beginY = y;
  endX = mouseX;
  endY = mouseY;
  distX = endX - beginX;
  distY = endY - beginY;
  System.out.println("Inicio: "+beginX+", "+beginY);
  System.out.println("Fim: "+endX+", "+endY);
  System.out.println("(" + (float)(mouseX/width) + "," + (float)(mouseY/height) + ")");
}
public void display()
{
  stroke(0);
  for (int i=0; i<increment;i++)
  {
    float t1 = i / (float)resolution;
    float t2 = (i+1)/ (float)resolution;
//    float x1 = curvePoint(beginX-640, beginX, endX, endX-40, t1);
    float x1 = curvePoint(beginX-640, beginX, endX, endX-640, t1);
    float y1 = curvePoint(beginY-140, beginY, endY, endY-40, t1);
//    float x2 = curvePoint(beginX-640, beginX, endX, endX-40, t2);
    float x2 = curvePoint(beginX-640, beginX, endX, endX-640, t2);
    float y2 = curvePoint(beginY-140, beginY, endY, endY-40, t2);
    line(x1, y1, x2, y2);
  }
  if (increment<=resolution)
  {
    float t1 = increment / (float)resolution;
    float t2 = (increment+1)/ (float)resolution;
    float x1 = curvePoint(beginX-40, beginX, endX, endX-40, t1);
    float y1 = curvePoint(beginY-40, beginY, endY, endY-40, t1);
    float x2 = curvePoint(beginX-40, beginX, endX, endX-40, t2);
    float y2 = curvePoint(beginY-40, beginY, endY, endY-40, t2);
    pct=t2;
    x=x2;
    y=y2;
    increment++;
    line(x1, y1, x2, y2);
  }
  //ellipse(x, y, 10, 10);
}
public void clock()
{
  fill(21, 37, 193);
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
  for (int a = 0; a < 360; a+=6)
  {
    float angle = radians(a);
    float x = cx + cos(angle) * secondsRadius;
    float y = cy + sin(angle) * secondsRadius;
    vertex(x, y);
  }
  endShape();
}
