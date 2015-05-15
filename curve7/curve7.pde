PVector c, p1, p2;
float aMin, aMax, r, t;

void setup() {
  size(600, 600);
  noFill();
  reset();
}

void draw() {
  background(255);

  // The center
  stroke(128);
  ellipse(c.x, c.y, 10, 10);

  // The random points
  stroke(255, 0, 0);
  ellipse(p1.x, p1.y, 10, 10);
  ellipse(p2.x, p2.y, 10, 10);

  // Interpolate between aMin and aMax
  float ta = aMin+t*(aMax-aMin);
  arc(c.x, c.y, r*2, r*2, aMin, ta);

  if (t < 1.0) t += 0.01;
  else t = 1.0;
}

void mousePressed() {
  reset();
}

void reset() {
  // Make two random points
  p1 = new PVector(random(width), random(height));
  p2 = new PVector(random(width), random(height));

  // Find the center
  c = new PVector((p1.x+p2.x)/2, (p1.y+p2.y)/2);

  // Determine the radius
  r = sqrt(sq(c.x-p1.x)+sq(c.y-p1.y));

  // I'm going to draw a clockwise arc()
  // so I want to know the min and max angle
  float a1 = atan2(p1.y-c.y, p1.x-c.x);
  if (a1 < 0) a1 = map(a1, -PI, 0, PI, TWO_PI);

  float a2 = atan2(p2.y-c.y, p2.x-c.x);
  if (a2 < 0) a2 = map(a2, -PI, 0, PI, TWO_PI);

  aMin = min(a1, a2);
  aMax = max(a1, a2);

  // Reset Parametric t
  t = 0;
}
