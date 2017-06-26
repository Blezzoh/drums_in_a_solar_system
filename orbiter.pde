/* creates an object that rotates around the sun and it also creates its orbit line
 * it used the Planet class to create the sun 
 * it is used in the System class once we start simulating the movement
 */
 
class Orbiter{
  
  float size;
  float distFromSun;
  float speedOfRotation;
  float rotIncrement, rotation, orbitZ, orbitX, x, y, orbitDiameter;
  PImage texture;
  Boolean bool;
  Planet s;
  //- texture, size, distanceFromSun, zOrbit, speedOfRotation
  //- zOrbit: angle of the orbit with respect to the z axis, it should be different 
  // .... if you want to see the planets rotating on different 3d- planes
  //- moon: if true the planet is going to have amoon rorating around it
  public Orbiter(PImage  texture, float size, float distanceFromSun, float zOrbit, float speedOfRotation, boolean moon){
    this.texture = texture;
    this.distFromSun = distanceFromSun;
    this.orbitDiameter = distanceFromSun * 2;
    this.size = size;
    this.orbitZ = zOrbit;
    this.rotation = 1;
    this.rotIncrement= speedOfRotation;
    this.x =0;
    this.y = 0;
    s = new Planet(texture, size, moon);
    this.bool = moon;
  }
   
  // in case the planet need a ring aka saturn, 
  // the ring need to be initialized before callind this classes draw(dw)
  public void initiliazeRing(float x){
    this.x = x;
    this.y = x;
  }
  
  // in case the plane of rotation need to be randomly changed
  public void changeOrbit(){
    orbitZ = random(0, 2 * PI);
    orbitX = random(0,2 * PI);
  }
  
  public float getOrbitZ(){
   return orbitZ;
  }
  
  public float getOrbitX(){
   return orbitX;
  }
  
  // in case the speed of orbit around the sun needs to be changed
  public void changeSpeed(float number){
      rotIncrement += number;
  }  
  
  
  //classes draw
  public void dw() {
    pushMatrix();
    translate(width/2, height/2,-400);
    rotateZ(orbitZ);
    rotateX( -PI/2);
    noFill();
    stroke(255);
    strokeWeight(1);
    ellipse(0,0, orbitDiameter,orbitDiameter);
    noStroke(); 
    popMatrix();
    rotation += rotIncrement;
    noStroke();
    pushMatrix();
    translate(width/2, height/2 ,-400);
    pushMatrix();
    popMatrix();
    pushMatrix();
    rotateZ(orbitZ);
    pushMatrix();
    rotateY(PI/100 * rotation);
    pushMatrix();
    translate(distFromSun, 0 , 0);
    initializeSphere(30,30);
    noFill();
    strokeWeight(10);
    s.dw(x,y);
    popMatrix();
    popMatrix();
    popMatrix();
    popMatrix();
    
  }
}