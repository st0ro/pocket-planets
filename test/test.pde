PFont f;
void setup(){
  size(500,400);
  f = createFont("Arial",20,true);
}


void draw(){
  
  background(255);

  stroke(400);


  textFont(f);       
  fill(0);
  
  textAlign(CENTER);
  text("Press anywhere to play", width/2, 60);
}
