class Star
{
  double myX, myY, myAngle, mySpeed, startY, startX;
  int myColor, mySize, explodeColor;

 Star() {
    myX = 500;
    myY =500;
    mySpeed = Math.random()*10;
    myAngle = (Math.random()*2)*Math.PI;
    mySize = 1;
    myColor = color((int)(Math.random()*1)+180, (int)(Math.random()*1)+250, (int)(Math.random()*1)+250);
  }

  void move() {

    if (myX >1000 || myY >1000 ||myX<-1000 || myY<-1000) {
      myX = myY= 500;
      myAngle = (double)((int)(Math.random()*360)+1)* (Math.PI/100);
    }
    
    
    startY = myY;
    startX = myX;
    myX += Math.cos(myAngle) * mySpeed;
    myY += Math.sin(myAngle) * mySpeed;
  }

  void show() {
    frameRate(60);
   
    fill(myColor);
    ellipse((float)myX, (float)myY, mySize, mySize);
     fill(255);
    if (numOfPlanetsDestroyed>50){
      mySize+=1;
      myColor = color(192,0,0);
      text("LOOK WHAT YOU HAVE DONE!, DONT YOU SEE WHAT YOU'VE DONE TO OUR UNIVERSE?", 250,500);
    }
  }
}

Star [] bob;
int  numOfPlanetsDestroyed = 0;
void mousePressed(){
  numOfPlanetsDestroyed-=1;
}
void setup() {
  size(1000, 1000);
  noStroke();
  bob = new Star[1800];
  for (int i =0; i<5; i++) {
    bob[i]= new Planet();
  }
  for (int i =5; i<bob.length; i++) {
    bob[i] = new Star();
  }
}
void draw() {
  background(0);
  fill(0,0,0,10);
  rect(0,0,3,3);
  for (int i = 0; i<bob.length; i++) {
    frameRate(60);
    bob[i].show();
    bob[i].move();
  }
}


class Planet extends Star {
  Planet() {
    myX = 500;
    myY =500;
    mySpeed = Math.random()*50;
    myAngle = (Math.random()*2)*Math.PI;
    mySize = 10;
    myColor = color((int)(Math.random()*1)+127, (int)(Math.random()*1)+127, (int)(Math.random()*1)+127);
  }
  
  void mousePressed(){
    redraw();
  }
  void move(){
      if (myX >1000 || myY >1000 ||myX<-1000 || myY<-1000) {
      myX = myY= 500;
      myAngle = (double)((int)(Math.random()*360)+1)* (Math.PI/100);
       mySize =1;
       
         numOfPlanetsDestroyed = numOfPlanetsDestroyed+1;
 if (mySize>350){
   mySize=500;
 }
 
 
    }
    
 mySize += 1;
 


 
    text("You have caused "+ numOfPlanetsDestroyed +" destruction of planets just by running this program", 100,100);
    startY = myY;
    startX = myX;
    myX += Math.cos(myAngle) * mySpeed;
    myY += Math.sin(myAngle) * mySpeed;
  }
  
  void show(){
     frameRate(60);
    fill(myColor);
    ellipse((float)myX, (float)myY, mySize+10, mySize);
   
  }
}

