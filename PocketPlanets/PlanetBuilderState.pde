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
  
  
  
  PlanetBuilderState()
  {
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
   //dwarf button
   image(img1, 0.925*width, height*0.2, height*0.15, height*0.15);
   Button DwarfButton = new Button("", int(0.925*width),int(height*0.2),int(height*0.15),int(height*0.15), 255, 0); 
   DwarfButton.displayButton();
   if(DwarfButton.ButtonPressed() == true)
   choice = 'D';
   
   //terrestrial button
   image(img2, 0.925*width, height*0.355, height*0.15, height*0.15);
   Button TerrestrialButton = new Button("", int(0.925*width),int(height*0.355),int(height*0.15),int(height*0.15), 255, 0); 
   TerrestrialButton.displayButton();
   if(TerrestrialButton.ButtonPressed() == true)
   choice = 'T';
   
   //Giant button
   image(img3, 0.925*width, height*0.55, height*0.15, height*0.15);
   Button GiantButton = new Button("", int(0.925*width),int(height*0.55),int(height*0.15),int(height*0.15), 255, 0); 
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
   massSliderDwarf.displaySlider();
   radiusSliderDwarf.displaySlider();
   }
   
   if (choice == 'T'){
   massSliderTerrestrial.displaySlider();
   radiusSliderTerrestrial.displaySlider();
   }
   if (choice == 'G'){
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
}
class Dwarf extends Planet { 
  
  Dwarf(){
  mass= random(pow(10,20),2*pow(10,22));   //mass in kg 
  radius = random(300*pow(10,3),2000*pow(10,3)); // radius is  m
  name = "Barack Obama";
  dist_from_sun = counter* 500*pow(10,3);
  //orbit_speed = sqrt(radius/(G*msun));
  }
}
  
class Terrestrial extends Planet { 
  
  Terrestrial(){
  mass= random(pow(10,20),2*pow(10,22));   //mass in kg 
  radius = random(300*pow(10,3),2000*pow(10,3)); // radius is  m
  name = "Barack Obama 2";
  dist_from_sun = counter* 500*pow(10,3);
 // orbit_speed = sqrt(radius/(G*msun));
  }
}
  
class Giant extends Planet { 
  
  Giant(){
  mass= random(pow(10,20),2*pow(10,22));   //mass in kg 
  radius = random(300*pow(10,3),2000*pow(10,3)); // radius is  m
  name = "Barack Obama 3";
  dist_from_sun = counter* 500*pow(10,3);
  //orbit_speed = sqrt(radius/(G*msun));
  }
}
