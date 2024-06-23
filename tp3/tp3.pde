// Almonacid, Fernanda
// tp3 comision 1

PImage fondo;
boolean invertirColores = false;
boolean primerClicHecho = false; 

void setup() {
  size(800, 400);
  fondo = loadImage("colors.jpg");
  textSize(28);
}

void draw() {
  background(108, 113, 117);
   image(fondo, 0, 0, 400, 400);
  cuadro();
}
