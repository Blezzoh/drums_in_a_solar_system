/* class to create the sun, all its planets, and its moons
 * uses the orbiter class
 */

class Sun{
  PImage texture;
  float size;
  float speed, rot;
  
  // array list of planets rotation around the sun
  ArrayList<Orbiter> orbiters;
  
  //texture and the size of the sun
  public Sun(PImage texture, float size){
    this.size = size;
    this.texture= texture;
    this.speed = 1;
    this.rot = 1;
    orbiters = new ArrayList<Orbiter>();
  }
  
 // speed of roration of the sun on itself
 public void changeSpeed(float number){
      rot += number;
  }  
  
  // draw method
  public void dw(){
    speed += rot;
    noStroke();
    pushMatrix();
    translate(width/2, height/2,-400);
    pushMatrix();
    rotateY(PI/1000 * speed);
    initializeSphere(30,30);
    textureSphere(size, size, size, texture);
    popMatrix();
    popMatrix();
    // draws all the planets
    for(Orbiter x : orbiters) 
      x.dw();
  }
  
  // fills the array list of planets
  public void addOrbiter(Orbiter orbiter) {
      orbiters.add(orbiter);
  }
  
}