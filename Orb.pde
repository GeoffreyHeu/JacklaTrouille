class Orb
{
  int orb_size;
  int line_number;
  int position_x;
  int position_y;
  int speed_x;
  color my_color;
  boolean clicked;
  
  Orb()
  {
    orb_size = int(random(25, 50));
    
    int[] lines = {180, 300, 420, 540, 660};
    int line_number = int(random(0, 5));
    
    position_x = 700;
    position_y = lines[line_number];
    
    my_color = color(255, 127, 0);
    
    speed_x = int(random(2, 5));
    
    position_x = 1250;
  }
  
  void display() //Permet d'afficher un cercle a la position de notre orbe
  {
    pushStyle();
    
    fill(color(255, 127, 0));
    noStroke();
    
    circle(position_x, position_y, orb_size);
    
    popStyle();
  }
  
  void move() //Permet de déplacer l'orbe vers la gauche de l'écran
  {
    position_x -= speed_x;
  }
  
  int is_alive()
  {
    if(position_x < orb_size) 
    {
      return 1;
    }
    
    if(clicked == true) 
    {
      return 2;
    }
    
    cursor(HAND);
    return 0;
  }
  
  void click()
  {
    if (mouseX > position_x - orb_size
        && mouseX < position_x + orb_size
        && mouseY > position_y - orb_size
        && mouseY < position_y + orb_size)
    {
      clicked = true;
      cursor(CROSS);
    } 
    else
    {
      clicked = false;
    }
  }
}
