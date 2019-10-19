State[] states = new State[4];
int currentState = 0;

void setup()
{
  frameRate(60);
  orientation(LANDSCAPE);
  textAlign(CENTER, CENTER);
  states[0] = new MainMenuState();
  states[1] = new PlanetBuilderState();
  states[2] = new SolarViewState();
  states[3] = new StarBuilderState();
}

Slider testy = new Slider (600, 800, 1000, 1000, 2000);

void draw()
{
  background(0); 
  Button test = new Button ("test", 500, 500, 200, 100);
  test.displayButton();
  if (test.ButtonPressed())
  {
    background(0);
  }
  states[currentState].update();

  testy.displaySlider();
}

class State
{
  void update() {
  }
}

class Button
{
  String label;
  int x, y, h, w;

  void displayButton()
  {
    fill(0);
    text(label, x + (w/2), y + (h/2));
    fill(255);
    rect(x, y, w, h);
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

  Button(String l, int a, int b, int c, int d)
  {
    label = l;
    x=a;
    y=b;
    w=c;
    h=d;
  }
}

class Slider
{
  int x, y, w, min, max, current;
  int sx;

  void displaySlider()
  {
    fill(255);
    moveSlider();
    rect(x, y, w, 20);
    rect(sx, y, 40, 100);
    text(min, x, y+20);
    text(max, x+w, y+20);
    text(current, x+(w/2), y+20);
  }

  boolean selectSlider()
  {
    for (int i = 0; i <touches.length; i++)
    {
      if (touches[i].x > sx-100 && touches[i].x < sx + 120 && touches[i].y > y - 100 && touches[i].y < y + 150)
        return true;
    }
    return false;
  }

  void moveSlider()
  {
    if (selectSlider())
    {
      fill(128);
      for (int i = 0; i < touches.length; i++)
      {
        if (touches[i].x > x && touches[i].x < (x + w))
        {
          if (sx<=touches[i].x)
            sx=(int)touches[i].x - 10 ;
          else if (sx > touches[i].x)
            sx=(int)touches[i].x + 10;
        }
      }
    }
  }

  Slider(int a, int b, int c, int d, int e)
  {
    x = a;
    sx = a + 20;
    y = b;
    w = c;
    min = d;
    max = e;
  }
}
