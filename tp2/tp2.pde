// Almonacid, Fernanda
// tp2 comision 1

PFont fuente;
PImage img1, img2, img3, img4, img5, img6;
int estado;
float posX, posY;
int contador;
String texto1, texto2, texto3, texto4, texto5, texto6;

void setup() {
  background (0);

  size (640, 480);
  fuente =loadFont("fuente.vlw");
  textFont(fuente);
  textAlign( LEFT );
  textSize(20);

  img1 =loadImage("img1.png");
  img2 =loadImage("img2.png");
  img3 =loadImage("img3.png");
  img4 =loadImage("img4.png");
  img5 =loadImage ("img5.png");
  img6 =loadImage ("img6.png");


  texto1 ="Final Fantasy VII: Advent Children Complete\nes una cinta animada y de fantasía,\ndirigida por Tetsuya Nomura, que, con una\nedición especial de la historia, revive la épica \naventura de Final Fantasy VII.";
  texto2="Con más escenas, más acción y más emoción, \nla cinta se sitúa dos años después de los eventos \ndel juego, cuando el mundo está en paz \ntras la derrota de Sephiroth.";
  texto3="Sin embargo, una nueva amenaza surge de la \nmano de los Remnants, tres hermanos que comparten \nel ADN de Sephiroth y que quieren resucitarlo \npara cumplir su plan de destruir el planeta.";
  texto4="Se renderiza en tiempo real, mediante un programa de computadora. Así asegurando que cada estado visual sea único.Cloud Strife, el héroe que venció a Sephiroth,\nse ve involucrado en el conflicto cuando\nlos Remnants secuestran a sus amigos y lo atacan..";
  texto5="Sin opciones, Cloud tendrá que superar sus \ntraumas y sus culpas, y reunir de nuevo a sus aliados para enfrentarse  \na su enemigo más poderoso.No solo eso, Cloud también deberá encontrar  \nuna cura para la enfermedad que lo consume,  \ny que está relacionada  con los restos de Jenova,  \nla madre de Sephiroth. La cinta ofrece una edición especial de la historia, \ncon una narrativa que aporta más profundidad  \na los personajes y los conflictos,  haciendo  de  \nFinal Fantasy VII: Advent Children    \nComplete una experiencia imperdible para los fans.";
  texto6= "Restart";

  estado=1;
  contador = 0;
  posX = 10;
  posY = 220;
}

void draw() {
  println ("X:");
  println ("Y:");
  println (mouseX+","+mouseY);
  println("estado="+estado);

  if (estado ==1) {
    image(img1, 0, 0, width, height);
    text(texto1, posX/5, posY, 600, 200);


    posX+=5;
    if (posX>width) {
      estado=2;
      contador = 0;
      posX = 10;
      posY = 220;
    }
  
  } else if (estado ==2) {
    image(img2, 0, 0, 640, 480);
    text(texto2, posX/5, posY, 600, 200);

    posX+=5;
    if (posX>width) {
      estado=3;
      contador = 0;
      posX = 10;
      posY = 220;
    }
  
  } else if (estado ==3) {
    image(img3, 0, 0, 640, 480);
    text(texto3, posX/6, posY, 600, 200);
    posX+=5;
    if (posX>width) {
      estado=4;
      contador = 0;
      posX = 20;
      posY = 220;
    }
    
  } else if (estado ==4) {
    image(img4, 0, 0, 640, 480);
    text(texto4, posX/6, posY, 600, 200);
    posX+=5;
    if (posX>width) {
      estado=5;
      contador = 0;
      posX = 20;
      posY = 220;
    }
  
  } else if (estado ==5) {
    image(img5, 0, 0, 640, 480);
    text(texto5, posX/6, posY, 600, 200);
    posX+=5;
    if (posX>width) {
      estado=6;
      contador = 0;
      posX = 20;
      posY = 220;
    }
   
  } else if (estado ==6) {
    image(img6, 0, 0, 640, 480);
    if ( mouseX>200 && mouseX<200+250
      && mouseY >209 && mouseY<209+80 ) {
      fill(100);
    } else {
      fill(200);
    }
    rect( 200, 209, 250, 80);
    fill(255);
    text (texto6, 260, 259);
  }
}
void mousePressed() {

  if ( estado > 5) {
    if ( mouseX>200 && mouseX<200+250
      && mouseY >209 && mouseY<209+80 ) {
      estado = 1;
    }
  } else {
    estado++;
    contador = 0;
    posX = 20;
  }
}
