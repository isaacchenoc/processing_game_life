class Dtree {
  boolean exist, activeU;
  boolean activeM;
  int timer;
  
  Dtree() {
    exist = true;
    activeU = false;
    activeM = false;
    timer = 100;
  }
  
  void display() {
   // These images are originally from the free sources "http://www.clipartlord.com/" and "https://openclipart.org/tags/dead%20tree"
    PImage main = loadImage("main/dtree.png");
    PImage map = loadImage("main/map.png");
    PImage amap = loadImage("main/amap.png");
    PImage umap = loadImage("main/umap.png");
    image(main,0,0,width,height);
    items.display();
    image(back,0,0,width,height);
    hp.display();
    if (!exist) {
      timer =   timer-20;
      tint(255,timer);
    }
    image(map,0,0,width,height);
    tint(255);
    if (exist) {
    if (activeU) {
      image(umap,0,0,width,height);
        if (activeM) image(amap,0,0,width,height);
      }
    }
  }
}