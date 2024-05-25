// Almonacid, Fernanda
// tp2 comision 1

PImage[] imagenes;
int numImagenes = 9;
int indiceActual = 0;
int siguienteIndice = 1;
float transparencia = 0;
boolean enTransicion = false;
boolean botonInicioClicado = false;
boolean botonReiniciarClicado = false;
int velocidadTransicion = 6;
int retrasoTransicion = 180;
int ultimoFrame = 0;
PFont fuentePersonalizada;
ArrayList<Particle> particles;

float textSuperiorX;
float textInferiorX;
float textSuperiorDestinoX;
float textInferiorDestinoX;

void setup() {
  size(640, 480);
  frameRate(60);
  imagenes = new PImage[numImagenes];
  particles = new ArrayList<Particle>();
  
  fuentePersonalizada = createFont("SansSerif", 20);
  
  for (int i = 0; i < numImagenes; i++) {
    String nombreImagen = "imagen" + (i + 1) + ".png";
    imagenes[i] = loadImage(nombreImagen);
  }
  
  textFont(fuentePersonalizada);
  textSize(20);
  fill(255);
  
  textSuperiorX = -width;
  textInferiorX = width;
  textSuperiorDestinoX = width / 4;
  textInferiorDestinoX = width / 4;
}

void draw() {
  background(0);
  PImage img = imagenes[indiceActual];
  image(img, (width - img.width) / 2, (height - img.height) / 2);
  
  if (indiceActual > 0 && indiceActual < numImagenes - 1) {
    drawTextOnImage(indiceActual);
  }

  if (indiceActual == 0 && !botonInicioClicado) {
    dibujarBoton("START");
  }
  
  if (indiceActual == numImagenes - 1) {
    botonInicioClicado = false;
    dibujarBoton("RESTART");
  }

  if (enTransicion) {
    transparencia += velocidadTransicion * 0.01;
    if (transparencia >= 1) {
      transparencia = 0;
      enTransicion = false;
      indiceActual = siguienteIndice;
      ultimoFrame = frameCount;
      textSuperiorX = -width;
      textInferiorX = width;
    }
    PImage siguienteImg = imagenes[siguienteIndice];
    tint(255, 255 );
    image(siguienteImg, (width - siguienteImg.width) / 2, (height - siguienteImg.height) / 2);
    noTint();
  }
  
  if (frameCount - ultimoFrame >= retrasoTransicion && !enTransicion && botonInicioClicado) {
    siguienteIndice = (indiceActual + 1) % numImagenes;
    enTransicion = true;
  }

  if (mouseX > 0 && mouseX < width && mouseY > 0 && mouseY < height) {
    for (int i = 0; i < 5; i++) {
      particles.add(new Particle(mouseX, mouseY));
    }
  }

  for (int i = particles.size() - 1; i >= 0; i--) {
    Particle p = particles.get(i);
    p.update();
    p.display();
    if (p.isFinished()) {
      particles.remove(i);
    }
  }
}

void mousePressed() {
  if (indiceActual == 0 && !botonInicioClicado && ratonSobreBoton()) {
    botonInicioClicado = true;
    ultimoFrame = frameCount;
  }
  
  if (indiceActual == numImagenes - 1 && ratonSobreBoton()) {
    botonReiniciarClicado = true;
    botonInicioClicado = false;
    indiceActual = 0;
    ultimoFrame = frameCount;
  }
}

void dibujarBoton(String etiqueta) {
  int anchoBoton = 100;
  int altoBoton = 40;
  int botonX = width / 2 - anchoBoton / 2;
  int botonY = height / 2 + altoBoton;
  fill(0);
  noStroke();
  rect(botonX, botonY, anchoBoton, altoBoton);
  fill(255);
  textAlign(CENTER, CENTER);
  text(etiqueta, botonX + anchoBoton / 2, botonY + altoBoton / 2);
}

boolean ratonSobreBoton() {
  int anchoBoton = 100;
  int altoBoton = 40;
  int botonX = width / 2 - anchoBoton / 2;
  int botonY = height / 2 + altoBoton;
  return mouseX >= botonX && mouseX <= botonX + anchoBoton && mouseY >= botonY && mouseY <= botonY + altoBoton;
}

void drawTextOnImage(int indice) {
  fill(255);
  textAlign(LEFT, TOP);

  if (textSuperiorX < textSuperiorDestinoX) {
    textSuperiorX += 10;
  }
  if (textInferiorX > textInferiorDestinoX) {
    textInferiorX -= 10;
  }

  switch(indice) {
    case 1:
      textAlign(RIGHT, TOP);
      text("CLOUD \nSTRIFE", textSuperiorX, 60);
      textAlign(LEFT, BOTTOM);
      text("Final Fantasy VII: Advent Children Complete\nes una cinta animada y de fantasía,\ndirigida por Tetsuya Nomura, que, con una\nedición especial de la historia, revive la épica \naventura de Final Fantasy VII.", textInferiorX, height - 20);
      break;
    case 2:
      textAlign(RIGHT, TOP);
      text("ZACK \nFAIR", textSuperiorX, 60);
      textAlign(LEFT, BOTTOM);
      text("Con más escenas, más acción y más emoción, \nla cinta se sitúa dos años después de los eventos \ndel juego, cuando el mundo está en paz \ntras la derrota de Sephiroth.", textInferiorX, height - 20);
      break;
    case 3:
      textAlign(RIGHT, TOP);
      text("TIFA \nLOCKHART", textSuperiorX, 60);
      textAlign(LEFT, BOTTOM);
      text("Sin embargo, una nueva amenaza surge de la \nmano de los Remnants, tres hermanos que comparten \nel ADN de Sephiroth y que quieren resucitarlo \npara cumplir su plan de destruir el planeta.", textInferiorX, height - 20);
      break;
    case 4:
      textAlign(RIGHT, TOP);
      text("VINCENT \nVALENTINE", textSuperiorX, 60);
      textAlign(LEFT, BOTTOM);
      text("Cloud Strife, el héroe que venció a Sephiroth,\nse ve involucrado en el conflicto cuando\nlos Remnants secuestran a sus amigos y lo atacan.", textInferiorX, height - 20);
      break;
    case 5:
      textAlign(RIGHT, TOP);
      text("RENO", textSuperiorX, 60);
      textAlign(LEFT, BOTTOM);
      text("Sin opciones, Cloud tendrá que superar sus \ntraumas y sus culpas, y reunir de nuevo a sus aliados para enfrentarse  \na su enemigo más poderoso.", textInferiorX, height - 20);
      break;
    case 6:
      textAlign(RIGHT, TOP);
      text("RUFUS \nSHINRA", textSuperiorX, 60);
      textAlign(LEFT, BOTTOM);
      text("No solo eso, Cloud también deberá encontrar  \nuna cura para la enfermedad que lo consume,  \ny que está relacionada  con los restos de Jenova,  \nla madre de Sephiroth.", textInferiorX, height - 20);
      break;
    case 7:
      textAlign(RIGHT, TOP);
      text("SEPHIROTH", textSuperiorX, 60);
      textAlign(LEFT, BOTTOM);
      text("La cinta ofrece una edición especial de la historia, \ncon una narrativa que aporta más profundidad  \na los personajes y los conflictos,  haciendo  de  \nFinal Fantasy VII: Advent Children    \nComplete una experiencia imperdible para los fans.", textInferiorX, height - 20);
      break;
  }
}

class Particle {
  PVector position;
  PVector velocity;
  PVector acceleration;
  float lifespan;
  
  Particle(float x, float y) {
    position = new PVector(x, y);
    velocity = PVector.random2D().mult(random(1, 3));
    acceleration = new PVector(0, 0.05);
    lifespan = 255;
  }
  
  void update() {
    velocity.add(acceleration);
    position.add(velocity);
    lifespan -= 2;
  }
  
  void display() {
    noStroke();
    float alpha = map(lifespan, 0, 255, 0, 100);
    fill(0, 255, 127, alpha);
    ellipse(position.x, position.y, 10, 10);
  }
  
  boolean isFinished() {
    return lifespan < 0;
  }
}
