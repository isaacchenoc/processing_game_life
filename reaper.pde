class Reaper {
  DialogBox dia0, dia1, dia2, dia3, dia4;
  boolean exist;
  int timer;
  int dnum;
  
  Reaper() {
    dia0 = new DialogBox("Do you see my friend, Black spirit?");
    dia1 = new DialogBox("He's often playing around.");
    dia2 = new DialogBox("You are not allowed to go ahead.");
    dia3 = new DialogBox("You cannot go there...");
    dia4 = new DialogBox("His feather, I can find him now.");
    exist = true;
    timer = 100;
    dnum = 0;
  }
  
  void display() {
        // These images are originally from the free source "http://www.clipartlord.com/"
    PImage main = loadImage("main/reaper.png");
    PImage death = loadImage("main/death.png");
    image(main,0,0,width,height);
    items.display();
    image(back,0,0,width,height);
    hp.display();
    if (!exist) {
      timer = (timer<0)? 0 : timer-10;
      tint(255,timer);
    }
    image(death,0,0,width,height);
    tint(255);

    if (dia0.isNotDone()) {
      dia0.npc = true;
      dia0.drawBox(width/3,0.03*height,width,width/8,6);
    }
    if (dia1.isNotDone()) {
      dia1.npc = true;
      dia1.drawBox(width/3,0.03*height,width,width/8,6);
    }    
    if (dia2.isNotDone()) {
      dia2.npc = true;
      dia2.drawBox(width/3,0.03*height,width,width/8,6);
    }
    if (dia3.isNotDone()) {
      dia3.npc = true;
      dia3.drawBox(width/3,0.03*height,width,width/8,6);
    }
    if (dia4.isNotDone()) {
      dia4.npc = true;
      dia4.drawBox(width/3,0.03*height,width,width/8,6);
  }
}
}