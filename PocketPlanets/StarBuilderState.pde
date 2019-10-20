class StarBuilderState extends State
{
  Slider sizeSlider;
  Button yellowButton, redButton, blueButton, goButton;
  Star tempYellow, tempRed, tempBlue;
  StarBuilderState()
  {
    userStar = new StarYellowDwarf();
    sizeSlider = new Slider(width*0.64, height*0.65, width*.32, (float)userStar.radMin, (float)userStar.radMax, #BFBFBF);
    yellowButton = new Button("", (int)(width*.63), (int)(height*0.35), (int)(width*.1), (int)(width*0.1), #7F7F7F, 255);
    redButton = new Button("", (int)(width*.75), (int)(height*0.35), (int)(width*.1), (int)(width*0.1), #7F7F7F, 255);
    blueButton = new Button("", (int)(width*.87), (int)(height*0.35), (int)(width*.1), (int)(width*0.1), #7F7F7F, 255);
    goButton = new Button("Go!", (int)(width*.63), (int)(height*0.8), (int)(width*.34), (int)(height*0.18), #7F7F7F, 255);
    tempYellow = new StarYellowDwarf();
    tempRed = new StarRedDwarf();
    tempBlue = new StarBlueGiant();
  }
  void update()
  {
    userStar.renderStar(width*0.3, height*.5, height*.09*log(sizeSlider.current*100));
    fill(#3F3F3F, 170);
    rect(width*.6, 0, width*.4, height);
    sizeSlider.displaySlider();
    yellowButton.displayButton();
    tempYellow.renderStar(width*0.68, height*0.45, width*0.06);
    redButton.displayButton();
    tempRed.renderStar(width*0.80, height*0.45, width*0.05);
    blueButton.displayButton();
    tempBlue.renderStar(width*0.92, height*0.45, width*0.08);
    goButton.displayButton();
    fill(255);
    textAlign(LEFT, CENTER);
    textSize(48);
    text("Star Size (compared to the Sun)", width*.63, height*0.6);
    textSize(96);
    textAlign(CENTER, TOP);
    text(userStar.starName, width*.8, height*0.03);
    textSize(48);
    text("Star Life: " + userStar.life, width*.8, height*0.15);
    text("Temperature: " + userStar.temp, width*.8, height*0.2+5);
    
    if(yellowButton.ButtonPressed())
    {
      userStar = new StarYellowDwarf();
      sizeSlider.min = (float)userStar.radMin;
      sizeSlider.max = (float)userStar.radMax;
    }
    if(redButton.ButtonPressed())
    {
      userStar = new StarRedDwarf();
      sizeSlider.min = (float)userStar.radMin;
      sizeSlider.max = (float)userStar.radMax;
    }
    if(blueButton.ButtonPressed())
    {
      userStar = new StarBlueGiant();
      sizeSlider.min = (float)userStar.radMin;
      sizeSlider.max = (float)userStar.radMax;
    }
  }
}

class Star
{
  double radMin, radMax, massMin, massMax, prev, radUser, massUser, radView;
  String life, starName, userName, temp;
  int starColor, star2ndColor, star3rdColor;
  Star(String in) {
    starName = in;
  }
  void renderStar(float x, float y, float diam)
  {
    noStroke();
    fill(starColor);
    ellipse(x, y, diam, diam);
    fill(star2ndColor);
    ellipse(x, y, diam*.8, diam*.8);
    fill(star3rdColor);
    ellipse(x, y, diam*.6, diam*.6);
  }
}
class StarYellowDwarf extends Star
{
  StarYellowDwarf()
  {
    super("Yellow Dwarf");
    life = "4-17 billion years";
    temp = "5000-7300 C";
    radMin = 0.96;
    radMax = 1.4;
    massMin = 0.8;
    massMax = 1.4;
    prev = .1;
    starColor = #FF5E00;
    star2ndColor = #F59E2C;
    star3rdColor = #FAB253;
  }
}
class StarRedDwarf extends Star
{
  StarRedDwarf()
  {
    super("Red Dwarf");
    life = "73-5500 billion years";
    temp = "1800-3500 C";
    radMin = 0.12;
    radMax = 0.7;
    massMin = 0.08;
    massMax = 0.45;
    prev = .73;
    starColor = #FF3300;
    star2ndColor = #FF6F00;
    star3rdColor = #FF9E00;
  }
}
class StarBlueGiant extends Star
{
  StarBlueGiant()
  {
    super("Blue Giant");
    life = "3-4000 million years";
    temp = "7300-200000 C";
    radMin = 1.4;
    radMax = 250;
    massMin = 1.4;
    massMax = 265;
    prev = .007;
    starColor = #00B0FF;
    star2ndColor = #90F7FF;
    star3rdColor = #E3FDFF;
  }
}
