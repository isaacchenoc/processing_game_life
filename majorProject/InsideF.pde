class InsideF {
  boolean actived,activel;
  int timer;
  
  InsideF() {
    actived = false;
    activel = false;
    timer = 100;
  }
  
  void display() {
        // These images are originally from the free source "http://www.clipartlord.com/"
    PImage main = loadImage("main/insidef.png");
    PImage door = loadImage("main/insidedoor.png");
    PImage lock = loadImage("main/lock.png");
    image(main,0,0,width,height);
    items.display();
    hp.display();
    if (actived) {
      timer = (timer<0)? 0 : timer-20;
      tint(255,timer);
    }
    image(door,0,0,width,height);
    tint(255);
    if (activel) {
      image(lock,0,0,width,height);
    }
  }
}