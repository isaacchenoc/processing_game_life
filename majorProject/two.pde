class Two {
  DialogBox tree;
  boolean active, exist;
  
  Two() {
    tree = new DialogBox("The branch is broken off...");
    active = false;
    exist = true;
  }
  
  void display() {
        // These images are originally from the free source "http://www.clipartlord.com/"
    PImage main = loadImage("main/two.png");
    PImage branch = loadImage("main/branch.png");
    image(main,0,0,width,height);
    items.display();
    image(back,0,0,width,height);
    hp.display();
    if (exist) image(branch,0,0,width,height);
    if (tree.isNotDone()) {
      tree.drawBox(width/3,0.92*height,width,width/8,6);
    }
  }
}