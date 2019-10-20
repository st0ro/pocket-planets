class PlanetBuilderState extends State
{
     
     
  PlanetBuilderState()
  {
    planets[0] = new Dwarf();
  }
  
  void update()
  {
   noStroke();
   fill(#7F7F7F);
   rect(0.5*width, 0, 0.55*width, 0.6*height, 5); //Backdrop right top
   rect(0.5*width, 0.65*height, 0.495*width, 0.55*height, 5);// Backdrop bottom
   rect(0.05*width, 0.55*height, 0.4*width, height*0.40, 5); //Backdrop left
   fill(#000000);
   rect(0.925*width, 0,height*0.2, height); //Selection Bar
   fill(255);
   
   //rect(0.925*width, height*0.25, height*0.15, height*0.15, 5); //Planet Type Choice 1
  
   //rect(0.925*width, height*0.45, height*0.15, height*0.15, 5); // Planet Type Choice 2
   //rect(0.925*width, height*0.65, height*0.15, height*0.15, 5); // Planet Type Choice 3
   rect(0.9355*width, 0+0.025*height, height*0.10, height*0.10, 8); //Exit Button
   ellipse(0.25*width, 0.25*height, 0.12*width, 0.12*width); //Planet Placeholder
   rectMode(CENTER);
   noFill(); 
   stroke(0);
   
   rectMode(CORNER);
   PImage img1=loadImage("Dwarf.jpeg");
   image(img1, 0.925*width, height*0.1, height*0.15, height*0.15);
   PImage img2 =loadImage("earth.jpg");
   image(img2, 0.925*width, height*0.255, height*0.15, height*0.15);
   PImage img3 =loadImage("Jupiter.jpg");
   image(img3, 0.925*width, height*0.45, height*0.15, height*0.15);
   
    //rect 
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
    angle += PI/60;
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
  //orbit_speed = sqrt(radius/(G*msun));
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
 // orbit_speed = sqrt(radius/(G*msun));
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
  //orbit_speed = sqrt(radius/(G*msun));
  }
}
