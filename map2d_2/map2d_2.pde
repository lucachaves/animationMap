//http://forum.processing.org/one/topic/using-a-world-map-in-processing.html
PImage backgroundMap;

float mapGeoLeft   = -125.22;          // Longitude 125 degrees west
float mapGeoRight  =  153.44;          // Longitude 153 degrees east
float mapGeoTop    =   71.89;          // Latitude 72 degrees north.
float mapGeoBottom =  -56.11;          // Latitude 56 degrees south.
                         
float mapScreenWidth,mapScreenHeight;  // Dimension of map in pixels.

void setup()
{
  size(600,350);
  smooth();
  noLoop();
  backgroundMap   = loadImage("../data/ui/natural.earth.data.png");
  mapScreenWidth  = width;
  mapScreenHeight = height;
}

void draw()
{
  image(backgroundMap,0,0,mapScreenWidth,mapScreenHeight);
  
  fill(180,120,120);
  strokeWeight(0.5);
  
  PVector p = geoToPixel(new PVector(0.8,51.5));  // London
  ellipse(p.x,p.y,5,10);
  p = geoToPixel(new PVector(-73.9,40.8));        // New York
  ellipse(p.x,p.y,5,10);
  p = geoToPixel(new PVector(139.8,35.7));        // Tokyo
  ellipse(p.x,p.y,5,10); 
  p = geoToPixel(new PVector(151.0,-34.0));       // Sydney
  ellipse(p.x,p.y,5,10);
}

// Converts screen coordinates into geographical coordinates. 
// Useful for interpreting mouse position.
public PVector pixelToGeo(PVector screenLocation)
{
    return new PVector(mapGeoLeft + (mapGeoRight-mapGeoLeft)*(screenLocation.x)/mapScreenWidth,
                       mapGeoTop - (mapGeoTop-mapGeoBottom)*(screenLocation.y)/mapScreenHeight);
}

// Converts geographical coordinates into screen coordinates.
// Useful for drawing geographically referenced items on screen.
public PVector geoToPixel(PVector geoLocation)
{
    return new PVector(mapScreenWidth*(geoLocation.x-mapGeoLeft)/(mapGeoRight-mapGeoLeft),
                       mapScreenHeight - mapScreenHeight*(geoLocation.y-mapGeoBottom)/(mapGeoTop-mapGeoBottom));
}
