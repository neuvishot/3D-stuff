class rain extends GameObject {

  rain() {
    super (random(-width, width), random(height), random(-2000, 2000), 10);
    lives = 1;
  }

  void act() {
    loc.add(vel);
    if (loc.y >= 900) lives = 0;
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
