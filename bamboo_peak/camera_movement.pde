void controlCamera() {
  if (wkey && canMoveForward()) {
    eyeX = eyeX + cos(leftRightHeadAngle)*10;
    eyeZ = eyeZ + sin(leftRightHeadAngle)*10;
  }
  if (skey && canMoveBack()) {
    eyeX = eyeX - cos(leftRightHeadAngle)*10;
    eyeZ = eyeZ - sin(leftRightHeadAngle)*10;
  }
  if (akey && canMoveLeft()) {
    eyeX = eyeX - cos(leftRightHeadAngle + PI/2)*10;
    eyeZ = eyeZ - sin(leftRightHeadAngle + PI/2)*10;
  }
  if (dkey && canMoveRight()) {
    eyeX = eyeX - cos(leftRightHeadAngle - PI/2)*10;
    eyeZ = eyeZ - sin(leftRightHeadAngle - PI/2)*10;
  }
  if (skipFrame == false) {
    leftRightHeadAngle = leftRightHeadAngle + (mouseX - pmouseX)*0.01;
    topBottomAngle = topBottomAngle + (mouseY - pmouseY)*0.01;
  }

  focusX = eyeX + cos(leftRightHeadAngle)*300;
  focusZ = eyeZ + sin(leftRightHeadAngle)*300;
  focusY = eyeY + tan(topBottomAngle)*300;

  if (topBottomAngle > PI/2.5) topBottomAngle = PI/2.5;
  if (topBottomAngle < -PI/2.5) topBottomAngle = -PI/2.5;

  if (shiftkey || downkey) eyeY = eyeY + 3;
  if (upkey || qkey) eyeY = eyeY - 3;

  // 360 rotation smoothererer
  if (mouseX < 2) {
    rbt.mouseMove(width-3, mouseY);
    skipFrame = true;
  } else if (mouseX > width-2) {
    rbt. mouseMove(3, mouseY);
    skipFrame = true;
  } else {
    skipFrame = false;
  }
}

boolean canMoveLeft() {
  float leftx, leftz;
  int mapx, mapy;

  leftx = eyeX - cos(leftRightHeadAngle+PI/2)*100;
  leftz = eyeZ - sin(leftRightHeadAngle+PI/2)*100;

  mapx = int(leftx+2000) / gridSize;
  mapy = int(leftz+2000) / gridSize;

  if (map.get(mapx, mapy) == white) {
    return true;
  } else {
    return false;
  }
}

boolean canMoveRight() {
  float rightx, rightz;
  int mapx, mapy;

  rightx = eyeX + cos(leftRightHeadAngle+PI/2)*100;
  rightz = eyeZ + sin(leftRightHeadAngle+PI/2)*100;

  mapx = int(rightx+2000) / gridSize;
  mapy = int(rightz+2000) / gridSize;

  if (map.get(mapx, mapy) == white) {
    return true;
  } else {
    return false;
  }
}

boolean canMoveBack() {
  return true;
}

boolean canMoveForward() {
  float fwdx, fwdz;
  float leftx, lefty, leftz;
  float rightx, righty, rightz;
  int fmapx, fmapy;
  int lmapx, lmapy;
  int rmapx, rmapy;
  boolean left, right, fwd;

  int m = 200;
  fwdx = eyeX + cos(leftRightHeadAngle)*m; // SUBTRACT FROM THE ANGLES TO MAKE THE LEFT AND RIGHT STCHUFF
  //fwdy = eyeY + tan(topBottomAngle)*300;
  fwdz = eyeZ + sin(leftRightHeadAngle)*m;

  int ugh = 10;
  leftx = eyeX + cos(leftRightHeadAngle+PI/ugh)*m;
  lefty = eyeY + tan(topBottomAngle)*300;
  leftz = eyeZ + sin(leftRightHeadAngle+PI/ugh)*m;

  rightx = eyeX + cos(leftRightHeadAngle-PI/ugh)*m;
  righty = eyeY + tan(topBottomAngle)*300;
  rightz = eyeZ + sin(leftRightHeadAngle-PI/ugh)*m;

  // left and right are switched cries

  world.pushMatrix();
  world.translate(leftx, lefty, leftz);
  world.sphere(5);
  world.popMatrix();

  world.pushMatrix();
  world.translate(rightx, righty, rightz);
  world.sphere(5);
  world.popMatrix();

  fmapx = int(fwdx+2000) / gridSize;
  fmapy = int(fwdz+2000) / gridSize;
  lmapx = int(leftx+2000) / gridSize;
  lmapy = int(leftz+2000) / gridSize;
  rmapx = int(rightx+2000) / gridSize;
  rmapy = int(rightz+2000) / gridSize;

  if (map.get(lmapx, lmapy) == white) {
    left = true;
  } else {
    left = false;
  }

  if (map.get(rmapx, rmapy) == white) {
    right = true;
  } else {
    right = false;
  }

  if (map.get(fmapx, fmapy) == white) {
    fwd = true;
  } else {
    fwd = false;
  }

  if (fwd && left && right) {
    return true;
  } else {
    return false;
  }
}
