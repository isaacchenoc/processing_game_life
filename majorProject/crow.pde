class Crow {
  DialogBox rockdia, treedia, tombdia, tip;
  boolean existC, existS, activeT, existF, got;
  int timer1, timer2;
  
  Crow() {
    rockdia = new DialogBox("some shards, seems useful in some ways...");
    treedia = new DialogBox("Another tree, a dark crow on the branch, it's impossible to reach it.");
    tombdia = new DialogBox("tomb stones, seems something there...");
    tip = new DialogBox("         click items at the bottem to use and interact with other objects");
    existC = true;
    existS = true;
    existF = false;
    activeT = false;
    got = false;
    tip.start();
    timer1 = 100;
    timer2 = 0;
  }
  
  void display() {
       // These images are originally from the free sources "http://www.clipartlord.com/" 
    PImage main = loadImage("main/crow.png");
    PImage shard = loadImage("main/shard.png");
    PImage bird = loadImage("main/crowtree.png");
    PImage feather = loadImage("main/feather.png");
    image(main,0,0,width,height);
    items.display();
    image(back,0,0,width,height);
    hp.display();
    tint(255,timer2);
    if (existF)
    image(feather,0,0,width,height);
    tint(255);
    if (!existC) {
      timer1 = (timer1<0)? 0 : timer1-20;
      timer2 = (timer2>100)? 100 : timer2+20;
      tint(255,timer1);
    }
    image(bird,0,0,width,height);
    tint(255);
    if (existS)
    image(shard,0,0,width,height);
    
    if (rockdia.isNotDone()) {
      rockdia.drawBox(width/3,0.92*height,width,width/8,7);
    }
    if (treedia.isNotDone()) {
      treedia.drawBox(width/3,0.92*height,width,width/8,7);
    }
    if (tombdia.isNotDone()) {
      tombdia.drawBox(width/3,0.92*height,width,width/8,7);
    }
    if (tip.isNotDone()) {
      tip.tip = true;
      tip.drawBox(0,0.5*height,width,width/8,5);
    } 
  }
  
}