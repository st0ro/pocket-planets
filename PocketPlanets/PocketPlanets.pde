class BackgroundStar
{
  int x;
  int y;
}
BackgroundStar bStar[] = new BackgroundStar[100];
void setup()
{
  background(0);
  for (int i = 0; i < bStar.length; i++)
  {
    bStar[i] = new BackgroundStar();
    bStar[i].x = (int)random(0, width);
    bStar[i].y = (int)random(0, height);
  }
}
void draw()
{
  for (int i = 0; i < bStar.length; i++)
  {
    rect(bStar[i].x, bStar[i].y, 10, 10);
  }
}
