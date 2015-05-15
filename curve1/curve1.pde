//http://forum.processing.org/one/topic/animation-with-curve.html
//https://processing.org/examples/movingoncurves.html
long time;
int x1=0;
int y1=0;
int x2=0;
int y2=0;
 
public void setup()
{
    size(300,300); 
    background(255);
}

public void draw()
{
    y1=(int)Math.sqrt(Math.pow(width,2)-Math.pow(x1,2)); //Circle Math Expression
    line(x1, y1, x2, y2);
    x2=x1;
    y2=y1;
    x1++;
    time=millis();
    while(millis()-time<100){} //Here you can regulate the speed which the curve is being drawn
}
