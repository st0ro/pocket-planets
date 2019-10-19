State[] states = new State[4];
int currentState = 0;

void setup()
{
  frameRate(60);
  orientation(LANDSCAPE);
  states[0] = new MainMenuState();
  states[1] = new PlanetBuilderState();
  states[2] = new SolarViewState();
  states[3] = new StarBuilderState();
  starInit();
}
void draw()
{
  background(255);
  if(currentState == 0 || currentState == 2) starDraw();
  states[currentState].update();
}

class State
{
  void update(){}
}
