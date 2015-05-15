//http://forum.processing.org/one/topic/spheres-on-a-3d-map.html

import controlP5.*;
import peasy.*;
import processing.opengl.*;
import de.fhpotsdam.unfolding.*;
import de.fhpotsdam.unfolding.geo.*;
import de.fhpotsdam.unfolding.utils.*;
import de.fhpotsdam.unfolding.providers.*;
import de.fhpotsdam.unfolding.mapdisplay.MapDisplayFactory;

ControlP5 controlP5;

PFont title;

de.fhpotsdam.unfolding.Map map;

ArrayList<Decibel> decibels = new ArrayList<Decibel>();

int timeCheck = 24;
float alti;

PeasyCam cam;
PeasyDragHandler PanDragHandler;
PeasyDragHandler ZoomDragHandler;
PeasyDragHandler RotateDragHandler;

public void setup() {
  size(800, 600, OPENGL);
  noStroke();

  //INITIALIZE FONTS
//  title = loadFont("DINEngschrift-150.vlw");
//  textFont(title);


  //CONTROLP5
  controlP5 = new ControlP5(this);
  controlP5.addButton("0100HRS - 0259HRS", 4, 10, 100, 95, 20).setId(1);
  controlP5.addButton("0300HRS - 0559HRS", 4, 10, 130, 95, 20).setId(2);
  controlP5.addButton("0600HRS - 0859HRS", 4, 10, 160, 95, 20).setId(3);
  controlP5.addButton("0900HRS - 1159HRS", 4, 10, 190, 95, 20).setId(4);
  controlP5.addButton("1200HRS - 1459HRS", 4, 10, 220, 95, 20).setId(5);
  controlP5.addButton("1500HRS - 1759HRS", 4, 10, 250, 95, 20).setId(6);
  controlP5.addButton("1800HRS - 2059HRS", 4, 10, 280, 95, 20).setId(7);
  controlP5.addButton("2100HRS - 2359HRS", 4, 10, 310, 95, 20).setId(8);
  controlP5.addButton("VIEW ALL", 4, 10, 340, 95, 20).setId(9);
  controlP5.setAutoDraw(false);

//  loadData("decibel.txt", true);
  loadData("decibel3.xml", true);
  //loadData("http://sinospheres.com/decibelone_genxml2.php", true);

  //PEASYCAM
  cam = new PeasyCam(this, 1500);
  cam.setMinimumDistance(800);
  cam.setMaximumDistance(3000);
  cam.setRotations(-1.0120627, 0.21060975, -0.10038537);
  PanDragHandler = cam.getPanDragHandler();
  ZoomDragHandler = cam.getZoomDragHandler();
  RotateDragHandler = cam.getRotateDragHandler();

  //MAPPING MOUSE HANDLERS
  cam.setLeftDragHandler(PanDragHandler); //left mousepress to pan
  cam.setRightDragHandler(RotateDragHandler); //right mousepress to rotate

  //DRAWING MAP
  map = new de.fhpotsdam.unfolding.Map(this);
//  map = new de.fhpotsdam.unfolding.Map(this, -700, -400, 2500, 1500, new OpenStreetMap.CloudmadeProvider(MapDisplayFactory.OSM_API_KEY, 61030));
  map.setTweening(true);
  map.zoomAndPanTo(new Location(1.36f, 103.8f), 13);

  cam.lookAt(642.35724, -79.86721, -143.15086, 3000);//cam first look
}


public void draw() {

  //  println((cam.getLookAt()));

  directionalLight(166, 166, 196, -60, -60, -60);
  background(0);
  map.draw();

  for (Decibel d:decibels) {
    float pos[] = map.getScreenPositionFromLocation(d.loc);
    drawEllipse(pos[0], pos[1], d.altitude*0.15);
    println(pos[0], pos[1], d.altitude*0.15);
    if (timeCheck == 24) {
      pos = map.getScreenPositionFromLocation(d.loc);
  //    drawEarthquakeMarker(pos[0], pos[1], d.altitude*0.15);
      drawEllipse(pos[0], pos[1], d.altitude*0.15);

    }
    else if (timeCheck >= 0 && timeCheck <= 2) {
      if (d.currTime >= 0 && d.currTime <=2) {
        pos = map.getScreenPositionFromLocation(d.loc);
//        drawEarthquakeMarker(pos[0], pos[1], d.altitude*0.15);
        drawEllipse(pos[0], pos[1], d.altitude*0.15);
      }
    }
    else if (timeCheck >= 3 && timeCheck <= 5) {
      if (d.currTime >= 3 && d.currTime <=5) {
        pos = map.getScreenPositionFromLocation(d.loc);
//        drawEarthquakeMarker(pos[0], pos[1], d.altitude*0.15);
        drawEllipse(pos[0], pos[1], d.altitude*0.15);
      }
    }
    else if (timeCheck >= 6 && timeCheck <= 8) {
      if (d.currTime >= 6 && d.currTime <=8) {
        pos = map.getScreenPositionFromLocation(d.loc);
//        drawEarthquakeMarker(pos[0], pos[1], d.altitude*0.15);
        drawEllipse(pos[0], pos[1], d.altitude*0.15);
      }
    }
    else if (timeCheck >= 9 && timeCheck <= 11) {
      if (d.currTime >= 9 && d.currTime <=11) {
        pos = map.getScreenPositionFromLocation(d.loc);
//        drawEarthquakeMarker(pos[0], pos[1], d.altitude*0.15);
        drawEllipse(pos[0], pos[1], d.altitude*0.15);
      }
    }
    else if (timeCheck >= 12 && timeCheck <= 14) {
      if (d.currTime >= 12 && d.currTime <=14) {
        pos = map.getScreenPositionFromLocation(d.loc);
//        drawEarthquakeMarker(pos[0], pos[1], d.altitude*0.15);
        drawEllipse(pos[0], pos[1], d.altitude*0.15);
      }
    }
    else if (timeCheck >= 15 && timeCheck <= 17) {
      if (d.currTime >= 15 && d.currTime <=17) {
        pos = map.getScreenPositionFromLocation(d.loc);
//        drawEarthquakeMarker(pos[0], pos[1], d.altitude*0.15);
        drawEllipse(pos[0], pos[1], d.altitude*0.15);
      }
    }
    else if (timeCheck >= 18 && timeCheck <= 20) {
      if (d.currTime >= 18 && d.currTime <=20) {
        pos = map.getScreenPositionFromLocation(d.loc);
//        drawEarthquakeMarker(pos[0], pos[1], d.altitude*0.15);
        drawEllipse(pos[0], pos[1], d.altitude*0.15);
      }
    }
    else if (timeCheck >= 21 && timeCheck <= 23) {
      if (d.currTime >= 21 && d.currTime <=23) {
        pos = map.getScreenPositionFromLocation(d.loc);
//        drawEarthquakeMarker(pos[0], pos[1], d.altitude*0.15);
        drawEllipse(pos[0], pos[1], d.altitude*0.15);
      }
    }
  }

  gui();
}


public void keyPressed() {
  if (key == '1') {
    map.zoomLevelIn();
  }
  if (key == '2') {
    map.zoomLevelOut();
  }
}

public void drawTruncatedCone(float r1, float r2, float d1, float d2) {
  float ang = 0;
  int pts = 120;
  beginShape(QUAD_STRIP);
  for (int i=0; i<=pts; i++) {

    float  px = cos(radians(ang))*r1;
    float  py = sin(radians(ang))*r1;
    vertex(px, py, d1);

    float  px2 = cos(radians(ang))*r2;
    float  py2 = sin(radians(ang))*r2;
    vertex(px2, py2, d2);
    ang+=360/pts;
  }
  endShape();
}

public void drawEarthquakeMarker(float x, float y, float value) {
  fill(#23cf94, 200);
  pushMatrix();
  translate(x, y);
  float height = map(value, 4, 8, 20, 100);
  drawTruncatedCone(1, 5, 0, height);
  popMatrix();
  noStroke();
  alti=height;
}



void loadData(String theFile, boolean override) {
  
  XML data = loadXML(theFile);
  
  if (override) {
    decibels = new ArrayList<Decibel>();
  }
  
  XML[] itemXML = data.getChildren("marker"); 
  for (int i = 0; i < itemXML.length; i++) {
    
    Decibel d = new Decibel();
    
    XML marker = itemXML[i];
    float lat = Float.valueOf(marker.getChild("latitude").getContent());
    float lon = Float.valueOf(marker.getChild("longitude").getContent());
    float altitude = Float.valueOf(marker.getChild("description").getContent());
    int currTime = Integer.valueOf(marker.getChild("time").getContent());
    d.loc = new Location(lat, lon);
    d.altitude = altitude;
    d.currTime = currTime;
    //alti = d.altitude;

    decibels.add(d);
  }
  println("done reading xml, now we have "+decibels.size()+" decibel items in our list.");
}


class Decibel {
  Location loc;
  float altitude;
  int currTime;
}

public void drawEllipse(float x, float y, float value) {
  fill(#ffffff, 200);
  pushMatrix();
  translate(x, y, alti);
  float height = map(value, 4, 8, 20, 100);
  sphere(3);
  popMatrix();
  noStroke();
  alti=height;
}


void gui() {
  cam.beginHUD();
  controlP5.draw();
  cam.endHUD();
}


public void controlEvent(ControlEvent theEvent) {
  switch(theEvent.controller().id()) {

    case(1):
    timeCheck = 1;
    println(theEvent.controller().id() + " " + timeCheck );
    break;

    case(2):
    timeCheck = 4;
    println(theEvent.controller().id() + " " + timeCheck );
    break;

    case(3):
    timeCheck = 7;
    println(theEvent.controller().id() + " " + timeCheck );
    break;

    case(4):
    timeCheck = 10;
    println(theEvent.controller().id() + " " + timeCheck );
    break;

    case(5):
    timeCheck = 13;
    println(theEvent.controller().id() + " " + timeCheck );
    break;

    case(6):
    timeCheck = 16;
    println(theEvent.controller().id() + " " + timeCheck );
    break;

    case(7):
    timeCheck = 19;
    println(theEvent.controller().id() + " " + timeCheck );
    break;

    case(8):
    timeCheck = 22;
    println(theEvent.controller().id() + " " + timeCheck );
    break;

    case(9):
    timeCheck = 24;
    println(theEvent.controller().id() + " " + timeCheck );
    break;
  }
}
