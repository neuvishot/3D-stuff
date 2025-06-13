class GameObject{
  int lives;
  PVector loc, vel;
  float size;
  
  GameObject(){
   loc = new PVector (0,0,0);
   size = 10;
   lives = 1;
  }
  
  GameObject(float x, float y, float z, float s){
   lives = 1;
   vel = new PVector(random(0, 1), 3, random(0, 1));
   loc = new PVector(x, y, z);
   size = s;
  }
  
  void act(){

  }
  
  void show(){
   
  }
  
  
}
