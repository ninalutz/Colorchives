
  
public PVector rgb_to_hsv(PVector c) 
    { 
  
        // R, G, B values are divided by 255 
        // to change the range from 0..255 to 0..1 
        float r = c.x / 255.0; 
        float g = c.y / 255.0; 
        float b = c.z / 255.0; 
  
        // h, s, v = hue, saturation, value 
        double cmax = Math.max(r, Math.max(g, b)); // maximum of r, g, b 
        double cmin = Math.min(r, Math.min(g, b)); // minimum of r, g, b 
        double diff = cmax - cmin; // diff of cmax and cmin. 
        double h = -1, s = -1; 
          
        // if cmax and cmax are equal then h = 0 
        if (cmax == cmin) 
            h = 0; 
  
        // if cmax equal r then compute h 
        else if (cmax == r) 
            h = (60 * ((g - b) / diff) + 360) % 360; 
  
        // if cmax equal g then compute h 
        else if (cmax == g) 
            h = (60 * ((b - r) / diff) + 120) % 360; 
  
        // if cmax equal b then compute h 
        else if (cmax == b) 
            h = (60 * ((r - g) / diff) + 240) % 360; 
  
        // if cmax equal zero 
        if (cmax == 0) 
            s = 0; 
        else
            s = (diff / cmax) * 100; 
  
        // compute v 
        double v = cmax * 100; 
        //System.out.println("(" + h + " " + s + " " + v + ")"); 
      PVector vec = new PVector((float)h, (float)s, (float)v);
      return vec;
    } 
    
    

  
  public PVector rgbToHSL(PVector p)
  {
    //  Get RGB values in the range 0 - 1
    float r = p.x/255.0;
    float g = p.y/255.0;
    float b = p.z/255.0;

    //  Minimum and Maximum RGB values are used in the HSL calculations

    float min = Math.min(r, Math.min(g, b));
    float max = Math.max(r, Math.max(g, b));

    //  Calculate the Hue

    float h = 0;

    if (max == min)
      h = 0;
    else if (max == r)
      h = ((60 * (g - b) / (max - min)) + 360) % 360;
    else if (max == g)
      h = (60 * (b - r) / (max - min)) + 120;
    else if (max == b)
      h = (60 * (r - g) / (max - min)) + 240;

    //  Calculate the Luminance

    float l = (max + min) / 2;

    //  Calculate the Saturation

    float s = 0;

    if (max == min)
      s = 0;
    else if (l <= .5f)
      s = (max - min) / (max + min);
    else
      s = (max - min) / (2 - max - min);

    return new PVector(h, s * 100, l * 100);
  }
