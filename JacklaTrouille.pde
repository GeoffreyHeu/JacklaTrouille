PImage background;

ArrayList<Orb> my_orbs;

long time_counter;

void setup() //On initialise la fenêtre
{
  size(1200, 720);
  background = loadImage("resources/training_background.png");
  my_orbs = new ArrayList();
  time_counter = millis();
}

void draw() //On dessine dans la fenêtre
{
  clear();
  background(background);
  
  Spawn();
  
  for(int i = 0; i < my_orbs.size(); i++)
  {
    if (my_orbs.get(i).is_alive() == 0) 
    {
      my_orbs.get(i).move();
       my_orbs.get(i).display();
    }
    else 
    {
      my_orbs.remove(i);
      i--;
    }
  }
}

void Spawn() 
{
  
  for (int i = 0; i < my_orbs.size(); i++)
  {
    my_orbs.get(i).move();
    my_orbs.get(i).display();
  }
  
  if(time_counter <= millis())
  {
  my_orbs.add(new Orb());
  
  time_counter = millis() + 1500;
  }
}

void mousePressed()
{
  if(mouseButton == LEFT) {
    for (int i = 0; i < my_orbs.size(); i += 1)
    {
      my_orbs.get(i).click();
      System.out.println("Click : " + i);
    }
  }
}
