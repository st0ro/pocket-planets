class PlanetBuilderState extends State
{
  PImage img1 =loadImage("Dwarf.jpeg");
  PImage img2 =loadImage("earth.jpg");
  PImage img3 =loadImage("Jupiter.jpg");   
  PImage img4 =loadImage("Star.jpg");   
  char choice = 'D';
  Slider massSliderDwarf = new Slider(width*0.55, height*0.45,width*0.3,0.0001,0.02,255); //units x10^24
  Slider radiusSliderDwarf = new Slider(width*0.55, height*0.65,width*0.3,200,2000, 255);
  Slider massSliderTerrestrial = new Slider(width*0.55, height*0.45,width*0.3,0.1,60, 255);//units 10^24
  Slider radiusSliderTerrestrial = new Slider(width*0.55, height*0.65,width*0.3,4000,40000, 255);
  Slider massSliderGiant = new Slider(width*0.55, height*0.45,width*0.3,100,2000, 255); //units 10^24
  Slider radiusSliderGiant = new Slider(width*0.55, height*0.65,width*0.3,40000,150000, 255);
  
  Textbox dwarfName = new Textbox (int(0.55*width), int(0.22*height), int(width*0.3),int(height*0.15));
  Textbox TerrestrialName = new Textbox (int(0.55*width), int(0.22*height), int(width*0.3),int(height*0.15));
  Textbox GiantName = new Textbox (int(0.55*width), int(0.22*height), int(width*0.3),int(height*0.15));
  
  PlanetBuilderState()
  {
    planets[0] = new Terrestrial();
    planets[1] = new Giant();
    planets[2] = new Dwarf();
  }
  
  void update()
  {
   textFont(font);
   noStroke();
   fill(#BFBFBF, 170);
   rect(0.4*width, 0, 0.60*width, height, 5); //Backdrop right 
   rect(0.05*width, 0.65*height, 0.3*width, height*0.35, 5); //Backdrop left
   
   
   fill(#000000);
   rect(0.925*width, 0,height*0.2, height); //Selection Bar
   
   fill(255);
   rect(0.9355*width, 0+0.025*height, height*0.10, height*0.10, 8); //Exit Button
   ellipse(0.2*width, 0.25*height, 0.12*width, 0.12*width); //Planet Placeholder
   rectMode(CENTER);
   noFill(); 
   stroke(0);
   
   rectMode(CORNER);
   //dwarf button
   image(img1, 0.925*width, height*0.2, height*0.15, height*0.15);
   Button DwarfButton = new Button("", 0.925*width,height*0.2,height*0.15,height*0.15, 255, 0); 
   DwarfButton.displayButton();
   if(DwarfButton.ButtonPressed() == true)
   choice = 'D';
   
   //terrestrial button
   image(img2, 0.925*width, height*0.355, height*0.15, height*0.15);
   Button TerrestrialButton = new Button("", 0.925*width,height*0.355,height*0.15,height*0.15, 255, 0); 
   TerrestrialButton.displayButton();
   if(TerrestrialButton.ButtonPressed() == true)
   choice = 'T';
   
   //Giant button
   image(img3, 0.925*width, height*0.55, height*0.15, height*0.15);
   Button GiantButton = new Button("", 0.925*width,height*0.55,height*0.15,height*0.15, 255, 0); 
   GiantButton.displayButton();
   if(GiantButton.ButtonPressed() == true)
   choice = 'G';
   
   image(img4, 0.925*width, height*0.75, height*0.15, height*0.12);
   
   textSize(width/25);
   text("Planet Settings", 0.6625*width, 0.1*height);
   textSize(width/35);
   text("Name", 0.4525*width, 0.3*height);
   text("Mass", 0.4525*width, 0.5*height);
   text("Radius", 0.4525*width, 0.7*height);
   text("Cost", 0.4525*width, 0.9*height);
   text("Create", 0.75*width, 0.9*height);
   
   if (choice == 'D'){
   dwarfName.displayTextbox();
   dwarfName.type();
   massSliderDwarf.displaySlider();
   radiusSliderDwarf.displaySlider();
   }
   
   if (choice == 'T'){
   TerrestrialName.displayTextbox();
   TerrestrialName.type();  
   massSliderTerrestrial.displaySlider();
   radiusSliderTerrestrial.displaySlider();
   }
   if (choice == 'G'){
   GiantName.displayTextbox();
   GiantName.type();  
   massSliderGiant.displaySlider();
   radiusSliderGiant.displaySlider();
   }
   
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
  xOrbitDiam = width*0.4;
  yOrbitDiam = height*0.2;
  planetDiam = log((float)radius)*width*0.002;
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
  xOrbitDiam = width*0.6;
  yOrbitDiam = height*0.3;
  planetDiam = log((float)radius)*width*0.002;
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
  xOrbitDiam = width*0.9;
  yOrbitDiam = height*0.45;
  planetDiam = log((float)radius)*width*0.002;
  //orbit_speed = sqrt(radius/(G*msun));
  }
}
