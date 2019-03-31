class Shape{
  Boolean kelle= true;
  int iksz;
  int ipsz; 
  int id = int(random(1,4));
  
  Shape(int _iksz, int _ipsz){
  iksz = _iksz;
  ipsz = _ipsz;
  }
  
void drawShape(){
  if (kelle){
  stroke(0);
  strokeWeight(int(random(3,10)));
  fill(255);
if(id==1){
  rect(iksz,ipsz,random(40,90),random(40,90));
}else if(id==2){
  ellipse(iksz,ipsz,random(40,90),random(40,90));
}else if(id==3){
  triangle(iksz,ipsz, iksz+random(40,90),ipsz+random(40,90), iksz+random(40,90),ipsz+random(40,90));
}else if(id==4){
}else if(id==5){
  }
  }
}

}