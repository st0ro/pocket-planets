class BackgroundStar
{
  int x, y;
  BackgroundStar(int a, int b)
  {
    x = a;
    y = b;
  }
}
class FlickerStar
{
  int x, y, tint;
  FlickerStar(int a, int b, int c)
  {
    x = a;
    y = b;
    tint = c;
  }
}
BackgroundStar bStar[] = new BackgroundStar[80];
FlickerStar fStar[] = new FlickerStar[40];
void starInit()
{
  for (int i = 0; i < bStar.length; i++)
    bStar[i] = new BackgroundStar((int)random(0, width), (int)random(0, height));
  for (int i = 0; i < fStar.length; i++)
  {
    fStar[i] = new FlickerStar ((int)random(0, width), (int)random(0, height), (int)random(0, 255));
  }
}
void starDraw()
{
  for (int i = 0; i < bStar.length; i++)
  {
    fill(255);
    rect(bStar[i].x, bStar[i].y, 10, 10);
  }
  for (int i = 0; i < fStar.length; i++)
  {
    if (fStar[i].tint <= 255)
      fill(fStar[i].tint);
    else 
      fill(510-fStar[i].tint);
    rect(fStar[i].x, bStar[i].y, 10, 10);
    fStar[i].tint += 5;
    if (fStar[i].tint >= 510)
      fStar[i].tint = 0;
  }
}
