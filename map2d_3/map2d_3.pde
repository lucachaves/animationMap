import peasy.*;
import de.fhpotsdam.unfolding.*;
import de.fhpotsdam.unfolding.geo.*;
import de.fhpotsdam.unfolding.utils.*;  

PeasyCam cam;
UnfoldingMap map;
PImage worldMapImage;
PeasyDragHandler PanDragHandler;
PeasyDragHandler ZoomDragHandler;
PeasyDragHandler RotateDragHandler;

void setup() {
  size(900,500,OPENGL);
  noStroke();
  
//  cam = new PeasyCam(this, 400, 300, 400, 50);
//  cam = new PeasyCam(this, 800, 500, 0, 0);
//  cam.setMinimumDistance(800);
//  cam.setMaximumDistance(3000);
//  cam.setRotations(-1.0120627, 0.21060975, -0.10038537);
//  PanDragHandler = cam.getPanDragHandler();
//  ZoomDragHandler = cam.getZoomDragHandler();
//  RotateDragHandler = cam.getRotateDragHandler();
  
   //MAPPING MOUSE HANDLERS
//  cam.setLeftDragHandler(PanDragHandler); //left mousepress to pan
//  cam.setRightDragHandler(RotateDragHandler); //right mousepress to rotate
  
  map = new UnfoldingMap(this, 0, 0, width, height);
  MapUtils.createDefaultEventDispatcher(this, map);
  map.zoomAndPanTo(new Location(0f, 0f), 2);
  
//  worldMapImage = loadImage("../data/ui/mapbox.light.world.png"); 
  
//  cam.lookAt(642.35724, -79.86721, -143.15086, 3000);
}
void draw() {
//  directionalLight(166, 166, 196, -60, -60, -60);
  background(0);
  map.draw();

//  image(worldMapImage, 0, 0, width, height);
//  noStroke();

//  cam.beginHUD();
//  cam.endHUD();
}

public void keyPressed() {
  if (key == '1') {
    map.zoomLevelIn();
  }
  if (key == '2') {
    map.zoomLevelOut();
  }
}
