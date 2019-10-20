class PlanetBuilderState extends State
{
     
     
  PlanetBuilderState()
  {
    planets[0] = new Terrestrial();
    planets[1] = new Giant();
    planets[2] = new Dwarf();
  }
  
  void update()
  {
   noStroke();
   fill(#7F7F7F, 170);
   rect(0.4*width, 0, 0.60*width, height, 5); //Backdrop right 
   
   //rect(0.05*width, 0.55*height, 0.4*width, height*0.40, 5); //Backdrop left
   fill(#000000);
   rect(0.925*width, 0,height*0.2, height); //Selection Bar
   fill(255);
   
   
   rect(0.9355*width, 0+0.025*height, height*0.10, height*0.10, 8); //Exit Button
   ellipse(0.2*width, 0.25*height, 0.12*width, 0.12*width); //Planet Placeholder
   rectMode(CENTER);
   noFill(); 
   stroke(0);
   
   rectMode(CORNER);
   PImage img1=loadImage("Dwarf.jpeg");
   image(img1, 0.925*width, height*0.2, height*0.15, height*0.15);
   PImage img2 =loadImage("earth.jpg");
   image(img2, 0.925*width, height*0.355, height*0.15, height*0.15);
   PImage img3 =loadImage("Jupiter.jpg");
   image(img3, 0.925*width, height*0.55, height*0.15, height*0.15);
   PImage img4 =loadImage("Star.jpg");
   image(img4, 0.925*width, height*0.75, height*0.15, height*0.12);
   
   textSize(width/25);
   text("Planet Settings", 0.6625*width, 0.1*height);
   textSize(width/35);
   text("Name", 0.4525*width, 0.3*height);
   text("Mass", 0.4525*width, 0.5*height);
   text("Radius", 0.4525*width, 0.7*height);
   text("Cost", 0.4525*width, 0.9*height);
   text("Create", 0.75*width, 0.9*height);
   
   
  }
}

class Planet{
  double radius;
  double mass;
  double orbit_speed;
  double dist_from_sun;
  String name;
  int counter = 0;
  double G = 6.67048 * pow(10,-11);
  double msun =1;
  int planetColor;
  float angle;
  float xOrbitDiam, yOrbitDiam, planetDiam;
  void renderPlanet(float x, float y, float diam){
    noStroke();
    fill(planetColor);
    ellipse(x, y, diam, diam);
  }
  void planetUpdate(float xRadius, float yRadius, float planetDiam)
  {
    float x, y;
    x = width*0.5 + xRadius*cos(angle);
    y = height*0.5 + yRadius*sin(angle);
    renderPlanet(x, y, planetDiam);
    angle += orbit_speed;
  }
}
class Dwarf extends Planet { 
  
  Dwarf(){
  mass= random(pow(10,20),2*pow(10,22));   //mass in kg 
  radius = random(300*pow(10,3),2000*pow(10,3)); // radius is  m
  name = "Barack Obama";
  dist_from_sun = counter* 500*pow(10,3);
  planetColor = #A0D0F0;
  angle = random(0, 2*PI);
  xOrbitDiam = width*0.9;
  yOrbitDiam = height*0.45;
  planetDiam = log((float)radius)*width*0.002;
  orbit_speed = PI/200;
  }
}
  
class Terrestrial extends Planet { 
  
  Terrestrial(){
  mass= random(pow(10,20),2*pow(10,22));   //mass in kg 
  radius = random(300*pow(10,3),2000*pow(10,3)); // radius is  m
  name = "Barack Obama 2";
  dist_from_sun = counter* 500*pow(10,3);
  planetColor = #25890A;
  angle = random(0, 2*PI);
  xOrbitDiam = width*0.4;
  yOrbitDiam = height*0.2;
  planetDiam = log((float)radius)*width*0.002;
  orbit_speed = PI/90;
  }
}
  
class Giant extends Planet { 
  
  Giant(){
  mass= random(pow(10,20),2*pow(10,22));   //mass in kg 
  radius = random(300*pow(10,3),2000*pow(10,3)); // radius is  m
  name = "Barack Obama 3";
  dist_from_sun = counter* 500*pow(10,3);
  planetColor = #B7116C;
  angle = random(0, 2*PI);
  xOrbitDiam = width*0.6;
  yOrbitDiam = height*0.3;
  planetDiam = log((float)radius)*width*0.002;
  orbit_speed = PI/140;
  }
}
