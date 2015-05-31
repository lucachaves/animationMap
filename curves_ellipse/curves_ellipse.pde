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
//    print(dx,dy);
    
    float ao, bo, ae, be, diff;
 
    if(ye>yo){  
      diff = (1/(float)2)*dx*(dy/height);
      bo = Math.abs(xo-xc);
      be = Math.abs(xo-xc)+Math.abs(yo-ye);
      ao = Math.abs(xc-xo)-diff;
      ae = Math.abs(xc-xe)+diff;
      xc += diff;
    } else {
      diff = (1/(float)2)*dx*(dy/height);
      bo = Math.abs(xo-xc)+Math.abs(yo-ye);
      be = Math.abs(xo-xc);
      ao = Math.abs(xc-xo)+diff;
      ae = Math.abs(xc-xe)-diff;
      xc -= diff;
    }
//    println(dx+" "+diff);
    
    stroke(0);
    fill(0);
//    strokeWeight(0.2);
    strokeWeight(1);
    
//    ellipse(xc, yc, 1, 1);
    ellipse(xo, yo, 4, 4);
    ellipse(xe, ye, 4, 4);
    
    //ellipse equation
    //x = a*cos(t)    
    //y = b*sin(t)
    //slanted, rotated
    //x' = a*cos(t)*cos(theta) - b*sin(t)*sin(theta) 
    //y' = a*cos(t)*sin(theta) + b*sin(t)*cos(theta)
    for (float i = 0; i < 90; i++) {
      float x1 = (float)(Math.cos(radians(i))*ao+xc);
      float y1 = (float)(-Math.sin(radians(i))*bo+yo);
      float x2 = (float)(Math.cos(radians(i+1))*ao+xc);
      float y2 = (float)(-Math.sin(radians(i+1))*bo+yo);
//      if(i == 0)
//        println(x1,y1,x2,y2);
      line(x1,y1,x2,y2);
    }
    
    for (float i = 90; i <= 180; i++) {
      float x1 = (float)(Math.cos(radians(i))*ae+xc);
      float y1 = (float)(-Math.sin(radians(i))*be+ye);
      float x2 = (float)(Math.cos(radians(i+1))*ae+xc);
      float y2 = (float)(-Math.sin(radians(i+1))*be+ye);
//      if(i == 0)
//        println(x1,y1,x2,y2);
      line(x1,y1,x2,y2);
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

  (new MyCurve(new PVector(150, 450), new PVector(100,400))).show();
  (new MyCurve(new PVector(150, 450), new PVector(100,400))).show();
  (new MyCurve(new PVector(200, 450), new PVector(100,400))).show();
  (new MyCurve(new PVector(250, 450), new PVector(100,400))).show();
  (new MyCurve(new PVector(300, 450), new PVector(100,400))).show();
  (new MyCurve(new PVector(400, 450), new PVector(100,400))).show();
  (new MyCurve(new PVector(600, 450), new PVector(100,400))).show();
  (new MyCurve(new PVector(900, 450), new PVector(100,400))).show();
  
  (new MyCurve(new PVector(150, 600), new PVector(100,400))).show();
  (new MyCurve(new PVector(200, 600), new PVector(100,400))).show();
  (new MyCurve(new PVector(250, 600), new PVector(100,400))).show();
  (new MyCurve(new PVector(300, 600), new PVector(100,400))).show();
  (new MyCurve(new PVector(400, 600), new PVector(100,400))).show();
  (new MyCurve(new PVector(600, 600), new PVector(100,400))).show();
  (new MyCurve(new PVector(900, 600), new PVector(100,400))).show();
  
  (new MyCurve(new PVector(150, 700), new PVector(100,400))).show();
  (new MyCurve(new PVector(200, 700), new PVector(100,400))).show();
  (new MyCurve(new PVector(250, 700), new PVector(100,400))).show();
  (new MyCurve(new PVector(300, 700), new PVector(100,400))).show();
  (new MyCurve(new PVector(400, 700), new PVector(100,400))).show();
  (new MyCurve(new PVector(600, 700), new PVector(100,400))).show();
  (new MyCurve(new PVector(900, 700), new PVector(100,400))).show();
  
  (new MyCurve(new PVector(150, 600), new PVector(100,500))).show();
  (new MyCurve(new PVector(150, 400), new PVector(100,500))).show();
  (new MyCurve(new PVector(50, 600), new PVector(100,500))).show();
  (new MyCurve(new PVector(50, 400), new PVector(100,500))).show();
}
