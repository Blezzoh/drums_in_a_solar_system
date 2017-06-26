/* class to created stars 
 * the stars are put on their rendering layer just in case user 
   wants the stars to be have a background image to make it look sky like
  * it is used directly in the main draw method
   */

class Stars{
  PGraphics layer;
  int w, h;

  // rendering layer, width and height they need to cover
  public Stars(PGraphics layer,int w, int h){
    this.layer = layer;
    this.w = w;
    this.h = h;
    initiliazeCoordinates();
  }
  
  // makes a star, draws them on the rendering layerm and makes the returned image
  void makeStars(color c){
    stars(c);
    image(layer, -2 * w, -2 * h);
  }

  // draws the stars on the rendering layer
  void stars(color c){
    layer.beginDraw();
    layer.lights();
    layer.clear();
    initiliazeStars(c);
    layer.endDraw(); 
  }
  

  
 // listes of location and sizes of the stars
  ArrayList<Float> coordX = new ArrayList<Float>();
  ArrayList<Float> coordY = new ArrayList<Float>();
  ArrayList<Float> sizes = new ArrayList<Float>();
  
  // makes random coordinates of the stars and their sizes
  void initiliazeCoordinates(){
    float x =0, y =0;
    noStroke();
    while ( y < h ) {
      x = 0;
      while(x < w){
        float g = random(3, 9);
        float b = random(y, y + w/10);
        
        x += g + 5;
        coordX.add(x);
        coordY.add(b);
        sizes.add(random(3,9));
      }
    y += w/10;
  
    }
  }
  
  // uses the created list of coordinates and sizes to create stars
  void initiliazeStars(color c){
    float x =0, y =0;
    noStroke();
    for(int i = 0; i < coordX.size(); i++) {
      if(i%2 == 0){
        fill(color(red(c), green(c) ,0)); 
        star(coordX.get(i), coordY.get(i), sizes.get(i)/12, sizes.get(i),5); 
      }
      else if (i% 3 == 0){
        fill(color(0, green(c) ,0)); 
        star(coordX.get(i), coordY.get(i), sizes.get(i)/12, sizes.get(i),5); 
      }
      else if(i% 5 == 0){
        fill(color(0,  0,blue(c) )); 
        star(coordX.get(i), coordY.get(i), sizes.get(i)/12, sizes.get(i),5); 
      }
      else{
        fill(c); 
        star(coordX.get(i), coordY.get(i), sizes.get(i)/12, sizes.get(i),5); 
      }
    }
  }
  
  // copied from the processing websites
  void star(float x, float y, float radius1, float radius2, int npoints) {
  float angle = TWO_PI / npoints;
  float halfAngle = angle/2.0;
  beginShape();
  for (float a = 0; a < TWO_PI; a += angle) {
    
    float sx = x + cos(a) * radius2;
    float sy = y + sin(a) * radius2;
    vertex(sx, sy);
    sx = x + cos(a+halfAngle) * radius1;
    sy = y + sin(a+halfAngle) * radius1;
    vertex(sx, sy);
  }
  endShape(CLOSE);
  }
}