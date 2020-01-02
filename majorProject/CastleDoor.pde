class CastleDoor {
  boolean active;
  boolean check;
  int timer;
  DialogBox dia1;
  
  CastleDoor() {
    active = false;
    check = false;
    dia1 = new DialogBox("          Locked!");
    timer = 100;
  }
  
  void display() {
    // These images are originally from the free source "http://www.clipartlord.com/"
    PImage main = loadImage("main/castledoor.png");
    PImage door = loadImage("main/cdoor.png");
    image(main,0,0,width,height);
    items.display();
    image(back,0,0,width,height);
    hp.display();
    if (active) {
      timer = (timer<0)? 0 : timer-15;
      tint(255,timer);
    }
    image(door,0,0,width,height);
    tint(255);
    
    if (dia1.isNotDone()) {
      dia1.drawBox(width/3,0.92*height,width,width/8,6);
    }
  }
}