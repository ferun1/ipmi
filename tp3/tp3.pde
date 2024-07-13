// Almonacid, Fernanda
// tp3 comision 1
PImage fondo;
boolean invertirColores = false; 
boolean primerClicHecho = true; 
int colorCirculo = 0; 

void setup() {
  size(800, 400);
}

int cols = 20; 
int filas = 20;
float tamMax = 25; 
float tamMin = 5; 

void draw() {
  background(108, 113, 117);
    PImage fondo;
  fondo = loadImage("colors.jpg");
  image(fondo, 0, 0, 400, 400);
  
if (primerClicHecho) { 
    for (int y = 0; y < filas; y++) {
      for (int x = 0; x < cols; x++) {
        float xPos = map(x, -20, cols - 4, width * 0.1, width * 0.9);
        float yPos = map(y, 1, filas - 2, height * 0.1, height * 0.9);

        float ellipseWidth, ellipseHeight;
        if ((x + y) % 2 == 0) {
          ellipseWidth = calcularRadio(x, y, 0, 0, 20, 20);
          ellipseHeight = ellipseWidth; 
          if (invertirColores) {
            fill(255);
          } else {
            fill(colorCirculo); 
          }
        } else {
          ellipseWidth = calcularRadio(x, y, 20, 0, 0, 20);
          ellipseHeight = ellipseWidth; 
          if (invertirColores) {
            fill(0); 
          } else {
            fill(255); 
          }
        }

        dibujarCirculo(xPos, yPos, ellipseWidth, ellipseHeight); 
      }
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


float calcularRadio(int x, int y, int x1, int y1, int x2, int y2) {
  float d1 = dist(x, y, x1, y1);
  float d2 = dist(x, y, x2, y2);
  float d = min(d1, d2);
  return map(d, 0, max(cols, filas), tamMax, tamMin);
}


void dibujarCirculo(float x, float y, float w, float h) {
  noStroke();
  ellipse(x, y, w, h);
}

void keyPressed() {
  if (key == 'c' || key == 'C') {
    colorCirculo = color(random(255), random(255), random(255)); 
  }
  if (key == 'r' || key == 'R') {
    colorCirculo = 0; 
  }
}
