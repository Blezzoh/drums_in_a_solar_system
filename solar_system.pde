/* Blaise Iradukunda
   Daniel Evans
   CS 276 final project
   - Draws the solar system
   - if the pure data patch is connected to the sketch, 
      you can beat some drums
   - the stars reacts to processing frequencies output
   - the lights intensity also reacts to the frequency output
   */


PGraphics starLayer;
import oscP5.*;
import netP5.*;
import krister.Ess.*;

OscP5 oscP5;
Stars stars;
NetAddress station1, station2; 
boolean oscBool = false;
SunSystem system;
PImage skyNoStar;



void setup(){
  size(1300,1000, P3D);
  //make graphics layers
  starLayer = createGraphics(width, height, P3D);
  //initiliaze oscP5
  initiliazePorts();
  skyNoStar = loadImage("stars.jpg");
  skyNoStar.resize(width, height);
  stars = new Stars(starLayer, width , height );
  stars.makeStars(color(255));
  system = new SunSystem();
  system.initializeSystem(0);
  frameRate(60);
 
}
// light control and star color control
color c = color (255);
float l = 1;
void draw(){

  clear();
  background(skyNoStar);
  if (oscBool){
    // the value of the frequency is sent mapped to a sound
    l = map(arg, -1, 1, 0,1);
    float ads =  map(arg, -1, 1, 0, 255);
    c = color(ads *random(0,1), ads*random(0,1) , ads*random(0,1));  
    oscBool = false;
  }
  //stars.makeStars(c);
  // the intensity if the light depends on this
  pointLight(255 * l, 255 * l , 255 * l, width/2, height/2, 0);
  planets();
     
}
// makes the solar system the rotation are applied to change the prospective
void planets(){
  translate(0, 200,0);
  rotateX(-.2);
  rotateZ(-.1);
  system.action();
}



// addresses used
void initiliazePorts(){
  oscP5 = new OscP5(this,12000);
  station1 = new NetAddress("127.0.0.1",12001);
  station2 = new NetAddress("127.0.0.2",12002);
}




void keyPressed(){
  sendDrumMessage();
}