// JIAYI CHEN
// u5619768
// display name: icc
// The basic structure of these classes are inspired from Ben Swift, the lecturer of comp1720, ANU
// The class DialogBox is referenced from Ben Swift, the lecturer of comp1720, ANU


import ddf.minim.*;
import ddf.minim.ugens.*;

Minim minim;
AudioPlayer bgm;
AudioPlayer effect;  

PImage back;
Item items;
Wake wake;
Lying lying;
Crow crow;
Tombs tombs; 
Two two;
Reaper reaper;
CastleF castlef;
Dtree dtree;
CastleDoor castled;
InsideF insidef;
InsideB insideb;
CastleB castleb;
Down down;
Up up;
Title title;
Health hp;
int sceneIndex,psceneIndex;

void setup() {
  fullScreen();
  
  minim = new Minim(this);
  // This sound file is originally from "www.freesound.org/"
  bgm = minim.loadFile("sound/bgm.mp3");
  bgm.loop();
  
  
  psceneIndex = 0;
  sceneIndex = 0;
  title = new Title();
  hp = new Health();
  back = loadImage("main/back.png");
  items = new Item();
  lying = new Lying();
  castleb = new CastleB();
  tombs = new Tombs();
  two = new Two();
  reaper = new Reaper();
  down = new Down();
  up = new Up();
  wake = new Wake();
  crow = new Crow();
  dtree = new Dtree();
  castlef = new CastleF();
  castled = new CastleDoor();
  insidef = new InsideF();
  insideb = new InsideB();
  
}

void draw() {

  switch(sceneIndex){
    
   case 0:
     title.display();
     break;
    
   case 1: 
     wake.display();
     break;
   
   case 2:
     psceneIndex = 1;  
     lying.display();
     break;
     
   case 3:
     psceneIndex = 2;
     crow.display();
     break;
   
   case 4:
     psceneIndex = 3;
     tombs.display();
     break;
     
   case 5:
     psceneIndex = 3;
     two.display();
     break;
     
   case 6:
     psceneIndex = 5;
     reaper.display();
     break;
   case 7:
     psceneIndex = 5;
     castlef.display();
     break;
   
   case 8:
     psceneIndex = 6;
     dtree.display();
     break;
     
   case 9:
     psceneIndex = 7;
     castled.display();
     break;
   
   case 10:
     psceneIndex = 7;
     castleb.display();
     break;
   
   case 11:
     insidef.display();
     break;
     
   case 12:
     insideb.display();
     break;
 
   case 13:
     down.display();
     break;
     
   case 14:
     up.display();
     break;
     
 }
 if (hp.value<=0) {
   while (tcounter<200) {
     transform(1);
     tcounter++;
   } 
    tcounter = 0;
    setup();
  }
}

void mousePressed() {
   if (mouseX>width*0.888&&mouseX<width&&mouseY>height*0.866&&mouseY<height&&sceneIndex!=1&&sceneIndex!=11&&sceneIndex!=12&&sceneIndex!=13&&sceneIndex!=14) {
     sceneIndex = psceneIndex;
   }
   if (mouseY>0.83*height && mouseY<height) {
      for (int i = 0; i<items.having.size(); i++) {
          if (mouseX>((2+i)*width/10)&& mouseX<((2+i)*width/10+width/8)) {
            if (mouseButton==LEFT) {
            items.using = (items.using == items.having.get(i)) ? 0: items.having.get(i);
            }
          }
        }
      }
      
  switch(sceneIndex){
    case 0:
    title.active = true;
    title.dia1.start();
    title.dia2.start();
    if (title.timer>600) sceneIndex = 1;
    break;
    
    case 1:
    if (((mouseX>width/8&&mouseX<0.3*width&&mouseY>height/2&&mouseY<0.93*height)||
    (mouseX>0.56*width&&mouseX<0.7*width&&mouseY>0.42*height&&mouseY<0.733*height))) {
      wake.tree.start();
    }
    if ((mouseX>width*0.375&&mouseX<0.687*width&&mouseY>height*0.033&&mouseY<0.333*height)) {
      if (!wake.active) {
        wake.active = true;
        wake.out.start();
      }
      else {
        sceneIndex = 2;
    }
    }
    break;
    
    case 2:
    if (((mouseX>width*0.237&&mouseX<0.375*width&&mouseY>height*0.29&&mouseY<0.815*height))) {
      lying.tree.start();
    }
    if (lying.existM) {
      if (((mouseX>width*0&&mouseX<width*0.205&&mouseY>height*0&&mouseY<height*0.763)||(mouseX>width*0.74&&mouseX<width&&mouseY>height*0&&mouseY<height*0.763)||(mouseY>0&&mouseY<0.215*height)
      )&&(lying.activeU||lying.activeP)) {
        lying.activeU = false;
        lying.activeP = false;
        if(!lying.existK) lying.existM = false;
      }
    if (mouseX>width*0.4375&&mouseX<0.546*width&&mouseY>height*0.038&&mouseY<0.543*height&&lying.activeM&&lying.activeU&&lying.activeP) {
      lying.existK = false;
      items.add(items.ky);
    }
    if (mouseX>width*0.3325&&mouseX<0.56*width&&mouseY>height*0.253&&mouseY<0.678*height&&lying.activeM&&lying.activeU&&!lying.activeP) {
        minim = new Minim(this);
          // This sound file is originally from "www.freesound.org/"

        effect = minim.loadFile("sound/paper.mp3");
        effect.play();
        lying.activeP=true;
    }
    if (mouseX>width*0.513&&mouseX<0.583*width&&mouseY>height*0.76&&mouseY<0.816*height&&lying.activeM&&!lying.activeU&&!lying.activeP) {
      lying.activeU=true;
    }
    
    if (mouseX>width*0.42&&mouseX<0.565*width&&mouseY>height*0.62&&mouseY<0.815*height) {
      if (!lying.activeM) {
      lying.dia1.start();
      lying.activeM = true;
      }
        }
      }
    if ((mouseX>0.411*width/8&&mouseX<0.62*width&&mouseY>height*0.05&&mouseY<0.288*height)&&!lying.activeU&&!lying.activeP) {
      if (crow.existC) {
        minim = new Minim(this);
          // This sound file is originally from "www.freesound.org/"
        effect = minim.loadFile("sound/crow.mp3");
        effect.play();
      }
      sceneIndex = 3;
       }
    break;
    
    case 3:
    if (crow.existC) {
    if (mouseX>width*0.511&&mouseX<0.92*width&&mouseY>height*0.226&&mouseY<0.698*height) {
      crow.treedia.start();
    }
    if (mouseX>width*0.538&&mouseX<0.61*width&&mouseY>height*0.125&&mouseY<0.248*height&&items.using==items.shard) {
      minim = new Minim(this);
        // This sound file is originally from "www.freesound.org/"
      effect = minim.loadFile("sound/crow2.mp3");
      effect.play();
      items.remove(items.shard);
      crow.existF = true;
      crow.existC = false;
    }
  }
    if ((mouseX>width*0.041&&mouseX<0.2275*width&&mouseY>height*0.268&&mouseY<0.556*height)) {
      if (!crow.activeT) {
        crow.activeT = true;
        crow.tombdia.start();
      }
      else {
        sceneIndex = 4;
        if (tombs.existS) {
        minim = new Minim(this);
          // This sound file is originally from "www.freesoundeffects.com"
        effect = minim.loadFile("sound/snake.mp3");
        effect.play();
        }
      }
    }
    if ((mouseX>width*0.0237&&mouseX<0.3312*width&&mouseY>height*0.648&&mouseY<0.91*height)&&!crow.got) {
      crow.rockdia.start();
      items.add(items.shard);
      crow.existS = false;
      crow.got = true;
    }
    if ((mouseX>width*0.5325&&mouseX<0.601*width&&mouseY>height*0.738&&mouseY<0.808*height&&crow.existF)) {
      crow.existF = false;
      items.add(items.feather);
    }
    if ((mouseX>width*0.2337&&mouseX<0.38372*width&&mouseY>height*0.063&&mouseY<0.322*height)) {
      sceneIndex = 5;
    }
      break;
      
      case 4:
      if ((mouseX>width*0.5&&mouseX<0.665*width&&mouseY>height*0.546&&mouseY<0.678*height)) {
         if (tombs.existS) {
           if (items.using == items.branch) {
            minim = new Minim(this);
                      // This sound file is originally from "www.freesoundeffects.com"
            effect = minim.loadFile("sound/snake.mp3");
            effect.play();
            tombs.existS = false;
           items.remove(items.branch);
         }
             else {
             minim = new Minim(this);
                       // This sound file is originally from "www.freesoundeffects.com"
             effect = minim.loadFile("sound/dart.mp3");
             effect.play();
             transform(0);
             hp.value--;
           }
         } else {
           if (tombs.existE) {
             tombs.existE = false;
             items.add(items.eyeBalls);
           }
         }
    }
     break;
     
     case 5:
     if (mouseX>width*0.665&&mouseX<0.893*width&&mouseY>height*0.415&&mouseY<0.845*height) {
         if (two.exist) {
            if (mouseX>width*0.827&&mouseX<0.871*width&&mouseY>height*0.588&&mouseY<0.701*height&&two.active) {
              two.exist = false;
              items.add(items.branch);
            } 
            two.active = true;
            if (two.exist)
            two.tree.start();
         }
    }
    if (mouseX>width*0.205&&mouseX<0.4*width&&mouseY>height*0.078&&mouseY<0.32*height) {
          sceneIndex = 6;
    }
    if (mouseX>width*0.576&&mouseX<0.756*width&&mouseY>height*0.078&&mouseY<0.32*height) {
          sceneIndex = 7;
    }
    break;
    
    case 6:
    if (reaper.exist) {
     if (mouseX>width*0.53&&mouseX<0.691*width&&mouseY>height*0.545&&mouseY<0.806*height) {
       if (items.using == items.feather) {
         reaper.dia4.start();
         reaper.exist=false;
         items.remove(items.feather);
         } else {
       switch (reaper.dnum) {
         case 0:
           reaper.dia0.start();
           break;
         case 1:
           reaper.dia1.start();
           break;
         case 2:
           reaper.dia2.start();
           break;           
         }
       }
      reaper.dnum = (reaper.dnum+1)%3;
     }}
    if (mouseX>width*0.585&&mouseX<0.765*width&&mouseY>height*0.0683&&mouseY<0.313*height) {  
        if (reaper.exist) {
        minim = new Minim(this);
                  // This sound file is originally from "www.freesoundeffects.com"
        effect = minim.loadFile("sound/hit.mp3");
        effect.play();
           transform(0);
          hp.value--;
          reaper.dia3.start();
        } else {
          sceneIndex = 8;
          }
        }
    if (mouseX>width*0.195&&mouseX<0.41*width&&mouseY>height*0.0683&&mouseY<0.313*height) {
      sceneIndex = 1;
    }
    break;
    
    case 7:
    if (mouseX>width*0.3925&&mouseX<0.6025*width&&mouseY>height*0.4&&mouseY<0.575*height) {
      sceneIndex = 9;
    }
    if (mouseX>width*0.792&&mouseX<0.956*width&&mouseY>height*0.233&&mouseY<0.526*height) {
      sceneIndex = 10;
    }
    break;
    
    case 8:
    if (dtree.activeU) {
    if ((mouseX>width*0&&mouseX<width*0.257&&mouseY>height*0&&mouseY<height*0.778)||(mouseX>width*0.743&&mouseX<width&&mouseY>height*0&&mouseY<height*0.778)||(mouseY>height*0&&mouseY<height*0.245)) {
        if (dtree.activeM) dtree.exist = false;
        dtree.activeU = false;
        dtree.activeM = false;
      }
    }
    if (mouseX>width*0.375&&mouseX<0.645*width&&mouseY>height*0.276&&mouseY<0.526*height&&dtree.activeU) {
          minim = new Minim(this);
                    // This sound file is originally from "www.freesound.org/"
          effect = minim.loadFile("sound/paper.mp3");
          effect.play();
          dtree.activeM = true;
      }
    if (mouseX>width*0.556&&mouseX<0.653*width&&mouseY>height*0.566&&mouseY<0.668*height&&!dtree.activeU) {
        dtree.activeU = true;
      }
    break;
    
    case 9: 
    if (mouseX>width*0.326&&mouseX<0.69*width&&mouseY>height*0.351&&mouseY<0.748*height&&castled.active) {
        minim = new Minim(this);
                            // This sound file is originally from "www.freesound.org/"
        effect = minim.loadFile("sound/enter.mp3");
        effect.play();
         sceneIndex = 11;
      }
    if (mouseX>width*0.326&&mouseX<0.381*width&&mouseY>height*0.591&&mouseY<0.665*height) {
       if (!castled.check) {
           minim = new Minim(this);
                               // This sound file is originally from "www.freesound.org/"
          effect = minim.loadFile("sound/lock.mp3");
          effect.play();
          castled.check = true;
          castled.dia1.start();
       } else {
        if (items.using == items.ky) {
          minim = new Minim(this);
                              // This sound file is originally from "www.freesound.org/"
          effect = minim.loadFile("sound/dooropen.mp3");
          effect.play();
         castled.active = true;
         items.remove(items.ky);
         }
         }
      }
    
    break;
    
    case 10: 
    if (castleb.activel) {
      if (castleb.password.size()>=3) {
       if (castleb.passsum==3) {
          minim = new Minim(this);
                              // This sound file is originally from "www.freesound.org/"
          effect = minim.loadFile("sound/dooropen.mp3");
          effect.play();
         castleb.activel = false;
         castleb.actived = true;
       } else {
         castleb.password.clear();
       }
     }
       if ((mouseX>0&&mouseX<0.27*width&&mouseY>height*0&&mouseY<0.75*height)||(mouseX>0.715*width&&mouseX<width&&mouseY>height*0&&mouseY<0.75*height)
       ||(mouseY>height*0&&mouseY<0.17*height)) {
         castleb.activel = false;
       }
       if (castleb.password.size()<3) {
       if (mouseX>0.33*width&&mouseX<0.417*width&&mouseY>height*0.315&&mouseY<0.42*height) {
         castleb.password.add(0);
       }       
       if (mouseX>0.457*width&&mouseX<0.54*width&&mouseY>height*0.315&&mouseY<0.42*height) {
         castleb.password.add(0);
       }
        if (mouseX>0.582*width&&mouseX<0.671*width&&mouseY>height*0.315&&mouseY<0.42*height) {
         castleb.password.add(0);
        }
      if (mouseX>0.33*width&&mouseX<0.417*width&&mouseY>height*0.461&&mouseY<0.563*height) {
         castleb.password.add(0);
       }
      if (mouseX>0.457*width&&mouseX<0.54*width&&mouseY>height*0.461&&mouseY<0.563*height) {
         castleb.password.add(0);
       }  
      if (mouseX>0.582*width&&mouseX<0.671*width&&mouseY>height*0.461&&mouseY<0.563*height) {
         castleb.password.add(1);
         castleb.passsum++;
       }         
       if (mouseX>0.33*width&&mouseX<0.417*width&&mouseY>height*0.611&&mouseY<0.70*height) {
         castleb.password.add(0);
       }
       if (mouseX>0.457*width&&mouseX<0.54*width&&mouseY>height*0.611&&mouseY<0.70*height) {
         castleb.password.add(0);
       }
       if (mouseX>0.582*width&&mouseX<0.671*width&&mouseY>height*0.611&&mouseY<0.70*height) {
         castleb.password.add(0);
         }
       }
     }
     
     if (mouseX>width*0.4125&&mouseX<0.575*width&&mouseY>height*0.64&&mouseY<0.805*height&&castleb.actived&&!castleb.activel) {
        minim = new Minim(this);
        effect = minim.loadFile("sound/enter.mp3");
        effect.play();
         sceneIndex = 12;
      }
     if (mouseX>width*0.4125&&mouseX<0.575*width&&mouseY>height*0.64&&mouseY<0.805*height&&!castleb.actived) {
         castleb.activel = true;
      }
    break;
    
    case 11:
     if (insidef.activel) {
       if ((mouseX>0&&mouseX<0.198*width&&mouseY>height*0&&mouseY<0.8*height)||(mouseX>0.826*width&&mouseX<width&&mouseY>height*0&&mouseY<0.8*height)
       ||(mouseY>height*0&&mouseY<0.135*height)) {
         insidef.activel = false;
       }
       if (mouseX>0.298*width&&mouseX<0.362*width&&mouseY>height*0.64&&mouseY<0.728*height) {
          minim = new Minim(this);
          effect = minim.loadFile("sound/dart.mp3");
          effect.play();
          transform(0);
          hp.value--;         
       }
       if (mouseX>0.41*width&&mouseX<0.503*width&&mouseY>height*0.64&&mouseY<0.728*height) {
         minim = new Minim(this);
          effect = minim.loadFile("sound/dart.mp3");
          effect.play();
          transform(0);
          hp.value--;         
       }
       if (mouseX>0.547*width&&mouseX<0.6225*width&&mouseY>height*0.64&&mouseY<0.728*height) {
         insidef.activel = false;
         insidef.actived = true;
       }
       if (mouseX>0.677*width&&mouseX<0.728*width&&mouseY>height*0.64&&mouseY<0.728*height) {
          minim = new Minim(this);
          effect = minim.loadFile("sound/dart.mp3");
          effect.play();
          transform(0);
          hp.value--;         
       }
     }
     if (mouseX>width*0.408&&mouseX<0.598*width&&mouseY>height*0.171&&mouseY<0.45*height&&insidef.actived&&!insidef.activel) {
          minim = new Minim(this);
          effect = minim.loadFile("sound/enter.mp3");
          effect.play();
          sceneIndex = 13;
      }
     if (mouseX>width*0.46&&mouseX<0.528*width&&mouseY>height*0.305&&mouseY<0.4*height&&!insidef.actived) {
         insidef.activel = true;
      }
    break;
    
    case 12:
    if (mouseX>width*0.403&&mouseX<0.59*width&&mouseY>height*0.163&&mouseY<0.47*height) {
         if (insideb.puteyes) {
          minim = new Minim(this);
          effect = minim.loadFile("sound/enter.mp3");
          effect.play();
           sceneIndex = 14;
         }
         else {
          insideb.axe = true;
          minim = new Minim(this);
                              // This sound file is originally from "www.freesound.org/"
          effect = minim.loadFile("sound/hit.mp3");
          effect.play();
          transform(0);
          hp.value--; 
         }
      }
    if (mouseX>width*0.691&&mouseX<0.8*width&&mouseY>height*0.775&&mouseY<0.875*height) {
        if (insideb.active&&items.using==items.eyeBalls) {
          minim = new Minim(this);
                              // This sound file is originally from "www.freesound.org/"
          effect = minim.loadFile("sound/putin.mp3");
          effect.play();
          insideb.axe = false;
          insideb.puteyes = true;
          items.remove(items.eyeBalls);
        }
        if (!insideb.active) {
          insideb.dia0.start();
          insideb.active = true;
        }
    }
    break;
    
    case 13:
    if (mouseX>width*0.536&&mouseX<0.762*width&&mouseY>height*0&&mouseY<0.803*height) {
      down.active = true;
      down.dia0.start();
    }  
    break;
    
    case 14:
    if (mouseX>width*0.527&&mouseX<0.855*width&&mouseY>height*0&&mouseY<0.298*height) {
      up.active = true;
      up.dia0.start();
    }  
    break;
  }   
}

int tcounter = 0;
void transform(int type) {
    switch(type) {
    
      case 0: 
      fill(0,150);
      rect(0,0,width,height);
      break;
      
      case 1:
      fill(0);
      rect(0,0,width,height);
      break;      
    
    }

}