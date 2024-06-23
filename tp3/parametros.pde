void cuadro() {
  image(fondo, 0, 0, 400, 400);
  float espacioX = width / 2 / 10;
  float espacioY = height / 10;

  for (int y = 0; y < 10; y++) {
    for (int x = 0; x < 10; x++) {
      float xPos = width / 2 + (x * espacioX) + espacioX / 2;
      float yPos = (y * espacioY) + espacioY / 2;

      float d1 = dist(x, y, 0, 0);
      float d2 = dist(x, y, 2 - 1, 10 - 1);
      float d = min(d1, d2);
      float ellipseSize = map(d, 0, max(10, 10), espacioX * 0.8, espacioY * 0.1);

      
      int colorValue = (x + y) % 2 == 0 ? 0 : 255;
      if (invertirColores) {
        colorValue = 255 - colorValue;
      }

      fill(colorValue);
      noStroke();
      ellipse(xPos, yPos, ellipseSize, ellipseSize);
    }
  }
}

void mousePressed() {
  if (!primerClicHecho) {
    primerClicHecho = true; 
    
  } else {
    invertirColores = !invertirColores; 
  }
}
