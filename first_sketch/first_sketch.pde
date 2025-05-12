
float rotx, rotY;
void setup() {
  size(800, 800, P3D);
  rotx = radians(45);
  rotY = radians(45);
}


void draw() {
  background(255);
  // sphere

  sikhol(width/2, height/2, 150, #F59C9C, 100);

  // cubes greah
  cube(width/2 - 60, height/2, 0, #F59C9C, 100);
  cube(width/2 + 60, height/2 + 100, 50, #BD9CF5, 100 );
}

void sikhol(float x, float y, float z, color c, float size) {
  pushMatrix();
  translate(x, y, z);
  rotateX(rotx);
  rotateY(rotY);
  strokeWeight(2);
  fill(c);
  sphere(size); // width, height, depth, does not specify the place
  popMatrix();
}

void cube(float x, float y, float z, color c, float size) {
  pushMatrix();
  translate(x, y, z);
  rotateX(rotx);
  rotateY(rotY);
  strokeWeight(2);
  fill(c);
  box(size); // width, height, depth, does not specify the place
  popMatrix();
}

void mouseDragged() {
  rotx = rotx + (pmouseY - mouseY) * 0.1;
  rotY = rotY + (pmouseX - mouseX) * -0.1;
}
