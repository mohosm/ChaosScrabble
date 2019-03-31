
ArrayList<Exps> exp = new ArrayList<Exps>();
String[] fontList = PFont.list();
//ArrayList<Shape> shapes = new ArrayList<Shape>();

import processing.pdf.*;
import ddf.minim.*;
import ddf.minim.analysis.*;

Minim minim;
BeatDetect beat;
AudioPlayer groove1;
AudioPlayer groove2;
int a = 255;
int shapeCount=int(random(5,20));
int i = 1;
PFont myFont;


float thrs = 0.2;

String[] nouns = {"fighter","box", "knives", "paradox", "childhood", "love", "stuff", "past", "machete", "vines", "blood", "nothing", "boo", "symbol", "will or won't", "children", "blade", "edge","future","present","bones"};
String[] verbs = {"like", "say", "are", "withstand", "rob", "fight", "call", "know", "get", "take", "slice", "seem", "do", "hack", "believe", "cut", "collapse", "deny" ,"catch", "need","think","wish"};
String[] adjectives = {"blind", "safe", "terrible", "alive", "pretty", "free","meek","weak"};
String[] prons = {"","the","my","your","his","her","its","our","their","thy"};
String[] preps = {"","to","from","at","by","in", "into", "onto","for","with"};
String[] pers = {"","I", "you","he","she","it","we","they"};
String[] wc = {"","should","would","could","can","can't","will","won't","shall","shan't"};
String[] time = {"","now","then",""};

  int strX;
  int strY;
  int strKy;
Boolean v = false;
Boolean add = false;
int linecount=int(random(1,8));

void setup(){
//  int shapeIndex = 0;
 /* for (int i = 0; i<width; i+=100){
    for (int j = 0; i<height; j+=100){
      shapes.add(new Shape(i,j));
      shapeIndex+=1;
    }
  }
  println(shapeIndex);*/
  myFont = createFont("Courier New", 30);
  textAlign(CENTER);
  minim = new Minim(this); 
  groove1 = minim.loadFile("song1.mp3");
  groove1.play();
  beat = new BeatDetect();
// size(500,500);
  fullScreen();    
  background(0);
  fill(0);
  textAlign(LEFT);
    textFont(myFont);
    
  exp.add(new Exps(false));
  exp.get(0).x = int(random(5,width-5));
  exp.get(0).y=int(random(5,height-5));
  exp.get(0).rand();
  textSize(24);
  exp.get(0).disp();
  v=true;
}


void draw(){
  
 if(groove1.right.level()>0.2){
    add=true;
  }
  
  
  
  if(add){
    addLines();
    add = false;
  }
  /*
  for (int h=0; h<shapes.length;h++){
    for (int g=0; g<i;g++){
      if(shapes.get(h).iksz < exp.get(g).x+textWidth(exp.get(g).e) +50 && shapes.get(h).iksz > exp.get(g).x -50 && shapes.get(h).ipsz < exp.get(g).y +50 && shapes.get(h).ipsz > exp.get(g).y-textAscent()-textDescent() -50){
      shapes.get(h).kelle = false;
      }
  }
  shapes.get(h).drawShape();
  }*/
}
void addLines(){
  int other;

    other = int(random(0,i));

      if(v){
          while(exp.get(other).x>width || exp.get(other).x <0 || exp.get(other).y>height || exp.get(other).y<0 || exp.get(other).isVert==true){
  other = int(random(0,i));}
       exp.add(new Exps(true));
       println("next:");
       println(other);
       println(exp.get(other).e.length());
   strKy = exp.get(other).e.charAt(int(random(exp.get(other).e.length())));
   strX = exp.get(other).x+ int(textWidth(exp.get(other).e.substring(0,exp.get(other).e.indexOf(strKy))));
   exp.get(i).rand();
   while (exp.get(i).e.indexOf(strKy)==-1){
     exp.get(i).rand();
       }
   strY = exp.get(other).y-int(textAscent()+textDescent())*exp.get(i).e.indexOf(strKy); // might be plus or minus one char
     exp.get(i).x = strX;
     exp.get(i).y = strY;
     exp.get(i).disp();
     v= false;
     } else {
                 while(exp.get(other).x>width || exp.get(other).x <0 || exp.get(other).y>height || exp.get(other).y<0 || exp.get(other).isVert==false){
  other = int(random(0,i));}
       exp.add(new Exps(false));
       strKy = exp.get(other).e.charAt(int(random(exp.get(other).e.length())));
       exp.get(i).rand();
       // y here
       while (exp.get(i).e.indexOf(strKy)==-1){
     exp.get(i).rand();
       }
     strY = int(exp.get(other).y+int(exp.get(other).e.substring(0,exp.get(other).e.indexOf(strKy)).length()*(textAscent()+textDescent())));   
     strX = int(exp.get(other).x-textWidth(exp.get(i).e.substring(0,exp.get(i).e.indexOf(strKy))));
     exp.get(i).x = strX;
     exp.get(i).y = strY;
     exp.get(i).disp();
     v = true;
     }
     i++;
}