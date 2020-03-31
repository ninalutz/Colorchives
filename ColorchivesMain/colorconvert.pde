
  
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
    
    

  
  public PVector rgb_to_hsl(PVector p)
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
  
  
 public  PVector HSBtoRGB(float hue, float saturation, float brightness) {
        int r = 0, g = 0, b = 0;
        if (saturation == 0) {
            r = g = b = (int) (brightness * 255.0f + 0.5f);
        } else {
            float h = (hue - (float)Math.floor(hue)) * 6.0f;
            float f = h - (float)java.lang.Math.floor(h);
            float p = brightness * (1.0f - saturation);
            float q = brightness * (1.0f - saturation * f);
            float t = brightness * (1.0f - (saturation * (1.0f - f)));
            switch ((int) h) {
            case 0:
                r = (int) (brightness * 255.0f + 0.5f);
                g = (int) (t * 255.0f + 0.5f);
                b = (int) (p * 255.0f + 0.5f);
                break;
            case 1:
                r = (int) (q * 255.0f + 0.5f);
                g = (int) (brightness * 255.0f + 0.5f);
                b = (int) (p * 255.0f + 0.5f);
                break;
            case 2:
                r = (int) (p * 255.0f + 0.5f);
                g = (int) (brightness * 255.0f + 0.5f);
                b = (int) (t * 255.0f + 0.5f);
                break;
            case 3:
                r = (int) (p * 255.0f + 0.5f);
                g = (int) (q * 255.0f + 0.5f);
                b = (int) (brightness * 255.0f + 0.5f);
                break;
            case 4:
                r = (int) (t * 255.0f + 0.5f);
                g = (int) (p * 255.0f + 0.5f);
                b = (int) (brightness * 255.0f + 0.5f);
                break;
            case 5:
                r = (int) (brightness * 255.0f + 0.5f);
                g = (int) (p * 255.0f + 0.5f);
                b = (int) (q * 255.0f + 0.5f);
                break;
            }
        }
        return new PVector(r/255, g/255, b/255);
    }
