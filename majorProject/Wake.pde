class Wake {
  DialogBox  tree,out,tip;
  boolean active;
  
  Wake() {
    tree = new DialogBox("A dead tree, looks horrible...There are so many of them.");
    out = new DialogBox("seems the only thing I can do is go ahead.");
    tip = new DialogBox("         Click to interact");
    active = false;
    tip.start();
  }
  
  void display() {
       // These images are originally from the free sources "http://www.clipartlord.com/" and "https://openclipart.org/tags/dead%20tree"
    PImage main = loadImage("main/wake.png");
    image(main,0,0,width,height);
    items.display();
    hp.display();

    if (tree.isNotDone()) {
      tree.drawBox(width/3,0.92*height,width,width/8,6);
    }
    if (out.isNotDone()) {
      out.drawBox(width/3,0.92*height,width,width/8,6);
    }
    
    if (tip.isNotDone()) {
      tip.tip = true;
      tip.drawBox(width/3,0.5*height,width,width/8,4);
    }
  }
  
}