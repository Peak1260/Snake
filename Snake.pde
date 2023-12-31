ArrayList<Integer> x=new ArrayList<Integer>(), y=new ArrayList<Integer>();
int w=30, h=30, b=20, dir=2, applex=10, appley=10;
int[] dx = {0,0,1,-1}, dy = {1,-1,0,0};
boolean gameover=false;
void setup(){
  size(600,600);
  x.add(5);
  y.add(5);
}
void draw(){
  background(255);
  for(int i=0;i<w;i++) line(i*b,0,i*b,height);
  for(int i=0;i<h;i++) line(0,i*b,width,i*b);
  for(int i=0;i<x.size();i++){
    fill(0,255,0);
    rect(x.get(i)*b, y.get(i)*b, b, b);
  }
  if(!gameover){
  fill(255,0,0);
  rect(applex*b,appley*b,b,b);
    if(frameCount%5==0){
      x.add(0,x.get(0)+dx[dir]);
      y.add(0,y.get(0)+dy[dir]);
      if(x.get(0)<0||y.get(0)<0||x.get(0)>=w||y.get(0)>=h) gameover = true;
      for(int i=1; i<x.size(); i++) if(x.get(0)==x.get(i) && y.get(0)==y.get(i)) gameover = true;
      if(x.get(0)==applex && y.get(0)==appley){
        applex=(int)random(0,w);
        appley=(int)random(0,h);
      }
      else{
        x.remove(x.size()-1);
        y.remove(y.size()-1);
      }
    }
  }
  else{
    fill(0);
    textSize(30);
    textAlign(CENTER);
    text("GAME OVER! Press Space",width/2,height/2);
    if(keyPressed&&key==' '){
      x.clear();
      y.clear();
      x.add(5);
      y.add(5);
      gameover=false;
    }
  }
}
void keyPressed(){
  int newdir=key=='s' ? 0:key=='w' ? 1:key=='d' ? 2:key=='a' ? 3:-1;
  if(newdir != -1 && (x.size()<=1 || !(x.get(1)==x.get(0)+dx[newdir] && y.get(1)==y.get(0)+dy[newdir]))) dir=newdir;
}
