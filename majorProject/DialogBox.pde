class DialogBox {
  String boxText;
  int charCounter;
  int timeCounter;
  int opac;
  boolean npc;
  boolean end;
  boolean tip;
   
  DialogBox(String boxText){
    charCounter = 0;
    this.boxText = boxText;
    timeCounter = 0;
    opac = 0;
    npc = false;
    end = false;
    tip = false;
  }

  void drawBox(float x, float y, float width, float height, int speed){
    fill(28,opac);
    noStroke();
    if (npc) {
     rect(0,0,width,width/14);
    } else if (end) {
    } else if (tip) {
        rect(0,2*height,width,width/9);
    } else 
    rect(0,4*height,width,width);
    fill(80,opac);
    textSize(30);
    if (end) {textSize(70);}
    text(boxText, x, y, width, height);
    if ( charCounter < boxText.length()) {
      charCounter+=2*speed;
      while(charCounter> boxText.length()) { charCounter--; }
    }
    if (isNotDone()) {
      timeCounter-=(speed-1);
    }
    if (charCounter>=boxText.length()) {
      opac-=speed*50;
    }
  }

  void start() {
    timeCounter = boxText.length();
    opac=200;
  }

  boolean isNotDone(){
    return timeCounter>0;
  }
}