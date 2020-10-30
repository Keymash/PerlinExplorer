float scale = 0.03;
float xoffset = 0;
float yoffset = 0;
float scalingSpeed = 0.005;
void setup()
{
  size(200, 200);
  xoffset = random(1000000);
  yoffset = random(1000000);
  makeNoise();
}

void draw()
{
  
}

void keyPressed()
{
  switch(key)
  {
  case 'q':
    scale += scalingSpeed;
    break;
  case 'e':
    scale -= scalingSpeed;
    break;
  case 'a':
    xoffset -= 20 * scale;
    break;
  case 'd':
    xoffset += 20 * scale;
    break;
  case 'w':
    yoffset -= 20 * scale;
    break;
  case 's':
    yoffset += 20 * scale;
    break;
  case 'z':
    randomize();
    break;
  default:
    break;
  }
  makeNoise();
}

void mousePressed()
{
  makeNoise();
}

void randomize()
{
  xoffset = random(1000000);
  yoffset = random(1000000);
}

void makeNoise()
{
  background(0);
  for (int y = 0; y < height; y++)
  {
    for (int x = 0; x< width; x++)
    {
      int value = (int)map(noise(x * scale + xoffset, y * scale + yoffset), 0, 1, 0, 255);
      stroke(value);
      point(x, y);
    }
  }
}
