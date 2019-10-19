class StarBuilderState extends State
{
  StarBuilderState()
  {
    userStar = new StarYellowDwarf();
  }
  void update()
  {
    noStroke();
    fill(userStar.starColor);
    ellipse(width*.3, height*.5, height*.6, height*.6);
    fill(userStar.star2ndColor);
    ellipse(width*.3, height*.5, height*.5, height*.5);
    fill(userStar.star3rdColor);
    ellipse(width*.3, height*.5, height*.4, height*.4);
    fill(#3F3F3F);
    rect(width*.6, 0, width*.4, height);
  }
}

class Star
{
  double lifeMin, lifeMax, tempMin, tempMax, radMin, radMax, massMin, massMax, prev, radUser, massUser, radView;
  String starName, userName;
  int starColor, star2ndColor, star3rdColor;
  Star(String in) {starName = in;}
}
class StarYellowDwarf extends Star
{
  StarYellowDwarf()
  {
    super("Yellow Dwarf");
    lifeMin = 4000;
    lifeMax = 17000;
    tempMin = 5000;
    tempMax = 7300;
    radMin = 0.96;
    radMax = 1.4;
    massMin = 0.8;
    massMax = 1.4;
    prev = .1;
    starColor = #FF5E00;
    star2ndColor = #F5A52C;
    star3rdColor = #FAC553;
  }
}
