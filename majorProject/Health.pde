class Health {
  int value;

  Health() {
    value = 3;
  }
  
  void display() {
    // This image is originally from the free source "http://www.clipartlord.com/"
    if(value>=1) {
     PImage hp = loadImage("health/"+value+".png");
     image(hp,0,0,width,height);
  }}
}