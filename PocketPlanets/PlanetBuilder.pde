class Planet{
  double radius;
  double mass;
  double orbit_speed;
  double dist_from_sun;
  String name;
  int counter = 0;
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
