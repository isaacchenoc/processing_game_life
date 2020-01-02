class Tombs {
  boolean existE, existS;
  int timer;
  
  Tombs() {
    existS = true;
    existE = true;
    timer = 100;
  }
  
  void display() {
        // These images are originally from the free source "http://www.clipartlord.com/"
    PImage main = loadImage("main/tombs.png");
    PImage snake = loadImage("main/snake.png");
    PImage eyeball = loadImage("main/eyeball.png");
    image(main,0,0,width,height);
    items.display();
    image(back,0,0,width,height);
    hp.display();
    if (existE)
    image(eyeball,0,0,width,height);
    if (!existS) {
      timer = (timer<0)? 0 : timer-20;
      tint(255,timer);
    }
    image(snake,0,0,width,height);
    tint(255);
  }
}