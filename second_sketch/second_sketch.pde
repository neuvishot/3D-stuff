float rotx, roty;
PImage diamond;

void setup(){
  size(800, 800, P3D);
  diamond = loadImage("Diamond.png");
}

void draw(){
  pushMatrix();
  translate(width/2, height/2, 0);
  scale(200);
  rotateX(rotx);
  rotateY(roty);
  
  popMatrix();
}

void mouseDragged() {
  rotx = rotx + (pmouseY - mouseY) * 0.1;
  roty = roty + (pmouseX - mouseX) * -0.1;
}
