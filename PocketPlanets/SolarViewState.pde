class SolarViewState extends State
{
  PImage img1, img2, img3,img4;
  int money;
  Button BuildButton = new Button("", width*0.9, height*4/5, width*0.1, width*0.1, 255, 0);
  SolarViewState()
  {
    img1 =loadImage("solar.png");
    img2 =loadImage("galaxy.jpg");
    img3 =loadImage("universe.jpg");
    img4 = loadImage("hammer.png");
    money = 100000;
  }
  void update()
  { 
    if (currentState ==2) {
      for (int i = 0; i < planets.length; i++)
      {
        if(planets[i] != null)
          stardust+=planets[i].revenue;
      }
      fill(#7F7F7F);
      textAlign(CENTER, CENTER);
      rect(width*0.9, height*4/5, width*0.1, width*0.1, 10); //build icon
      fill(0);
      textSize(80);
      //text("Build", width*0.91, height*4.6/5);//build 
      BuildButton.displayButton();
      if(BuildButton.ButtonPressed() == true)
      currentState = 1;
      image(img4, width*0.9, height*4/5, width*0.1, width*0.1);
      fill(#7F7F7F);
      rect (width * 0.75, height*0.078, width *0.05, width *0.05, 10);
      rect (width * 0.82, height*0.078, width *0.05, width *0.05, 10);
      rect (width * 0.89, height*0.078, width *0.05, width *0.05, 10);
      fill(255);
      image(img1, width * 0.75, height*0.078, width *0.05, width *0.05);
      image(img2, width * 0.82, height*0.078, width *0.05, width *0.05);
      image(img3, width * 0.89, height*0.078, width *0.05, width *0.05);
      textSize(80);
      textAlign(LEFT, CENTER);
      text(stardust + " SDs", width*0.02, height*0.1);

      for (int i = 0; i < planets.length; i++)
      {
        if (planets[i] != null)
        {
          noFill();
          strokeWeight(5);
          stroke(225);
          arc(width*0.5, height*0.5, planets[i].xOrbitDiam, planets[i].yOrbitDiam, PI, 2*PI);
          if (sin(planets[i].angle) < 0)
            planets[i].planetUpdate(planets[i].xOrbitDiam*0.5, planets[i].yOrbitDiam*0.5, planets[i].planetDiam);
        }
      }
      userStar.renderStar(width*0.5, height*0.5, height*0.5);//sun
      for (int i = 0; i < planets.length; i++)
      {
        if (planets[i] != null)
        {
          noFill();
          strokeWeight(5);
          stroke(225);
          arc(width*0.5, height*0.5, planets[i].xOrbitDiam, planets[i].yOrbitDiam, 0, PI);
          if (sin(planets[i].angle) > 0)
            planets[i].planetUpdate(planets[i].xOrbitDiam*0.5, planets[i].yOrbitDiam*0.5, planets[i].planetDiam);
        }
      }

      noStroke();
    }
  }
}
