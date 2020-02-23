int pantalla;
Pantalla inicio, seleccion, batalla, ganador;
Personaje kingkato,hei,vodu,leo,weirdzard, jugador1, jugador2;
Botones continuarbtn, playagain;
int contadorclick =0;
int turno=1;
void setup()
{
  size(1600,900);
  pantalla =1;
  background (0);
  //fontTitulo = loadFont ("LucidaConsole-48.vlw");
  //fontInicio = loadFont ("LucidaCInicio.vlw");
  inicio = new Pantalla (1);
  seleccion = new Pantalla(2);
  batalla = new Pantalla (3);
  ganador = new Pantalla (4);
  kingkato = new Personaje(1);
  weirdzard = new Personaje (2);
  vodu = new Personaje (3);
  hei = new Personaje (4);
  leo = new Personaje (5);

  continuarbtn = new Botones(700,750,"CONTINUAR",1);
  playagain = new Botones (700,450, "Jugar de nuevo",2);
}
void draw()
{
  DisplayScreen(pantalla);
}
void DisplayScreen(int pantalla)
{
  switch(pantalla)
  {
    case 1:
 
        inicio.DisplayPantalla();
        break;
    case 2:
        seleccion.DisplayPantalla();
        kingkato.DisplayPlayer();
        weirdzard.DisplayPlayer();
        vodu.DisplayPlayer();
        hei.DisplayPlayer();
        leo.DisplayPlayer();
        kingkato.DisplayStats();
        weirdzard.DisplayStats();
        vodu.DisplayStats();
        hei.DisplayStats();
        leo.DisplayStats();
        //text(mouseX,50,50);
        //text(mouseY,90,50);
        continuarbtn.Display();
        break;
    case 3:
        batalla.DisplayPantalla();
        jugador1.DisplayPlayer();
        jugador2.DisplayPlayer();
        jugador1.iddle();
        jugador2.iddle();
        jugador1.displayLifeBar();
        jugador2.displayLifeBar();
        turnoCombate();
        break;
    case 4:
        ganador.DisplayPantalla();
        playagain.Display();
 
        break;
  }
  return;
}
void turnoCombate()
{
    if(turno==1)
    {
      jugador1.displayCombatMenu();
    }
    else if(turno==2)
    {
      jugador2.displayCombatMenu();
    }

}
void keyPressed()
{
  if(pantalla==1)
  pantalla++;
}
void mouseClicked()
{
  float mx = mouseX;
  float my = mouseY;
  if(pantalla==2)
  {
     if(continuarbtn.isClicked(mx,my) && contadorclick==2)
     {
       pantalla+=1;
       jugador1.selected(0);
       jugador2.selected(0);
       jugador1.Trasladar(400,300);
       jugador2.Trasladar(1000,300);
     }
     if(mx>=100 && mx <= 315 && my >=230 && my <=470) //mouse click sobre kingkato
     {
       if(contadorclick==0)
       {
         jugador1=kingkato;
         contadorclick++;
         kingkato.selected(1);
       }
       else if(contadorclick==1)
       {
         jugador2=kingkato;
         contadorclick++;
         kingkato.selected(2);
       }
     }
      if(mx>=400 && mx <= 590 && my >=200 && my <=470) //mouse click sobre wierdzard
     {
       if(contadorclick==0)
       {
         jugador1=weirdzard;
         contadorclick++;
         weirdzard.selected(1);
       }
       else if(contadorclick==1)
       {
         jugador2=weirdzard;
         contadorclick++;
         weirdzard.selected(2);
       }
     }
     if(mx>=700 && mx <= 880 && my >=200 && my <=470) //mouse click sobre vodu
     {
       if(contadorclick==0)
       {
         jugador1=vodu;
         contadorclick++;
         vodu.selected(1);
       }
       else if(contadorclick==1)
       {
         jugador2=vodu;
         contadorclick++;
         vodu.selected(2);
       }
     }
    if(mx>=1000 && mx <= 1170 && my >=200 && my <=470) //mouse click sobre hei
     {
       if(contadorclick==0)
       {
         jugador1=hei;
         contadorclick++;
         hei.selected(1);
       }
       else if(contadorclick==1)
       {
         jugador2=hei;
         contadorclick++;
         hei.selected(2);
       }
     }
     if(mx>=1300 && mx <= 1480 && my >=200 && my <=470) //mouse click sobre leo
     {
       if(contadorclick==0)
       {
         jugador1=leo;
         contadorclick++;
         leo.selected(1);
       }
       else if(contadorclick==1)
       {
         jugador2=leo;
         contadorclick++;
         leo.selected(2);
       }
     }
  }
  if(pantalla==3)
  {
    if(turno==1)
    {
        if(jugador1.seleccionAtaque(mx,my)==1)
        {
          jugador2.vida = jugador2.vida-jugador1.hacerAtaque(1);
          turno=2;
        }
        else if(jugador1.seleccionAtaque(mx,my)==2)
        {  
          jugador2.vida = jugador2.vida-jugador1.hacerAtaque(2);
          turno=2;
        }
    }
    else if(turno==2)
    {
        if(jugador2.seleccionAtaque(mx,my)==1)
        {
          jugador1.vida = jugador1.vida - jugador2.hacerAtaque(1);
          turno=1;
        }
        else if(jugador2.seleccionAtaque(mx,my)==2)
        {
          jugador1.vida = jugador1.vida - jugador2.hacerAtaque(2);
          turno=1;
        }
    }
    if(jugador1.vida<=0)
            pantalla=4;
    if(jugador2.vida<=0)
            pantalla=4;
  }
  
  if (pantalla==4)
  {
    if(playagain.isClicked(mx,my))
     {
      pantalla=1;
      background (0);
      contadorclick =0;
      inicio = new Pantalla (1);
      seleccion = new Pantalla(2);
      batalla = new Pantalla (3);
      ganador = new Pantalla (4);
      kingkato = new Personaje(1);
      weirdzard = new Personaje (2);
      vodu = new Personaje (3);
      hei = new Personaje (4);
      leo = new Personaje (5);
      turno = 1;

     }
  }

}
class Botones
{
  int x,y;
  String texto;
  PFont fuentebtn;
  int identificador;
  Botones(int cx, int cy, String txtinicial, int id)
  {
    x = cx;
    y =cy;
    texto=txtinicial;
    fuentebtn = loadFont ("LucidaCInicio.vlw");
    identificador = id;
  }
  void Display()
  {
    switch (identificador)
  {
    case 1:
    noStroke();
    stroke(99);
    fill(200);
    rect(x,y,200,100);
    fill (0);
    textFont(fuentebtn);
    text(texto,x+37,y+55);
    break;
      
    case 2:
      
      noStroke();
      stroke(99);
      fill(200);
      rect(x,y,200,100);
      fill (0);
      textFont(fuentebtn);
      text(texto,x+20,y+55);
        
    break;
  }
  }
    
  boolean isClicked(float mx, float my)
  {
    if(mx>=x &&  mx<=x+200 && my>=y && my<=y+100)
    {
      return true;
    }
    else
      return false;
  }
}
class Pantalla
{
  int x;
  int y;
  String text;
  PFont fontTitulo, fontnormal;
  int identificador;
  float theta = 0;
  float radio = 0;
  float dx;
  int r,g;
  Botones juegonuevo;
  
  Pantalla ( int ide )
  {
    identificador=ide;
    InicVal(ide);
   
  }
  void InicVal (int ide)
  {
    switch (ide)
    {
      case 1:
          x = 0;
          y = 0;
          fontTitulo = loadFont ("LucidaConsole-48.vlw");
          fill (255);
          fontnormal = loadFont ("LucidaCInicio.vlw");
          fill (255);
          break;
     case 2:
        
        fontnormal = loadFont ("LucidaCInicio.vlw");
        textFont(fontnormal);
        //fill (0);
        //text (">>Para seleccionar tu personaje haz click sobre él", 150,90);
        //text (">>Una vez seleccionados ambos personajes, da click en continuar :)",150,110);
      break;
      case 3:
        fontnormal = loadFont ("LucidaCInicio.vlw");
        textFont(fontnormal);
      break;
      case 4:
        fontTitulo = loadFont ("LucidaConsole-48.vlw");
        fill (255);
          
      break;
    }
  }
  void DisplayPantalla ()
  {
    switch (identificador)
    {
      case 1:
            stroke(255);
            point(width/2 + cos(theta) * radio, height/2 + sin(theta) * radio);
            theta = theta + 0.05;
            radio = radio + 0.1;
            fill (255);
            textFont(fontTitulo);
            text("Hei, Where's Leon?", 150, 500);
            fill (255);
            textFont(fontnormal);
            text ("Press ANY key to continue", 680,800);
      break;
      case 2:
            
            dx+=0.05;
            background (255);
            for(int i= 0; i<1600; i+=10){
            for(int j = 0; j<900; j+=10){
            noStroke();
            fill(noise(i*0.01+dx,j*0.01,dx)*139,8,17);
            rect(i,j,10,10);
            }
            }
            fill (250);
            text (">>Para seleccionar tu personaje haz click sobre él", 150,90);
            text (">>Una vez seleccionados ambos personajes, da click en continuar :)",150,110);
            fill (255);
            text ("*Debajo de cada personaje podrás ver su vida y su ataque", 150, 680);
      break;
      case 3:
            dx+=0.05;
            background (255);
            for(int i= 0; i<1600; i+=10){
            for(int j = 0; j<900; j+=10){
            noStroke();
            fill(noise(i*0.01+dx,j*0.01,dx)*150,121,109);
            rect(i,j,10,10);
            }
            }
            fill (250);
            text (">> Los turnos para atacar van de acuerdo a la selección del personaje, si eres P1 vas primero ;)", 150,90);
            text (">> Debajo aparecerá un pequeño menú con los ataques de cada personaje y con un color especial para cada uno...", 150,120);
            text (">> El primer ataque hace la mitad de daño, el segundo hace el daño completo..", 150,150);
            text ("A JUGAR :D", 600,180);
            break;
      case 4:
           r = 20;
           g = 70;

           for (int i=20; i<width; i++)
           {
             stroke (r,i,g);
             line (0,i,width,i);
           }
           textFont(fontTitulo);
           fill (255);
           text("Vencedor", 150, 500);
           if(jugador1.vida<=0)
               jugador2.DisplayPlayer();
           if(jugador2.vida<=0)
               jugador1.DisplayPlayer();
           break;
    }
  }
  }
class Personaje
{
  float vida;
  float ataque;
  String nombre;
  int identificador;
  int x, y;
  int l; //Tamaño del pixel del pixelart
  int seleccionado =0;
  int contIddle = 0; //contador de animacion
  Botones ataque1btn, ataque2btn;
  Personaje(int id)//constructor
  {
    identificador = id;
    InicializarValores(id);
  }
  void Trasladar(int tx, int ty)
  {
    x=tx;
    y=ty;
  }
  void iddle()
{
    if(contIddle<20)
    {
      y+=1;
    }
    if(contIddle>20 && contIddle<40)
    {
      y-=1;
    }
    if(contIddle>40)
    {  
      contIddle=0;
    }
    contIddle++;
    return;
}
  void InicializarValores(int id)
  {
    switch(id)
      {
       case 1: //kingkato
         l=7;
         x=100;
         y=230;
         ataque=40;
         vida=350;
         ataque1btn = new Botones(550, 730, "SCRATCH", 1);
         ataque2btn = new Botones(850,730, "KING POWER", 1);
         break;
       
       case 2: //weirdzard
         l=12;
         x=400;
         y=190;
         ataque=45;
         vida=300;
         ataque1btn = new Botones (550, 730, "MAGIC BALL",1);
         ataque2btn = new Botones (850, 730, "WHITE MAGIC",1);
         break;
        
       case 3: //vodu
         l=12;
         x=700;
         y=200;
         ataque=50;
         vida=300;
         ataque1btn = new Botones (550, 730, "SKULL",1);
         ataque2btn = new Botones (850, 730, "DARK MAGIC",1);
         break;
       case 4: //hei
         l=7;
         x=1010;
         y=230;
         ataque=40;
         vida=300;
         ataque1btn = new Botones (550, 730, "SWORD THRUST",1);
         ataque2btn = new Botones (850, 730, "LIGHT SWORD",1);
         break;
       case 5: //leo
         l=7;
         x=1310;
         y=230;
         ataque=50;
         vida=250;
         ataque1btn = new Botones (550, 730, "STAB",1);
         ataque2btn = new Botones (850, 730, "DARK SWORD",1);
         break;
      }
  }
  void selected(int s)
  {
    seleccionado=s; 
  }
  void DisplayStats()
  {
    text ("Ataque: ",x+10,550);
    text(ataque,x+85,550);
    text("Vida: ", x+10,525);
    text(vida,x+85,525);
       
  }
  void DisplayPlayer()
  {
    
    switch(identificador)
    {
       case 1:
          fill(0);
          noStroke();

          //corona
          rect (x+l*12, y, l,l);
          rect (x+8*l,y+l,2*l,l);
          rect (x+11*l,y+l,l,l);
          rect (x+13*l,y+l,l,l);
          rect (x+15*l,y+l,2*l,l);
          rect (x+8*l,y+l*2,l,l);
          rect (x+10*l,y+l*2,l,l);
          rect (x+14*l,y+l*2,l,l);
          rect (x+16*l,y+l*2,l,l);
          rect (x+8*l,y+l*3,l,l);
          rect (x+16*l,y+l*3,l,l);
          rect (x+8*l,y+l*4,9*l,l);
          //cabeza
          rect (x+6*l,y+l*5,l*2,l);
          rect (x+17*l,y+l*5,l*2,l);
          rect (x,y+l*6,l*6,l);
          rect (x+19*l,y+l*6,l*6,l);
          rect (x,y+l*7,l,l*2);
          rect (x+24*l,y+l*7,l,l*2);
          rect (x+1*l,y+l*9,l,l*2);
          rect (x+23*l,y+l*9,l,l*2);
          rect (x+2*l,y+l*11,l,l);
          rect (x+22*l,y+l*11,l,l);
          rect (x+3*l,y+l*12,l,l*4);
          rect (x+21*l,y+l*12,l,l*4);
          rect (x+7*l,y+l*13,l*2,l);
          rect (x+16*l,y+l*13,l*2,l);
          rect (x+6*l,y+l*14,l,l*2);
          rect (x+9*l,y+l*14,l,l*2);
          rect (x+15*l,y+l*14,l,l*2);
          rect (x+18*l,y+l*14,l,l*2);
          rect (x,y+l*16,l*2,l);
          rect (x+l*23,y+l*16,l*2,l);
          rect (x+7*l,y+l*16,l*2,l);
          rect (x+16*l,y+l*16,l*2,l);
          rect (x+4*l,y+l*16,l,l*2);
          rect (x+20*l,y+l*16,l,l*2);
          rect (x+1*l,y+l*18,l,l);
          rect (x+5*l,y+l*18,l,l);
          rect (x+19*l,y+l*18,l,l);
          rect (x+22*l,y+l*18,l,l);
          rect (x,y+l*19,l,l);
          rect (x+6*l,y+l*19,l*2,l);
          rect (x+18*l,y+l*19,l,l);
          rect (x+23*l,y+l*19,l,l);
          rect (x+8*l,y+l*20,l,l);
          rect (x+18*l,y+l*19,l,l);
          //cuerpo y capa
          rect (x+19*l,y+l*20,l,l);
          rect (x+20*l,y+l*21,l,l);
          rect (x+21*l,y+l*22,l,l);
          rect (x+22*l,y+l*23,l,l*2);
          rect (x+12*l,y+l*23,l,l*2);
          rect (x+7*l,y+l*21,l,l*5);
          rect (x+11*l,y+l*25,l,l);
          rect (x+13*l,y+l*25,l,l);
          rect (x+10*l,y+l*26,l,l);
          rect (x+14*l,y+l*26,l,l);
          rect (x+15*l,y+l*27,l,l);
          rect (x+16*l,y+l*28,l,l);
          rect (x+17*l,y+l*29,l,l);
          rect (x+8*l,y+l*26,l,l*4);
          rect (x+9*l,y+l*27,l,l*2);
          rect (x+18*l,y+l*29,l*2,l);
          rect (x+19*l,y+l*30,l*4,l);
          rect (x+23*l,y+l*25,l,l*6);
          rect (x+9*l,y+l*30,l,l*3);
          rect (x+10*l,y+l*33,l*2,l);
          rect (x+12*l,y+l*32,l,l);
          rect (x+13*l,y+l*33,l*9,l);
          rect (x+22*l,y+l*32,l*4,l);
          rect (x+24*l,y+l*30,l,l);
          rect (x+25*l,y+l*29,l,l);
          rect (x+26*l,y+l*27,l,l*2);
          rect (x+27*l,y+l*24,l,l*3);
          rect (x+26*l,y+l*22,l,l*2);
          rect (x+27*l,y+l*22,l*2,l);
          rect (x+29*l,y+l*23,l,l);
          rect (x+30*l,y+l*24,l,l*4);
          rect (x+29*l,y+l*28,l,l*2);
          rect (x+28*l,y+l*30,l,l);
          rect (x+26*l,y+l*31,l*2,l);
          //color corona
          noStroke();
          fill (221,191,0);
          rect (x+9*l,y+l*2,l,l*2);
          rect (x+15*l,y+l*2,l,l);
          rect (x+14*l,y+l*3,l*2,l);
          fill (248,224,0);
          rect (x+11*l,y+l*3,l*3,l);
          rect (x+12*l,y+l*2,l*2,l);
          rect (x+12*l,y+l*1,l,l);
          //relleno gato
          fill(255);
          rect (x+l*8,y+l*5,l*9,l);
          rect (x+l*6,y+l*6,l*13,l);
          rect (x+l,y+l*7,l*23,l);
          rect (x+l,y+l*8,l*23,l);
          rect (x+l*2,y+l*9,l*21,l);
          rect (x+l*2,y+l*10,l*21,l);
          rect (x+l*3,y+l*11,l*19,l);
          rect (x+l*4,y+l*12,l*17,l);
          rect (x+l*4,y+l*13,l*3,l);
          rect (x+l*9,y+l*13,l*7,l);
          rect (x+l*18,y+l*13,l*3,l);
          rect (x+l*4,y+l*14,l*2,l*2);
          rect (x+l*7,y+l*14,l*2,l*2);
          rect (x+l*10,y+l*14,l*5,l*2);
          rect (x+l*16,y+l*14,l*2,l*2);
          rect (x+l*19,y+l*14,l*2,l*2);
          rect (x+l*5,y+l*16,l*2,l*2);
          rect (x+l*9,y+l*16,l*7,l*2);
          rect (x+l*18,y+l*16,l*2,l*2);
          rect (x+l*7,y+l*17,l*2,l);
          rect (x+l*16,y+l*17,l*2,l);
          rect (x+l*6,y+l*18,l*13,l);
          rect (x+l*7,y+l*19,l*11,l);
          rect (x+l*27,y+l*23,l*2,l);
          rect (x+l*28,y+l*24,l*2,l*3);
          rect (x+l*27,y+l*27,l*3,l);
          rect (x+l*27,y+l*28,l*2,l);
          rect (x+l*26,y+l*29,l*3,l);
          rect (x+l*25,y+l*30,l*3,l);
          rect (x+l*12,y+l*25,l,l);
          rect (x+l*11,y+l*26,l*3,l);
          rect (x+l*10,y+l*27,l*5,l);
          rect (x+l*10,y+l*28,l*6,l);
          rect (x+l*9,y+l*29,l*8,l);
          rect (x+l*10,y+l*30,l*9,l);
          rect (x+l*10,y+l*31,l*16,l);
          rect (x+l*10,y+l*32,l*2,l);
          rect (x+l*13,y+l*32,l*9,l);
          //capa
          fill (175,103,236);
          rect (x+9*l,y+l*20,l*9,l*2);
          rect (x+8*l,y+l*21,l,l);
          rect (x+18*l,y+l*20,l,l);
          fill (197,138,241);
          rect (x+8*l,y+l*21,l,l*5);
          rect (x+9*l,y+l*22,l,l*4);
          rect (x+10*l,y+l*22,l,l*3);
          rect (x+11*l,y+l*22,l,l*2);
          rect (x+17*l,y+l*21,l*3,l);
          rect (x+13*l,y+l*22,l*8,l);
          rect (x+13*l,y+l*23,l*9,l*2);
          rect (x+15*l,y+l*25,l*8,l);
          rect (x+16*l,y+l*26,l*7,l);
          rect (x+17*l,y+l*27,l*6,l);
          rect (x+18*l,y+l*28,l*5,l);
          fill (253,215,1);
          rect (x+9*l,y+l*26,l,l);
          rect (x+10*l,y+l*25,l,l);
          rect (x+11*l,y+l*24,l,l);
          rect (x+12*l,y+l*22,l,l);
          rect (x+13*l,y+l*23,l,l*2);
          rect (x+14*l,y+l*25,l,l);
          rect (x+15*l,y+l*26,l,l);
          rect (x+16*l,y+l*27,l,l);
          rect (x+17*l,y+l*28,l*2,l);
          rect (x+19*l,y+l*29,l*4,l);
          if(seleccionado==1)
          {
              stroke(150,25,30);
              noFill();
              strokeWeight(7);
              rect (100,230,210,240);
              text("P1 King Kato",110,210);
          }
          else if(seleccionado==2)
          {
              stroke(50,25,130);
              noFill();
              strokeWeight(7);
              rect (100,230,210,240);
              text("P2 King Kato",150,210);
          }
          break;
        
        case 2://WEIRDZARD
           fill (44,99,117);
           noStroke();
           rect (x+l*3,y+l*2,l,l);
           rect (x+l*4,y+l*3,l*2,l);
           rect (x+l*5,y+l*4,l*2,l);
           rect (x+l*6,y+l*5,l*2,l);
           rect (x+l*6,y+l*13,l,l*4);
           rect (x+l*6,y+l*18,l,l*4);
           rect (x+l*5,y+l*19,l,l*4);
           rect (x+l*4,y+l*22,l,l);
           rect (x+l*7,y+l*17,l*3,l*5);
           rect (x+l*8,y+l*15,l*2,l*2);
           rect (x+l*9,y+l*13,l,l*2);
           rect (x+l*11,y+l*16,l*2,l*2);
           rect (x+l*12,y+l*18,l,l);
           rect (x+l*6,y+l*6,l*4,l*2);
           rect (x+l*10,y+l*7,l*2,l);
           //azul oscuro
           fill (46,53,90);
           rect (x+l*4,y+l*4,l,l*4);
           rect (x+l*5,y+l*5,l,l*3);
           rect (x+l*3,y+l*6,l,l*2);
           rect (x+l*2,y+l*7,l,l);
           rect (x+l*4,y+l*12,l*2,l*7);
           rect (x+l*4,y+l*19,l,l*3);
           rect (x+3*l,y+13*l,l,l*4);
           rect (x+2*l,y+15*l,l,l*2);
           rect (x+1*l,y+17*l,l*2,l);
           rect (x+3*l,y+22*l,l,l);
           rect (x+6*l,y+22*l,l*3,l);
           rect (x+9*l,y+22*l,l,l);
           rect (x+9*l,y+21*l,l,l);
           rect (x+10*l,y+15*l,l,l*3);
           //barba
           fill(149,141,127);
           rect (x+4*l,y+l*8,l,l*4);
           rect (x+5*l,y+l*8,l,l);
           rect (x+6*l,y+l*10,l*4,l*3);
           rect (x+7*l,y+l*13,l*2,l*2);
           rect (x+7*l,y+l*15,l,l*2);
           rect (x+6*l,y+l*17,l,l);
           //cara
           fill (235,163,93);
           rect (x+5*l,y+l*9,l,l*3);
           rect (x+6*l,y+l*9,l*4,l*2);
           rect (x+6*l,y+l*8,l*4,l);
           rect (x+l,y+l*18,l,l);
           rect (x+l*13,y+l*16,l,l);
           
           fill(0);
           rect (x+6*l,y+l*9,l,l);
           rect (x+9*l,y+l*9,l,l);
           //báculo
           fill(120,113,99);
           rect (x+l*13,y+l*7,l,l*8);
           rect (x+l*13,y+l*18,l,l*5);
           rect (x+l*14,y+l*5,l,l*2);
           rect (x+l*13,y+l*4,l,l);
           fill(79,74,64);
           rect (x+l*13,y+15*l,l,l);
           rect (x+l*13,y+17*l,l,l);
           rect (x+l*13,y+3*l,l,l);
           fill(120,240,150);
           rect (x+l*13,y+l,l*2,l*2);
           if(seleccionado==1)
          {
              stroke(150,25,30);
              noFill();
              strokeWeight(7);
              rect (400,200,210,270);
              text("P1 Weirdzard",410,190);
          }
          else if(seleccionado==2)
          {
              stroke(50,25,130);
              noFill();
              strokeWeight(7);
              rect (400,200,210,270);
              text("P2 Weirdzard",460,190);
          }
           break;
        case 3: //vodu
          noStroke();
          fill (160,182,76);
          rect (x+l*13,y,l,l);
          rect (x+l*14,y+l*2,l,l);
          rect (x+l*13,y+l*4,l,l*4);
          rect (x+l*12,y+l*6,l,l*2);
          rect (x+l*10,y+l*8,l,l*3);
          rect (x+l*11,y+l*7,l,l*1);
          rect (x+l*14,y+l*5,l,l*3);
          rect (x+l*15,y+l*8,l,l*3);
          rect (x+l*11,y+l*11,l,l);
          rect (x+l*14,y+l*11,l,l);
          rect (x+l*11,y+l*9,l,l);
          rect (x+l*13,y+l*9,l,l);
          rect (x+l*12,y+l*10,l,l);
          rect (x+l*12,y+l*12,l*2,l);
          //ojos Vodu
          rect (x+l*4,y+l*8,l,l);
          rect (x+l*7,y+l*8,l,l);
          //ropa rojo claro
          fill (143,42,48);
          rect (x+l*2,y+l*3,l,l);
          rect (x+l*3,y+l*4,l*2,l);
          rect (x+l*3,y+l*5,l*4,l);
          rect (x+l*4,y+l*6,l*4,l);
          rect (x+l*4,y+l*7,l*5,l);
          rect (x+l*8,y+l*7,l,l*4);
          rect (x+l*4,y+l*12,l,l*4);
          rect (x+l*5,y+l*16,l,l);
          rect (x+l*6,y+l*14,l,l*3);
          rect (x+l*7,y+l*12,l,l*5);
          rect (x+l*5,y+l*18,l*2,l*3);
          rect (x+l*7,y+l*18,l,l*2);
          rect (x+l*2,y+l*21,l*2,l);
          rect (x+l*3,y+l*20,l*2,l);
          rect (x+l*3,y+l*18,l,l*2);
          rect (x+l*9,y+l*15,l*2,l*2);
          rect (x+l*10,y+l*17,l,l);
          //oscuro jsjsjs
          fill (66,39,52);
          rect (x+l*2,y+l*4,l,l*13);
          rect (x+l*3,y+l*6,l,l*2);
          rect (x+l*3,y+l*11,l,l*6);
          rect (x+l*2,y+l*18,l,l*3);
          rect (x+l,y+l*21,l,l);
          rect (x+l*4,y+l*21,l*4,l);
          rect (x+l*7,y+l*20,l,l);
          rect (x+l*8,y+l*14,l,l*3);
          //cinturón
          fill (74,61,46);
          rect (x+l*2,y+l*17,l*6,l);
          rect (x+l*4,y+l*16,l,l*4);
          //piel y hebilla de cinturon
          fill (152,100,57);
          rect (x+l*4,y+l*17,l,l);
          rect (x+l*3,y+l*9,l*5,l*2);
          rect (x+l*3,y+l*8,l,l);
          rect (x+l*5,y+l*8,l*2,l);
          rect (x+l*11,y+l*15,l,l);
          //barba
          fill (67,51,38);
          rect (x+l*4,y+l*10,l,l*2);
          rect (x+l*5,y+l*9,l,l*7);
          rect (x+l*6,y+l*9,l,l);
          rect (x+l*6,y+l*11,l,l*3);
          rect (x+l*7,y+l*9,l,l*3);
          if(seleccionado==1)
          {
            
              stroke(150,25,30);
              noFill();
              strokeWeight(7);
              rect (700,200,210,270);
              text("P1 Vodu",710,190);
          }
          else if(seleccionado==2)
          {
              stroke(50,25,130);
              noFill();
              strokeWeight(7);
              rect (700,200,210,270);
              text("P2 Vodu",780,190);
          }
          break;
       case 4:
         noStroke ();
         fill (0);
          rect (x+l*9,y,l*6,l);
          rect (x+l*6,y+l,l*3,l);
          rect (x+l*15,y+l,l,l);
          rect (x+l*16,y+l*2,l,l);
          rect (x+l*17,y+l*3,l,l*2);
          rect (x+l*18,y+l*5,l,l*2);
          rect (x+l*19,y+l*7,l,l*2);
          rect (x+l*5,y+l*2,l,l);
          rect (x+l*4,y+l*3,l,l*2);
          rect (x+l*3,y+l*5,l,l*4);
          rect (x+l*4,y+l*9,l,l*2);
          rect (x+l*5,y+l*11,l,l);
          rect (x+l*6,y+l*12,l,l);
          rect (x+l*7,y+l*13,l*8,l);
          rect (x+l*15,y+l*12,l,l);
          rect (x+l*16,y+l*10,l,l*2);
          rect (x+l*14,y+l*9,l*5,l);
          rect (x+l*12,y+l*8,l*2,l);
          rect (x+l*11,y+l*7,l,l);
          rect (x+l*9,y+l*6,l*2,l);
          rect (x+l*8,y+l*7,l,l*2);
          rect (x+l*7,y+l*9,l,l);
          //contorno cuerpo
          rect (x+l*5,y+l*14,l*3,l);
          rect (x+l*4,y+l*15,l,l);
          rect (x+l*3,y+l*16,l,l);
          rect (x+l*2,y+l*17,l,l*6);
          rect (x+l*3,y+l*23,l*3,l);
          rect (x+l*6,y+l*21,l,l*2);
          rect (x+l*7,y+l*18,l,l*3);
          rect (x+l*15,y+l*14,l,l);
          rect (x+l*16,y+l*15,l,l);
          rect (x+l*17,y+l*16,l,l*7);
          rect (x+l*15,y+l*23,l*2,l);
          rect (x+l*15,y+l*18,l,l*5);
          rect (x+l*10,y+l*15,l,l*10);
          rect (x+l*13,y+l*15,l,l*10);
          rect (x+l*6,y+l*25,l*4,l);
          rect (x+l*5,y+l*24,l,l*2);
          rect (x+l*2,y+l*24,l,l*2);
          rect (x+l*3,y+l*26,l*2,l);
          rect (x+l*14,y+l*25,l*2,l);
          rect (x+l*16,y+l*24,l,l);
          rect (x+l*14,y+l*24,l,l*4);
          rect (x+l*13,y+l*28,l,l*3);
          rect (x+l*13,y+l*31,l,l);
          rect (x+l*12,y+l*31,l,l);
          rect (x+l*11,y+l*27,l,l*5);
          rect (x+l*9,y+l*27,l*2,l);
          rect (x+l*9,y+l*28,l,l*2);
          rect (x+l*8,y+l*30,l,l*2);
          rect (x+l*6,y+l*31,l*2,l);
          rect (x+l*6,y+l*26,l,l*5);
          rect (x+l*2,y+l*26,l,l);
          rect (x+l,y+l*27,l,l);
          rect (x,y+l*28,l,l*3);
          rect (x,y+l*31,l*3,l);
          rect (x+l*3,y+l*30,l,l);
          rect (x+l*4,y+l*29,l,l);
          rect (x+l*5,y+l*28,l,l);
          //ojitos
          rect (x+l*10,y+l*9,l,l*2);
          rect (x+l*13,y+l*9,l,l*2);
          //color cabello
          fill (193,99,79);
          rect (x+l*4,y+l*5,l*4,l*4);
          rect (x+l*5,y+l*9,l*2,l*2);
          rect (x+l*6,y+l*11,l,l);
          rect (x+l*5,y+l*3,l*12,l*2);
          rect (x+l*6,y+l*2,l*10,l);
          rect (x+l*9,y+l,l*6,l);
          rect (x+l*8,y+l*5,l,l*2);
          rect (x+l*9,y+l*5,l*9,l);
          rect (x+l*11,y+l*6,l*7,l);
          rect (x+l*12,y+l*7,l*7,l);
          rect (x+l*14,y+l*8,l*5,l);
          //piel
          fill (230,190,124);
          rect (x+l*8,y+l*8,l*4,l);
          rect (x+l*9,y+l*7,l*2,l);
          rect (x+l*8,y+l*9,l*2,l*4);
          rect (x+l*7,y+l*10,l,l*3);
          rect (x+l*11,y+l*9,l*2,l*2);
          rect (x+l*9,y+l*11,l*5,l*2);
          rect (x+l*14,y+l*10,l*2,l*2);
          rect (x+l*14,y+l*12,l,l);
          rect (x+l*3,y+l*24,l*2,l*2);
          rect (x+l*15,y+l*24,l,l);
          //chamarra poarte oscura
          fill(44,85,78);
          rect (x+l*7,y+l*14,l*8,l);
          rect (x+l*5,y+l*15,l*5,l);
          rect (x+l*4,y+l*16,l*6,l);
          rect (x+l*3,y+l*17,l,l*6);
          rect (x+l*4,y+l*17,l,l);
          rect (x+l*4,y+l*22,l,l);
          rect (x+l*6,y+l*23,l*2,l*2);
          rect (x+l*7,y+l*21,l,l*2);
          rect (x+l*8,y+l*19,l,l*2);
          rect (x+l*16,y+l*22,l,l);
          //chamarra parte clara
          fill (63,148,116);
          rect (x+l*5,y+l*17,l*5,l);
          rect (x+l*4,y+l*18,l*3,l*2);
          rect (x+l*4,y+l*20,l*3,l);
          rect (x+l*4,y+l*21,l*2,l);
          rect (x+l*5,y+l*22,l,l);
          rect (x+l*8,y+l*18,l*2,l);
          rect (x+l*9,y+l*19,l,l*6);
          rect (x+l*8,y+l*21,l,l*4);
          rect (x+l*14,y+l*15,l,l*9);
          rect (x+l*15,y+l*15,l,l*3);
          rect (x+l*16,y+l*16,l,l*6);
          //playera
          fill (36,229,143);
          rect (x+l*11,y+l*15,l*2,l*9);
          //pantalón
          fill(86,99,177);
          rect (x+l*11,y+l*24,l*2,l);
          rect (x+l*10,y+l*25,l*4,l);
          rect (x+l*7,y+l*26,l*7,l);
          rect (x+l*7,y+l*27,l*2,l*3);
          rect (x+l*12,y+l*27,l*2,l);
          rect (x+l*12,y+l*28,l,l*2);
          //zapatitos
          fill (82,69,87);
          rect (x+l*7,y+l*30,l,l);
          rect (x+l*12,y+l*30,l,l);
          //espada
          fill(125,133,140);
          rect (x+l*2,y+l*27,l,l);
          rect (x+l*5,y+l*26,l,l);
          rect (x+l,y+l*28,l,l);
          fill(170,170,170);
          rect (x+l,y+l*29,l*2,l*2);
          rect (x+l*2,y+l*28,l*2,l);
          rect (x+l*3,y+l*29,l,l);
          rect (x+l*2,y+l*27,l*3,l);
          
          if(seleccionado==1)
          {
            
              stroke(150,25,30);
              noFill();
              strokeWeight(7);
              rect (1000,200,210,270);
              text("P1 Hei",1010,190);
          }
          else if(seleccionado==2)
          {
              stroke(50,25,130);
              noFill();
              strokeWeight(7);
              rect (1000,200,210,270);
              text("P2 Hei",1130,190);
          }
          break;
       case 5:
          noStroke ();
          fill (0);
          rect (x+l*9,y,l*6,l);
          rect (x+l*6,y+l,l*3,l);
          rect (x+l*15,y+l,l,l);
          rect (x+l*16,y+l*2,l,l);
          rect (x+l*17,y+l*3,l,l*2);
          rect (x+l*18,y+l*5,l,l*2);
          rect (x+l*19,y+l*7,l,l*2);
          rect (x+l*5,y+l*2,l,l);
          rect (x+l*4,y+l*3,l,l*2);
          rect (x+l*3,y+l*5,l,l*4);
          rect (x+l*4,y+l*9,l,l*2);
          rect (x+l*5,y+l*11,l,l);
          rect (x+l*6,y+l*12,l,l);
          rect (x+l*7,y+l*13,l*8,l);
          rect (x+l*15,y+l*12,l,l);
          rect (x+l*16,y+l*10,l,l*2);
          rect (x+l*14,y+l*9,l*5,l);
          rect (x+l*12,y+l*8,l*2,l);
          rect (x+l*11,y+l*7,l,l);
          rect (x+l*9,y+l*6,l*2,l);
          rect (x+l*8,y+l*7,l,l*2);
          rect (x+l*7,y+l*9,l,l);
          //contorno cuerpo
          rect (x+l*5,y+l*14,l*3,l);
          rect (x+l*4,y+l*15,l,l);
          rect (x+l*3,y+l*16,l,l);
          rect (x+l*2,y+l*17,l,l*6);
          rect (x+l*3,y+l*23,l*3,l);
          rect (x+l*6,y+l*21,l,l*2);
          rect (x+l*7,y+l*18,l,l*3);
          rect (x+l*15,y+l*14,l,l);
          rect (x+l*16,y+l*15,l,l);
          rect (x+l*17,y+l*16,l,l*7);
          rect (x+l*15,y+l*23,l*2,l);
          rect (x+l*15,y+l*18,l,l*5);
          rect (x+l*10,y+l*15,l,l*10);
          rect (x+l*13,y+l*15,l,l*10);
          rect (x+l*6,y+l*25,l*4,l);
          rect (x+l*5,y+l*24,l,l*2);
          rect (x+l*2,y+l*24,l,l*2);
          rect (x+l*3,y+l*26,l*2,l);
          rect (x+l*14,y+l*25,l*2,l);
          rect (x+l*16,y+l*24,l,l);
          rect (x+l*14,y+l*24,l,l*4);
          rect (x+l*13,y+l*28,l,l*3);
          rect (x+l*13,y+l*31,l,l);
          rect (x+l*12,y+l*31,l,l);
          rect (x+l*11,y+l*27,l,l*5);
          rect (x+l*9,y+l*27,l*2,l);
          rect (x+l*9,y+l*28,l,l*2);
          rect (x+l*8,y+l*30,l,l*2);
          rect (x+l*6,y+l*31,l*2,l);
          rect (x+l*6,y+l*26,l,l*5);
          rect (x+l*2,y+l*26,l,l);
          rect (x+l,y+l*27,l,l);
          rect (x,y+l*28,l,l*3);
          rect (x,y+l*31,l*3,l);
          rect (x+l*3,y+l*30,l,l);
          rect (x+l*4,y+l*29,l,l);
          rect (x+l*5,y+l*28,l,l);
          //ojitos
          rect (x+l*10,y+l*9,l,l*2);
          rect (x+l*13,y+l*9,l,l*2);
          //color cabello
          fill (255,246,60);
          rect (x+l*4,y+l*5,l*4,l*4);
          rect (x+l*5,y+l*9,l*2,l*2);
          rect (x+l*6,y+l*11,l,l);
          rect (x+l*5,y+l*3,l*12,l*2);
          rect (x+l*6,y+l*2,l*10,l);
          rect (x+l*9,y+l,l*6,l);
          rect (x+l*8,y+l*5,l,l*2);
          rect (x+l*9,y+l*5,l*9,l);
          rect (x+l*11,y+l*6,l*7,l);
          rect (x+l*12,y+l*7,l*7,l);
          rect (x+l*14,y+l*8,l*5,l);
          //piel
          fill (230,190,124);
          rect (x+l*8,y+l*8,l*4,l);
          rect (x+l*9,y+l*7,l*2,l);
          rect (x+l*8,y+l*9,l*2,l*4);
          rect (x+l*7,y+l*10,l,l*3);
          rect (x+l*11,y+l*9,l*2,l*2);
          rect (x+l*9,y+l*11,l*5,l*2);
          rect (x+l*14,y+l*10,l*2,l*2);
          rect (x+l*14,y+l*12,l,l);
          rect (x+l*3,y+l*24,l*2,l*2);
          rect (x+l*15,y+l*24,l,l);
          //chamarra poarte oscura
          fill(108,0,10);
          rect (x+l*7,y+l*14,l*8,l);
          rect (x+l*5,y+l*15,l*5,l);
          rect (x+l*4,y+l*16,l*6,l);
          rect (x+l*3,y+l*17,l,l*6);
          rect (x+l*4,y+l*17,l,l);
          rect (x+l*4,y+l*22,l,l);
          rect (x+l*6,y+l*23,l*2,l*2);
          rect (x+l*7,y+l*21,l,l*2);
          rect (x+l*8,y+l*19,l,l*2);
          rect (x+l*16,y+l*22,l,l);
          //chamarra parte clara
          fill (191,0,62);
          rect (x+l*5,y+l*17,l*5,l);
          rect (x+l*4,y+l*18,l*3,l*2);
          rect (x+l*4,y+l*20,l*3,l);
          rect (x+l*4,y+l*21,l*2,l);
          rect (x+l*5,y+l*22,l,l);
          rect (x+l*8,y+l*18,l*2,l);
          rect (x+l*9,y+l*19,l,l*6);
          rect (x+l*8,y+l*21,l,l*4);
          rect (x+l*14,y+l*15,l,l*9);
          rect (x+l*15,y+l*15,l,l*3);
          rect (x+l*16,y+l*16,l,l*6);
          //playera
          fill (248,184,223);
          rect (x+l*11,y+l*15,l*2,l*9);
          //pantalón
          fill(102,233,164);
          rect (x+l*11,y+l*24,l*2,l);
          rect (x+l*10,y+l*25,l*4,l);
          rect (x+l*7,y+l*26,l*7,l);
          rect (x+l*7,y+l*27,l*2,l*3);
          rect (x+l*12,y+l*27,l*2,l);
          rect (x+l*12,y+l*28,l,l*2);
          //zapatitos
          fill (82,69,87);
          rect (x+l*7,y+l*30,l,l);
          rect (x+l*12,y+l*30,l,l);
          //espada
          fill(125,133,140);
          rect (x+l*2,y+l*27,l,l);
          rect (x+l*5,y+l*26,l,l);
          rect (x+l,y+l*28,l,l);
          fill(170,170,170);
          rect (x+l,y+l*29,l*2,l*2);
          rect (x+l*2,y+l*28,l*2,l);
          rect (x+l*3,y+l*29,l,l);
          rect (x+l*2,y+l*27,l*3,l);
          
               if(seleccionado==1)
          {
            
              stroke(150,25,30);
              noFill();
              strokeWeight(7);
              rect (1300,200,210,270);
              text("P1 Leon",1310,190);
          }
          else if(seleccionado==2)
          {
              stroke(50,25,130);
              noFill();
              strokeWeight(7);
              rect (1300,200,210,270);
              text("P2 Leon",140,190);
          }
     
          break;
    }
  }
  void displayLifeBar()
  {
    fill(#32e369);
    rect(x,y-80,vida,30);
  }
  void displayCombatMenu()
  {
    switch(identificador)//asignar color al menu de combate de cada personaje
    {
      case 1:
          fill(#8700e7);
          break;
      case 2:
          fill(#238a56);
          break;
      case 3:
          fill(#720000);
          break;
      case 4:
          fill(#72afdf);
          break;
      case 5:
          fill(#d1a800);
          break;
    }
    rect(500,680, 600, 200);
    ataque1btn.Display();
    ataque2btn.Display();
  }
  int seleccionAtaque(float mx, float my)
  {
    if(ataque1btn.isClicked(mx,my)==true)
    {
      
      return 1;
    }
    else if(ataque2btn.isClicked(mx,my)==true)
    {
      
      return 2;
    }
    return 0;
  }
  float hacerAtaque(int numAtaque)
  {
    switch(identificador)
    {
      case 1: //ataques de kingkato
            switch(numAtaque)
            {
              case 1://scratch
                  return ataque/2;
              case 2://king power
                  return ataque;
            }
            break;
            
      case 2: //ataques de weirdzard
            switch(numAtaque)
            {
              case 1://magic ball
                  return ataque/2;
              case 2://white magic
                  return ataque;
            }
            break;
           
      case 3: //ataques de vodu
             switch(numAtaque)
            {
              case 1://scratch
                  return ataque/2;
              case 2://king power
                  return ataque;
            }
            break;
            
      case 4: //ataques de hei
            switch(numAtaque)
            {
              case 1://scratch
                  return ataque/2;
              case 2://king power
                  return ataque;
            }
            break;
           
      case 5: //ataques de leo
            switch(numAtaque)
            {
              case 1://scratch
                  return ataque/2;
              case 2://king power
                  return ataque;
            }
            break;
            
    }
    return 0;
  }
}
