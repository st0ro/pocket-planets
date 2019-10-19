State[] states = new State[4];


int currentState = 1;

Star userStar;

void setup()
{
  frameRate(60);
  orientation(LANDSCAPE);
  textAlign(CENTER, CENTER);
  states[0] = new MainMenuState();
  states[1] = new PlanetBuilderState();
  states[2] = new SolarViewState();
  states[3] = new StarBuilderState();
  starInit();
  
}

void draw()
{
  background(0);
  starDraw();
  states[currentState].update();
}

class State
{
  void update(){
}

class Button
{
  String label;
  int x, y, h, w;
  int colour;

  void displayButton()
  {
    fill(colour);
    rect(x, y, w, h);
    fill(0);
    textSize(h*0.75);
    text(label, x + (w/2), y + (h/2));
  }

  boolean ButtonPressed()
  {
    for (int i = 0; i <touches.length; i++)
    {
      if (touches[i].x > x && touches[i].x < x + w && touches[i].y > y && touches[i].y < y + h)
        return true;
    }
    return false;
  }

  Button(String l, int a, int b, int c, int d, int e)
  {
    label = l;
    x=a;
    y=b;
    w=c;
    h=d;
    colour = e;
  }
}

class Slider
{
  int x, y, w, min, max; 
  float current;
  int sx;
  int colour;

  void displaySlider()
  {
    fill(colour);
    moveSlider();
    current = ((sx-x)/(float)w)*(max - min) + min;
    rect(x, y+40, w, 20);
    rect(sx, y, 40, 100);
    fill(colour); 
    textSize(40);
    text(min, x, y+150);
    text(max, x+w, y+150);
    text((int)current, x+(w/2), y+150);
  }

  boolean selectSlider()
  {
    for (int i = 0; i <touches.length; i++)
    {
      if (touches[i].x > x - 50 && touches[i].x < x + w + 50 && touches[i].y > y - 100 && touches[i].y < y + 120)
        return true;
    }
    return false;
  }

  void moveSlider()
  {
    if (selectSlider())
    {
      fill(255);
      for (int i = 0; i < touches.length; i++)
      {
        if (touches[i].x > x && touches[i].x < (x + w))
          sx=(int)touches[i].x;
        else if (touches[i].x > x - 50 && touches [i].x < x)
          sx = x;
        else if (touches[i].x < x + w + 50 && touches[i].x > x + w)
          sx = x+w;
      }
    }
  }

  Slider(int a, int b, int c, int d, int e, int f)
  {
    x = a;
    sx = a;
    y = b;
    w = c;
    min = d;
    max = e;
    colour = f;
  }
}
}
