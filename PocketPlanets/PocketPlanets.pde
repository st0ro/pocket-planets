State[] states = new State[4];

boolean keyboard = false;
int currentState = 2;
Star userStar;
Planet[] planets = new Planet[3];
String textinput = "";
PFont font;

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
  font = loadFont("OCRAExtended-48.vlw");
}
Textbox test = new Textbox(500, 200, 300, 100);
void draw()
{
  background(0);
  starDraw();
  states[currentState].update();
  test.displayTextbox();
}

void keyPressed()
{
  if ((key>= 'a' && key<='z')||(key>='A' && key<='Z')||(key=='-')||(key>='0' && key <= '9'))
    textinput = textinput + key;
  else if (key==65535 && textinput.length() > 0)
    textinput = textinput.substring(0, textinput.length() - 1);
}

class State
{
  void update() {}
}

class Button
{
  String label;
  int x, y, h, w;
  int colour, trans;

  void displayButton()
  {
    fill(colour, trans);
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

  Button(String l, int a, int b, int c, int d, int e, int f)
  {
    label = l;
    x=a;
    y=b;
    w=c;
    h=d;
    colour = e;
    trans = f;
  }
}

class Slider
{
  float x, y, w, min, max; 
  float current;
  float sx;
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
    text(current, x+(w/2), y+150);
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

  Slider(float a, float b, float c, float d, float e, int f)
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

class Textbox
{
  int x, y, w, h;
  void type()
  {
    for (int i = 0; i <touches.length; i++)
    {
      if (touches[i].x > x-20 && touches[i].x < x + w + 20 && touches[i].y > y - 20 && touches[i].y < y + h + 20 && !keyboard)
        openKeyboard();
    }
  }

  void displayTextbox()
  {
    type();
    fill(255);
    rect(x, y, w, h);
    fill(0);
    textAlign(LEFT, CENTER);
    textSize(h*0.75);
    text(textinput, x + 10, y + h/2);
    textAlign(CENTER, CENTER);
  }

  Textbox(int a, int b, int c, int d)
  {
    x = a;
    y = b;
    w = c;
    h = d;
  }
}
