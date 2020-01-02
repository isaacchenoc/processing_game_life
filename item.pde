class Item {
  int branch, eyeBalls, paper, shard, map, feather, ky;
  ArrayList<Integer> having;
  int using;

  Item() {
      branch = 1;
      eyeBalls = 2;
      paper = 3;
      shard = 4;
      feather = 5;
      ky = 6;
      map = 7;
      having = new ArrayList();
      using = 0;
  }
  

  void add(int pick) {
      for (Integer i : having) {
        if (i.equals(pick)) {return;}
      }
      having.add(pick);
  }
  
  void remove(int rem) {
    int remIndex = -1;
      for (int i = 0; i<having.size(); i++) {
        if (having.get(i)==rem) {remIndex = i;}
      }
      if (remIndex==-1) return;
      having.remove(remIndex);
  }
  
  void display() {
      for (int i = 0; i<having.size(); i++) {
        PImage p = loadImage("item/"+having.get(i)+".png");
        image(p,(2+i)*width/10,0.83*height,width/8,width/8);
        if (having.get(i)==using) {
          noFill();
          stroke(150);
          strokeWeight(3);
          rect((2+i)*width/10+width/40,0.87*height,width/14,width/14,8);
        }
      }
  }
  


}