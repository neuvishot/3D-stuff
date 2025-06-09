class Snowball extends GameObject {

  PVector dir;
  float speed;

  Snowball() {
    super(eyeX, eyeY, eyeZ, 10);
    speed = 50;
    float vx = cos(leftRightHeadAngle); // basically this makes sure that the bullet comes out
    float vy = tan(topBottomAngle); // of the same place that the camera is looking at
    float vz = sin(leftRightHeadAngle); // (the focus point)
    dir = new PVector(vx, vy, vz);
    dir.setMag(speed);
  }

  void act() {
    int hitx = int(loc.x+2000) / gridSize;
    int hity = int(loc.z+2000) / gridSize;
    if (map.get(hitx, hity) == white) {
      loc. add(dir);
    } else {
      lives = 0;
      //for (int i = 0; i < 5; i++) {
      //  objects.add(new Particle(loc));
      //}
    }
  }

  void show() {
    pushMatrix();
    translate(loc.x, loc.y, loc.z);
    fill(255);
    stroke(100);
    box(size);
    popMatrix();
  }
}
