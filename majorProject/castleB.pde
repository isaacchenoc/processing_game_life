class CastleB {
  boolean actived,activel;
  int timer;
  ArrayList<Integer> password;
  int passsum;
  
  
  CastleB() {
    actived = false;
    activel = false;
    timer = 100;
    password = new ArrayList();
    passsum = 0;
  }
  
  void display() {
       // These images are originally from the free sources "http://www.clipartlord.com/" and "https://openclipart.org/tags/dead%20tree"
    PImage main = loadImage("main/castlebr.png");
    PImage door = loadImage("main/castlebackdoor.png");
    PImage lock = loadImage("main/pad.png");
    PImage lock1 = loadImage("main/pad1.png");
    PImage lock2 = loadImage("main/pad2.png");
    PImage lock3 = loadImage("main/pad3.png");
    image(main,0,0,width,height);
    items.display();
    hp.display();
    image(back,0,0,width,height);
    if (actived) {
      timer = (timer<0)? 0 : timer-20;
      tint(255,timer);
    }
    image(door,0,0,width,height);
    tint(255);
    if (activel) {
      switch(password.size()) {
        case 0:
        image(lock,0,0,width,height);
        break;        
        case 1:
        image(lock1,0,0,width,height);
        break;
        case 2:
        image(lock2,0,0,width,height);
        break;
        case 3:
        image(lock3,0,0,width,height);
        break;
      }
    }
  }
}