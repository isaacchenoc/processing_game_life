class Title {
  DialogBox dia1,dia2;
  boolean active;
  int timer;
  
  Title() {
      dia1 = new DialogBox("             Where am I?....What happened to me?           ");
      dia2 = new DialogBox("              I can't remember...not a thing...                                                ");
      active = false;
      timer = 0;
  }
  
  
  void display() {
     PImage main = loadImage("main/title.png");
     image(main,0,0,width,height);
     
     if (active) {
      timer = timer+50;
      tint(0,timer);
      
    }
    image(main,0,0,width,height);
    tint(255); 
    if (dia1.isNotDone()&&timer>200) {
      dia1.drawBox(width/3,0.92*height,width,width/8,4);
    }
    if (dia2.isNotDone()&&timer>600) {
      dia2.drawBox(width/3,0.92*height,width,width/8,3);
    }
  }
}