class CastleF {
  
  CastleF() {}
  
  void display() {
    // These images are originally from the free source "http://www.clipartlord.com/"
    PImage main = loadImage("main/castlef.png");
    image(main,0,0,width,height);
    items.display();
    image(back,0,0,width,height);
    hp.display();
  }
}