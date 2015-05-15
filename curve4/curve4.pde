  int increment=0;
    int resolution=100;
    
    public void setup() 
    {
      size(600, 600);
    }

    public void draw() 
    {
        background(255);
        for(int i=0; i<increment;i++)
        {
            float t1 = i / (float)resolution;
            float t2 = (i+1)/ (float)resolution;
            float x1 = curvePoint(5, 73, 73, 15, t1);
            float y1 = curvePoint(26, 24, 61, 65, t1);
            float x2 = curvePoint(5, 73, 73, 15, t2);
            float y2 = curvePoint(26, 24, 61, 65, t2);
            line(x1, y1, x2, y2);
        }
        if(increment<=resolution)
        {
            float t1 = increment / (float)resolution;
            float t2 = (increment+1)/ (float)resolution;
            float x1 = curvePoint(5, 73, 73, 15, t1);
            float y1 = curvePoint(26, 24, 61, 65, t1);
            float x2 = curvePoint(5, 73, 73, 15, t2);
            float y2 = curvePoint(26, 24, 61, 65, t2);

            increment++;
            line(x1, y1, x2, y2);
        }
    }
