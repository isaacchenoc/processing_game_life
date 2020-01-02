class Up {
  DialogBox dia0;
  boolean active;
  int timer;
  int timer2;
  Up() {
    dia0 = new DialogBox("                  END                        ");
    active = false;
    timer = 100;
    timer = 200;
  }
  
  void display() {
    PImage main = loadImage("main/up.png");
    background(255);
    if (active) {
      timer2 += 20;
      timer = (timer<0)? 0 : timer-10;
      tint(255,timer);
      
    }
    image(main,0,0,width,height);
    tint(255); 
    if (dia0.isNotDone()&&timer<20) {
      dia0.end = true;
      dia0.drawBox(width/3,height/2,width,width/8,1);
    }
    if (timer2>1000) {setup();}

}
}