class Exps{
  int x;
  int y;
  String v;
  String p;
  String e;
  String n;
  String pr;
  String a;
  String prp;
  String n2;
  String a2;
  Boolean isVert;
  int c = int(random(0,3));
  Exps(Boolean _isVert){
isVert = _isVert;
 

  }
  void pre(){

    n = nouns[int(random(nouns.length))];    
    n2=nouns[int(random(nouns.length))];              
    p = pers[int(random(pers.length))];          
    v = verbs[int(random(verbs.length))];              
    pr = prons[int(random(prons.length))];                 
    a = adjectives[int(random(adjectives.length))];                    
    a2=adjectives[int(random(adjectives.length))];                      
    prp = preps[int(random(preps.length))];

    
    
    if (p=="he" || p=="she"|| p=="it" && v!= "is" && v!= ""){
      v = v + "s";
    }
    if (p=="we" || p=="you" || p=="they" && v=="is"){
      v = "are";
    }
    if (p=="I" && v=="is"){
      v = "am";
    }
  }
  void VtheN(){ 
    pre();
    e=v+" "+pr+" "+n;
  }
  void AfromN(){
    pre();
    e=a+" "+ prp +" "+pr+" "+n;
  }
  void likeAN(){
    pre();
    e="like the "+a+" "+n;
  }
  void PVN(){
     pre();
    e=p+" "+v+" "+prp+" "+pr+" "+n;
  }
  void iamyour(){
    pre();
    int q = int(random(1,3));
    if(q==1){
    e=p+" "+v+" "+pr+" "+n;
  } else if(q == 2){
    e=p+" "+v+" "+pr+" "+a +" "+n;
    }
  }
  
  void and(){
  int v = int(random(1,4));
  if (v==1){
    e=n+" "+"and"+" "+n2;
  } else if(v==2){
    e=a+" "+n+" "+"and"+" "+n2;
  }else if(v==3){
    e=n+" "+"and"+" "+a+" "+n2;
  }else{
  e=a+" "+n+" "+"and"+" "+a2+" "+n2;
    }
  }
  void rand(){
    pre();
  int r = int(random(1,7));
 // print(r);
  if (r==1){
    VtheN();
  }else if(r==2){
    
    AfromN();
  }else if(r==3){
    likeAN();
  }else if (r==4){
    PVN();
  } else if(r==5){
   // print(r);
    and();
  } else if (r==6){
    iamyour();
  }
  
  }
  void cChooser(){

  if (c==0){
    fill(255,0,0);
    } else if (c==1){
    fill(0,255,0);
    } else {
    fill(0,0,255);
    }
  }
  
  
  void disp(){
    strokeWeight(4);
    cChooser();
    noStroke();
    if (isVert == false){
      int iksz = x;
      for (int i = 1; i <e.length()+1;i++){
      //fill(255);
      //rect(iksz-1,y-textAscent()-textDescent()+1,textWidth(e)+2,textAscent()+textDescent()+2);
      if(e.indexOf(strKy)+1==i){
        fill(255);
      }else{
     cChooser();
      }
      text(e.substring(i-1,i),iksz,y);
      iksz+=textWidth(e.substring(i-1,i));
      }
  } else {
    int ipsz = y;
    for (int i = 1; i <e.length()+1;i++){
      //  fill(255);
        //rect(x-1,ipsz-textAscent()-textDescent()+1,textWidth(e.substring(i-1,i))+2,textAscent()+textDescent()+2);
              if(e.indexOf(strKy)+1==i){
       fill(255);
      }else{
    cChooser();
      }
        text(e.substring(i-1,i),x,ipsz);
        ipsz+=textAscent()+textDescent();
      }
    }
  }
}