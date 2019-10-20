class SolarViewState extends State
{
  SolarViewState()
  {
    
  }
  void update()
  { 
    if(currentState ==2){
      fill(#7F7F7F);
      rect(width*0.9, height*4/5, width*0.1,width*0.1,10); //build icon
      fill(0);
      textSize(80);
      text("Build", width*0.91, height*4.6/5);//build text
      fill(#7F7F7F);
      rect(0, height*3/4, width/8, height,10); //player icon
      rect(width/8, height*0.9, width*2.5/10,height*0.1,10); // XP bar
      fill(0);
      textSize(50);
      text("5/10", (width/8)+(width*2.5/20) , height*0.95);//XP
      fill(#7F7F7F);
      rect(width/8,height*0.8,height*0.1, height*0.1,10); // level bar
      fill(0);
      textSize(70);
      text("69", width/8 + width/(15*5) , height*0.88);//level
      fill(#7F7F7F);
      rect (width * 0.75, height*0.078, width *0.05,width *0.05,10);
      rect (width * 0.82, height*0.078, width *0.05,width *0.05,10);
      rect (width * 0.89, height*0.078, width *0.05,width *0.05,10);
      fill(0);
      textSize(70);
      text("S", width*0.76,height*0.15);
      PImage img1 =loadImage("solar.png");
      image(img1,width * 0.75, height*0.078, width *0.05,width *0.05);
      text("G", width*0.83,height*0.15);
      PImage img2 =loadImage("galaxy.jpg");
      image(img2,width * 0.82, height*0.078, width *0.05,width *0.05);
      
      text("U", width*0.90,height*0.15);
      PImage img3 =loadImage("universe.jpg");
      image(img3,width * 0.89, height*0.078, width *0.05,width *0.05);
      textSize(150);
      text("420 SDs", width*0.1,height*0.1);
      
      userStar.renderStar(width*0.5, height*0.5, height*0.5);//sun
    }
  }
}