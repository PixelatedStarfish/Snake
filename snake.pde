//Snake! by Andrew Vella
//Written in Java in Processing3

// 0 - empty
// 1 - snake
// 2 - food


int tileConst = 20;
int divisor = 25;

ArrayList<Integer> snake = new ArrayList<Integer>(); 
int appleLocation = int(random(471) + 3); //474

boolean dead = false;

int[] tileMap = {0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
                 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
                 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
                 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
                 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
                 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
                 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
                 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
                 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
                 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
                 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
                 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
                 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
                 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
                 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
                 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
                 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
                 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
                 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
                 };




void initSnake() {
  snake.add(3);
  snake.add(2);
  snake.add(1);
  snake.add(0);
}


//90 is right
int direction = 90;
void setup() {
  size(500,380);
  frameRate(5);
  background(0);
  initSnake();
 
  }

int[] genTiles() {
  
 for (int i = 0; i < tileMap.length; i++) {
   tileMap[i] = 0;
 }

  tileMap[appleLocation] = 2;

  for (int i = 0; i < snake.size(); i++) {
    tileMap[snake.get(i)] = 1; }
     
  return tileMap;
}

void drawTiles(int[] tiles) {
  ellipseMode(CORNER);

  int i = -1;
  while (i < tiles.length - 1) {
    i += 1;
    if (tiles[i] == 1) {
      fill(color(0,255,0));
      ellipse(tileConst * (i % divisor), (i / divisor) * tileConst, tileConst, tileConst);

    }
    
    if (tiles[i] == 2) {
      fill(color(255,255,0));
      ellipse(tileConst * (i % divisor), (i / divisor) * tileConst, tileConst, tileConst);
    }
    
    if (tiles[i] == 0) {
      fill(color(0,0,0));
      rect(tileConst * (i % divisor), (i / divisor) * tileConst, tileConst, tileConst);

    }
  
      
}}

void appleEaten() {
  
  if (snake.get(0) == appleLocation) {
    appleLocation = int(random(0, 474));
    
    if (direction == 90) {
    snake.add(snake.get(snake.size() -1) + 1);
   }
    if (direction == -90) {
      snake.add(snake.get(snake.size() -1) - 1);
   }
    if (direction == 0) {
      snake.add(snake.get(snake.size() -1) - divisor);
   }
    if (direction == 180) {
      snake.add(snake.get(snake.size() -1) + divisor);
   }}
    
  
  }
  

void moveSnake() {
    
    for (int i = snake.size()-1; i > 0 ; i--) {
      snake.set(i, snake.get(i-1));
    }
    
    
  if (direction == 90) {
    snake.set(0, snake.get(0) + 1);
   }
  if (direction == -90) {
    snake.set(0, snake.get(0) - 1);
   }
  if (direction == 0) {
    snake.set(0, snake.get(0) - divisor);
   }
  if (direction == 180) {
    snake.set(0, snake.get(0) + divisor);
   }}
   


boolean Orobourus() {
  boolean death = false;
  
  
  int infront = 0;
  int i = 0;
  
  
  if (direction == 90) {
    infront = snake.get(0) + 1;
   }
  if (direction == -90) {
    infront = snake.get(0) - 1;
   }
  if (direction == 0) {
    infront = snake.get(0) - divisor;
   }
  if (direction == 180) {
    infront = snake.get(0) + divisor;
   }
   

   

  try {
      i = tileMap[infront]; }
  
  catch (ArrayIndexOutOfBoundsException a) {
    
    if (direction == 0) {
      infront = snake.get(0) - divisor;
   }
    if (direction == 180) {
      infront = snake.get(0) + divisor;
   }}

   if (i == 1) {
     death = true;
 }

  return death; 
}
  
boolean edgePoke() { //Only concerned with left and right edges, the upper and lower throw an exception
  return (direction == 90 && snake.get(0) % divisor  == 0 && snake.get(1) % divisor  != 0 ) || (direction == -90 && snake.get(1) % divisor  == 0 && snake.get(0) % divisor  != 0);
  }


void update() {
  moveSnake();
  appleEaten();
  if (Orobourus() || edgePoke()) {
    dead = true;

  };
}

void keyPressed() {
    if ((key == 'w' || key == 'W') && (direction != 180)) {
      direction = 0;
    }
    if ((key == 's' || key == 'S') && (direction != 0)) {
      direction = 180;
    }
    if ((key == 'd' || key == 'D') && (direction != -90)) {
      direction = 90;
    }
    if ((key == 'a' || key == 'A')  && (direction != 90)) {
      direction = -90;
    }}
    
void draw() {
    
  if (dead) {
    delay(2000);
    exit();
  }

  update();
  
   try {
      drawTiles(genTiles());  }
   catch (ArrayIndexOutOfBoundsException a) {
      dead = true;
         }}
