// Almonacid, Fernanda
// tp1 comision 1
PImage fondo;



void setup() {  
    
  size (800,400);
  fondo = loadImage ("gato1.jpg");  

}

void draw () {
  
  background (255) ;
  
  int x = width - 400; 
  int y = 0; 
  image(fondo, x, y, 400, 400);   
  

fill(143, 126, 108); 
strokeWeight(4);
triangle(40, 10,60, 200, 300, 200); 
fill(123, 113, 104);
triangle(40, 10, 60, 200, 200, 200);  
fill(170, 158, 158);  // sombra interna
triangle(80, 60, 90, 160, 190, 160);

 fill(143, 126, 108);
  triangle(330, 10, 348, 200, 90, 200); 
  fill(123, 113, 104);
  triangle(330, 10, 348, 200, 190, 200); 
  fill(170, 158, 158);  
triangle(295,58, 296, 165, 190, 150);


fill(90, 80, 71);
ellipse(200,410, 300, 200);


 fill(169, 152, 134); 
strokeWeight(3);
ellipse(200,240, 310, 250); 


fill(205, 189, 166);
strokeWeight(1);
ellipse(200,335, 110 , 110); 


fill(121, 87, 75);
strokeWeight(2);
triangle(200, 330, 175, 280, 225, 280);


fill(57, 61, 64); 
stroke(1);
triangle(175, 356, 200, 336, 225, 356);


stroke(121, 87, 75); 
strokeWeight(2); 


line(175, 310, 115, 285);
ellipse(175, 310, 5, 5);  

line(230, 310, 270, 285);
ellipse(230, 310, 5, 5);  


line(175, 325, 115, 350);
ellipse(175, 325, 5, 5);  

line(230, 325, 270, 350);
ellipse(230, 325, 5, 5);  


line(180, 340, 120, 365);
ellipse(180, 340, 5, 5);  

line(225, 340, 265, 365);
ellipse(225, 340, 5, 5); 

fill(2, 0, 3);
ellipse(129,230, 70, 70);
ellipse(268,230, 70, 70);


fill(200, 166, 128); 
strokeWeight(4);
ellipse(126,239, 70, 70);
ellipse(268,237, 70, 70);


fill(120, 134, 109);  
strokeWeight(0);
ellipse(126,239, 30, 65);
ellipse(268,237, 30, 65);


fill(13, 15, 27);  
strokeWeight(3);
ellipse(126,239, 20,55);
ellipse(268,237, 20, 55);

fill(149, 162, 178);
strokeWeight(1);
ellipse(120,215, 13,13);
ellipse(260,215, 13, 13);
}
