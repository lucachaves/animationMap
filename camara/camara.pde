import processing.opengl.*;
import java.awt.event.*;
 
PVector position = new PVector(450, 450);
PVector movement = new PVector();
PVector rotation = new PVector();
PVector velocity = new PVector();
float rotationSpeed = 0.035;
float movementSpeed = 0.05;
float scaleSpeed = 0.25;
float fScale = 2;
 
void setup() {
  size(900, 900, OPENGL);
  stroke(255, 255, 0);
  strokeWeight(2);
  fill(150, 200, 250);
  addMouseWheelListener(new MouseWheelListener() {
    public void mouseWheelMoved(MouseWheelEvent mwe) {
      mouseWheel(mwe.getWheelRotation());
  }});
}
 
void draw() {
  if (mousePressed) {
    if (mouseButton==LEFT) velocity.add( (pmouseY-mouseY) * 0.01, (mouseX-pmouseX) * 0.01, 0);
    if (mouseButton==RIGHT) movement.add( (mouseX-pmouseX) * movementSpeed, (mouseY-pmouseY) * movementSpeed, 0);
  }
  velocity.mult(0.95);
  rotation.add(velocity);
  movement.mult(0.95);
  position.add(movement);
 
  background(0);
  lights();
 
  translate(position.x, position.y, position.z);
  rotateX(rotation.x*rotationSpeed);
  rotateY(rotation.y*rotationSpeed);
  scale(fScale);
 
  box(90);
  line(-100, 0, 0, 100, 0, 0);
  line(0, -100, 0, 0, 100, 0);
  line(0, 0, -100, 0, 0, 100);
}
 
void mouseWheel(int delta) {
  fScale -= delta * scaleSpeed;
  fScale = max(0.5, fScale);
}
