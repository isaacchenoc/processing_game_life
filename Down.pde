class Down {
  DialogBox dia0;
  boolean active;
  int timer;

  Down() {
    dia0 = new DialogBox("I remember one thing now....I have died....");
    active = false;
    timer = 0;
  }
  
  void display() {
    PImage main = loadImage("main/down.png");
    
    if (active) {
      timer = timer+20;
      tint(0,timer);
      
    }
    image(main,0,0,width,height);
    tint(255); 
    if (dia0.isNotDone()&&timer>200) {
      dia0.drawBox(width/3,0.92*height,width,width/8,1);
    }
    if (timer>1000) {setup();}
}
}