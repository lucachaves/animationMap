Location newDelhi = new Location(810,230,false);
Location istanbul = new Location(630,175,false);
Location bethesda = new Location(243,182,false);
Location arlington = new Location(243,184,false);
Location mcLean = new Location(240,186,false);
Location danville = new Location(80,185,false);
Location suZhou = new Location(975,225,false);
Location zhuHai = new Location(955,255,false);
Location hongKong = new Location(959,255,false);
Location saratoga = new Location(81,181,false);
Location cupertino = new Location(80,190,false);
Location taiChung = new Location(980,250,false);
Location taiNan = new Location(980,253,false);
Location greenwich = new Location(260,175,false);

ArrayList <Location> locs = new ArrayList();

float[][]adjMatrix = new float[14][14];

int count = 0;

void setup(){
  size(1280,635);
 
  locs.add(danville);
  locs.add(cupertino);
  locs.add(saratoga); 
  locs.add(mcLean); 
  locs.add(bethesda);
  locs.add(arlington);
  locs.add(greenwich);
  locs.add(istanbul);
  locs.add(newDelhi);
  locs.add(zhuHai);
  locs.add(hongKong);
  locs.add(suZhou);
  locs.add(taiChung);
  locs.add(taiNan);
  
  for(int i = 0; i < 14; i++){
    for(int j = 0; j < 14; j++){
      if(i == j) adjMatrix[i][j] = 0;
      else adjMatrix[i][j] = distance(locs.get(i),locs.get(j));
    }
  }
  
  PImage b;
  b = loadImage("map.png");
  background(b);
  
}


void draw(){
  if(count != 13){
  
  //horizontal
  for(int i = 0; i < 635; i += 50){
    line(0,i,1280,i);
    fill(0);
    textSize(10);
    text(i,5,i);
  }
  
  //vertical
  for(int i = 0; i < 1280; i += 50){
    line(i,0,i,635);
    fill(0);
    textSize(10);
    text(i,i,10);
  }
  
  newDelhi.display();
  istanbul.display();
  bethesda.display();
  arlington.display();
  mcLean.display();
  danville.display();
  suZhou.display();
  zhuHai.display();  
  hongKong.display();
  saratoga.display();
  cupertino.display();  
  taiChung.display();
  taiNan.display();
  greenwich.display();
  
  /*
  ellipse(mouseX, mouseY, 5, 5);
  println(mouseX);
  println(mouseY);
  */
  
  locs.get(count).changeStat();
  Location min = locs.get(count+1); 
  
  for(int i = 0; i < adjMatrix.length; i++){
    if(locs.get(i).getStat() == false && adjMatrix[count][i] < adjMatrix[count][locs.indexOf(min)]){
      min = locs.get(i);
    }
  }
  
  drawLine(locs.get(count),min);
  
  count = locs.indexOf(min);
  }else{
    drawLine(taiChung,suZhou);
  }
}

class Location{
  int x;
  int y;
  boolean used;
  
  Location(int x, int y, boolean used){
    this.x = x;
    this.y = y;
    this.used = used;
  }
  
  void display(){
    fill(255,0,0);
    ellipse(x,y,5,5);
  }
  
  int getX(){
    return x;
  }
  
  int getY(){
    return y;
  }
  
  boolean getStat(){
    return used;
  }
  
  void changeStat(){
    used = !used;
  }
}

float distance(Location loc1, Location loc2){
  return sqrt((float)Math.pow(loc2.getX()-loc1.getX(),2) + (float)Math.pow(loc2.getY()-loc1.getY(),2));
}

void drawLine(Location loc1, Location loc2){
  line(loc1.getX(),loc1.getY(),loc2.getX(),loc2.getY());
}


