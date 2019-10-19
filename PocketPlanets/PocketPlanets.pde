int x = 1;

void setup()
{
  frameRate(30);
}
void draw()
{
  background(0);
  rect(x, x, 10, 10);
  x++;
}
