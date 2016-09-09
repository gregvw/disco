color pink     = color(255, 127, 255);
color black    = color(0, 0, 0);
color lt_green = color(127, 255, 127);
color white    = color(255, 255, 255);

// long lastTime;

public class DiscStack {
  int numCircles;   
  float x, y;       // Center
  float rmin;       // Smallest radius of smallest circle
  float rad;        // Current radius of smallest circle
  float rmax;       // Largest radius of smallest circle
  float dr;         // difference in radius of two successive circles
  color c1;         // Color of outermost circle
  color c2;         // Color of alternating circles

  boolean isGrowing;

  public DiscStack(int NumCircles, float X, float Y, float Rmin, 
  float Rmax, float Dr, color C1, color C2) {
    numCircles = NumCircles;
    x = X; 
    y = Y;
    rmin = Rmin; 
    rad = rmin; 
    rmax = Rmax; 
    dr = Dr;
    c1 = C1; 
    c2 = C2;
    isGrowing = true;
  }  

  void draw() {
    // Draw the circles from largest to smallest
    boolean colorflip = false;
    color c; 

    for ( int i=numCircles; i>0; --i ) {
      if ( colorflip ) {
        c = c1;
      } else {
        c = c2;
      }
      fill(c);
      ellipse(x, y, rad+i*dr, rad+i*dr);

      colorflip = !colorflip;

      if ( isGrowing ) {
        if (rad < rmax ) {
          rad+=0.05;
        } else {
          isGrowing = false;
        }
      } else {
        if (rad > rmin ) {
          rad-=0.05;
        } else {
          isGrowing = true;
        }
      }
    }
  }
}

DiscStack ds;

void setup() {
  size(1080, 720);
  //  lastTime = millis();
  ds = new DiscStack(20, 0.5*width, 0.5*height, 20, 150, 20, pink, lt_green);
}

void draw() {
  //  if( millis() - lastTime > 1 ) {
  background(white);
  ds.draw();
  //    lastTime = millis();
  //  }
}

