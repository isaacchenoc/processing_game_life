class InsideB {
  DialogBox dia0;
  boolean active;
  boolean puteyes;
  boolean axe;
  
  InsideB() {
    dia0 = new DialogBox("A skull...seems miss something...");
    active = false;
    puteyes = false;
    axe = false;
  }
  
  void display() {
        // These images are originally from the free source "http://www.clipartlord.com/"
    PImage main = loadImage("main/insideb.png");
    PImage skull = loadImage("main/skull.png");
    PImage axes = loadImage("main/axes.png");
    PImage haxes = loadImage("main/haxes.png");
    image(main,0,0,width,height);
    items.display();
    hp.display();
    
    if (axe) image(axes,0,0,width,height);
    if (!axe)  image(haxes,0,0,width,height);
    
    if (puteyes) 
    image(skull,0,0,width,height);

    if (dia0.isNotDone()) {
      dia0.drawBox(width/3,0.92*height,width,width/8,6);
    }

}
}