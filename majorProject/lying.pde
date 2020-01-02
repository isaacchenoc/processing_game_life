class Lying {
  DialogBox dia1, tree,tip;
  boolean existM,existK,activeM,activeU,activeP;
  int timer;
  
  Lying() {
    dia1 = new DialogBox("Someone is lying there...what's beside him...");
    tree = new DialogBox("Another dead tree, but this seems different...");
    tip = new DialogBox("                        some objects can be picked up");
    existM = true;
    existK = true;
    activeM = false;
    activeU = false;
    activeP = false;
    timer = 100;
    tip.start();
  }
  
  void display() {
       // These images are originally from the free sources "http://www.clipartlord.com/" and "http://www.clipartpanda.com/"
    PImage main = loadImage("main/lying.png");
    PImage man = loadImage("main/man.png");
    PImage unopenpapaer = loadImage("main/unopenpaper.png");
    PImage paper = loadImage("main/paper.png");
    PImage ky = loadImage("main/ky.png");
    image(main,0,0,width,height);
    items.display();
    image(back,0,0,width,height);
    hp.display();
    if (!existM) {
      timer = (timer<0)? 0 : timer-20;
      tint(255,timer);
    }
    image(man,0,0,width,height);
    tint(255);
    if  (existM) {
    if (activeU)
    image(unopenpapaer,0,0,width,height);
    if (activeP) {
    image(paper,0,0,width,height);
      if (existK) image(ky,0,0,width,height);
    }
  }
    if (dia1.isNotDone()) {
      dia1.drawBox(width/3,0.92*height,width,width/8,6);
    }
    if (tree.isNotDone()) {
      tree.drawBox(width/3,0.92*height,width,width/8,6);
    }
    if (tip.isNotDone()) {
      tip.tip = true;
      tip.drawBox(0,0.5*height,width,width/8,4);
    }    

  }
  
}