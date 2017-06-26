/* class that creates a planet with a moon rotating around it
 * it is used by the orbiter class
 * modification can be made to add more than one moon or change the texture of each planets moon
 */



class Planet{
  // textures of the planet and its moon
  PImage texture, moon;
  float size;
  //speed of rotation of the planet, speed increment variable, 
  // and the speed of rotation of the moon
  float speed, rot, xRandom;
  boolean bool;
  
  // texture of the planet size and the boolean to precise if the moon is needed
  public Planet(PImage texture, float size, boolean moonBool){
    this.size = size;
    this.texture= texture;
    this.speed = 1;
    this.rot = 1;
    this.bool = moonBool;
    this.xRandom = random(-.8, .8);
    moon = loadImage("astrd.jpg");
  }
  // if the change of speed is needed
 public void changeSpeed(float number){
      rot += number;
  } 
  
  
  float sz = random (5,15);
  
  // the draw method of the class
  // everytime is it is called the instance variable of the class chandes which simulates a rotation
  public void dw(float x, Float y){

    //rotation incrent
    speed += rot;
    // a serie of trashformation 
    pushMatrix();
    //rotation value increses by a factor of speed everytime it is called
    rotateY(PI/50 * speed);
    initializeSphere(30,30);
    textureSphere(size, size, size, texture);
    rotateX(PI/2.04);
    stroke(200);
    ellipse(0,0,x,y);
    popMatrix();   
    pushMatrix();
    rotateX(xRandom);
    rotateY(-PI/70 * speed);
    translate(50, 0,0);
    noStroke();
    if(bool){
      textureSphere(sz,sz,sz, moon);
    }
    popMatrix();
  }
}