class MyCurve{
  PVector source;
  PVector target;
  
  public MyCurve(PVector source, PVector target){
    this.source = source;
    this.target = target;
  }
  
  void show(){
    float xo, yo, xe, ye;
    
    if(this.source.x >= this.target.x){
      xo = this.source.x;
      yo = this.source.y;
      xe = this.target.x;
      ye = this.target.y;
    } else {
      xe = this.source.x;
      ye = this.source.y;
      xo = this.target.x;
      yo = this.target.y;
    }
    
    float xc = (xo+xe)/2;
    float yc = (yo+ye)/2;
    float dx = Math.abs(xo-xe);
    float dy = Math.abs(yo-ye);    
    
    float ao, bo, ae, be, diff;
 
    if(ye>yo){  
      diff = (1/(float)2)*dx*(dy/height);
      bo = Math.abs(xo-xc);
      be = Math.abs(xo-xc)+Math.abs(yo-ye);
      ao = Math.abs(xc-xo)-diff;
      ae = Math.abs(xc-xe)+diff;
//      xc += diff;
    } else {
      diff = (1/(float)2)*dx*(dy/height);
      bo = Math.abs(xo-xc)+Math.abs(yo-ye);
      be = Math.abs(xo-xc);
      ao = Math.abs(xc-xo)+diff;
      ae = Math.abs(xc-xe)-diff;
//      xc -= diff;
    }
    
    float xMax=0;
    float xMin=height;
//    println(ao,bo,ae,be);
    
    stroke(0);
    fill(0);
    strokeWeight(1);//0.2
    
//    ellipse(xc, yc, 1, 1);
    ellipse(xo, yo, 4, 4);
    ellipse(xe, ye, 4, 4);
    
    //ellipse equation
    //x = a*cos(t)    
    //y = b*sin(t)
    float diffX = 0;
    ArrayList<float[]> points = new ArrayList<float[]>();
    float percentageSlant = ((width/2f)-xc)/(width/2f);
    int slant = 30;
    slant = (int)(slant*percentageSlant);
//    println(xc, percentageSlant, slant);
    
    for (float i = 0; i < 90; i++) {
      float x1 = (float)(Math.cos(radians(i))*ao+xc); 
      float y1 = (float)(-Math.sin(radians(i))*bo+yo);
      float xs1 = (float)(Math.tan(radians(slant))*y1+x1);
      if(i == 0)
        diffX = (float)(Math.tan(radians(slant))*y1);
      xs1=diffX+xs1;
      float x2 = (float)(Math.cos(radians(i+1))*ao+xc);
      float y2 = (float)(-Math.sin(radians(i+1))*bo+yo);
      float xs2 = (float)(Math.tan(radians(slant))*y2+x2);
      xs2=diffX+xs2;
//      if(xs1>xMax){
      if(i == 0){
        xMax = xs1; 
      } 
      float[] point = {xs1,y1,xs2,y2};
      points.add(point);
    }
    
    for (float i = 90; i < 180; i++) {
      float x1 = (float)(Math.cos(radians(i))*ae+xc);
      float y1 = (float)(-Math.sin(radians(i))*be+ye);
      float xs1 = (float)(Math.tan(radians(slant))*y1+x1);
      if(i == 0)
        diffX = (float)(Math.tan(radians(slant))*y1);
      xs1=diffX+xs1;
      float x2 = (float)(Math.cos(radians(i+1))*ae+xc);
      float y2 = (float)(-Math.sin(radians(i+1))*be+ye);
      float xs2 = (float)(Math.tan(radians(slant))*y2+x2);
      xs2=diffX+xs2;
//      if(xs1<xMin){
      if(i == 180-1){
        xMin = xs1; 
      }
      float[] point = {xs1,y1,xs2,y2};
      points.add(point);
    }
    
    float percentageScale = (xo-xe)/(xMax-xMin);
    float diffX2 = xo-points.get(0)[0]*percentageScale;
//    diffX2 = 0;
    for(float[] point: points){
      line(point[0]*percentageScale+diffX2,point[1],point[2]*percentageScale+diffX2,point[3]);
    }
  }
}

void setup(){
  size(1000,800,P3D);
}

void draw(){
  (new MyCurve(new PVector(600, 300), new PVector(300,400))).show();
  (new MyCurve(new PVector(300, 450), new PVector(100,500))).show();
  (new MyCurve(new PVector(500, 450), new PVector(100,500))).show();
  (new MyCurve(new PVector(400, 400), new PVector(100,500))).show();
  (new MyCurve(new PVector(700, 400), new PVector(100,500))).show();
  (new MyCurve(new PVector(700, 500), new PVector(100,500))).show();
  (new MyCurve(new PVector(700, 600), new PVector(100,500))).show();
  (new MyCurve(new PVector(600, 650), new PVector(100,500))).show();
  (new MyCurve(new PVector(400, 700), new PVector(100,500))).show();
  (new MyCurve(new PVector(300, 790), new PVector(100,500))).show();
  (new MyCurve(new PVector(110, 600), new PVector(100,500))).show();
//
//  (new MyCurve(new PVector(-300, 450), new PVector(500,400))).show();
//  (new MyCurve(new PVector(-200, 450), new PVector(500,400))).show();
//  (new MyCurve(new PVector(-100, 450), new PVector(500,400))).show();
//  (new MyCurve(new PVector(0, 450), new PVector(500,400))).show();
//  (new MyCurve(new PVector(100, 450), new PVector(500,400))).show();
//  (new MyCurve(new PVector(200, 450), new PVector(500,400))).show();
//  (new MyCurve(new PVector(300, 450), new PVector(500,400))).show();
//  (new MyCurve(new PVector(400, 450), new PVector(500,400))).show();
//  (new MyCurve(new PVector(500, 450), new PVector(500,400))).show();
//  (new MyCurve(new PVector(600, 450), new PVector(500,400))).show();
//  (new MyCurve(new PVector(700, 450), new PVector(500,400))).show();
//  (new MyCurve(new PVector(800, 450), new PVector(500,400))).show();
//  (new MyCurve(new PVector(900, 450), new PVector(500,400))).show();
//  (new MyCurve(new PVector(1000, 450), new PVector(500,400))).show();
//  (new MyCurve(new PVector(1100, 450), new PVector(500,400))).show();
//  (new MyCurve(new PVector(1200, 450), new PVector(500,400))).show();
//  (new MyCurve(new PVector(1300, 450), new PVector(500,400))).show();
//
  (new MyCurve(new PVector(-300, 450), new PVector(400,400))).show();
  (new MyCurve(new PVector(-200, 450), new PVector(400,400))).show();
  (new MyCurve(new PVector(-100, 450), new PVector(400,400))).show();
  (new MyCurve(new PVector(0, 450), new PVector(400,400))).show();
  (new MyCurve(new PVector(100, 450), new PVector(400,400))).show();
  (new MyCurve(new PVector(200, 450), new PVector(400,400))).show();
  (new MyCurve(new PVector(300, 450), new PVector(400,400))).show();
  (new MyCurve(new PVector(400, 450), new PVector(400,400))).show();
  (new MyCurve(new PVector(500, 450), new PVector(400,400))).show();
  (new MyCurve(new PVector(600, 450), new PVector(400,400))).show();
  (new MyCurve(new PVector(700, 450), new PVector(400,400))).show();
  (new MyCurve(new PVector(800, 450), new PVector(400,400))).show();
  (new MyCurve(new PVector(900, 450), new PVector(400,400))).show();
  (new MyCurve(new PVector(1000, 450), new PVector(400,400))).show();
  (new MyCurve(new PVector(1100, 450), new PVector(400,400))).show();
  (new MyCurve(new PVector(1200, 450), new PVector(400,400))).show();
  (new MyCurve(new PVector(1300, 450), new PVector(400,400))).show();
//
//  (new MyCurve(new PVector(-300, 450), new PVector(500,600))).show();
//  (new MyCurve(new PVector(-200, 450), new PVector(500,600))).show();
//  (new MyCurve(new PVector(-100, 450), new PVector(500,600))).show();
//  (new MyCurve(new PVector(0, 450), new PVector(500,600))).show();
//  (new MyCurve(new PVector(100, 450), new PVector(500,600))).show();
//  (new MyCurve(new PVector(200, 450), new PVector(500,600))).show();
//  (new MyCurve(new PVector(300, 450), new PVector(500,600))).show();
//  (new MyCurve(new PVector(400, 450), new PVector(500,600))).show();
//  (new MyCurve(new PVector(500, 450), new PVector(500,600))).show();
//  (new MyCurve(new PVector(600, 450), new PVector(500,600))).show();
//  (new MyCurve(new PVector(700, 450), new PVector(500,600))).show();
//  (new MyCurve(new PVector(800, 450), new PVector(500,600))).show();
//  (new MyCurve(new PVector(900, 450), new PVector(500,600))).show();
//  (new MyCurve(new PVector(1000, 450), new PVector(500,600))).show();
//  (new MyCurve(new PVector(1100, 450), new PVector(500,600))).show();
//  (new MyCurve(new PVector(1200, 450), new PVector(500,600))).show();
//  (new MyCurve(new PVector(1300, 450), new PVector(500,600))).show();
//
//  (new MyCurve(new PVector(150, 450), new PVector(100,400))).show();
//  (new MyCurve(new PVector(150, 450), new PVector(100,400))).show();
//  (new MyCurve(new PVector(200, 450), new PVector(100,400))).show();
//  (new MyCurve(new PVector(250, 450), new PVector(100,400))).show();
//  (new MyCurve(new PVector(300, 450), new PVector(100,400))).show();
//  (new MyCurve(new PVector(400, 450), new PVector(100,400))).show();
//  (new MyCurve(new PVector(600, 450), new PVector(100,400))).show();
//  (new MyCurve(new PVector(900, 450), new PVector(100,400))).show();
//  
//  (new MyCurve(new PVector(150, 600), new PVector(100,400))).show();
//  (new MyCurve(new PVector(200, 600), new PVector(100,400))).show();
//  (new MyCurve(new PVector(250, 600), new PVector(100,400))).show();
//  (new MyCurve(new PVector(300, 600), new PVector(100,400))).show();
//  (new MyCurve(new PVector(400, 600), new PVector(100,400))).show();
//  (new MyCurve(new PVector(600, 600), new PVector(100,400))).show();
//  (new MyCurve(new PVector(900, 600), new PVector(100,400))).show();
//  
//  (new MyCurve(new PVector(150, 700), new PVector(100,400))).show();
//  (new MyCurve(new PVector(200, 700), new PVector(100,400))).show();
//  (new MyCurve(new PVector(250, 700), new PVector(100,400))).show();
//  (new MyCurve(new PVector(300, 700), new PVector(100,400))).show();
//  (new MyCurve(new PVector(400, 700), new PVector(100,400))).show();
//  (new MyCurve(new PVector(600, 700), new PVector(100,400))).show();
//  (new MyCurve(new PVector(900, 700), new PVector(100,400))).show();
//  
//  (new MyCurve(new PVector(400, 500), new PVector(500,400))).show();
//  (new MyCurve(new PVector(600, 300), new PVector(500,400))).show();
//  (new MyCurve(new PVector(600, 500), new PVector(500,400))).show();
//  (new MyCurve(new PVector(400, 300), new PVector(500,400))).show();
}
