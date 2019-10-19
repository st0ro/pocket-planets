class StarBuilderState extends State
{
  StarBuilderState()
  {
    userStar = new StarYellowDwarf();
  }
  void update()
  {
    userStar.renderStar(width*0.3, height*.5, height*.6);
    fill(#3F3F3F);
    rect(width*.6, 0, width*.4, height);
  }
}

class Star
{
  double tempMin, tempMax, radMin, radMax, massMin, massMax, prev, radUser, massUser, radView;
  String lifeMin, lifeMax, starName, userName;
  int starColor, star2ndColor, star3rdColor;
  Star(String in) {starName = in;}
  void renderStar(float x, float y, float diam)
  {
    noStroke();
    fill(userStar.starColor);
    ellipse(x, y, diam, diam);
    fill(userStar.star2ndColor);
    ellipse(x, y, diam*.8, diam*.8);
    fill(userStar.star3rdColor);
    ellipse(x, y, diam*.6, diam*.6);
  }
}
class StarYellowDwarf extends Star
{
  StarYellowDwarf()
  {
    super("Yellow Dwarf");
    lifeMin = "4 billion";
    lifeMax = "17 billion";
    tempMin = 5000;
    tempMax = 7300;
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
    lifeMin = "73 billion";
    lifeMax = "5.5 trillion";
    tempMin = 1800;
    tempMax = 3500;
    radMin = 0.12;
    radMax = 0.7;
    massMin = 0.08;
    massMax = 0.45;
    prev = .73;
    starColor = #FF5E00;
    star2ndColor = #F59E2C;
    star3rdColor = #FAB253;
  }
}
class StarBlueGiant extends Star
{
  StarBlueGiant()
  {
    super("Blue Giant");
    lifeMin = "3 million";
    lifeMax = "4 billion";
    tempMin = 7300;
    tempMax = 200000;
    radMin = 1.4;
    radMax = 250;
    massMin = 1.4;
    massMax = 265;
    prev = .007;
    starColor = #FF5E00;
    star2ndColor = #F59E2C;
    star3rdColor = #FAB253;
  }
}
