class BackgroundStar
{
  int x, y;
  BackgroundStar(int a, int b)
  {
    x = a;
    y = b;
  }
}
BackgroundStar bStar[] = new BackgroundStar[100];
void starInit()
{
  for (int i = 0; i < bStar.length; i++)
    bStar[i] = new BackgroundStar((int)random(0, width), (int)random(0, height));
}
void starDraw()
{
  for (int i = 0; i < bStar.length; i++)
  {
    fill(255);
    rect(bStar[i].x, bStar[i].y, 10, 10);
  }
}
