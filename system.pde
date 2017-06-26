/** combines the created classes to make the entire solar system
  * the ratio of the size of the planets looks logical but not the right one
  * used in by the main draw
  */

class SunSystem{
  // sun, planets, and textures
  Sun sun;
  float rad;
  Orbiter mercury, venus, earth, mars, jupiter, uranus,saturn, neptune;
  PImage mercuryT, venusT, earthT, marsT, jupiterT, uranusT, neptuneT, sunT, saturnT, space;

  public SunSystem(){
  }
  
  // loads the textures to avoid images to be loaded while drawing
  private void initiliazeImages(){
    mercuryT = loadImage("mercury.jpg");
    venusT = loadImage("venus.jpg");
    earthT = loadImage("earth.jpg");
    marsT =  loadImage("mars.jpg");
    saturnT = loadImage("saturn.png");
    jupiterT = loadImage("jupiter.jpg");
    uranusT = loadImage("uranus.jpg");
    neptuneT = loadImage("beptune.jpg");
    sunT = loadImage("sun.jpg");
  }
    
  
  
  // planets gets intiliazed and added to the Sun so that the sun draw method can control them
  void initializeSystem(float angle) {
    initiliazeImages();
    sun = new Sun(sunT, 100/1.5);
    mercury= new Orbiter(mercuryT,10/1.5, 200, angle, 1.5, true);
    venus =  new Orbiter(venusT, 22/1.5, 270, angle,1.2, true);
    earth = new Orbiter(earthT, 28/1.5, 360, angle, 1, true);
    mars = new Orbiter(marsT, 17/1.5, 440, angle, 0.9, true);
    jupiter= new Orbiter(jupiterT, 55/1.5, 540,angle, 0.6 , true);
    saturn = new Orbiter(saturnT, 50/1.5, 660, angle, .52, true);
    saturn.initiliazeRing(80);
    uranus = new Orbiter(uranusT, 42/1.5, 800,angle,0.45, true);
    neptune= new Orbiter(neptuneT, 40/1.5, 900, angle, .39, true);   
    
    sun.addOrbiter(mercury);
    sun.addOrbiter(venus);
    sun.addOrbiter(earth);
    sun.addOrbiter(mars);
    sun.addOrbiter(jupiter);
    sun.addOrbiter(saturn);
    sun.addOrbiter(uranus);
    sun.addOrbiter(neptune);
    rad = angle;
  }
  
  
  // insted the speed need to be changes by some factor
  void changeSpeed(float number){

    mercury.changeSpeed(number);
    venus.changeSpeed(number);
    earth.changeSpeed(number);
    mars.changeSpeed(number);
    jupiter.changeSpeed(number);
    uranus.changeSpeed(number);
    neptune.changeSpeed(number);
    saturn.changeSpeed(number);
  }
  
  // the Class draw method
  void action(){
    sun.dw();

  }
}