PFont f;
void setup(){
  size(400,200);
  f = createFont("Arial",16,true);
}


void draw(){
  
  background(255);

   stroke(400);


  textFont(f);       
  fill(0);
  
  textAlign(CENTER);
  text("Press anywhere to play", width/2, 60);
}
