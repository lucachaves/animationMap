float initial_x = -200;// the "width" of parabola, will change the heigth as well...
                        // that may be adjusted below...
float r = 200;// change this to change the height of the parabola bigger lower.
float x =  initial_x;
float y;
float y_offset;
ArrayList<PVector> pts = new ArrayList<PVector>();
float mx = 70, my = -15, tmx, tmy;
boolean animating = false;
PFont f;
PImage map;



void setup() {
  size( 800, 400, P3D);
  background(255);
  smooth();
  f = createFont("Arial", 15);
  textMode(SCREEN);
  map = loadImage("../data/ui/mapbox.light.world.png");
}

void draw() {
  //lights();
  background(255);
  fill(100);
  textFont(f, 15);
  text("drag to orbit", width - 10 - textWidth("drag to orbit"), height -30);
  text("any key to redraw parabola", width - 10 - textWidth("any key to redraw parabola"), height -10);

  //rotate 3d
  translate(width/4, height/2);
  rotateY(radians(mx));
  rotateZ(radians(my));

  // to mark origin and help view 3d
  noFill();
  stroke(100);
  box(20);
  pushMatrix();
  translate(100, 5, -100);
  stroke(200);
  fill(0, 20);
  box(600, 2, 600);
  popMatrix();



  //store y offset
  if (x == initial_x) {
    y_offset = (sq(x)+2*x)/r;
  }

  // stop parabola
  if ( x == initial_x ||  x < -initial_x + 2) {
    x+=2;
    //calc y
    y = (sq(x)+2*x)/r - y_offset;
    animating = true;
    
    // add to curve storage
    //only add a vertex each 3 points or || if the first 
    if (pts.size() > 0 && x > pts.get(pts.size()-1).x +3
        || pts.size() == 0)
      pts.add(new PVector(x, y));
  }
  else {
    animating = false;
  }



  stroke(50, 30, 7);
  noFill();
  strokeWeight(1.5);

  //draw at origin
  translate(-initial_x, 0);



  //draw curve
  beginShape();
  for (PVector p:pts) {
    curveVertex(p.x, p.y);
  }
  endShape();
  strokeWeight(1);
  
  
  //draw a ball
  if (!animating) {
    float ball_x = pts.get(frameCount%pts.size()).x;
    float ball_y = pts.get(frameCount%pts.size()).y;
    translate(ball_x, ball_y);
    noStroke();
    fill(220, 190, 35);
    sphere(4);
  }
}


void mousePressed() {
  tmx = mouseX;
  tmy = mouseY;
}
void mouseDragged() {
  mx = tmx - mouseX;
  my = tmy - mouseY;
}

void keyPressed() {
  x = initial_x;
  pts.clear();
}