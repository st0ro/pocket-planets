class PlanetBuilderState extends State
{
  PImage img1 =loadImage("Dwarf.jpeg");
  PImage img2 =loadImage("earth.jpg");
  PImage img3 =loadImage("Jupiter.jpg");   
  PImage img4 =loadImage("Star.jpg");   
  char choice = 'D';
  int index = 0;
  Planet temp;
  
  Slider massSliderDwarf = new Slider(width*0.55, height*0.45,width*0.3,0.0001,0.02,255); //units x10^24
  Slider radiusSliderDwarf = new Slider(width*0.55, height*0.65,width*0.3,200,2000, 255);
  Slider massSliderTerrestrial = new Slider(width*0.55, height*0.45,width*0.3,0.1,60, 255);//units 10^24
  Slider radiusSliderTerrestrial = new Slider(width*0.55, height*0.65,width*0.3,4000,40000, 255);
  Slider massSliderGiant = new Slider(width*0.55, height*0.45,width*0.3,100,2000, 255); //units 10^24
  Slider radiusSliderGiant = new Slider(width*0.55, height*0.65,width*0.3,40000,150000, 255);
  Button DwarfButton = new Button("", 0.925*width,height*0.2,height*0.15,height*0.15, 255, 0); 
  Button TerrestrialButton = new Button("", 0.925*width,height*0.355,height*0.15,height*0.15, 255, 0); 
  Button GiantButton = new Button("", 0.925*width,height*0.55,height*0.15,height*0.15, 255, 0);
  Button CreateButton = new Button("Create", 0.75*width, 0.9*height, width*0.2, height*0.12, #BFBFBF, 255);
  Textbox DwarfName = new Textbox (int(0.55*width), int(0.22*height), int(width*0.3),int(height*0.15));
  Textbox TerrestrialName = new Textbox (int(0.55*width), int(0.22*height), int(width*0.3),int(height*0.15));
  Textbox GiantName = new Textbox (int(0.55*width), int(0.22*height), int(width*0.3),int(height*0.15));
  
  PlanetBuilderState()
  {
    temp = new Dwarf();
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
   switch(choice)
   {
     case 'D':
     temp.renderPlanet(0.2*width, 0.32*height, 0.01*width*log(radiusSliderDwarf.current));
     break;
     case 'T':
     temp.renderPlanet(0.2*width, 0.32*height, 0.01*width*log(radiusSliderTerrestrial.current));
     break;
     case 'G':
     temp.renderPlanet(0.2*width, 0.32*height, 0.06*width*log(radiusSliderGiant.current/1000));
     break;
   }
   rectMode(CENTER);
   noFill(); 
   stroke(0);
   
   rectMode(CORNER);
   //dwarf button
   image(img1, 0.925*width, height*0.2, height*0.15, height*0.15);
   DwarfButton.displayButton();
   if(DwarfButton.ButtonPressed() == true)
   {
     choice = 'D';
     temp = new Dwarf();
   }
   
   //terrestrial button
   image(img2, 0.925*width, height*0.355, height*0.15, height*0.15);
   TerrestrialButton.displayButton();
   if(TerrestrialButton.ButtonPressed() == true)
   {
     choice = 'T';
     temp = new Terrestrial();
   }
   
   //Giant button
   image(img3, 0.925*width, height*0.55, height*0.15, height*0.15);
   GiantButton.displayButton();
   if(GiantButton.ButtonPressed() == true)
   {
     choice = 'G';
     temp = new Giant();
   }
   
   //Create button
   CreateButton.displayButton();
   if(CreateButton.ButtonPressed() == true)
   {
     planets[index] = temp;
     temp = new Dwarf();
     currentState = 2;
   }
   
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
   DwarfName.displayTextbox();
   DwarfName.type();
   massSliderDwarf.displaySlider();
   radiusSliderDwarf.displaySlider();
   text("Name", 0.1*width, 0.70*height);
   text("Mass: " + massSliderDwarf.current, 0.1*width, 0.75*height);
   text("Radius: " + radiusSliderDwarf.current, 0.1*width, 0.80*height);
   text("Orbit time: ",0.1*width,0.85*height);
   }
   
   if (choice == 'T'){
   TerrestrialName.displayTextbox();
   TerrestrialName.type();  
   massSliderTerrestrial.displaySlider();
   radiusSliderTerrestrial.displaySlider();
   text("Name", 0.1*width, 0.70*height);
   text("Mass: " + massSliderTerrestrial.current, 0.1*width, 0.75*height);
   text("Radius: " + radiusSliderTerrestrial.current, 0.1*width, 0.80*height);
   text("Orbit time: ",0.1*width,0.85*height);
   }
   if (choice == 'G'){
   GiantName.displayTextbox();
   GiantName.type();  
   massSliderGiant.displaySlider();
   radiusSliderGiant.displaySlider();
   text("Name", 0.1*width, 0.70*height);
   text("Mass: " + massSliderGiant.current, 0.1*width, 0.75*height);
   text("Radius: " + radiusSliderGiant.current, 0.1*width, 0.80*height);
   text("Orbit time: ",0.1*width,0.85*height);
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
