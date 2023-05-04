


/*
Author: Dario Au
 Date: November 26, 2018
 Project: Final Project Structured Programming 2
 In this project I made a simple game where you move around with WASD and interact with objects by pressing E
 */






//this is text, you can read text, you may pass









//Accurate Numbers
float charX = 600;
float charY = 360;
float mapX = 0;
float mapY = 0;
//Big Numbers
int floor = 1;
int room = -2;
int playerPicX = -1000;
int npcPicX = 2200;
int npcX = 479;
int npcY = 631;
int botX = 0;
int botY = 0;
int botX2 = 0;
int botY2 = 0;
int name = 0;
int wordCount = 0;
int introBack = 0;
int colour = 0;
int leaveTitle = -1200;
//True/False Stuff
boolean getKey = false; //used for getting keys
boolean openDoor = false;//used for opening doors
boolean autoDoor = false;//used for opening doors
boolean playerTalk = false;//the player is talking, be patient
boolean checkObject = false; // if the player is analyzing an object this has a 50/50 chance of being used
boolean gotKey = false; // used if player has a key but alsp used for other stuff not key related
boolean showMap = false; // shows a minimap at the end of every room
boolean randomMumble = false;// the player is going crazy, likes talking for no reason
boolean movingNextRoom = false;//moves to the next room, what else would it do?
boolean leaveTitleStart = false;//leaves the title screen
boolean gameOver = false;//game over you lost git gud
boolean controls = false;// instructions are for the weak
//bot controls
boolean left = false;  
boolean right = false;   
boolean up = true;   
boolean down = false;   
boolean left2 = false;  
boolean right2 = false;   
boolean up2 = true;   
boolean down2 = false;  
//Images
PImage keyCard;
PImage player;
PImage text;
PImage silhouette;
PImage npc;
PImage map;
PImage titlescreen;
PImage titlescreen2;
PImage titlescreen3;
PImage titlescreen4;
PImage titlescreen5;
PImage control;
PFont font;
PFont font2;
PFont title;
//BossFight
int charge = 0;
float bossSpeed = 1;
int shield = 200;
float bossX = -200;
float bossY = 360;
boolean bossAttack = false;
boolean shoot = true;
boolean switch1 = false;
boolean switch2 = false;
boolean switch3 = false;
boolean switch4 = false;














void setup() {
  //Load Everything
  keyCard = loadImage("ObjectKeycard.png");
  player = loadImage("PurpleBurpleProto.png");
  text = loadImage("TextBox.png");
  silhouette = loadImage("ScientistFace1.png");
  npc = loadImage("Scientist.png");
  map = loadImage("Map1.png");
  titlescreen = loadImage("TitleScreenPB.png");
  titlescreen2 = loadImage("TitleScreenPB2.png");
  titlescreen3 = loadImage("TitleScreenPB3.png");
  titlescreen4 = loadImage("TitleScreenPB4.png");
  titlescreen5 = loadImage("TitleScreenPB5.png");
  font = loadFont("font.vlw");
  font2 = loadFont("default.vlw");
  title = loadFont("AlienEncounters-48.vlw");
  control = loadImage("Controls.png");
  size(1200, 720);
  smooth();
  background(255);
  keyCard.resize(0, 20);
  map.resize(0, 500);
  //constrain(colour, 0, 255);
  noStroke();
}

void draw() {
  /* 
   //Room Maker Code
   
   //so I use this to make rooms
   //I got lazy ;D
   
   
   //Lets make a room
   if (room< [NEXT ROOM] && room> [PREVIOUS ROOM]){
   if (keyPressed) {
   if (key == 'w' || key == 'W') {
   background(255);
   noStroke();
   fill(#7705A5);
   ellipse(charX, charY, width/40, height/24);
   
   charY = charY - height/360;
   }
   if (key == 'a' || key == 'A') {
   background(255);
   noStroke();
   fill(#7705A5);
   ellipse(charX, charY, width/40, height/24);
   
   charX = charX - width/600;
   }
   if (key == 's' || key == 'S') {
   background(255);
   noStroke();
   fill(#7705A5);
   ellipse(charX, charY, width/40, height/24);
   
   charY = charY + height/360;
   }
   if (key == 'd' || key == 'D') {
   background(255);
   noStroke();
   fill(#7705A5);
   ellipse(charX, charY, width/40, height/24);
   
   charX = charX + width/600;
   }
   
   if (!(keyPressed)) {
   charX = charX + 0;
   charY = charY + 0;
   }
   }
   //Blocks
   fill(0);
   //Borders
   rect(0, 0, width, height*1/14);
   rect(0, height-height*1/14, width, height*1/14);
   }
   //end of room
   //
   //
   //
   //Collision For Map Blocks Equation For Lazy Me ;-;
   while ((charX > [rectangle X] -width/40/2 && charX < [rectangle X] + [rectangle width] +width/40/2 && charY > [rectangle Y]-height/24/2 && charY < [rectangle Y]+ [rectangle height] +height/24/2) ||
   (charX > [rectangle X] -width/40/2 && charX < [rectangle X] + [rectangle width] +width/40/2 && charY > [rectangle Y]-height/24/2 && charY < [rectangle Y]+ [rectangle height] +height/24/2)||
   (charX > [rectangle X] -width/40/2 && charX < [rectangle X] + [rectangle width] +width/40/2 && charY > [rectangle Y]-height/24/2 && charY < [rectangle Y]+ [rectangle height] +height/24/2)||
   (charX > [rectangle X] -width/40/2 && charX < [rectangle X] + [rectangle width] +width/40/2 && charY > [rectangle Y]-height/24/2 && charY < [rectangle Y]+ [rectangle height] +height/24/2)
   
   ){
   
   if (key == 'w' || key == 'W') {
   //Put Stuff Here Like
   //Background
   //Character
   //Blocks
   //Etc
   charY = charY + height/360;
   }
   if (key == 'a' || key == 'A') {
   //Put Stuff Here Like
   //Background
   //Character
   //Blocks
   //Etc
   charX = charX + width/600;
   }
   if (key == 's' || key == 'S') {
   //Put Stuff Here Like
   //Background
   //Character
   //Blocks
   //Etc
   charY = charY - height/360;
   }
   if (key == 'd' || key == 'D') {
   //Put Stuff Here Like
   //Background
   //Character
   //Blocks
   //Etc
   charX = charX - width/600;
   }
   }
   
   
   */














  //so this is the title screen, i think it went well
  if ((room<-1 && room>-3) && (!(controls))) {
    //animated background
    wordCount = wordCount + 1;
    constrain(wordCount, 0, 50);
    if (wordCount>24) {
      wordCount = 0;
    }
    if (wordCount>0 && wordCount<5) {
      titlescreen.resize(0, 746);
      image(titlescreen, 0, 0);
    }
    if (wordCount>4 && wordCount<10) {
      titlescreen2.resize(0, 746);
      image(titlescreen2, 0, 0);
    }
    if (wordCount>9 && wordCount<15) {
      titlescreen3.resize(0, 746);
      image(titlescreen3, 0, 0);
    }
    if (wordCount>14 && wordCount<20) {
      titlescreen4.resize(0, 746);
      image(titlescreen4, 0, 0);
    }
    if (wordCount>19 && wordCount<25) {
      titlescreen5.resize(0, 746);
      image(titlescreen5, 0, 0);
    }

    textFont(title);
    textSize(100);
    fill(0);
    text("IN", 0, height/6);
    text("THE", 0, height/3.5);
    text("DARKNESS", 0, height/2.5);
    stroke(0);
    strokeWeight(5);
    fill(100);
    rect(width/2-width/12, height/1.5, width/6, height/7.2);
    rect(526, 626, 150, 50);
    textFont(font2);
    textSize(60);
    fill(0);
    text("Play", width/2-width/19, height/1.3);
    textSize(34);
    text("Controls", 532, 666);
    //click play to play duh
    if ((mouseX > width/2-width/12  && mouseX < width/2-width/12 + width/6 && mouseY > height/1.5 && mouseY < height/1.5+ height/7.2)&&(!(controls))) {
      noStroke();
      fill(200);
      rect(width/2-width/12, height/1.5, width/6, height/7.2);
      textSize(70);
      fill(0);
      text("Play", width/2-width/17, height/1.3);

      if (mousePressed) {
        if (mouseButton == LEFT) {
          leaveTitleStart = true;
        }
      }
    }
    if ((mouseX > 526  && mouseX < 526 + 150 && mouseY > 626 && mouseY < 626+ 50)&&(!(controls))) {
      noStroke();
      fill(200);
      rect(526, 626, 150, 50);
      fill(0);
      textSize(36);
      text("Controls", 528, 664);

      if (mousePressed) {
        if (mouseButton == LEFT) {
          leaveTitle = -1200;
          controls = true;
        }
      }
    }
    //lets go to the next room 
    if (leaveTitleStart) {
      fill(0);
      rect(leaveTitle, 0, width, height);
      leaveTitle = leaveTitle + 50;
      if (leaveTitle>-1) {
        room = room + 1;
        wordCount = wordCount + 0;
        wordCount = 0;
      }
    }
  }




  if (controls) {
    fill(0);
    rect(leaveTitle, 0, width, height);
    leaveTitle = leaveTitle + 20;
    if (leaveTitle>-1) {
      leaveTitle = 0;
      leaveTitle = leaveTitle + 0;
      control.resize(0, 746);
      //yea i ain't coding this to draw an intructions manual for you, i'll just use a premade image for this
      image(control, 0, 0);
      textSize(20);
      text("Press E to leave", width/120, height/40);
      //press e to leave 
      if (keyPressed) {
        if (key== 'e' || key == 'E') {
          controls = false;
          leaveTitle = -1200;
        }
      }
    }
  }


























  //introduction, i like it, lots of talking, some hints to backstory i think, who knows?
  if (room<0 && room > -2) {
    println("lets us begin");
    background(0);
    textFont(font2);
    textAlign(CENTER, CENTER);
    wordCount = wordCount + 1;
    constrain(wordCount, 0, 3000);
    constrain(colour, -255, 255);
    if (wordCount>100 && wordCount<1250) {
      textSize(20);
      fill(colour, colour, 0);
      colour = colour + 1;
      text("Hold E to Speed Up", width/2, height/50);
    }

    //press e to skip if you doing a speed run
    if (keyPressed) {
      if (key== 'e' || key == 'E') {
        wordCount = wordCount + 50;
      }
    }


    if (wordCount>50 && wordCount<150) {
      textSize(100);
      fill(255);
      text("Hello?", width/2, height/2);
    }
    if (wordCount>250 && wordCount<350) {
      textSize(100);
      fill(255);
      text("Nice to meet you...", width/2, height/2);
    }
    // I am Dr.[Insert Random Numbers Here]
    if (wordCount>450 && wordCount<550) {
      name = int(random(10000, 99999));
      textSize(100);
      fill(255);
      text("I am Dr."+ name, width/2, height/2);
    }
    if (wordCount>650 && wordCount<750) {
      textSize(50);
      fill(255);
      text("I'll be running some tests today with you", width/2, height/2);
    }
    if (wordCount>850 && wordCount<950) {
      textSize(100);
      fill(255);
      text("C-Calm down please...", width/2, height/2);
    }
    if (wordCount>1050 && wordCount<1150) {
      textSize(100);
      fill(255);
      text("It will be alright...", width/2, height/2);
    }
    if (wordCount>1250 && wordCount<2550) {
      background(0);
    }
    //this is the part where you get blinded by a white background XD
    if (wordCount>1550 && wordCount<2550) {
      background(255);
      //silhouette.resize(0, 730);
      //image(silhouette, 0, 0);
    }
    if (wordCount>1650 && wordCount<1750) {
      textSize(100);
      fill(0);
      text("There we go...", width/2, height/2);
    }
    if (wordCount>1850 && wordCount<1950) {
      textSize(100);
      fill(0);
      text("Can you see me?", width/2, height/2);
    }

    if (wordCount>2050 && wordCount<2150) {
      textSize(200);
      fill(0);
      text("...", width/2, height/2);
    }

    if (wordCount>2250 && wordCount<2350) {
      textSize(40);
      fill(0);
      text("It appears I need to go somewhere...", width/2, height/2);
    }
    if (wordCount>2450 && wordCount<2550) {
      textSize(50);
      fill(0);
      text("I'll be right back, so please wait here...", width/2, height/2);
    }
    if (wordCount>2850) {
      background(0);
      textFont(font);
      textSize(30);
      fill(#7705A5);
      text("I don't think he is coming back...", width/2, height/2);
    }

    if (wordCount>3000) {
      room = room +1;
      showMap = true;
      wordCount = 0;
      wordCount = wordCount + 0;
      background(0);
      randomMumble = true;
      textFont(font2);
    }
  }



  //show minimap
  if (room<1 && room> -1 && showMap) {
    wordCount = wordCount + 1;
    mapX = 531;
    mapY = 224;
    background(0);
    image(map, 200, 100);
    noStroke();
    fill(#7705A5);
    ellipse(mapX, mapY, width/80, height/48);
    if (wordCount>150) {
      showMap = false;
      randomMumble = false;
      wordCount = 0;
      wordCount = wordCount + 0;
    }
  }


  //Start THE GAME !!!!
  //or at least the first room
  //room 0 i think :P

  if (room<1 && room> -1 && (!(showMap))) {
    background(255);



    //draw a keycard
    if (!(getKey)) {
      keyCard.resize(0, 20);
      image(keyCard, width/2+width/20, height/2+ height/20);
    }
    noStroke();
    fill(#7705A5);
    ellipse(charX, charY, width/40, height/24);
    //Draw objects
    //Movement
    if (keyPressed) {
      if (key == 'w' || key == 'W') {
        background(255);
        if (!(getKey)) {
          keyCard.resize(0, 20);
          image(keyCard, width/2+width/20, height/2+ height/20);
        }
        noStroke();
        fill(#7705A5);
        ellipse(charX, charY, width/40, height/24);

        charY = charY - height/360;
      }
      if (key == 'a' || key == 'A') {
        background(255);
        if (!(getKey)) {
          keyCard.resize(0, 20);
          image(keyCard, width/2+width/20, height/2+ height/20);
        }
        noStroke();
        fill(#7705A5);
        ellipse(charX, charY, width/40, height/24);

        charX = charX - width/600;
      }
      if (key == 's' || key == 'S') {
        background(255);
        if (!(getKey)) {
          keyCard.resize(0, 20);
          image(keyCard, width/2+width/20, height/2+ height/20);
        }
        noStroke();
        fill(#7705A5);
        ellipse(charX, charY, width/40, height/24);

        charY = charY + height/360;
      }
      if (key == 'd' || key == 'D') {
        background(255);
        if (!(getKey)) {
          keyCard.resize(0, 20);
          image(keyCard, width/2+width/20, height/2+ height/20);
        }

        noStroke();
        fill(#7705A5);
        ellipse(charX, charY, width/40, height/24);

        charX = charX + width/600;
      }

      if (!(keyPressed)) {
        charX = charX + 0;
        charY = charY + 0;
      }
    }
    //Blocks
    fill(0);
    //Borders
    rect(0, 0, width, height/3);
    rect(0, height-height*1/3, width, height/3);
    rect(0, height/4, width/2-width/10, height);  
    rect(width/2+width/6, height/1.8, width/2-width/14, height);  
    rect(width/2+width/6, height*1/4, width/2-width/14, height/5);  

    //rect(width/2+width/20, height/2+ height/20, width/40, height/24);

    //KeyCard Grab
    if (charX > width/2+width/20 -width/40/2 && charX < width/2+width/20 + width/40 +width/40/2 && charY > height/2+ height/20-height/24/2 && charY <height/2+ height/20+ height/24 +height/24/2 && (!(gotKey))) {
      textSize(20);
      fill(255, 255, 0);
      text("Press E to Interact", width/2, height/50);
      if (keyPressed) {
        if (key == 'e' || key == 'E') {
          getKey = true;
          playerTalk = true;
        }
      }
    }
    //openDoor
    if (charX > width/1.5) {
      if (getKey) {
        if (keyPressed) {
          if ((key == 'e' || key == 'E')) {
            openDoor = true;
          }
        }
      }
      if (charX > width/2+width/5-width/40/2) {
        if (!(openDoor)) {
          background(255);

          if (!(getKey)) {
            keyCard.resize(0, 20);
            image(keyCard, width/2+width/20, height/2+ height/20);
          }
          noStroke();
          fill(#7705A5);
          ellipse(charX, charY, width/40, height/24);
          fill(0);
          rect(0, 0, width, height/3);
          rect(0, height-height*1/3, width, height/3);
          rect(0, height/4, width/2-width/10, height);  
          rect(width/2+width/6, height/1.8, width/2-width/14, height);  
          rect(width/2+width/6, height*1/4, width/2-width/14, height/5); 
          charX = charX - width/600;
        }
      }
    }


    // I TIRED MAKING A DOOR AND IT MURDERED ME
    //checkDoor
    if (charX > width/1.5) {
      if (!(openDoor)) {
        textSize(20);
        fill(255, 255, 0);
        text("Press E to Interact", width/2, height/50);
      }
      if (keyPressed) {
        if ((key == 'e' || key == 'E')) {
          if (!(getKey)) {

            checkObject = true;
          }
        }
      }
    }

    //check the door
    if (checkObject) {
      playerTalk = true;
      text.resize(0, 300);
      image(text, 0, height/1.5);
      player.resize(0, 700);
      image(player, playerPicX, height/8+ height/20);

      if (playerPicX < width/15) {
        playerPicX = playerPicX + 50;
      }

      if (playerPicX >= width/15 && playerTalk) {
        textSize(30);
        fill(0);
        textAlign(CENTER, CENTER);
        wordCount = wordCount + 1;

        if (wordCount>7) {
          text("I", width/2.95, height/1.3);
        }
        if (wordCount>14) {
          text("need", width/2.62, height/1.3);
        }
        if (wordCount>21) {
          text("a", width/2.33, height/1.3);
        }
        if (wordCount>28) {
          text("keycard", width/2.03, height/1.3);
        }
        if (wordCount>35) {
          text("to", width/1.78, height/1.3);
        }
        if (wordCount>42) {
          text("open", width/1.63, height/1.3);
        }
        if (wordCount>49) {
          text("this", width/1.48, height/1.3);
        }
        if (wordCount>56) {
          text("door?", width/1.35, height/1.3);
        }
        if (wordCount>150) {
          //Blocks
          fill(0);
          //Borders
          rect(0, 0, width, height/3);
          rect(0, height-height*1/3, width, height/3);
          rect(0, height/4, width/2-width/10, height);  
          rect(width/2+width/6, height/1.8, width/2-width/14, height);  
          rect(width/2+width/6, height*1/4, width/2-width/14, height/5);  
          playerTalk = false;
          checkObject = false;
          playerPicX = playerPicX +0;
          playerPicX = -1000;
          wordCount = wordCount +0;
          wordCount = 0;
        }
        /*
          playerPicX = playerPicX +0;
         playerPicX = -1000;
         wordCount = wordCount +0;
         wordCount = 0;
         
         charX = charX - width/600;
         */

        /*
        text.resize(0, 300);
         image(text, 0, height/1.5);
         player.resize(0, 700);
         image(player, playerPicX, height/8+ height/20);
         
         if (playerPicX < width/15) {
         playerPicX = playerPicX + 50;
         }
         
         if (playerPicX >= width/15) {
         textSize(30);
         fill(0);
         textAlign(CENTER, CENTER);
         wordCount = wordCount + 1;
         
         if (wordCount>7) {
         text("I", width/2.95, height/1.3);
         }
         if (wordCount>14) {
         text("think", width/2.62, height/1.3);
         }
         if (wordCount>21) {
         text("this", width/2.26, height/1.3);
         }
         if (wordCount>28) {
         text("is", width/2.08, height/1.3);
         }
         if (wordCount>35) {
         text("a", width/1.98, height/1.3);
         }
         if (wordCount>42) {
         text("keycard?", width/1.75, height/1.3);
         }
         if (wordCount>150) {
         //Blocks
         fill(0);
         //Borders
         rect(0, 0, width, height/3);
         rect(0, height-height*1/3, width, height/3);
         rect(0, height/4, width/2-width/10, height);  
         rect(width/2+width/6, height/1.8, width/2-width/14, height);  
         rect(width/2+width/6, height*1/4, width/2-width/14, height/5);  
         playerTalk = false;
         playerPicX = playerPicX +0;
         playerPicX = -1000;
         wordCount = wordCount +0;
         wordCount = 0;
         gotKey = true;
         }
         }
         */
      }
    }






    //Stop the player from moving during talk
    if (playerTalk) {
      if (keyPressed) {
        if (key == 'w' || key == 'W') {

          charY = charY + height/360;
        }
        if (key == 'a' || key == 'A') {

          charX = charX + width/600;
        }
        if (key == 's' || key == 'S') {

          charY = charY - height/360;
        }
        if (key == 'd' || key == 'D') {

          charX = charX - width/600;
        }
      }
    }



    //closeDoor
    if (!(openDoor)) {
      fill(0);
      rect(width/2+width/5, height/2-height/14, width/2-width/14, height/5);
    }






    //Collisions
    //This checks if you are in a wall, if a you are then move away from the wall till you are out of the wall
    //in layman terms, it stops you
    while 
      ((charX > 0 -width/40/2 && charX < 0 + width +width/40/2 && charY > 0-height/24/2 && charY < 0+ height/3 +height/24/2) || 
      (charX > 0 -width/40/2 && charX < 0 + width +width/40/2 && charY > height-height*1/3-height/24/2 && charY < height-height*1/3+ height/3 +height/24/2) ||
      (charX > 0 -width/40/2 && charX < 0 + width/2-width/10 +width/40/2 && charY > height/4-height/24/2 && charY < height/4+ height +height/24/2) ||
      (charX > width/2+width/6 -width/40/2 && charX < width/2+width/6 + width/2-width/14 +width/40/2 && charY > height/1.8-height/24/2 && charY < height/1.8+ height +height/24/2) ||
      (charX > width/2+width/6 -width/40/2 && charX < width/2+width/6 + width/2-width/14 +width/40/2 && charY > height*1/4-height/24/2 && charY < height*1/4+ height/5 +height/24/2) 

      ) {
      if (key == 'w' || key == 'W') {
        background(255);
        if (!(getKey)) {
          keyCard.resize(0, 20);
          image(keyCard, width/2+width/20, height/2+ height/20);
        }
        noStroke();
        fill(#7705A5);
        ellipse(charX, charY, width/40, height/24);
        fill(0);
        rect(0, 0, width, height/3);
        rect(0, height-height*1/3, width, height/3);
        rect(0, height/4, width/2-width/10, height);  
        rect(width/2+width/6, height/1.8, width/2-width/14, height);  
        rect(width/2+width/6, height*1/4, width/2-width/14, height/5); 
        if (!(openDoor)) {
          rect(width/2+width/5, height/2-height/14, width/2-width/14, height/5);
        }
        charY = charY + height/360;
      }
      if (key == 'a' || key == 'A') {
        background(255);
        if (!(getKey)) {
          keyCard.resize(0, 20);
          image(keyCard, width/2+width/20, height/2+ height/20);
        }
        noStroke();
        fill(#7705A5);
        ellipse(charX, charY, width/40, height/24);
        fill(0);
        rect(0, 0, width, height/3);
        rect(0, height-height*1/3, width, height/3);
        rect(0, height/4, width/2-width/10, height);  
        rect(width/2+width/6, height/1.8, width/2-width/14, height);  
        rect(width/2+width/6, height*1/4, width/2-width/14, height/5); 
        if (!(openDoor)) {
          rect(width/2+width/5, height/2-height/14, width/2-width/14, height/5);
        }
        charX = charX + width/600;
      }
      if (key == 's' || key == 'S') {
        background(255);
        if (!(getKey)) {
          keyCard.resize(0, 20);
          image(keyCard, width/2+width/20, height/2+ height/20);
        }
        noStroke();
        fill(#7705A5);
        ellipse(charX, charY, width/40, height/24);
        fill(0);
        rect(0, 0, width, height/3);
        rect(0, height-height*1/3, width, height/3);
        rect(0, height/4, width/2-width/10, height);  
        rect(width/2+width/6, height/1.8, width/2-width/14, height);  
        rect(width/2+width/6, height*1/4, width/2-width/14, height/5); 
        if (!(openDoor)) {
          rect(width/2+width/5, height/2-height/14, width/2-width/14, height/5);
        }
        charY = charY - height/360;
      }
      if (key == 'd' || key == 'D') {
        background(255);
        if (!(getKey)) {
          keyCard.resize(0, 20);
          image(keyCard, width/2+width/20, height/2+ height/20);
        }
        noStroke();
        fill(#7705A5);
        ellipse(charX, charY, width/40, height/24);
        fill(0);
        rect(0, 0, width, height/3);
        rect(0, height-height*1/3, width, height/3);
        rect(0, height/4, width/2-width/10, height);  
        rect(width/2+width/6, height/1.8, width/2-width/14, height);  
        rect(width/2+width/6, height*1/4, width/2-width/14, height/5); 
        if (!(openDoor)) {
          rect(width/2+width/5, height/2-height/14, width/2-width/14, height/5);
        }
        charX = charX - width/600;
      }
    }
    //SightLimits Well WHAT DID YOU EXPECT FROM A BLIND CHILD
    /*
    if (charX>width/1.4) {
     fill(0);
     rect(480, 240, 320, 84);  
     rect(480, 400, 320, 80);
     }
     
     */
    /* //This was very weird I didn't like this
     if ((charY<height/2.3 && charX>width/1.8) || (charY>height/1.8&& charX>width/1.8)) {
     fill(0);
     rect(width/2+width/6, 0, width, height);
     }
     */
    //GetKeycard
    if (playerTalk) {
      if (getKey) {


        text.resize(0, 300);
        image(text, 0, height/1.5);
        player.resize(0, 700);
        image(player, playerPicX, height/8+ height/20);

        if (playerPicX < width/15) {
          playerPicX = playerPicX + 50;
        }

        if (playerPicX >= width/15) {
          textSize(30);
          fill(0);
          textAlign(CENTER, CENTER);
          wordCount = wordCount + 1;

          if (wordCount>7) {
            text("I", width/2.95, height/1.3);
          }
          if (wordCount>14) {
            text("think", width/2.62, height/1.3);
          }
          if (wordCount>21) {
            text("this", width/2.26, height/1.3);
          }
          if (wordCount>28) {
            text("is", width/2.08, height/1.3);
          }
          if (wordCount>35) {
            text("a", width/1.98, height/1.3);
          }
          if (wordCount>42) {
            text("keycard?", width/1.74, height/1.3);
          }
          if (wordCount>150) {

            //Blocks
            fill(0);
            //Borders
            rect(0, 0, width, height/3);
            rect(0, height-height*1/3, width, height/3);
            rect(0, height/4, width/2-width/10, height);  
            rect(width/2+width/6, height/1.8, width/2-width/14, height);  
            rect(width/2+width/6, height*1/4, width/2-width/14, height/5);  
            playerTalk = false;
            playerPicX = playerPicX +0;
            playerPicX = -1000;
            wordCount = wordCount +0;
            wordCount = 0;
            gotKey = true;
          }
        }
      }
    }
    //Shadows, if the area is blocked of the player can't see
    if (charX>width/1.4) {
      fill(colour);
      colour = 0;
      rect(480, 240, 320, 84);  
      rect(480, 400, 320, 80);
    } else {
      colour = 255;
    }
    //Talk at the start
    /*
if (randomMumble) {
     playerTalk = true;
     if (playerTalk) {
     text.resize(0, 300);
     image(text, 0, height/1.5);
     player.resize(0, 700);
     image(player, playerPicX, height/8+ height/20);
     
     if (playerPicX < width/15) {
     playerPicX = playerPicX + 50;
     }
     
     if (playerPicX >= width/15) {
     textSize(30);
     fill(0);
     textAlign(CENTER, CENTER);
     wordCount = wordCount + 1;
     
     if (wordCount>7) {
     text("I", width/2.95, height/1.3);
     }
     if (wordCount>14) {
     text("don't", width/2.62, height/1.3);
     }
     if (wordCount>21) {
     text("think", width/2.26, height/1.3);
     }
     if (wordCount>28) {
     text("he", width/2.08, height/1.3);
     }
     if (wordCount>35) {
     text("is", width/1.98, height/1.3);
     }
     if (wordCount>42) {
     text("coming", width/1.75, height/1.3);
     }
     if (wordCount>42) {
     text("back...", width/1.45, height/1.3);
     }
     if (wordCount>150) {
     //Blocks
     fill(0);
     //Borders
     rect(0, 0, width, height/3);
     rect(0, height-height*1/3, width, height/3);
     rect(0, height/4, width/2-width/10, height);  
     rect(width/2+width/6, height/1.8, width/2-width/14, height);  
     rect(width/2+width/6, height*1/4, width/2-width/14, height/5);  
     playerTalk = false;
     playerPicX = playerPicX +0;
     playerPicX = -1000;
     wordCount = wordCount +0;
     wordCount = 0;
     randomMumble = false;
     }
     }
     }
     
     }
     */

    //Leave Room
    if (charX>width) {
      room = 0;
      charX = width/50;
      charY = height/6.26;
      getKey = false;
      openDoor = false;
      playerTalk = false;
      checkObject = false;
      gotKey = true;
      room = room + 1;
      movingNextRoom = true;
      mapX = 592;
      mapY = 224;
      botY = 631;
      botX = -100;
    }
  }




  /* 
   
   
   rrrrrrrrr           rrr
   rrrrrrrrrr        rr rr
   rr      rrr      rr  rr
   rr      rr           rr
   rr    rrr            rr
   rrrrrrr              rr
   rrrrrrr              rr
   rr    rr             rr
   rr     rr            rr
   rr      rr           rr
   rr       rr     rrrrrrrrrrr
   
   room one will start here
   so ya
   this is to sort out stuff to i guess?
   
   I MAKE GIANT SPACE
   
   ROOM 1 START
   
   also if you wanna spawn here
   make gotkey = ture
   cuz i am lazy
   i don't wanna make new variable
   :P
   
   
   SORRY ABOUT THE RANDOM COMMENTS OF CODE
   THOSE WHERE JUST PREVIOUS CODE I TYPED
   THAT DIDN'T WORK, SO I JUST TURNED THEM
   INTO COMMENTS -\_('3')_/-
   
   
   
   LETS DO THIS
   ROOM ONE TIME
   ALSO
   YA
   
   */

  //check if room1
  if (room>0 && room<2) {  

    //show minimap
    if (movingNextRoom) {
      wordCount = wordCount + 1;

      background(0);
      image(map, 200, 100);
      noStroke();
      fill(#7705A5);
      ellipse(mapX, mapY, width/80, height/48);

      mapX = mapX + 0.5;
      if (mapX > 662) {
        mapX = mapX + 0;
        mapX = 662;
      }

      if (wordCount>150) {
        movingNextRoom = false;
        randomMumble = false;
        wordCount = 0;
        wordCount = wordCount + 0;
      }
    }
    //shadows THIS IS SO HARD AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA 
    if ((!(movingNextRoom))) {
      background(0);
      fill(255);
      if (charY<180) {
        fill(255);
        rect(0, 0, width, 180);
      }
      if (charX>514 && charX<684) {
        fill(255);
        rect(515, 0, 170, height);
        //uh oh i tink he ded
        if (!(gotKey)) {
          fill(200);
          ellipse(npcX, npcY, width/40, height/24);
        }
      }
      if (charY>280 && charX>399) {
        fill(255);
        rect(400, 282, width, 580);
        //uh oh i tink he ded
        if (!(gotKey)) {
          fill(200);
          ellipse(npcX, npcY, width/40, height/24);
        }
      }
      if (charY<343 && charY>280) {
        fill(255);
        rect(20, 282, width, 61);
      }
      if (charY<514 && charY>443) {
        fill(255);
        rect(0, 443, width, 71);
      }
      if (charY>614) {
        fill(255);
        rect(0, 614, width, 71);
        if (!(gotKey)) {
          fill(200);
          ellipse(npcX, npcY, width/40, height/24);
        }
      }
      if (charX>199 && charX<288 && charY>280) {
        fill(255);
        rect(199, 280, 102, 580);
      }
      if (charX<100 && charX>20&& charY>280) {
        fill(255);
        rect(20, 280, 80, 580);
      }

      //player
      noStroke();
      fill(#7705A5);
      ellipse(charX, charY, width/40, height/24);


      //Movement
      if (keyPressed) {
        if (key == 'w' || key == 'W') {
          background(0);
          fill(255);
          if (charY<180) {
            fill(255);
            rect(0, 0, width, 180);
          }
          if (charX>514 && charX<684) {
            fill(255);
            rect(515, 0, 170, height);
            //uh oh i tink he ded
            if (!(gotKey)) {
              fill(200);
              ellipse(npcX, npcY, width/40, height/24);
            }
          }
          if (charY>280 && charX>399) {
            fill(255);
            rect(400, 282, width, 580);
            //uh oh i tink he ded
            if (!(gotKey)) {
              fill(200);
              ellipse(npcX, npcY, width/40, height/24);
            }
          }
          if (charY<343 && charY>280) {
            fill(255);
            rect(20, 282, width, 61);
          }
          if (charY<514 && charY>443) {
            fill(255);
            rect(0, 443, width, 71);
          }
          if (charY>614) {
            fill(255);
            rect(0, 614, width, 71);
            if (!(gotKey)) {
              fill(200);
              ellipse(npcX, npcY, width/40, height/24);
            }
          }
          if (charX>199 && charX<288 && charY>280) {
            fill(255);
            rect(199, 280, 102, 580);
          }
          if (charX<100 && charX>20&& charY>280) {
            fill(255);
            rect(20, 280, 80, 580);
          }
          noStroke();
          fill(#7705A5);
          ellipse(charX, charY, width/40, height/24);

          charY = charY - height/360;
        }
        if (key == 'a' || key == 'A') {
          background(0);
          fill(255);
          if (charY<180) {
            fill(255);
            rect(0, 0, width, 180);
          }
          if (charX>514 && charX<684) {
            fill(255);
            rect(515, 0, 170, height);
            //uh oh i tink he ded
            if (!(gotKey)) {
              fill(200);
              ellipse(npcX, npcY, width/40, height/24);
            }
          }
          if (charY>280 && charX>399) {
            fill(255);
            rect(400, 282, width, 580);
            //uh oh i tink he ded
            if (!(gotKey)) {
              fill(200);
              ellipse(npcX, npcY, width/40, height/24);
            }
          }
          if (charY<343 && charY>280) {
            fill(255);
            rect(20, 282, width, 61);
          }
          if (charY<514 && charY>443) {
            fill(255);
            rect(0, 443, width, 71);
          }
          if (charY>614) {
            fill(255);
            rect(0, 614, width, 71);
            if (!(gotKey)) {
              fill(200);
              ellipse(npcX, npcY, width/40, height/24);
            }
          }
          if (charX>199 && charX<288 && charY>280) {
            fill(255);
            rect(199, 280, 102, 580);
          }
          if (charX<100 && charX>20&& charY>280) {
            fill(255);
            rect(20, 280, 80, 580);
          }
          noStroke();
          fill(#7705A5);
          ellipse(charX, charY, width/40, height/24);

          charX = charX - width/600;
        }
        if (key == 's' || key == 'S') {
          background(0);
          fill(255);
          if (charY<180) {
            fill(255);
            rect(0, 0, width, 180);
          }
          if (charX>514 && charX<684) {
            fill(255);
            rect(515, 0, 170, height);
            //uh oh i tink he ded
            if (!(gotKey)) {
              fill(200);
              ellipse(npcX, npcY, width/40, height/24);
            }
          }
          if (charY>280 && charX>399) {
            fill(255);
            rect(400, 282, width, 580);
            //uh oh i tink he ded
            if (!(gotKey)) {
              fill(200);
              ellipse(npcX, npcY, width/40, height/24);
            }
          }
          if (charY<343 && charY>280) {
            fill(255);
            rect(20, 282, width, 61);
          }
          if (charY<514 && charY>443) {
            fill(255);
            rect(0, 443, width, 71);
          }
          if (charY>614) {
            fill(255);
            rect(0, 614, width, 71);
            if (!(gotKey)) {
              fill(200);
              ellipse(npcX, npcY, width/40, height/24);
            }
          }
          if (charX>199 && charX<288 && charY>280) {
            fill(255);
            rect(199, 280, 102, 580);
          }
          if (charX<100 && charX>20&& charY>280) {
            fill(255);
            rect(20, 280, 80, 580);
          }
          noStroke();
          fill(#7705A5);
          ellipse(charX, charY, width/40, height/24);

          charY = charY + height/360;
        }
        if (key == 'd' || key == 'D') {
          background(0);
          fill(255);
          if (charY<180) {
            fill(255);
            rect(0, 0, width, 180);
          }
          if (charX>514 && charX<684) {
            fill(255);
            rect(515, 0, 170, height);
            //uh oh i tink he ded
            if (!(gotKey)) {
              fill(200);
              ellipse(npcX, npcY, width/40, height/24);
            }
          }
          if (charY>280 && charX>399) {
            fill(255);
            rect(400, 282, width, 580);
            //uh oh i tink he ded
            if (!(gotKey)) {
              fill(200);
              ellipse(npcX, npcY, width/40, height/24);
            }
          }
          if (charY<343 && charY>280) {
            fill(255);
            rect(20, 282, width, 61);
          }
          if (charY<514 && charY>443) {
            fill(255);
            rect(0, 443, width, 71);
          }
          if (charY>614) {
            fill(255);
            rect(0, 614, width, 71);
            if (!(gotKey)) {
              fill(200);
              ellipse(npcX, npcY, width/40, height/24);
            }
          }
          if (charX>199 && charX<288 && charY>280) {
            fill(255);
            rect(199, 280, 102, 580);
          }
          if (charX<100 && charX>20&& charY>280) {
            fill(255);
            rect(20, 280, 80, 580);
          }
          noStroke();
          fill(#7705A5);
          ellipse(charX, charY, width/40, height/24);

          charX = charX + width/600;
        }

        if (!(keyPressed)) {
          charX = charX + 0;
          charY = charY + 0;
        }
      }
      //Blocks
      fill(0);
      //Borders
      rect(0, 0, width, height*1/14);
      rect(0, height-height*1/14, width, height*1/14);
      //Rect 1
      rect(0, height/4, width/2-width/14, height*1/7);
      //Rect 2
      rect(width/2+width/14, height/4, width/2-width/14, height);  
      //Rect3
      rect(width/12, height/2.1, width/12, height/7.2);
      //Rect4
      rect(width/12, height/1.4, width/12, height/7.2);

      //Rect3
      rect(width/4, height/2.1, width/12, height/7.2);
      //Rect4
      rect(width/4, height/1.4, width/12, height/7.2);

      //Rect3
      rect(width/4, height/2.1, width/12, height/7.2);
      //Rect4
      rect(0, height/4, width/60, height/1.66);
      //stop player from moving
      if (playerTalk) {
        if (keyPressed) {
          if (key == 'w' || key == 'W') {

            charY = charY + height/360;
          }
          if (key == 'a' || key == 'A') {

            charX = charX + width/600;
          }
          if (key == 's' || key == 'S') {

            charY = charY - height/360;
          }
          if (key == 'd' || key == 'D') {

            charX = charX - width/600;
          }
        }
      }

      //CutScene Time
      /*
      if (gotKey) {
       if (charX>width/2.27) {
       println("Start cutscene");
       playerTalk = true;
       text.resize(0, 300);
       image(text, 0, height/1.5);
       npc.resize(0, 700);
       image(npc, npcPicX, height/8+ height/20);
       
       if (npcPicX > width/1.4) {
       npcPicX = npcPicX - 50;
       }
       if (npcPicX <= width/1.4) {
       fill(50);
       ellipse(npcX, npcY, width/40, height/24);
       if (npcX > 600) {
       npcX = 600;
       npcX = npcX + 0;
       if (wordCount>300) {
       fill(100);
       ellipse(npcX, npcY, width/40, height/24);
       }
       }
       npcX = npcX + 1;
       }
       }
       if (npcPicX <= width/1.4) {
       textSize(30);
       fill(0);
       textAlign(CENTER, CENTER);
       wordCount = wordCount + 1;
       
       if (wordCount>30) {
       text("Is", width/20, height/1.3);
       }
       if (wordCount>60) {
       text("anyone", width/9, height/1.3);
       }
       if (wordCount>90) {
       text("there?", width/5, height/1.3);
       }
       if (wordCount>500) {
       //Blocks
       fill(0);
       //Borders
       playerTalk = false;
       npcPicX = npcPicX +0;
       npcPicX = 2200;
       wordCount = wordCount +0;
       wordCount = 0;
       gotKey = false;
       }
       }
       }
       */


      //Locked Door No Touch
      if (charX > width-width/14) {   
        textSize(20);
        fill(255, 255, 0);
        text("Press E to Interact", width/2, height/50);    
        if (keyPressed) {
          if ((key == 'e' || key == 'E')) {
            checkObject = true;
          }
        }
      }





      //Collisions
      while 
        ((charX > 0 -width/40/2 && charX < 0 + width/2-width/14 +width/40/2 && charY > height/4-height/24/2 && charY < height/4+ height*1/7 +height/24/2) || 
        (charX > width/2+width/14 -width/40/2 && charX < width/2+width/14 + width/2-width/14 +width/40/2 && charY > height/4-height/24/2 && charY < height/4+ height*1/7 +height)||
        ((charX<0+width/40/2 || (charX>width-width/40/2)) && charY<height/3)||
        (charX > width/12 -width/40/2 && charX < width/12 +  width/12 +width/40/2 && charY > height/2.1-height/24/2 && charY < height/2.1+ height/7.2 +height/24/2) ||
        (charX > width/12 -width/40/2 && charX < width/12 + width/12 +width/40/2 && charY > height/1.4-height/24/2 && charY < height/1.4+ height/7.2  +height/24/2)|| 
        (charX > width/4 -width/40/2 && charX < width/4 + width/12+width/40/2 && charY > height/2.1-height/24/2 && charY < height/2.1+ height/7.2 +height/24/2)||
        (charX > width/4 -width/40/2 && charX < width/4 + width/12 +width/40/2 && charY > height/1.4-height/24/2 && charY < height/1.4+ height/7.2  +height/24/2)|| 
        (charX > width/4 -width/40/2 && charX < width/4 + width/12 +width/40/2 && charY > height/2.1-height/24/2 && charY < height/2.1+ height/7.2 +height/24/2) ||
        (charX > 0 -width/40/2 && charX < 0 + width/60 +width/40/2 && charY > height/4-height/24/2 && charY < height/4+ height/1.7+height/24/2) ||
        (charX > 0 -width/40/2 && charX < 0 +  width +width/40/2 && charY > 0-height/24/2 && charY < 0+ height*1/14 +height/24/2) ||
        (charX > 0 -width/40/2 && charX < 0 + width +width/40/2 && charY > height-height*1/14-height/24/2 && charY < height-height*1/14+ height*1/14 +height/24/2)

        ) {
        if (key == 'w' || key == 'W') {
          background(0);
          fill(255);
          if (charY<180) {
            fill(255);
            rect(0, 0, width, 180);
          }
          if (charX>514 && charX<684) {
            fill(255);
            rect(515, 0, 170, height);
            //uh oh i tink he ded
            if (!(gotKey)) {
              fill(200);
              ellipse(npcX, npcY, width/40, height/24);
            }
          }
          if (charY>280 && charX>399) {
            fill(255);
            rect(400, 282, width, 580);
            //uh oh i tink he ded
            if (!(gotKey)) {
              fill(200);
              ellipse(npcX, npcY, width/40, height/24);
            }
          }
          if (charY<343 && charY>280) {
            fill(255);
            rect(20, 282, width, 61);
          }
          if (charY<514 && charY>443) {
            fill(255);
            rect(0, 443, width, 71);
          }
          if (charY>614) {
            fill(255);
            rect(0, 614, width, 71);
            if (!(gotKey)) {
              fill(200);
              ellipse(npcX, npcY, width/40, height/24);
            }
          }
          if (charX>199 && charX<288 && charY>280) {
            fill(255);
            rect(199, 280, 102, 580);
          }
          if (charX<100 && charX>20&& charY>280) {
            fill(255);
            rect(20, 280, 80, 580);
          }
          noStroke();
          fill(#7705A5);
          ellipse(charX, charY, width/40, height/24);
          fill(0);
          rect(0, 0, width, height*1/14);
          rect(0, height-height*1/14, width, height*1/14);
          rect(0, height/4, width/2-width/14, height*1/7);
          rect(width/2+width/14, height/4, width/2-width/14, height);  
          rect(width/12, height/2.1, width/12, height/7.2);
          rect(width/12, height/1.4, width/12, height/7.2);
          rect(width/4, height/2.1, width/12, height/7.2);
          rect(width/4, height/1.4, width/12, height/7.2);
          rect(width/4, height/2.1, width/12, height/7.2);
          rect(0, height/4, width/60, height/1.7);
          charY = charY + height/360;
        }
        if (key == 'a' || key == 'A') {
          background(0);
          fill(255);
          if (charY<180) {
            fill(255);
            rect(0, 0, width, 180);
          }
          if (charX>514 && charX<684) {
            fill(255);
            rect(515, 0, 170, height);
            //uh oh i tink he ded
            if (!(gotKey)) {
              fill(200);
              ellipse(npcX, npcY, width/40, height/24);
            }
          }
          if (charY>280 && charX>399) {
            fill(255);
            rect(400, 282, width, 580);
            //uh oh i tink he ded
            if (!(gotKey)) {
              fill(200);
              ellipse(npcX, npcY, width/40, height/24);
            }
          }
          if (charY<343 && charY>280) {
            fill(255);
            rect(20, 282, width, 61);
          }
          if (charY<514 && charY>443) {
            fill(255);
            rect(0, 443, width, 71);
          }
          if (charY>614) {
            fill(255);
            rect(0, 614, width, 71);
            if (!(gotKey)) {
              fill(200);
              ellipse(npcX, npcY, width/40, height/24);
            }
          }
          if (charX>199 && charX<288 && charY>280) {
            fill(255);
            rect(199, 280, 102, 580);
          }
          if (charX<100 && charX>20&& charY>280) {
            fill(255);
            rect(20, 280, 80, 580);
          }
          noStroke();
          fill(#7705A5);
          ellipse(charX, charY, width/40, height/24);
          fill(0);
          rect(0, 0, width, height*1/14);
          rect(0, height-height*1/14, width, height*1/14);
          rect(0, height/4, width/2-width/14, height*1/7);
          rect(width/2+width/14, height/4, width/2-width/14, height);  
          rect(width/12, height/2.1, width/12, height/7.2);
          rect(width/12, height/1.4, width/12, height/7.2);
          rect(width/4, height/2.1, width/12, height/7.2);
          rect(width/4, height/1.4, width/12, height/7.2);
          rect(width/4, height/2.1, width/12, height/7.2);
          rect(0, height/4, width/60, height/1.7);
          charX = charX + width/600;
        }
        if (key == 's' || key == 'S') {
          background(0);
          fill(255);
          if (charY<180) {
            fill(255);
            rect(0, 0, width, 180);
          }
          if (charX>514 && charX<684) {
            fill(255);
            rect(515, 0, 170, height);
            //uh oh i tink he ded
            if (!(gotKey)) {
              fill(200);
              ellipse(npcX, npcY, width/40, height/24);
            }
          }
          if (charY>280 && charX>399) {
            fill(255);
            rect(400, 282, width, 580);
            //uh oh i tink he ded
            if (!(gotKey)) {
              fill(200);
              ellipse(npcX, npcY, width/40, height/24);
            }
          }
          if (charY<343 && charY>280) {
            fill(255);
            rect(20, 282, width, 61);
          }
          if (charY<514 && charY>443) {
            fill(255);
            rect(0, 443, width, 71);
          }
          if (charY>614) {
            fill(255);
            rect(0, 614, width, 71);
            if (!(gotKey)) {
              fill(200);
              ellipse(npcX, npcY, width/40, height/24);
            }
          }
          if (charX>199 && charX<288 && charY>280) {
            fill(255);
            rect(199, 280, 102, 580);
          }
          if (charX<100 && charX>20&& charY>280) {
            fill(255);
            rect(20, 280, 80, 580);
          }
          noStroke();
          fill(#7705A5);
          ellipse(charX, charY, width/40, height/24);
          fill(0);
          rect(0, 0, width, height*1/14);
          rect(0, height-height*1/14, width, height*1/14);
          rect(0, height/4, width/2-width/14, height*1/7);
          rect(width/2+width/14, height/4, width/2-width/14, height);  
          rect(width/12, height/2.1, width/12, height/7.2);
          rect(width/12, height/1.4, width/12, height/7.2);
          rect(width/4, height/2.1, width/12, height/7.2);
          rect(width/4, height/1.4, width/12, height/7.2);
          rect(width/4, height/2.1, width/12, height/7.2);
          rect(0, height/4, width/60, height/1.7);
          charY = charY - height/360;
        }
        if (key == 'd' || key == 'D') {
          background(0);
          fill(255);
          if (charY<180) {
            fill(255);
            rect(0, 0, width, 180);
          }
          if (charX>514 && charX<684) {
            fill(255);
            rect(515, 0, 170, height);
            //uh oh i tink he ded
            if (!(gotKey)) {
              fill(200);
              ellipse(npcX, npcY, width/40, height/24);
            }
          }
          if (charY>280 && charX>399) {
            fill(255);
            rect(400, 282, width, 580);
            //uh oh i tink he ded
            if (!(gotKey)) {
              fill(200);
              ellipse(npcX, npcY, width/40, height/24);
            }
          }
          if (charY<343 && charY>280) {
            fill(255);
            rect(20, 282, width, 61);
          }
          if (charY<514 && charY>443) {
            fill(255);
            rect(0, 443, width, 71);
          }
          if (charY>614) {
            fill(255);
            rect(0, 614, width, 71);
            if (!(gotKey)) {
              fill(200);
              ellipse(npcX, npcY, width/40, height/24);
            }
          }
          if (charX>199 && charX<288 && charY>280) {
            fill(255);
            rect(199, 280, 102, 580);
          }
          if (charX<100 && charX>20&& charY>280) {
            fill(255);
            rect(20, 280, 80, 580);
          }
          noStroke();
          fill(#7705A5);
          ellipse(charX, charY, width/40, height/24);
          fill(0);
          rect(0, 0, width, height*1/14);
          rect(0, height-height*1/14, width, height*1/14);
          rect(0, height/4, width/2-width/14, height*1/7);
          rect(width/2+width/14, height/4, width/2-width/14, height);  
          rect(width/12, height/2.1, width/12, height/7.2);
          rect(width/12, height/1.4, width/12, height/7.2);
          rect(width/4, height/2.1, width/12, height/7.2);
          rect(width/4, height/1.4, width/12, height/7.2);
          rect(width/4, height/2.1, width/12, height/7.2);
          rect(0, height/4, width/60, height/1.7);    
          charX = charX - width/600;
        }
      }
    }



    //so the npcs talk
    if (gotKey) {
      if (charX>width/2.27) {
        println("Start cutscene");
        playerTalk = true;



        if (npcPicX <= width/1.5 && wordCount<700) {
          fill(0);
          rect(npcX-15, npcY, 30, 400);
          fill(50);
          ellipse(npcX, npcY, width/40, height/24);
          if (npcX > 600) {
            npcX = 600;
            npcX = npcX + 0;
          }
          npcX = npcX + 1;
        }

        if (wordCount>380 && wordCount < 700) {
          fill(255, 0, 0);
          rect(botX, botY, width/40, height/24);
          if (botX<230) {
            botX = botX +2;
          }
        }

        if (wordCount>1299) {
          fill(200);
          ellipse(npcX, npcY, width/40, height/24);
        }



        if (wordCount>700 && wordCount < 1300) {
          background(255, 0, 0);
        }


        if (wordCount<700 || wordCount > 900 ) {
          text.resize(0, 300);
          image(text, 0, height/1.5);
        }




        //player talks now
        if (wordCount>900) {
          player.resize(0, 700);
          image(player, playerPicX, height/8+ height/20);

          if (playerPicX < width/15) {
            playerPicX = playerPicX + 50;
          }

          if (playerPicX >= width/15 && wordCount < 1300) {
            textSize(30);
            fill(0);
            textAlign(CENTER, CENTER);

            if (wordCount>1000) {
              text("So", width/2+ random(-0.3, 0.3), height/1.3+ random(-0.3, 0.3));
            }
            if (wordCount>1030) {
              text("loud...", width/1.77+ random(-0.3, 0.3), height/1.3+ random(-0.3, 0.3));
            }
          }
        }
        if (wordCount > 1300) {

          fill(0);
          if (wordCount>1400) {
            text("I", width/3, height/1.3);
          }
          if (wordCount>1410) {
            text("should", width/2.55, height/1.3);
          }
          if (wordCount>1420) {
            text("avoid", width/2.1, height/1.3);
          }
          if (wordCount>1430) {
            text("getting", width/1.79, height/1.3);
          }
          if (wordCount>1440) {
            text("seen", width/1.57, height/1.3);
          }
          if (wordCount>1450) {
            text("by", width/1.45, height/1.3);
          }
          if (wordCount>1460) {
            text("that", width/1.36, height/1.3);
          }
          if (wordCount>1470) {
            text("thing", width/1.25, height/1.3);
          }
        }




        if (wordCount < 700) {
          npc.resize(0, 700);
          image(npc, npcPicX, height/8+ height/20);
        }
        if (npcPicX > width/1.5) {
          npcPicX = npcPicX - 50;
        }



        if (npcPicX <= width/1.4) {
          textSize(30);
          fill(0);
          textAlign(CENTER, CENTER);
          wordCount = wordCount + 1;

          if (wordCount>30 && wordCount<200) {
            text("Hello?", width/20, height/1.3);
          }
          if (wordCount>80&& wordCount<200) {
            text("Anyone", width/6.3, height/1.3);
          }
          if (wordCount>100&& wordCount<200) {
            text("there?", width/4, height/1.3);
          }


          if (wordCount>260 && wordCount < 700) {
            text("W-WHAT", width/15 + random(-0.3, 0.3), height/1.3+ random(-0.3, 0.3));
          }
          if (wordCount>290 && wordCount < 700) {
            text("IS", width/7+ random(-0.3, 0.3), height/1.3+ random(-0.3, 0.3));
          }
          if (wordCount>320 && wordCount < 700) {
            text("T-THAT", width/4.7+ random(-0.3, 0.3), height/1.3+ random(-0.3, 0.3));
          }

          if (wordCount>350 && wordCount < 700) {
            text("DOING", width/3.2+ random(-0.3, 0.3), height/1.3+ random(-0.3, 0.3));
          }
          if (wordCount>380 && wordCount < 700 ) {
            text("HERE?!?", width/2.41+ random(-0.3, 0.3), height/1.3+ random(-0.3, 0.3));
          }





          if (wordCount>1500) {
            //Blocks
            fill(0);
            //Borders
            playerTalk = false;
            npcPicX = npcPicX +0;
            npcPicX = 2200;
            wordCount = wordCount +0;
            wordCount = 0;
            gotKey = false;
            up = true;
          }
        }
      }
    }
    //bot movement
    if (!(gotKey)) {
      fill(255, 0, 0);
      rect(botX, botY, width/40, height/24); 
      if (up) {
        botY = botY -2;
        if (botY<291) {
          println("left");
          up = false;
          left = true;
        }
      }
      if (left) {
        botX = botX -2;
        if (botX<44) {
          println("down");
          left = false;
          down = true;
        }
      }
      if (down) {
        botY = botY +2;
        if (botY>631) {
          println("right");
          down = false;
          right = true;
        }
      }
      if (right) {
        botX = botX +2;
        if (botX>231) {
          println("up");
          right = false;
          up = true;
        }
      }
      //bot kills you
      if (botY>614 && charY >614) {
        wordCount = wordCount +1;
        if (wordCount>0) {
          left = false;
          right = false;
          up = false;
          down = false;
          playerTalk = true;
        }
        if (wordCount>100) {
          background(255, 0, 0);
        }


        if (wordCount>200) {
          charX = width/50;
          charY = height/6.26;
          botY = 631;
          botX = -100;
          wordCount = 0;
          playerTalk = false;
          up = true;
        }
      }
      if ((botY<514 && botY>442)&&(charY<514 && charY>443)) {
        wordCount = wordCount +1;
        if (wordCount>0) {
          left = false;
          right = false;
          up = false;
          down = false;
          playerTalk = true;
        }
        if (wordCount>100) {
          background(255, 0, 0);
        }

        if (wordCount>200) {
          charX = width/50;
          charY = height/6.26;
          botY = 631;
          botX = -100;
          wordCount = 0;
          playerTalk = false;
          up = true;
        }
      }
      if ((botY<343 && botY>281)&&(charY<343 && charY>280)) {
        wordCount = wordCount +1;
        if (wordCount>0) {
          left = false;
          right = false;
          up = false;
          down = false;
          playerTalk = true;
        }
        if (wordCount>100) {
          background(255, 0, 0);
        }

        if (wordCount>200) {
          charX = width/50;
          charY = height/6.26;
          botY = 631;
          botX = -100;
          wordCount = 0;
          playerTalk = false;
          up = true;
        }
      }


      if ((botX<99 && botX>20)&&((charX<100 && charX>20)&& charY>280)) {
        wordCount = wordCount +1;
        if (wordCount>0) {
          left = false;
          right = false;
          up = false;
          down = false;
          playerTalk = true;
        }
        if (wordCount>100) {
          background(255, 0, 0);
        }

        if (wordCount>200) {
          charX = width/50;
          charY = height/6.26;
          botY = 631;
          botX = -100;
          wordCount = 0;
          playerTalk = false;
          up = true;
        }
      }
      if ((botX<299 && botX>199)&&((charX<288 && charX>199)&& charY>280)) {
        wordCount = wordCount +1;
        if (wordCount>0) {
          left = false;
          right = false;
          up = false;
          down = false;
          playerTalk = true;
        }
        if (wordCount>100) {
          background(255, 0, 0);
        }

        if (wordCount>200) {
          charX = width/50;
          charY = height/6.26;
          botY = 631;
          botX = -100;
          wordCount = 0;
          playerTalk = false;
          up = true;
        }
      }
    }
    //check door witout hey
    if (checkObject) {
      playerTalk = true;
      text.resize(0, 300);
      image(text, 0, height/1.5);
      player.resize(0, 700);
      image(player, playerPicX, height/8+ height/20);

      if (playerPicX < width/15) {
        playerPicX = playerPicX + 50;
      }

      if (playerPicX >= width/15 && playerTalk) {
        textSize(30);
        fill(0);
        textAlign(CENTER, CENTER);
        wordCount = wordCount + 1;

        if (wordCount>30) {
          text("Doesn't", width/2, height/1.3);
        }
        if (wordCount>60) {
          text("open...", width/1.68, height/1.3);
        }
        if (wordCount>80) {
          //Blocks
          fill(0);
          //Borders
          /*
          ADD
           STUUF
           LIKE
           BLOCKS
           AND
           THE
           MAP
           HERE
           PLEASE
           
           -past me
           */
          playerTalk = false;
          checkObject = false;
          playerPicX = playerPicX +0;
          playerPicX = -1000;
          wordCount = wordCount +0;
          wordCount = 0;
        }
      }
    }
    //next room
    if (charX<0 &&charY>height/1.5) {
      room = 1;
      charX = 1174;
      charY =171;
      getKey = false;
      openDoor = false;
      playerTalk = false;
      checkObject = false;
      gotKey = true;
      room = room + 1;
      movingNextRoom = true;
      mapX = 663;
      mapY = 291;
      botY = 625;
      botX = 433;
    }
  }



  /*

   
   rrrrrrrrr           rrrrr
   rrrrrrrrrr        rr    rrr
   rr      rrr      rr      rrr
   rr      rr                rr
   rr    rrr                rr
   rrrrrrr                 rr
   rrrrrrr                rr
   rr    rr              rr
   rr     rr           rr
   rr      rr        rr
   rr       rr      rrrrrrrrrrr
   
   
   
   
   
   
   
   ROOOOM 2 
   LETS GOOOO
   
   MAN ROOM ONE WAS SO HARD TO MAKE
   THE SHADOWS TOOK SO LONG
   BUT I DID IT
   SOMEHOW...
   SO I GUESS IT IS TIME TO START
   
   THE DEATH BOT WAS ALSO HARD TO MAKE
   AAAAAAAAAAAA
   I SHOULD PROBABLY PUT INTRUCTIONS ON HOW TO AVOID IT
   idk
   
   */


  //show mini map :D
  if (room>1&&room<3) {
    if (movingNextRoom) {
      wordCount = wordCount + 1;

      background(0);
      image(map, 200, 100);
      noStroke();
      fill(#7705A5);
      ellipse(mapX, mapY, width/80, height/48);

      mapX = mapX - 0.5;
      if (mapX < 622) {
        mapX = mapX + 0;
        mapX = 622;
      }

      if (wordCount>150) {
        movingNextRoom = false;
        wordCount = 0;
        wordCount = wordCount + 0;
      }
    }

    //Start Room2
    if (!(movingNextRoom)) {
      background(0);
      fill(255);
      ellipse(676, 361, 140, 100);

      //shadows
      if (charY>141 && charY<198 && charX>762) {
        fill(255);
        rect(762, 141, width, 58);
      }


      if (charX<816 && charX>762) {
        fill(255);
        rect(762, 0, 54, height);
      }

      if (charY<112) {
        fill(255);
        rect(0, 0, width, 112);
      }

      if (charX<136) {
        fill(255);
        rect(0, 0, 136, height);
      }

      if (charX>423 && charX<476) {
        fill(255);
        rect(423, 52, 54, height);
      }     

      if (charX>423 && charX<676 && charY<412 && charY>292) {
        fill(255);
        rect(423, 291, 253, 121);
      }     
      if (charX>577 && charX<676 && charY<525 && charY>294) {
        fill(255);
        rect(576, 291, 100, 220);
      } 
      if (charY>616) {
        fill(255);
        rect(0, 616, width, 300);
      } 
      if (charX>1042 && charX<1116 && charY>548) {
        fill(255);
        rect(1046, 547, 70, height);
      } 
      //switch
      fill(100);
      if (getKey) {
        fill(200);
      }
      rect(663, 340, 25, 50);
      noStroke();
      fill(#7705A5);
      ellipse(charX, charY, width/40, height/24);




      //movement duh
      if (keyPressed) {
        if (key == 'w' || key == 'W') {
          background(0);
          fill(255);
          ellipse(676, 361, 140, 100);

          //shadows
          if (charY>141 && charY<198 && charX>762) {
            fill(255);
            rect(762, 141, width, 58);
          }


          if (charX<816 && charX>762) {
            fill(255);
            rect(762, 0, 54, height);
          }

          if (charY<112) {
            fill(255);
            rect(0, 0, width, 112);
          }

          if (charX<136) {
            fill(255);
            rect(0, 0, 136, height);
          }

          if (charX>423 && charX<476) {
            fill(255);
            rect(423, 52, 54, height);
          }     

          if (charX>423 && charX<676 && charY<412 && charY>292) {
            fill(255);
            rect(423, 291, 253, 121);
          }     
          if (charX>577 && charX<676 && charY<525 && charY>294) {
            fill(255);
            rect(576, 291, 100, 220);
          } 
          if (charY>616) {
            fill(255);
            rect(0, 616, width, 300);
          } 
          if (charX>1042 && charX<1116 && charY>548) {
            fill(255);
            rect(1046, 547, 70, height);
          } 
          //switch
          fill(100);
          if (getKey) {
            fill(200);
          }
          rect(663, 340, 25, 50);
          noStroke();
          fill(#7705A5);
          ellipse(charX, charY, width/40, height/24);

          charY = charY - height/360;
        }
        if (key == 'a' || key == 'A') {
          background(0);
          fill(255);
          ellipse(676, 361, 140, 100);

          //shadows
          if (charY>141 && charY<198 && charX>762) {
            fill(255);
            rect(762, 141, width, 58);
          }


          if (charX<816 && charX>762) {
            fill(255);
            rect(762, 0, 54, height);
          }

          if (charY<112) {
            fill(255);
            rect(0, 0, width, 112);
          }

          if (charX<136) {
            fill(255);
            rect(0, 0, 136, height);
          }

          if (charX>423 && charX<476) {
            fill(255);
            rect(423, 52, 54, height);
          }     

          if (charX>423 && charX<676 && charY<412 && charY>292) {
            fill(255);
            rect(423, 291, 253, 121);
          }     
          if (charX>577 && charX<676 && charY<525 && charY>294) {
            fill(255);
            rect(576, 291, 100, 220);
          } 
          if (charY>616) {
            fill(255);
            rect(0, 616, width, 300);
          } 
          if (charX>1042 && charX<1116 && charY>548) {
            fill(255);
            rect(1046, 547, 70, height);
          } 
          //switch
          fill(100);
          if (getKey) {
            fill(200);
          }
          rect(663, 340, 25, 50);
          noStroke();
          fill(#7705A5);
          ellipse(charX, charY, width/40, height/24);

          charX = charX - width/600;
        }
        if (key == 's' || key == 'S') {
          background(0);
          fill(255);
          ellipse(676, 361, 140, 100);

          //shadows
          if (charY>141 && charY<198 && charX>762) {
            fill(255);
            rect(762, 141, width, 58);
          }


          if (charX<816 && charX>762) {
            fill(255);
            rect(762, 0, 54, height);
          }

          if (charY<112) {
            fill(255);
            rect(0, 0, width, 112);
          }

          if (charX<136) {
            fill(255);
            rect(0, 0, 136, height);
          }

          if (charX>423 && charX<476) {
            fill(255);
            rect(423, 52, 54, height);
          }     

          if (charX>423 && charX<676 && charY<412 && charY>292) {
            fill(255);
            rect(423, 291, 253, 121);
          }     
          if (charX>577 && charX<676 && charY<525 && charY>294) {
            fill(255);
            rect(576, 291, 100, 220);
          } 
          if (charY>616) {
            fill(255);
            rect(0, 616, width, 300);
          } 
          if (charX>1042 && charX<1116 && charY>548) {
            fill(255);
            rect(1046, 547, 70, height);
          } 
          //switch
          fill(100);
          if (getKey) {
            fill(200);
          }
          rect(663, 340, 25, 50);
          noStroke();
          fill(#7705A5);
          ellipse(charX, charY, width/40, height/24);
          charY = charY + height/360;
        }
        if (key == 'd' || key == 'D') {
          background(0);
          fill(255);
          ellipse(676, 361, 140, 100);

          //shadows
          if (charY>141 && charY<198 && charX>762) {
            fill(255);
            rect(762, 141, width, 58);
          }


          if (charX<816 && charX>762) {
            fill(255);
            rect(762, 0, 54, height);
          }

          if (charY<112) {
            fill(255);
            rect(0, 0, width, 112);
          }

          if (charX<136) {
            fill(255);
            rect(0, 0, 136, height);
          }

          if (charX>423 && charX<476) {
            fill(255);
            rect(423, 52, 54, height);
          }     

          if (charX>423 && charX<676 && charY<412 && charY>292) {
            fill(255);
            rect(423, 291, 253, 121);
          }     
          if (charX>577 && charX<676 && charY<525 && charY>294) {
            fill(255);
            rect(576, 291, 100, 220);
          } 
          if (charY>616) {
            fill(255);
            rect(0, 616, width, 300);
          } 
          if (charX>1042 && charX<1116 && charY>548) {
            fill(255);
            rect(1046, 547, 70, height);
          } 
          //switch
          fill(100);
          if (getKey) {
            fill(200);
          }
          rect(663, 340, 25, 50);
          noStroke();
          fill(#7705A5);
          ellipse(charX, charY, width/40, height/24);

          charX = charX + width/600;
        }

        if (!(keyPressed)) {
          charX = charX + 0;
          charY = charY + 0;
        }
      }
      //



      //
      if (playerTalk) {
        if (keyPressed) {
          if (key == 'w' || key == 'W') {

            charY = charY + height/360;
          }
          if (key == 'a' || key == 'A') {

            charX = charX + width/600;
          }
          if (key == 's' || key == 'S') {

            charY = charY - height/360;
          }
          if (key == 'd' || key == 'D') {

            charX = charX - width/600;
          }
        }
      }

      //

      //

      //Blocks
      fill(0);
      //Blocks
      fill(0);
      rect(136, 112, 286, 505);
      rect(476, 112, 286, 178);
      rect(476, 512, 286, 105);
      rect(476, 412, 100, 105);
      rect(676, 212, 86, 355);
      rect(816, 0, 385, 140);
      rect(816, 202, 385, 345);
      rect(816, 500, 230, 117);
      rect(1116, 500, 230, 117);
      //Borders
      rect(0, 0, 50, height);
      //Borders
      rect(0, 0, width, height*1/14);
      rect(0, height-height*1/14, width, height*1/14);


      //press e to turn on switch
      if (charX > 630-width/40/2 && charX < 630 + 50 +width/40/2 && charY > 310-height/24/2 && charY <310+ 100 +height/24/2) {
        if (!(getKey)) {
          textSize(20);
          fill(255, 255, 0);
          text("Press E to Interact", width/2, height/50);
          if (keyPressed) {
            if ((key == 'e' || key == 'E')) {
              getKey = true;
            }
          }
        }
      }


      //REMEMBER THIS, ITS BACK! ITS COLLISIONS
      while 
        ((charX > 136 -width/40/2 && charX < 136 + 286 +width/40/2 && charY > 112-height/24/2 && charY < 112+ 505 +height/24/2) || 
        (charX > 476 -width/40/2 && charX < 476 + 286 +width/40/2 && charY > 112-height/24/2 && charY < 112+ 178 +height/24/2) ||
        (charX > 476 -width/40/2 && charX < 476 + 286 +width/40/2 && charY > 512-height/24/2 && charY < 512+ 105 +height/24/2) ||
        (charX > 476 -width/40/2 && charX < 476 + 100 +width/40/2 && charY > 412-height/24/2 && charY < 412+ 105 +height/24/2) ||
        (charX > 676 -width/40/2 && charX < 676 + 86 +width/40/2 && charY > 212-height/24/2 && charY < 212+ 355 +height/24/2) ||
        (charX > 816 -width/40/2 && charX < 816 + 385 +width/40/2 && charY > 0-height/24/2 && charY < 0+  140 +height/24/2) ||
        (charX > 816 -width/40/2 && charX < 816 + 385 +width/40/2 && charY > 202-height/24/2 && charY < 202+ 345 +height/24/2) ||
        (charX > 816 -width/40/2 && charX < 816 + 230 +width/40/2 && charY > 500-height/24/2 && charY < 500+ 117 +height/24/2) ||
        (charX > 1116 -width/40/2 && charX < 1116 + 230 +width/40/2 && charY > 500-height/24/2 && charY < 500+ 117 +height/24/2) ||
        (charX > 0 -width/40/2 && charX < 0 + 50 +width/40/2 && charY > 0-height/24/2 && charY < 0+ height +height/24/2) ||
        (charX > 0 -width/40/2 && charX < 0 + width +width/40/2 && charY > 0-height/24/2 && charY < 0+ height*1/14 +height/24/2) ||
        (charX > 0 -width/40/2 && charX < 0 + width +width/40/2 && charY > height-height*1/14-height/24/2 && charY < height-height*1/14+ height*1/14 +height/24/2) ||
        (charX >width-width/40/2 && charY<height/2)

        ) {
        if (key == 'w' || key == 'W') {
          background(0);
          fill(255);
          ellipse(676, 361, 140, 100);

          //shadows
          if (charY>141 && charY<198 && charX>762) {
            fill(255);
            rect(762, 141, width, 58);
          }


          if (charX<816 && charX>762) {
            fill(255);
            rect(762, 0, 54, height);
          }

          if (charY<112) {
            fill(255);
            rect(0, 0, width, 112);
          }

          if (charX<136) {
            fill(255);
            rect(0, 0, 136, height);
          }

          if (charX>423 && charX<476) {
            fill(255);
            rect(423, 52, 54, height);
          }     

          if (charX>423 && charX<676 && charY<412 && charY>292) {
            fill(255);
            rect(423, 291, 253, 121);
          }     
          if (charX>577 && charX<676 && charY<525 && charY>294) {
            fill(255);
            rect(576, 291, 100, 220);
          } 
          if (charY>616) {
            fill(255);
            rect(0, 616, width, 300);
          } 
          if (charX>1042 && charX<1116 && charY>548) {
            fill(255);
            rect(1046, 547, 70, height);
          } 
          //switch
          fill(100);
          if (getKey) {
            fill(200);
          }
          rect(663, 340, 25, 50);
          noStroke();
          fill(#7705A5);
          ellipse(charX, charY, width/40, height/24);

          //Blocks
          fill(0);
          //Blocks
          fill(0);
          rect(136, 112, 286, 505);
          rect(476, 112, 286, 178);
          rect(476, 512, 286, 105);
          rect(476, 412, 100, 105);
          rect(676, 212, 86, 355);
          rect(816, 0, 385, 140);
          rect(816, 202, 385, 345);
          rect(816, 500, 230, 117);
          rect(1116, 500, 230, 117);
          //Borders
          rect(0, 0, 50, height);
          //Borders
          rect(0, 0, width, height*1/14);
          rect(0, height-height*1/14, width, height*1/14);


          charY = charY + height/360;
        }
        if (key == 'a' || key == 'A') {
          background(0);
          fill(255);
          ellipse(676, 361, 140, 100);

          //shadows
          if (charY>141 && charY<198 && charX>762) {
            fill(255);
            rect(762, 141, width, 58);
          }


          if (charX<816 && charX>762) {
            fill(255);
            rect(762, 0, 54, height);
          }

          if (charY<112) {
            fill(255);
            rect(0, 0, width, 112);
          }

          if (charX<136) {
            fill(255);
            rect(0, 0, 136, height);
          }

          if (charX>423 && charX<476) {
            fill(255);
            rect(423, 52, 54, height);
          }     

          if (charX>423 && charX<676 && charY<412 && charY>292) {
            fill(255);
            rect(423, 291, 253, 121);
          }     
          if (charX>577 && charX<676 && charY<525 && charY>294) {
            fill(255);
            rect(576, 291, 100, 220);
          } 
          if (charY>616) {
            fill(255);
            rect(0, 616, width, 300);
          } 
          if (charX>1042 && charX<1116 && charY>548) {
            fill(255);
            rect(1046, 547, 70, height);
          } 
          //switch
          fill(100);
          if (getKey) {
            fill(200);
          }
          rect(663, 340, 25, 50);
          noStroke();
          fill(#7705A5);
          ellipse(charX, charY, width/40, height/24);
          //Blocks
          fill(0);
          //Blocks
          fill(0);
          rect(136, 112, 286, 505);
          rect(476, 112, 286, 178);
          rect(476, 512, 286, 105);
          rect(476, 412, 100, 105);
          rect(676, 212, 86, 355);
          rect(816, 0, 385, 140);
          rect(816, 202, 385, 345);
          rect(816, 500, 230, 117);
          rect(1116, 500, 230, 117);
          //Borders
          rect(0, 0, 50, height);
          //Borders
          rect(0, 0, width, height*1/14);
          rect(0, height-height*1/14, width, height*1/14);
          charX = charX + width/600;
        }
        if (key == 's' || key == 'S') {
          background(0);
          fill(255);
          ellipse(676, 361, 140, 100);

          //shadows
          if (charY>141 && charY<198 && charX>762) {
            fill(255);
            rect(762, 141, width, 58);
          }


          if (charX<816 && charX>762) {
            fill(255);
            rect(762, 0, 54, height);
          }

          if (charY<112) {
            fill(255);
            rect(0, 0, width, 112);
          }

          if (charX<136) {
            fill(255);
            rect(0, 0, 136, height);
          }

          if (charX>423 && charX<476) {
            fill(255);
            rect(423, 52, 54, height);
          }     

          if (charX>423 && charX<676 && charY<412 && charY>292) {
            fill(255);
            rect(423, 291, 253, 121);
          }     
          if (charX>577 && charX<676 && charY<525 && charY>294) {
            fill(255);
            rect(576, 291, 100, 220);
          } 
          if (charY>616) {
            fill(255);
            rect(0, 616, width, 300);
          } 
          if (charX>1042 && charX<1116 && charY>548) {
            fill(255);
            rect(1046, 547, 70, height);
          } 
          //switch
          fill(100);
          if (getKey) {
            fill(200);
          }
          rect(663, 340, 25, 50);
          noStroke();
          fill(#7705A5);
          ellipse(charX, charY, width/40, height/24);
          //Blocks
          fill(0);
          //Blocks
          fill(0);
          rect(136, 112, 286, 505);
          rect(476, 112, 286, 178);
          rect(476, 512, 286, 105);
          rect(476, 412, 100, 105);
          rect(676, 212, 86, 355);
          rect(816, 0, 385, 140);
          rect(816, 202, 385, 345);
          rect(816, 500, 230, 117);
          rect(1116, 500, 230, 117);
          //Borders
          rect(0, 0, 50, height);
          //Borders
          rect(0, 0, width, height*1/14);
          rect(0, height-height*1/14, width, height*1/14);

          charY = charY - height/360;
        }
        if (key == 'd' || key == 'D') {
          background(0);
          fill(255);
          ellipse(676, 361, 140, 100);

          //shadows
          if (charY>141 && charY<198 && charX>762) {
            fill(255);
            rect(762, 141, width, 58);
          }


          if (charX<816 && charX>762) {
            fill(255);
            rect(762, 0, 54, height);
          }

          if (charY<112) {
            fill(255);
            rect(0, 0, width, 112);
          }

          if (charX<136) {
            fill(255);
            rect(0, 0, 136, height);
          }

          if (charX>423 && charX<476) {
            fill(255);
            rect(423, 52, 54, height);
          }     

          if (charX>423 && charX<676 && charY<412 && charY>292) {
            fill(255);
            rect(423, 291, 253, 121);
          }     
          if (charX>577 && charX<676 && charY<525 && charY>294) {
            fill(255);
            rect(576, 291, 100, 220);
          } 
          if (charY>616) {
            fill(255);
            rect(0, 616, width, 300);
          } 
          if (charX>1042 && charX<1116 && charY>548) {
            fill(255);
            rect(1046, 547, 70, height);
          } 
          //switch
          fill(100);
          if (getKey) {
            fill(200);
          }
          rect(663, 340, 25, 50);
          noStroke();
          fill(#7705A5);
          ellipse(charX, charY, width/40, height/24);
          //Blocks
          fill(0);
          //Blocks
          fill(0);
          rect(136, 112, 286, 505);
          rect(476, 112, 286, 178);
          rect(476, 512, 286, 105);
          rect(476, 412, 100, 105);
          rect(676, 212, 86, 355);
          rect(816, 0, 385, 140);
          rect(816, 202, 385, 345);
          rect(816, 500, 230, 117);
          rect(1116, 500, 230, 117);
          //Borders
          rect(0, 0, 50, height);
          //Borders
          rect(0, 0, width, height*1/14);
          rect(0, height-height*1/14, width, height*1/14);
          charX = charX - width/600;
        }
      }
      //closed door?
      if (!(openDoor)) {
        fill(0);
        rect(1180, 600, 100, 100);
        if (charX > 1180 -width/40/2 && charX < 1180 + 100 +width/40/2 && charY > 600-height/24/2 && charY < 600+ 100 +height/24/2) {
          if (key == 'w' || key == 'W') {
            background(0);
            fill(255);
            ellipse(676, 361, 140, 100);

            //shadows
            if (charY>141 && charY<198 && charX>762) {
              fill(255);
              rect(762, 141, width, 58);
            }


            if (charX<816 && charX>762) {
              fill(255);
              rect(762, 0, 54, height);
            }

            if (charY<112) {
              fill(255);
              rect(0, 0, width, 112);
            }

            if (charX<136) {
              fill(255);
              rect(0, 0, 136, height);
            }

            if (charX>423 && charX<476) {
              fill(255);
              rect(423, 52, 54, height);
            }     

            if (charX>423 && charX<676 && charY<412 && charY>292) {
              fill(255);
              rect(423, 291, 253, 121);
            }     
            if (charX>577 && charX<676 && charY<525 && charY>294) {
              fill(255);
              rect(576, 291, 100, 220);
            } 
            if (charY>616) {
              fill(255);
              rect(0, 616, width, 300);
            } 
            if (charX>1042 && charX<1116 && charY>548) {
              fill(255);
              rect(1046, 547, 70, height);
            } 
            //switch
            fill(100);
            if (getKey) {
              fill(200);
            }
            rect(663, 340, 25, 50);
            noStroke();
            fill(#7705A5);
            ellipse(charX, charY, width/40, height/24);
            //Blocks
            fill(0);
            //Blocks
            fill(0);
            rect(136, 112, 286, 505);
            rect(476, 112, 286, 178);
            rect(476, 512, 286, 105);
            rect(476, 412, 100, 105);
            rect(676, 212, 86, 355);
            rect(816, 0, 385, 140);
            rect(816, 202, 385, 345);
            rect(816, 500, 230, 117);
            rect(1116, 500, 230, 117);
            rect(1180, 600, 100, 100);
            //Borders
            rect(0, 0, 50, height);
            //Borders
            rect(0, 0, width, height*1/14);
            rect(0, height-height*1/14, width, height*1/14);


            charY = charY + height/360;
          }
          if (key == 'a' || key == 'A') {
            background(0);
            fill(255);
            ellipse(676, 361, 140, 100);

            //shadows
            if (charY>141 && charY<198 && charX>762) {
              fill(255);
              rect(762, 141, width, 58);
            }


            if (charX<816 && charX>762) {
              fill(255);
              rect(762, 0, 54, height);
            }

            if (charY<112) {
              fill(255);
              rect(0, 0, width, 112);
            }

            if (charX<136) {
              fill(255);
              rect(0, 0, 136, height);
            }

            if (charX>423 && charX<476) {
              fill(255);
              rect(423, 52, 54, height);
            }     

            if (charX>423 && charX<676 && charY<412 && charY>292) {
              fill(255);
              rect(423, 291, 253, 121);
            }     
            if (charX>577 && charX<676 && charY<525 && charY>294) {
              fill(255);
              rect(576, 291, 100, 220);
            } 
            if (charY>616) {
              fill(255);
              rect(0, 616, width, 300);
            } 
            if (charX>1042 && charX<1116 && charY>548) {
              fill(255);
              rect(1046, 547, 70, height);
            } 
            //switch
            fill(100);
            if (getKey) {
              fill(200);
            }
            rect(663, 340, 25, 50);
            noStroke();
            fill(#7705A5);
            ellipse(charX, charY, width/40, height/24);
            //Blocks
            fill(0);
            //Blocks
            fill(0);
            rect(136, 112, 286, 505);
            rect(476, 112, 286, 178);
            rect(476, 512, 286, 105);
            rect(476, 412, 100, 105);
            rect(676, 212, 86, 355);
            rect(816, 0, 385, 140);
            rect(816, 202, 385, 345);
            rect(816, 500, 230, 117);
            rect(1116, 500, 230, 117);
            rect(1180, 600, 100, 100);
            //Borders
            rect(0, 0, 50, height);
            //Borders
            rect(0, 0, width, height*1/14);
            rect(0, height-height*1/14, width, height*1/14);
            charX = charX + width/600;
          }
          if (key == 's' || key == 'S') {
            background(0);
            fill(255);
            ellipse(676, 361, 140, 100);

            //shadows
            if (charY>141 && charY<198 && charX>762) {
              fill(255);
              rect(762, 141, width, 58);
            }


            if (charX<816 && charX>762) {
              fill(255);
              rect(762, 0, 54, height);
            }

            if (charY<112) {
              fill(255);
              rect(0, 0, width, 112);
            }

            if (charX<136) {
              fill(255);
              rect(0, 0, 136, height);
            }

            if (charX>423 && charX<476) {
              fill(255);
              rect(423, 52, 54, height);
            }     

            if (charX>423 && charX<676 && charY<412 && charY>292) {
              fill(255);
              rect(423, 291, 253, 121);
            }     
            if (charX>577 && charX<676 && charY<525 && charY>294) {
              fill(255);
              rect(576, 291, 100, 220);
            } 
            if (charY>616) {
              fill(255);
              rect(0, 616, width, 300);
            } 
            if (charX>1042 && charX<1116 && charY>548) {
              fill(255);
              rect(1046, 547, 70, height);
            } 
            //switch
            fill(100);
            if (getKey) {
              fill(200);
            }
            rect(663, 340, 25, 50);
            noStroke();
            fill(#7705A5);
            ellipse(charX, charY, width/40, height/24);
            //Blocks
            fill(0);
            //Blocks
            fill(0);
            rect(136, 112, 286, 505);
            rect(476, 112, 286, 178);
            rect(476, 512, 286, 105);
            rect(476, 412, 100, 105);
            rect(676, 212, 86, 355);
            rect(816, 0, 385, 140);
            rect(816, 202, 385, 345);
            rect(816, 500, 230, 117);
            rect(1116, 500, 230, 117);
            rect(1180, 600, 100, 100);
            //Borders
            rect(0, 0, 50, height);
            //Borders
            rect(0, 0, width, height*1/14);
            rect(0, height-height*1/14, width, height*1/14);

            charY = charY - height/360;
          }
          if (key == 'd' || key == 'D') {
            background(0);
            fill(255);
            ellipse(676, 361, 140, 100);

            //shadows
            if (charY>141 && charY<198 && charX>762) {
              fill(255);
              rect(762, 141, width, 58);
            }


            if (charX<816 && charX>762) {
              fill(255);
              rect(762, 0, 54, height);
            }

            if (charY<112) {
              fill(255);
              rect(0, 0, width, 112);
            }

            if (charX<136) {
              fill(255);
              rect(0, 0, 136, height);
            }

            if (charX>423 && charX<476) {
              fill(255);
              rect(423, 52, 54, height);
            }     

            if (charX>423 && charX<676 && charY<412 && charY>292) {
              fill(255);
              rect(423, 291, 253, 121);
            }     
            if (charX>577 && charX<676 && charY<525 && charY>294) {
              fill(255);
              rect(576, 291, 100, 220);
            } 
            if (charY>616) {
              fill(255);
              rect(0, 616, width, 300);
            } 
            if (charX>1042 && charX<1116 && charY>548) {
              fill(255);
              rect(1046, 547, 70, height);
            } 
            //switch
            fill(100);
            if (getKey) {
              fill(200);
            }
            rect(663, 340, 25, 50);
            noStroke();
            fill(#7705A5);
            ellipse(charX, charY, width/40, height/24);
            //Blocks
            fill(0);
            //Blocks
            fill(0);
            rect(136, 112, 286, 505);
            rect(476, 112, 286, 178);
            rect(476, 512, 286, 105);
            rect(476, 412, 100, 105);
            rect(676, 212, 86, 355);
            rect(816, 0, 385, 140);
            rect(816, 202, 385, 345);
            rect(816, 500, 230, 117);
            rect(1116, 500, 230, 117);
            rect(1180, 600, 100, 100);
            //Borders
            rect(0, 0, 50, height);
            //Borders
            rect(0, 0, width, height*1/14);
            rect(0, height-height*1/14, width, height*1/14);
            charX = charX - width/600;
          }
        }
      }




      //checkDoor
      if ((charX > width/1.05 && charX < width/0.9) && charY > height/2) {
        if (!(openDoor)) {
          textSize(20);
          fill(255, 255, 0);
          text("Press E to Interact", width/2, height/50);
          if (keyPressed) {
            if ((key == 'e' || key == 'E')) {
              if (!(getKey)) {
                checkObject = true;
              }
              if (getKey) {
                openDoor = true;
              }
            }
          }
        }
      }

      //Bots ATTACK
      fill(255, 0, 0);
      rect(botX, botY, width/40, height/24); 
      if (up) {
        botY = botY -4;
        if (botY<64) {
          println("left");
          up = false;
          left = true;
        }
      }
      if (left) {
        botX = botX -4;
        if (botX<77) {
          println("down");
          left = false;
          down = true;
        }
      }
      if (down) {
        botY = botY +4;
        if (botY>624) {
          println("right");
          down = false;
          right = true;
        }
      }
      if (right) {
        botX = botX +4;
        if (botX>434) {
          println("up");
          right = false;
          up = true;
        }
      }
      if (botY>617 && charY >617) {
        wordCount = wordCount +1;
        if (wordCount>0) {
          left = false;
          right = false;
          up = false;
          down = false;
          playerTalk = true;
        }
        if (wordCount>100) {
          background(255, 0, 0);
        }


        if (wordCount>200) {
          charX = 1174;
          charY =171;
          botY = 625;
          botX = 433;
          wordCount = 0;
          playerTalk = false;
          up = true;
          getKey = false;
          openDoor = false;
          checkObject = false;
        }
      }


      if (botY<112 && charY<112) {
        wordCount = wordCount +1;
        if (wordCount>0) {
          left = false;
          right = false;
          up = false;
          down = false;
          playerTalk = true;
        }
        if (wordCount>100) {
          background(255, 0, 0);
        }

        if (wordCount>200) {
          charX = 1174;
          charY =171;
          botY = 625;
          botX = 433;
          wordCount = 0;
          playerTalk = false;
          up = true;
          getKey = false;
          openDoor = false;
          checkObject = false;
        }
      }

      if ((botX>49 && botX<134)&&(charX>49 && charX<134)) {
        wordCount = wordCount +1;
        if (wordCount>0) {
          left = false;
          right = false;
          up = false;
          down = false;
          playerTalk = true;
        }
        if (wordCount>100) {
          background(255, 0, 0);
        }


        if (wordCount>200) {
          charX = 1174;
          charY =171;
          botY = 625;
          botX = 433;
          wordCount = 0;
          playerTalk = false;
          up = true;
          getKey = false;
          openDoor = false;
          checkObject = false;
        }
      }

      if ((botX>421 && botX<475 && botY<412 && botY>289)&&(charX>421 && charX<676 && charY<412 && charY>289)) {
        wordCount = wordCount +1;
        if (wordCount>0) {
          left = false;
          right = false;
          up = false;
          down = false;
          playerTalk = true;
        }
        if (wordCount>100) {
          background(255, 0, 0);
        }

        if (wordCount>200) {
          charX = 1174;
          charY =171;
          botY = 625;
          botX = 433;
          wordCount = 0;
          playerTalk = false;
          up = true;
          getKey = false;
          openDoor = false;
          checkObject = false;
        }
      }

      if ((botX>421 && botX<475 )&&(charX>421 && charX<475)) {
        wordCount = wordCount +1;
        if (wordCount>0) {
          left = false;
          right = false;
          up = false;
          down = false;
          playerTalk = true;
        }
        if (wordCount>100) {
          background(255, 0, 0);
        }


        if (wordCount>200) {
          charX = 1174;
          charY =171;
          botY = 625;
          botX = 433;
          wordCount = 0;
          playerTalk = false;
          up = true;
          getKey = false;
          openDoor = false;
          checkObject = false;
        }
      }





      //the door is locked
      if (checkObject && (!(getKey))) {
        playerTalk = true;
        text.resize(0, 300);
        image(text, 0, height/1.5);
        player.resize(0, 700);
        image(player, playerPicX, height/8+ height/20);

        if (playerPicX < width/15) {
          playerPicX = playerPicX + 50;
        }

        if (playerPicX >= width/15 && playerTalk) {
          textSize(30);
          fill(0);
          textAlign(CENTER, CENTER);
          wordCount = wordCount + 1;

          if (wordCount>7) {
            text("The", width/2.95, height/1.3);
          }
          if (wordCount>14) {
            text("door", width/2.50, height/1.3);
          }
          if (wordCount>21) {
            text("isn't", width/2.17, height/1.3);
          }
          if (wordCount>28) {
            text("opening...", width/1.80, height/1.3);
          }
          if (wordCount>40) { 
            playerTalk = false;
            checkObject = false;
            playerPicX = playerPicX +0;
            playerPicX = -1000;
            wordCount = wordCount +0;
            wordCount = 0;
          }
        }
      }
    }
    //leave room
    if (charX>width &&charY>height/1.5) {
      room = 2;
      charX = 32;
      charY = 65;
      getKey = false;
      openDoor = false;
      playerTalk = false;
      checkObject = false;
      gotKey = false;
      room = room + 1;
      movingNextRoom = true;
      mapX = 637;
      mapY = 346;
      botY = 30;
      botX = 816;
      botY2 = 650;
      botX2 = 816;
    }
  }





  /*
   rrrrrrrrr           rrrrrr
   rrrrrrrrrr        rr   rrr
   rr      rrr      rr     rr
   rr      rr             rrr
   rr    rrr            rrr
   rrrrrrr               rrr
   rrrrrrr                rr
   rr    rr                rr
   rr     rr               rr
   rr      rr             rr
   rr       rr       rrrrrr
   
   
   
   ROOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOM
   THREEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEE
   
   
   
   
   
   
   ROOM 3 IS FINNALLY HERE
   SO DID YOU GET LOST IN THE 
   OTHER LINES OF CODE?
   
   THIS IS WILL BE A "BIT" CLEANER
   IDK
   
   ALSO
   
   YA
   
   
   
   LETS START ROOOM 3
   AND MAYBE A LITTLE BIT EXTRA
   
   THE LAST ROOM WAS PRETTY BIG THOUGH
   BUT THIS WILL ONLY HAVE LOTS OF OBJECTS
   NOT MUCH ELSE
   
   OK LETS START THIS THING
   
   
   */




  //mini map
  if (room>2&&room<4) {
    if (movingNextRoom) {
      wordCount = wordCount + 1;

      background(0);
      image(map, 200, 100);
      noStroke();
      fill(#7705A5);
      ellipse(mapX, mapY, width/80, height/48);

      mapX = mapX + 0.5;
      if (mapX > 690) {
        mapX = mapX + 0;
        mapX = 690;
      }

      if (wordCount>150) {
        movingNextRoom = false;
        wordCount = 0;
        wordCount = wordCount + 0;
      }
    }


    //start room 3
    if (!(movingNextRoom)) {
      background(0);
      noStroke();
      //shadows
      if (charY>30&&charY<102&&charX<467) {
        fill(255);
        rect(0, 0, 467, 100);
      }
      if (charY<395&&charX>400&&charX<467) {
        fill(255);
        rect(399, 0, 68, 394);
      }
      if (charY>329&&charY<392&&charX>400&&charX<606) {
        fill(255);
        rect(399, 329, 207, 65);
      }
      if (charY>29&&charY<394&&charX>526&&charX<606) {
        fill(255);
        rect(527, 29, 79, 367);
      }
      if (charY>29&&charY<85&&charX>526&&charX<740) {
        fill(255);
        rect(527, 29, 213, 56 );
      }
      //Path With getKey Switch
      if (charY>29&&charY<716&&charX>666&&charX<740) {
        fill(255);
        rect(666, 29, 74, 687 );
        fill(100);
        if (getKey) {
          fill(200);
        }
        rect(679, 696, 50, 20);
      }
      if (charY>433&&charY<505&&charX>526&&charX<740) {
        fill(255);
        rect(526, 433, 214, 72 );
      }
      if (charY>433&&charY<716&&charX>526&&charX<606) {
        fill(255);
        rect(526, 433, 80, 350 );
      }
      if (charY>649&&charX<606) {
        fill(255);
        rect(0, 649, 606, 350 );
      }
      if (charY>613&&charX<467) {
        fill(255);
        rect(0, 614, 467, 350 );
      }
      //path with gotKey switch
      if (charY>434&&charX>400&&charX<467) {
        fill(255);
        rect(400, 434, 67, 350 );
        fill(100);
        if (gotKey) {
          fill(200);
        }
        rect(410, 434, 50, 20);
      }
      if (charY>110-width/40/2 && charY<125+width/40/2) {
        fill(255);
        rect(0, 110, width, 15);
      }
      if (charY>235-width/40/2 && charY<250+width/40/2) {
        fill(255);
        rect(0, 235, width, 15);
      }
      if (charY>545-width/40/2 && charY<560+width/40/2) {
        fill(255);
        rect(0, 545, width, 15);
      }
      //character
      fill(#7705A5);
      ellipse(charX, charY, width/40, height/24);








      // stay still when talking
      if (playerTalk) {
        if (keyPressed) {
          if (key == 'w' || key == 'W') {

            charY = charY + height/360;
          }
          if (key == 'a' || key == 'A') {

            charX = charX + width/600;
          }
          if (key == 's' || key == 'S') {

            charY = charY - height/360;
          }
          if (key == 'd' || key == 'D') {

            charX = charX - width/600;
          }
        }
      }



      //Movement
      if (keyPressed) {
        if (key == 'w' || key == 'W') {
          background(0);
          noStroke();
          //shadows
          if (charY>30&&charY<102&&charX<467) {
            fill(255);
            rect(0, 0, 467, 100);
          }
          if (charY<395&&charX>400&&charX<467) {
            fill(255);
            rect(399, 0, 68, 394);
          }
          if (charY>329&&charY<392&&charX>400&&charX<606) {
            fill(255);
            rect(399, 329, 207, 65);
          }
          if (charY>29&&charY<394&&charX>526&&charX<606) {
            fill(255);
            rect(527, 29, 79, 367);
          }
          if (charY>29&&charY<85&&charX>526&&charX<740) {
            fill(255);
            rect(527, 29, 213, 56 );
          }
          //Path With getKey Switch
          if (charY>29&&charY<716&&charX>666&&charX<740) {
            fill(255);
            rect(666, 29, 74, 687 );
            fill(100);
            if (getKey) {
              fill(200);
            }
            rect(679, 696, 50, 20);
          }
          if (charY>433&&charY<505&&charX>526&&charX<740) {
            fill(255);
            rect(526, 433, 214, 72 );
          }
          if (charY>433&&charY<716&&charX>526&&charX<606) {
            fill(255);
            rect(526, 433, 80, 350 );
          }
          if (charY>649&&charX<606) {
            fill(255);
            rect(0, 649, 606, 350 );
          }
          if (charY>613&&charX<467) {
            fill(255);
            rect(0, 614, 467, 350 );
          }
          //path with gotKey switch
          if (charY>434&&charX>400&&charX<467) {
            fill(255);
            rect(400, 434, 67, 350 );
            fill(100);
            if (gotKey) {
              fill(200);
            }
            rect(410, 434, 50, 20);
          }
          if (charY>110-width/40/2 && charY<125+width/40/2) {
            fill(255);
            rect(0, 110, width, 15);
          }
          if (charY>235-width/40/2 && charY<250+width/40/2) {
            fill(255);
            rect(0, 235, width, 15);
          }
          if (charY>545-width/40/2 && charY<560+width/40/2) {
            fill(255);
            rect(0, 545, width, 15);
          }
          //character
          fill(#7705A5);
          ellipse(charX, charY, width/40, height/24);


          //Blocks
          fill(0);
          //Borders
          rect(0, 0, width/1.5, 30);
          rect(0, 100, width/3, height/1.4);
          rect(0, 700, width/3, 50);
          rect(0, 715, width, 50);
          rect(0, 394, width/1.8, 40);
          rect(870, 0, width, height);

          //borderthing

          rect(740, 0, 60, 110);
          rect(740, 125, 60, 110);
          rect(740, 250, 60, 295);
          rect(740, 560, 60, 250);

          //top left

          rect(467, 0, 60, 110);
          rect(467, 125, 60, 110);
          rect(467, 250, 60, 80);

          //topright

          rect(606, 85, 61, 25);
          rect(606, 125, 61, 110);
          rect(606, 250, 61, 170);

          //bottom right

          rect(606, 505, 60, 40);
          rect(606, 560, 60, 180);


          //bottom left

          rect(467, 430, 60, 115);
          rect(467, 560, 60, 90);
          charY = charY - height/360;
        }
        if (key == 'a' || key == 'A') {
          background(0);
          noStroke();
          //shadows
          if (charY>30&&charY<102&&charX<467) {
            fill(255);
            rect(0, 0, 467, 100);
          }
          if (charY<395&&charX>400&&charX<467) {
            fill(255);
            rect(399, 0, 68, 394);
          }
          if (charY>329&&charY<392&&charX>400&&charX<606) {
            fill(255);
            rect(399, 329, 207, 65);
          }
          if (charY>29&&charY<394&&charX>526&&charX<606) {
            fill(255);
            rect(527, 29, 79, 367);
          }
          if (charY>29&&charY<85&&charX>526&&charX<740) {
            fill(255);
            rect(527, 29, 213, 56 );
          }
          //Path With getKey Switch
          if (charY>29&&charY<716&&charX>666&&charX<740) {
            fill(255);
            rect(666, 29, 74, 687 );
            fill(100);
            if (getKey) {
              fill(200);
            }
            rect(679, 696, 50, 20);
          }
          if (charY>433&&charY<505&&charX>526&&charX<740) {
            fill(255);
            rect(526, 433, 214, 72 );
          }
          if (charY>433&&charY<716&&charX>526&&charX<606) {
            fill(255);
            rect(526, 433, 80, 350 );
          }
          if (charY>649&&charX<606) {
            fill(255);
            rect(0, 649, 606, 350 );
          }
          if (charY>613&&charX<467) {
            fill(255);
            rect(0, 614, 467, 350 );
          }
          //path with gotKey switch
          if (charY>434&&charX>400&&charX<467) {
            fill(255);
            rect(400, 434, 67, 350 );
            fill(100);
            if (gotKey) {
              fill(200);
            }
            rect(410, 434, 50, 20);
          }
          if (charY>110-width/40/2 && charY<125+width/40/2) {
            fill(255);
            rect(0, 110, width, 15);
          }
          if (charY>235-width/40/2 && charY<250+width/40/2) {
            fill(255);
            rect(0, 235, width, 15);
          }
          if (charY>545-width/40/2 && charY<560+width/40/2) {
            fill(255);
            rect(0, 545, width, 15);
          }
          //character
          fill(#7705A5);
          ellipse(charX, charY, width/40, height/24);
          //Blocks
          fill(0);
          //Borders
          rect(0, 0, width/1.5, 30);
          rect(0, 100, width/3, height/1.4);
          rect(0, 700, width/3, 50);
          rect(0, 715, width, 50);
          rect(0, 394, width/1.8, 40);
          rect(870, 0, width, height);

          //borderthing

          rect(740, 0, 60, 110);
          rect(740, 125, 60, 110);
          rect(740, 250, 60, 295);
          rect(740, 560, 60, 250);

          //top left

          rect(467, 0, 60, 110);
          rect(467, 125, 60, 110);
          rect(467, 250, 60, 80);

          //topright

          rect(606, 85, 61, 25);
          rect(606, 125, 61, 110);
          rect(606, 250, 61, 170);

          //bottom right

          rect(606, 505, 60, 40);
          rect(606, 560, 60, 180);


          //bottom left

          rect(467, 430, 60, 115);
          rect(467, 560, 60, 90);
          charX = charX - width/600;
        }
        if (key == 's' || key == 'S') {
          background(0);
          noStroke();
          //shadows
          if (charY>30&&charY<102&&charX<467) {
            fill(255);
            rect(0, 0, 467, 100);
          }
          if (charY<395&&charX>400&&charX<467) {
            fill(255);
            rect(399, 0, 68, 394);
          }
          if (charY>329&&charY<392&&charX>400&&charX<606) {
            fill(255);
            rect(399, 329, 207, 65);
          }
          if (charY>29&&charY<394&&charX>526&&charX<606) {
            fill(255);
            rect(527, 29, 79, 367);
          }
          if (charY>29&&charY<85&&charX>526&&charX<740) {
            fill(255);
            rect(527, 29, 213, 56 );
          }
          //Path With getKey Switch
          if (charY>29&&charY<716&&charX>666&&charX<740) {
            fill(255);
            rect(666, 29, 74, 687 );
            fill(100);
            if (getKey) {
              fill(200);
            }
            rect(679, 696, 50, 20);
          }
          if (charY>433&&charY<505&&charX>526&&charX<740) {
            fill(255);
            rect(526, 433, 214, 72 );
          }
          if (charY>433&&charY<716&&charX>526&&charX<606) {
            fill(255);
            rect(526, 433, 80, 350 );
          }
          if (charY>649&&charX<606) {
            fill(255);
            rect(0, 649, 606, 350 );
          }
          if (charY>613&&charX<467) {
            fill(255);
            rect(0, 614, 467, 350 );
          }
          //path with gotKey switch
          if (charY>434&&charX>400&&charX<467) {
            fill(255);
            rect(400, 434, 67, 350 );
            fill(100);
            if (gotKey) {
              fill(200);
            }
            rect(410, 434, 50, 20);
          }
          if (charY>110-width/40/2 && charY<125+width/40/2) {
            fill(255);
            rect(0, 110, width, 15);
          }
          if (charY>235-width/40/2 && charY<250+width/40/2) {
            fill(255);
            rect(0, 235, width, 15);
          }
          if (charY>545-width/40/2 && charY<560+width/40/2) {
            fill(255);
            rect(0, 545, width, 15);
          }
          //character
          fill(#7705A5);
          ellipse(charX, charY, width/40, height/24);
          //Blocks
          fill(0);
          //Borders
          rect(0, 0, width/1.5, 30);
          rect(0, 100, width/3, height/1.4);
          rect(0, 700, width/3, 50);
          rect(0, 715, width, 50);
          rect(0, 394, width/1.8, 40);
          rect(870, 0, width, height);

          //borderthing

          rect(740, 0, 60, 110);
          rect(740, 125, 60, 110);
          rect(740, 250, 60, 295);
          rect(740, 560, 60, 250);

          //top left

          rect(467, 0, 60, 110);
          rect(467, 125, 60, 110);
          rect(467, 250, 60, 80);

          //topright

          rect(606, 85, 61, 25);
          rect(606, 125, 61, 110);
          rect(606, 250, 61, 170);

          //bottom right

          rect(606, 505, 60, 40);
          rect(606, 560, 60, 180);


          //bottom left

          rect(467, 430, 60, 115);
          rect(467, 560, 60, 90);
          charY = charY + height/360;
        }
        if (key == 'd' || key == 'D') {
          background(0);
          noStroke();
          //shadows
          if (charY>30&&charY<102&&charX<467) {
            fill(255);
            rect(0, 0, 467, 100);
          }
          if (charY<395&&charX>400&&charX<467) {
            fill(255);
            rect(399, 0, 68, 394);
          }
          if (charY>329&&charY<392&&charX>400&&charX<606) {
            fill(255);
            rect(399, 329, 207, 65);
          }
          if (charY>29&&charY<394&&charX>526&&charX<606) {
            fill(255);
            rect(527, 29, 79, 367);
          }
          if (charY>29&&charY<85&&charX>526&&charX<740) {
            fill(255);
            rect(527, 29, 213, 56 );
          }
          //Path With getKey Switch
          if (charY>29&&charY<716&&charX>666&&charX<740) {
            fill(255);
            rect(666, 29, 74, 687 );
            fill(100);
            if (getKey) {
              fill(200);
            }
            rect(679, 696, 50, 20);
          }
          if (charY>433&&charY<505&&charX>526&&charX<740) {
            fill(255);
            rect(526, 433, 214, 72 );
          }
          if (charY>433&&charY<716&&charX>526&&charX<606) {
            fill(255);
            rect(526, 433, 80, 350 );
          }
          if (charY>649&&charX<606) {
            fill(255);
            rect(0, 649, 606, 350 );
          }
          if (charY>613&&charX<467) {
            fill(255);
            rect(0, 614, 467, 350 );
          }
          //path with gotKey switch
          if (charY>434&&charX>400&&charX<467) {
            fill(255);
            rect(400, 434, 67, 350 );
            fill(100);
            if (gotKey) {
              fill(200);
            }
            rect(410, 434, 50, 20);
          }
          if (charY>110-width/40/2 && charY<125+width/40/2) {
            fill(255);
            rect(0, 110, width, 15);
          }
          if (charY>235-width/40/2 && charY<250+width/40/2) {
            fill(255);
            rect(0, 235, width, 15);
          }
          if (charY>545-width/40/2 && charY<560+width/40/2) {
            fill(255);
            rect(0, 545, width, 15);
          }
          //character
          fill(#7705A5);
          ellipse(charX, charY, width/40, height/24);
          //Blocks
          fill(0);
          //Borders
          rect(0, 0, width/1.5, 30);
          rect(0, 100, width/3, height/1.4);
          rect(0, 700, width/3, 50);
          rect(0, 715, width, 50);
          rect(0, 394, width/1.8, 40);
          rect(870, 0, width, height);

          //borderthing

          rect(740, 0, 60, 110);
          rect(740, 125, 60, 110);
          rect(740, 250, 60, 295);
          rect(740, 560, 60, 250);

          //top left

          rect(467, 0, 60, 110);
          rect(467, 125, 60, 110);
          rect(467, 250, 60, 80);

          //topright

          rect(606, 85, 61, 25);
          rect(606, 125, 61, 110);
          rect(606, 250, 61, 170);

          //bottom right

          rect(606, 505, 60, 40);
          rect(606, 560, 60, 180);


          //bottom left

          rect(467, 430, 60, 115);
          rect(467, 560, 60, 90);
          charX = charX + width/600;
        }

        if (!(keyPressed)) {
          charX = charX + 0;
          charY = charY + 0;
        }
      }







      //Blocks
      fill(0);
      //Borders
      rect(0, 0, width/1.5, 30);
      rect(0, 100, width/3, height/1.4);
      rect(0, 700, width/3, 50);
      rect(0, 715, width, 50);
      rect(0, 394, width/1.8, 40);
      rect(870, 0, width, height);

      //borderthing

      rect(740, 0, 60, 110);
      rect(740, 125, 60, 110);
      rect(740, 250, 60, 295);
      rect(740, 560, 60, 250);

      //top left

      rect(467, 0, 60, 110);
      rect(467, 125, 60, 110);
      rect(467, 250, 60, 80);

      //topright

      rect(606, 85, 61, 25);
      rect(606, 125, 61, 110);
      rect(606, 250, 61, 170);

      //bottom right

      rect(606, 505, 60, 40);
      rect(606, 560, 60, 180);


      //bottom left

      rect(467, 430, 60, 115);
      rect(467, 560, 60, 90);



      /*      
       COLLISIONS HERE
       
       rect(740, 0, 60, height);
       rect(467, 0, 60, 330);
       rect(467, 430, 60, 220); 
       rect(606, 505, 61, 220);
       rect(467, 430, 60, 220); 
       rect(0, 0, width/1.5, 30);
       rect(0, 100, width/3, height/1.4);    
       rect(0, 700, width/3, 50);
       rect(0, 715, width, 50);
       rect(0, 394, width/1.8, 40);
       
       rect(870, 0, width, height);
       */

      //COLLISIONS
      while 
        ((charX > 740 -width/40/2 && charX < 740 + 60 +width/40/2 && charY > 0-height/24/2 && charY < 0+  height +height/24/2) || 
        (charX > 467 -width/40/2 && charX < 467 + 60 +width/40/2 && charY > 0-height/24/2 && charY < 0+ 330 +height/24/2) ||
        (charX > 467 -width/40/2 && charX < 467 + 60 +width/40/2 && charY > 430-height/24/2 && charY < 430+ 220 +height/24/2) ||
        (charX > 606 -width/40/2 && charX < 606 + 60 +width/40/2 && charY > 505-height/24/2 && charY < 505+ 220 +height/24/2) ||
        (charX > 606 -width/40/2 && charX < 606 + 61 +width/40/2 && charY > 85-height/24/2 && charY < 85+ 330 +height/24/2) ||
        (charX > 467 -width/40/2 && charX < 467 + 60 +width/40/2 && charY > 430-height/24/2 && charY < 430+ 220 +height/24/2) ||
        (charX > 0 -width/40/2 && charX < 0 + width/1.5 +width/40/2 && charY > 0-height/24/2 && charY < 0+ 30 +height/24/2) ||
        (charX > 0 -width/40/2 && charX < 0 + width/3 +width/40/2 && charY > 100-height/24/2 && charY < 100+ height/1.4 +height/24/2) ||
        (charX > 0 -width/40/2 && charX < 0 + width/3 +width/40/2 && charY > 700-height/24/2 && charY < 700+ 50 +height/24/2) ||
        (charX > 0 -width/40/2 && charX < 0 +  width +width/40/2 && charY > 715-height/24/2 && charY < 715+ 50 +height/24/2) ||
        (charX > 0 -width/40/2 && charX < 0 + width/1.8 +width/40/2 && charY > 394-height/24/2 && charY < 394+ 40 +height/24/2) ||
        (charX > 870 -width/40/2 && charX < 870 + width +width/40/2 && charY > 0-height/24/2 && charY < 0+ height +height/24/2) 

        ) {
        if (key == 'w' || key == 'W') {
          background(0);
          noStroke();
          //shadows
          if (charY>30&&charY<102&&charX<467) {
            fill(255);
            rect(0, 0, 467, 100);
          }
          if (charY<395&&charX>400&&charX<467) {
            fill(255);
            rect(399, 0, 68, 394);
          }
          if (charY>329&&charY<392&&charX>400&&charX<606) {
            fill(255);
            rect(399, 329, 207, 65);
          }
          if (charY>29&&charY<394&&charX>526&&charX<606) {
            fill(255);
            rect(527, 29, 79, 367);
          }
          if (charY>29&&charY<85&&charX>526&&charX<740) {
            fill(255);
            rect(527, 29, 213, 56 );
          }
          //Path With getKey Switch
          if (charY>29&&charY<716&&charX>666&&charX<740) {
            fill(255);
            rect(666, 29, 74, 687 );
            fill(100);
            if (getKey) {
              fill(200);
            }
            rect(679, 696, 50, 20);
          }
          if (charY>433&&charY<505&&charX>526&&charX<740) {
            fill(255);
            rect(526, 433, 214, 72 );
          }
          if (charY>433&&charY<716&&charX>526&&charX<606) {
            fill(255);
            rect(526, 433, 80, 350 );
          }
          if (charY>649&&charX<606) {
            fill(255);
            rect(0, 649, 606, 350 );
          }
          if (charY>613&&charX<467) {
            fill(255);
            rect(0, 614, 467, 350 );
          }
          //path with gotKey switch
          if (charY>434&&charX>400&&charX<467) {
            fill(255);
            rect(400, 434, 67, 350 );
            fill(100);
            if (gotKey) {
              fill(200);
            }
            rect(410, 434, 50, 20);
          }
          if (charY>110-width/40/2 && charY<125+width/40/2) {
            fill(255);
            rect(0, 110, width, 15);
          }
          if (charY>235-width/40/2 && charY<250+width/40/2) {
            fill(255);
            rect(0, 235, width, 15);
          }
          if (charY>545-width/40/2 && charY<560+width/40/2) {
            fill(255);
            rect(0, 545, width, 15);
          }
          //character
          fill(#7705A5);
          ellipse(charX, charY, width/40, height/24);
          //Blocks
          fill(0);
          //Borders
          rect(0, 0, width/1.5, 30);
          rect(0, 100, width/3, height/1.4);
          rect(0, 700, width/3, 50);
          rect(0, 715, width, 50);
          rect(0, 394, width/1.8, 40);
          rect(870, 0, width, height);

          //borderthing

          rect(740, 0, 60, 110);
          rect(740, 125, 60, 110);
          rect(740, 250, 60, 295);
          rect(740, 560, 60, 250);

          //top left

          rect(467, 0, 60, 110);
          rect(467, 125, 60, 110);
          rect(467, 250, 60, 80);

          //topright

          rect(606, 85, 61, 25);
          rect(606, 125, 61, 110);
          rect(606, 250, 61, 170);

          //bottom right

          rect(606, 505, 60, 40);
          rect(606, 560, 60, 180);


          //bottom left

          rect(467, 430, 60, 115);
          rect(467, 560, 60, 90);
          charY = charY + height/360;
        }
        if (key == 'a' || key == 'A') {
          background(0);
          noStroke();
          //shadows
          if (charY>30&&charY<102&&charX<467) {
            fill(255);
            rect(0, 0, 467, 100);
          }
          if (charY<395&&charX>400&&charX<467) {
            fill(255);
            rect(399, 0, 68, 394);
          }
          if (charY>329&&charY<392&&charX>400&&charX<606) {
            fill(255);
            rect(399, 329, 207, 65);
          }
          if (charY>29&&charY<394&&charX>526&&charX<606) {
            fill(255);
            rect(527, 29, 79, 367);
          }
          if (charY>29&&charY<85&&charX>526&&charX<740) {
            fill(255);
            rect(527, 29, 213, 56 );
          }
          //Path With getKey Switch
          if (charY>29&&charY<716&&charX>666&&charX<740) {
            fill(255);
            rect(666, 29, 74, 687 );
            fill(100);
            if (getKey) {
              fill(200);
            }
            rect(679, 696, 50, 20);
          }
          if (charY>433&&charY<505&&charX>526&&charX<740) {
            fill(255);
            rect(526, 433, 214, 72 );
          }
          if (charY>433&&charY<716&&charX>526&&charX<606) {
            fill(255);
            rect(526, 433, 80, 350 );
          }
          if (charY>649&&charX<606) {
            fill(255);
            rect(0, 649, 606, 350 );
          }
          if (charY>613&&charX<467) {
            fill(255);
            rect(0, 614, 467, 350 );
          }
          //path with gotKey switch
          if (charY>434&&charX>400&&charX<467) {
            fill(255);
            rect(400, 434, 67, 350 );
            fill(100);
            if (gotKey) {
              fill(200);
            }
            rect(410, 434, 50, 20);
          }
          if (charY>110-width/40/2 && charY<125+width/40/2) {
            fill(255);
            rect(0, 110, width, 15);
          }
          if (charY>235-width/40/2 && charY<250+width/40/2) {
            fill(255);
            rect(0, 235, width, 15);
          }
          if (charY>545-width/40/2 && charY<560+width/40/2) {
            fill(255);
            rect(0, 545, width, 15);
          }
          //character
          fill(#7705A5);
          ellipse(charX, charY, width/40, height/24);
          //Blocks
          fill(0);
          //Borders
          rect(0, 0, width/1.5, 30);
          rect(0, 100, width/3, height/1.4);
          rect(0, 700, width/3, 50);
          rect(0, 715, width, 50);
          rect(0, 394, width/1.8, 40);
          rect(870, 0, width, height);

          //borderthing

          rect(740, 0, 60, 110);
          rect(740, 125, 60, 110);
          rect(740, 250, 60, 295);
          rect(740, 560, 60, 250);

          //top left

          rect(467, 0, 60, 110);
          rect(467, 125, 60, 110);
          rect(467, 250, 60, 80);

          //topright

          rect(606, 85, 61, 25);
          rect(606, 125, 61, 110);
          rect(606, 250, 61, 170);

          //bottom right

          rect(606, 505, 60, 40);
          rect(606, 560, 60, 180);


          //bottom left

          rect(467, 430, 60, 115);
          rect(467, 560, 60, 90);
          charX = charX + width/600;
        }
        if (key == 's' || key == 'S') {
          background(0);
          noStroke();
          //shadows
          if (charY>30&&charY<102&&charX<467) {
            fill(255);
            rect(0, 0, 467, 100);
          }
          if (charY<395&&charX>400&&charX<467) {
            fill(255);
            rect(399, 0, 68, 394);
          }
          if (charY>329&&charY<392&&charX>400&&charX<606) {
            fill(255);
            rect(399, 329, 207, 65);
          }
          if (charY>29&&charY<394&&charX>526&&charX<606) {
            fill(255);
            rect(527, 29, 79, 367);
          }
          if (charY>29&&charY<85&&charX>526&&charX<740) {
            fill(255);
            rect(527, 29, 213, 56 );
          }
          //Path With getKey Switch
          if (charY>29&&charY<716&&charX>666&&charX<740) {
            fill(255);
            rect(666, 29, 74, 687 );
            fill(100);
            if (getKey) {
              fill(200);
            }
            rect(679, 696, 50, 20);
          }
          if (charY>433&&charY<505&&charX>526&&charX<740) {
            fill(255);
            rect(526, 433, 214, 72 );
          }
          if (charY>433&&charY<716&&charX>526&&charX<606) {
            fill(255);
            rect(526, 433, 80, 350 );
          }
          if (charY>649&&charX<606) {
            fill(255);
            rect(0, 649, 606, 350 );
          }
          if (charY>613&&charX<467) {
            fill(255);
            rect(0, 614, 467, 350 );
          }
          //path with gotKey switch
          if (charY>434&&charX>400&&charX<467) {
            fill(255);
            rect(400, 434, 67, 350 );
            fill(100);
            if (gotKey) {
              fill(200);
            }
            rect(410, 434, 50, 20);
          }
          if (charY>110-width/40/2 && charY<125+width/40/2) {
            fill(255);
            rect(0, 110, width, 15);
          }
          if (charY>235-width/40/2 && charY<250+width/40/2) {
            fill(255);
            rect(0, 235, width, 15);
          }
          if (charY>545-width/40/2 && charY<560+width/40/2) {
            fill(255);
            rect(0, 545, width, 15);
          }
          //character
          fill(#7705A5);
          ellipse(charX, charY, width/40, height/24);
          //Blocks
          fill(0);
          //Borders
          rect(0, 0, width/1.5, 30);
          rect(0, 100, width/3, height/1.4);
          rect(0, 700, width/3, 50);
          rect(0, 715, width, 50);
          rect(0, 394, width/1.8, 40);
          rect(870, 0, width, height);

          //borderthing

          rect(740, 0, 60, 110);
          rect(740, 125, 60, 110);
          rect(740, 250, 60, 295);
          rect(740, 560, 60, 250);

          //top left

          rect(467, 0, 60, 110);
          rect(467, 125, 60, 110);
          rect(467, 250, 60, 80);

          //topright

          rect(606, 85, 61, 25);
          rect(606, 125, 61, 110);
          rect(606, 250, 61, 170);

          //bottom right

          rect(606, 505, 60, 40);
          rect(606, 560, 60, 180);


          //bottom left

          rect(467, 430, 60, 115);
          rect(467, 560, 60, 90);
          charY = charY - height/360;
        }
        if (key == 'd' || key == 'D') {
          background(0);
          noStroke();
          //shadows
          if (charY>30&&charY<102&&charX<467) {
            fill(255);
            rect(0, 0, 467, 100);
          }
          if (charY<395&&charX>400&&charX<467) {
            fill(255);
            rect(399, 0, 68, 394);
          }
          if (charY>329&&charY<392&&charX>400&&charX<606) {
            fill(255);
            rect(399, 329, 207, 65);
          }
          if (charY>29&&charY<394&&charX>526&&charX<606) {
            fill(255);
            rect(527, 29, 79, 367);
          }
          if (charY>29&&charY<85&&charX>526&&charX<740) {
            fill(255);
            rect(527, 29, 213, 56 );
          }
          //Path With getKey Switch
          if (charY>29&&charY<716&&charX>666&&charX<740) {
            fill(255);
            rect(666, 29, 74, 687 );
            fill(100);
            if (getKey) {
              fill(200);
            }
            rect(679, 696, 50, 20);
          }
          if (charY>433&&charY<505&&charX>526&&charX<740) {
            fill(255);
            rect(526, 433, 214, 72 );
          }
          if (charY>433&&charY<716&&charX>526&&charX<606) {
            fill(255);
            rect(526, 433, 80, 350 );
          }
          if (charY>649&&charX<606) {
            fill(255);
            rect(0, 649, 606, 350 );
          }
          if (charY>613&&charX<467) {
            fill(255);
            rect(0, 614, 467, 350 );
          }
          //path with gotKey switch
          if (charY>434&&charX>400&&charX<467) {
            fill(255);
            rect(400, 434, 67, 350 );
            fill(100);
            if (gotKey) {
              fill(200);
            }
            rect(410, 434, 50, 20);
          }
          if (charY>110-width/40/2 && charY<125+width/40/2) {
            fill(255);
            rect(0, 110, width, 15);
          }
          if (charY>235-width/40/2 && charY<250+width/40/2) {
            fill(255);
            rect(0, 235, width, 15);
          }
          if (charY>545-width/40/2 && charY<560+width/40/2) {
            fill(255);
            rect(0, 545, width, 15);
          }
          //character
          fill(#7705A5);
          ellipse(charX, charY, width/40, height/24);
          //Blocks
          fill(0);
          //Borders
          rect(0, 0, width/1.5, 30);
          rect(0, 100, width/3, height/1.4);
          rect(0, 700, width/3, 50);
          rect(0, 715, width, 50);
          rect(0, 394, width/1.8, 40);
          rect(870, 0, width, height);

          //borderthing

          rect(740, 0, 60, 110);
          rect(740, 125, 60, 110);
          rect(740, 250, 60, 295);
          rect(740, 560, 60, 250);

          //top left

          rect(467, 0, 60, 110);
          rect(467, 125, 60, 110);
          rect(467, 250, 60, 80);

          //topright

          rect(606, 85, 61, 25);
          rect(606, 125, 61, 110);
          rect(606, 250, 61, 170);

          //bottom right

          rect(606, 505, 60, 40);
          rect(606, 560, 60, 180);


          //bottom left

          rect(467, 430, 60, 115);
          rect(467, 560, 60, 90);
          charX = charX - width/600;
        }
      }

      //close door
      if (!(openDoor)) {
        fill(0);
        rect(0, 613, 390, 200);
        if (charX<390+width/40/2 && charY>height/2) {
          if (key == 'a' || key == 'A') {
            charX = charX + width/600;
          }
        }
      }
      if (charX<0+width/40/2 && charY<height/2) {
        if (key == 'a' || key == 'A') {
          charX = charX + width/600;
        }
      }


      //have to make the bots rectMode enter to attack the player better
      rectMode(CENTER);
      //bots move out
      fill(255, 0, 0);
      rect(botX, botY, width/40, height/24); 
      if (up) {
        botY = botY -7;

        if (botY<20) {
          println("down");
          up = false;
          down = true;
        }
      }

      if (down) {
        botY = botY +7;


        if (botY>650) {
          println("up");
          down = false;
          up = true;
        }
      }
      //bot2
      fill(255, 0, 0);
      rect(botX2, botY2, width/40, height/24); 
      if (up2) {
        botY2 = botY2 -7;

        if (botY2<20) {
          println("down");
          up2 = false;
          down2 = true;
        }
      }

      if (down2) {
        botY2 = botY2 +7;


        if (botY2>650) {
          println("up");
          down2 = false;
          up2 = true;
        }
      }












      //THE DEATH BOTS ATTACKS
      if ((botY>110-width/40/2 && botY<125+width/40/2)&&(charY>110-width/40/2 && charY<125+width/40/2)) {
        wordCount = wordCount +1;
        if (wordCount>0) {
          left = false;
          right = false;
          up = false;
          down = false;
          left2 = false;
          right2 = false;
          up2 = false;
          down2 = false;
          playerTalk = true;
        }
        if (wordCount>100) {
          background(255, 0, 0);
        }
        if (wordCount>200) {
          wordCount = 0;
          up = true;
          up2 = true;
          charX = 32;
          charY = 65;
          getKey = false;
          openDoor = false;
          playerTalk = false;
          checkObject = false;
          gotKey = false;
          botY = 30;
          botX = 816;
          botY2 = 650;
          botX2 = 816;
          rectMode(CORNER);
        }
      }


      if ((botY>235-width/40/2 && botY<250+width/40/2)&&(charY>235-width/40/2 && charY<250+width/40/2)) {
        wordCount = wordCount +1;
        if (wordCount>0) {
          left = false;
          right = false;
          up = false;
          down = false;
          left2 = false;
          right2 = false;
          up2 = false;
          down2 = false;
          playerTalk = true;
        }
        if (wordCount>100) {
          background(255, 0, 0);
        }
        if (wordCount>200) {
          wordCount = 0;
          up = true;
          up2 = true;
          charX = 32;
          charY = 65;
          getKey = false;
          openDoor = false;
          playerTalk = false;
          checkObject = false;
          gotKey = false;
          botY = 30;
          botX = 816;
          botY2 = 650;
          botX2 = 816;
          rectMode(CORNER);
        }
      }




      if ((botY>545-width/40/2 && botY<560+width/40/2)&&(charY>545-width/40/2 && charY<560+width/40/2)) {
        wordCount = wordCount +1;
        if (wordCount>0) {
          left = false;
          right = false;
          up = false;
          down = false;
          left2 = false;
          right2 = false;
          up2 = false;
          down2 = false;
          playerTalk = true;
        }
        if (wordCount>100) {
          background(255, 0, 0);
        }
        if (wordCount>200) {
          wordCount = 0;
          up = true;
          up2 = true;
          charX = 32;
          charY = 65;
          getKey = false;
          openDoor = false;
          playerTalk = false;
          checkObject = false;
          gotKey = false;
          botY = 30;
          botX = 816;
          botY2 = 650;
          botX2 = 816;
          rectMode(CORNER);
        }
      }
      //bot2
      if ((botY2>110-width/40/2 && botY2<125+width/40/2)&&(charY>110-width/40/2 && charY<125+width/40/2)) {
        wordCount = wordCount +1;
        if (wordCount>0) {
          left = false;
          right = false;
          up = false;
          down = false;
          left2 = false;
          right2 = false;
          up2 = false;
          down2 = false;
          playerTalk = true;
        }
        if (wordCount>100) {
          background(255, 0, 0);
        }
        if (wordCount>200) {
          wordCount = 0;
          up = true;
          up2 = true;
          charX = 32;
          charY = 65;
          getKey = false;
          openDoor = false;
          playerTalk = false;
          checkObject = false;
          gotKey = false;
          botY = 30;
          botX = 816;
          botY2 = 650;
          botX2 = 816;
          rectMode(CORNER);
        }
      }


      if ((botY2>235-width/40/2 && botY2<250+width/40/2)&&(charY>235-width/40/2 && charY<250+width/40/2)) {
        wordCount = wordCount +1;
        if (wordCount>0) {
          left = false;
          right = false;
          up = false;
          down = false;
          left2 = false;
          right2 = false;
          up2 = false;
          down2 = false;
          playerTalk = true;
        }
        if (wordCount>100) {
          background(255, 0, 0);
        }
        if (wordCount>200) {
          wordCount = 0;
          up = true;
          up2 = true;
          charX = 32;
          charY = 65;
          getKey = false;
          openDoor = false;
          playerTalk = false;
          checkObject = false;
          gotKey = false;
          botY = 30;
          botX = 816;
          botY2 = 650;
          botX2 = 816;
          rectMode(CORNER);
        }
      }




      if ((botY2>545-width/40/2 && botY2<560+width/40/2)&&(charY>545-width/40/2 && charY<560+width/40/2)) {
        wordCount = wordCount +1;
        if (wordCount>0) {
          left = false;
          right = false;
          up = false;
          down = false;
          left2 = false;
          right2 = false;
          up2 = false;
          down2 = false;
          playerTalk = true;
        }
        if (wordCount>100) {
          background(255, 0, 0);
        }
        if (wordCount>200) {
          wordCount = 0;
          up = true;
          up2 = true;
          charX = 32;
          charY = 65;
          getKey = false;
          openDoor = false;
          playerTalk = false;
          checkObject = false;
          gotKey = false;
          botY = 30;
          botX = 816;
          botY2 = 650;
          botX2 = 816;
          rectMode(CORNER);
        }
      }





      //left switch
      if (charX > 339 && charX < 467 && charY > 421 && charY <479) {
        if (!(gotKey)) {
          textSize(20);
          fill(255, 255, 0);
          text("Press E to Interact", width/2, height/50);
          if (keyPressed) {
            if ((key == 'e' || key == 'E')) {
              gotKey = true;
            }
          }
        }
      }


      //right switch
      if (charX > 666 && charX < 739 + 73 && charY > 660) {
        if (!(getKey)) {
          textSize(20);
          fill(255, 255, 0);
          text("Press E to Interact", width/2, height/50);
          if (keyPressed) {
            if ((key == 'e' || key == 'E')) {
              getKey = true;
            }
          }
        }
      }


      // press e to open door
      if (charX < 421 && charY>571) {
        if ((!(getKey)) || (!(gotKey)) && (!(openDoor))) {
          textSize(20);
          fill(255, 255, 0);
          text("Press E to Interact", width/2, height/50);
          if (keyPressed) {
            if ((key == 'e' || key == 'E')) {
              checkObject = true;
            }
          }
        }
        if (getKey && gotKey && (!(openDoor))) {
          textSize(20);
          fill(255, 255, 0);
          text("Press E to Interact", width/2, height/50);
          if (keyPressed) {
            if ((key == 'e' || key == 'E')) {
              openDoor = true;
            }
          }
        }
      }



      //the door is locked
      if (checkObject && ((!(getKey)) || (!(gotKey)))) {
        playerTalk = true;
        text.resize(0, 300);
        image(text, 0, height/1.5);
        player.resize(0, 700);
        image(player, playerPicX, height/8+ height/20);

        if (playerPicX < width/15) {
          playerPicX = playerPicX + 50;
        }

        if (playerPicX >= width/15 && playerTalk) {
          textSize(30);
          fill(0);
          textAlign(CENTER, CENTER);
          wordCount = wordCount + 1;

          if (wordCount>7) {
            text("The", width/2.95, height/1.3);
          }
          if (wordCount>14) {
            text("door", width/2.50, height/1.3);
          }
          if (wordCount>21) {
            text("isn't", width/2.17, height/1.3);
          }
          if (wordCount>28) {
            text("opening...", width/1.80, height/1.3);
          }
          if (wordCount>40) { 
            playerTalk = false;
            checkObject = false;
            playerPicX = playerPicX +0;
            playerPicX = -1000;
            wordCount = wordCount +0;
            wordCount = 0;
          }
        }
      }
      rectMode(CORNER);
      if (charX<0 &&charY>height/2) {
        room = 3;
        charX = 1100;
        charY = height/2;
        getKey = false;
        openDoor = false;
        playerTalk = true;
        checkObject = false;
        gotKey = false;
        getKey = false;
        room = room + 1;
        movingNextRoom = true;
        mapX = 713;
        mapY = 453;
      }
    }
  }





  /*
  
   THE FINNAL IS HERE
   YOU READY
   THIS ONE HAS A BOSS
   IT WAS FUN TO MAKE THIS ONE
   I THINK
   
   r4
   
   
   
   
   
   rrrrrrrrr           rrrrr
   rrrrrrrrrr        rr  rr
   rr      rrr      rr   rr
   rr      rr      rr    rr
   rr    rrr      rrrrrrrrrrrr
   rrrrrrr               rr
   rrrrrrr               rr
   rr    rr              rr
   rr     rr             rr
   rr      rr            rr
   rr       rr           rr
   
   
   
   
   
   
   
   
   
   
   
   */





  //check if room 4
  if (room>3 && room<5) {
    if (movingNextRoom) {
      wordCount = wordCount + 1;

      background(0);
      image(map, 200, 100);
      noStroke();
      fill(#7705A5);
      ellipse(mapX, mapY, width/80, height/48);

      mapX = mapX - 0.5;
      if (mapX < 659) {
        mapX = mapX + 0;
        mapX = 659;
      }

      if (wordCount>150) {
        movingNextRoom = false;
        wordCount = 0;
        wordCount = wordCount + 0;
      }
    }
    if (!(movingNextRoom)) {
      constrain(shield, 300, 0);
      background(255);
      noStroke();
      rectMode(CENTER);
      fill(200);
      if (switch1) {
        fill(100);
      }
      rect(width/5, height/5, 50, 50);
      fill(200);
      if (switch2) {
        fill(100);
      }
      rect(width/5*4, height/5*4, 50, 50);
      fill(200);
      if (switch3) {
        fill(100);
      }
      rect(width/5, height/5*4, 50, 50);
      fill(200);
      if (switch4) {
        fill(100);
      }
      rect(width/5*4, height/5, 50, 50);


      fill(#7705A5);
      ellipse(charX, charY, width/40, height/24);
      //Movement
      if (keyPressed) {
        if (key == 'w' || key == 'W') {
          background(255);
          noStroke();
          fill(200);
          if (switch1) {
            fill(100);
          }
          rect(width/5, height/5, 50, 50);
          fill(200);
          if (switch2) {
            fill(100);
          }
          rect(width/5*4, height/5*4, 50, 50);
          fill(200);
          if (switch3) {
            fill(100);
          }
          rect(width/5, height/5*4, 50, 50);
          fill(200);
          if (switch4) {
            fill(100);
          }
          rect(width/5*4, height/5, 50, 50);
          fill(#7705A5);
          ellipse(charX, charY, width/40, height/24);

          charY = charY - height/360;
        }
        if (key == 'a' || key == 'A') {
          background(255);
          noStroke();
          fill(200);
          if (switch1) {
            fill(100);
          }
          rect(width/5, height/5, 50, 50);
          fill(200);
          if (switch2) {
            fill(100);
          }
          rect(width/5*4, height/5*4, 50, 50);
          fill(200);
          if (switch3) {
            fill(100);
          }
          rect(width/5, height/5*4, 50, 50);
          fill(200);
          if (switch4) {
            fill(100);
          }
          rect(width/5*4, height/5, 50, 50);
          fill(#7705A5);
          ellipse(charX, charY, width/40, height/24);

          charX = charX - width/600;
        }
        if (key == 's' || key == 'S') {
          background(255);
          noStroke();
          fill(200);
          if (switch1) {
            fill(100);
          }
          rect(width/5, height/5, 50, 50);
          fill(200);
          if (switch2) {
            fill(100);
          }
          rect(width/5*4, height/5*4, 50, 50);
          fill(200);
          if (switch3) {
            fill(100);
          }
          rect(width/5, height/5*4, 50, 50);
          fill(200);
          if (switch4) {
            fill(100);
          }
          rect(width/5*4, height/5, 50, 50);

          fill(#7705A5);
          ellipse(charX, charY, width/40, height/24);

          charY = charY + height/360;
        }
        if (key == 'd' || key == 'D') {
          background(255);
          noStroke();
          fill(200);
          if (switch1) {
            fill(100);
          }
          rect(width/5, height/5, 50, 50);
          fill(200);
          if (switch2) {
            fill(100);
          }
          rect(width/5*4, height/5*4, 50, 50);
          fill(200);
          if (switch3) {
            fill(100);
          }
          rect(width/5, height/5*4, 50, 50);
          fill(200);
          if (switch4) {
            fill(100);
          }
          rect(width/5*4, height/5, 50, 50);
          fill(#7705A5);
          ellipse(charX, charY, width/40, height/24);

          charX = charX + width/600;
        }
      }



      //Map 
      fill(0);
      rect(width/2, 0, width, 140);
      rect(width/2, height, width, 140);
      rect(0, 0, 50, height/1.2);
      rect(0, height, 50, height/1.2);
      rect(width, 0, 50, height/1.2);
      rect(width, height, 50, height/1.2);






      //Talk before the battle


      if (playerTalk) {
        println("Start cutscene");
        wordCount = wordCount + 1;

        if (!(switch1 && switch2 && switch3 && switch4)) {

          if (wordCount>210) {
            noStroke();
            fill(255, 0, 0);
            rect(bossX, bossY, 100, 100); 
            stroke(0);
            strokeWeight(5);
            fill(charge, 50, 50);
            rect(bossX, bossY, 50, 50);
            noStroke();
            bossX = bossX + 5;
            if (bossX > 400) {
              bossX = bossX + 0;
              bossX = 400;
            }
          }


          if (wordCount>0 && wordCount<500) {
            text.resize(0, 300);
            image(text, 0, height/1.5);
          }


          if (wordCount>0 ) {
            if (wordCount<500) {
              player.resize(0, 700);
              image(player, playerPicX, height/8+ height/20);
              shield = 0;
            }
            if (playerPicX < width/15) {
              playerPicX = playerPicX + 50;
            }

            if (playerPicX >= width/15) {
              textSize(30);
              fill(0);
              textAlign(CENTER, CENTER);

              if (wordCount>30  && wordCount<210) {
                text("Where", width/3, height/1.3);
              }
              if (wordCount>60  && wordCount<210) {
                text("am", width/2.50, height/1.3);
              }
              if (wordCount>90  && wordCount<210) {
                text("I", width/2.30, height/1.3);
              }
              if (wordCount>120  && wordCount<210) {
                text("right", width/2.10, height/1.3);
              }
              if (wordCount>150 && wordCount<210) {
                text("now?", width/1.83, height/1.3);
              }


              textSize(30);
              fill(0);
              textAlign(CENTER, CENTER);
              if (wordCount>240 && wordCount<500) {
                text("I", width/3+random(-2, 2), height/1.3+random(-2, 2));
              }
              if (wordCount>270 && wordCount<500) {
                text("seem", width/2.61+random(-2, 2), height/1.3+random(-2, 2));
              }
              if (wordCount>300 && wordCount<500) {
                text("to", width/2.27+random(-2, 2), height/1.3+random(-2, 2));
              }
              if (wordCount>330 && wordCount<500) {
                text("be", width/2.07+random(-2, 2), height/1.3+random(-2, 2));
              }
              if (wordCount>360 && wordCount<500) {
                text("in", width/1.90+random(-2, 2), height/1.3+random(-2, 2));
              }
              if (wordCount>390 && wordCount<500) {
                text("danger...", width/1.65+random(-2, 2), height/1.3+random(-2, 2));
              }

              //draw health bar and boss health bars
              if (wordCount>500) {
                shield = shield + 5;
                if (shield>200) {
                  shield = 200;
                  shield = shield + 0;
                }
                fill(#7705A5);
                rect(width/2, 700, shield, 20);
                fill(255, 0, 0);
                rect(width/9, 40, 100, 20);
              }
              if (wordCount>560) {
                rect(width/9*3, 40, 100, 20);
              }

              if (wordCount>590) {
                rect(width/9*6, 40, 100, 20);
              }
              if (wordCount>620) {
                rect(width/9*8, 40, 100, 20);
                fill(0);
                //left door
                rect(0, height/2, 40, height/1.5);
              }



              if (wordCount>700) {
                playerTalk = false;
                playerPicX = playerPicX +0;
                playerPicX = -1000;
                wordCount = wordCount +0;
                wordCount = 0;
              }
            }
          }
        }

        // after boss is defeat player talks
        if (switch1 && switch2 && switch3 && switch4) {
          println("Start cutscene");

          wordCount = wordCount + 1;
          noStroke();
          fill(150, 0, 0);
          rect(bossX, bossY, 100, 100); 
          stroke(0);
          strokeWeight(5);
          fill(50, 50, 50);
          rect(bossX, bossY, 50, 50);
          noStroke();
          if (wordCount>100) {
            text.resize(0, 300);
            image(text, 0, height/1.5);
          }
          if (wordCount>100 ) {
            player.resize(0, 700);
            image(player, playerPicX, height/8+ height/20);
            shield = 0;
            if (playerPicX < width/15) {
              playerPicX = playerPicX + 50;
            }

            if (playerPicX >= width/15) {
              textSize(30);
              fill(0);
              textAlign(CENTER, CENTER);

              if (wordCount>120) {
                text("I", width/3+random(-2, 2), height/1.3+random(-2, 2));
              }
              if (wordCount>160) {
                text("survived...", width/2.42+random(-2, 2), height/1.3+random(-2, 2));
              }
              if (wordCount>250) { 
                room = room + 1;
                wordCount = 0;
              }
            }
          }
        }
      }






      if (playerTalk) {
        if (keyPressed) {
          if (key == 'w' || key == 'W') {

            charY = charY + height/360;
          }
          if (key == 'a' || key == 'A') {

            charX = charX + width/600;
          }
          if (key == 's' || key == 'S') {

            charY = charY - height/360;
          }
          if (key == 'd' || key == 'D') {

            charX = charX - width/600;
          }
        }
      }










      //Collisions





      while ((charX > 0 -width/40/2 && charX < 0 + width +width/40/2 && charY > 0-height/24/2 && charY < 0+ 70 +height/24/2) ||
        (charX > 0 -width/40/2 && charX < 0 + width +width/40/2 && charY > 650-height/24/2 && charY < 650+ 70 +height/24/2)||
        (charX > 1175 -width/40/2)||
        (charX < 25 +width/40/2)

        ) {

        if (key == 'w' || key == 'W') {
          background(255);
          noStroke();
          fill(200);
          if (switch1) {
            fill(100);
          }
          rect(width/5, height/5, 50, 50);
          fill(200);
          if (switch2) {
            fill(100);
          }
          rect(width/5*4, height/5*4, 50, 50);
          fill(200);
          if (switch3) {
            fill(100);
          }
          rect(width/5, height/5*4, 50, 50);
          fill(200);
          if (switch4) {
            fill(100);
          }
          rect(width/5*4, height/5, 50, 50);
          fill(#7705A5);
          ellipse(charX, charY, width/40, height/24);

          charY = charY + height/360;
        }
        if (key == 'a' || key == 'A') {
          background(255);
          noStroke();
          fill(200);
          if (switch1) {
            fill(100);
          }
          rect(width/5, height/5, 50, 50);
          fill(200);
          if (switch2) {
            fill(100);
          }
          rect(width/5*4, height/5*4, 50, 50);
          fill(200);
          if (switch3) {
            fill(100);
          }
          rect(width/5, height/5*4, 50, 50);
          fill(200);
          if (switch4) {
            fill(100);
          }
          rect(width/5*4, height/5, 50, 50);
          fill(#7705A5);
          ellipse(charX, charY, width/40, height/24);

          charX = charX + width/600;
        }
        if (key == 's' || key == 'S') {
          background(255);
          noStroke();
          fill(200);
          if (switch1) {
            fill(100);
          }
          rect(width/5, height/5, 50, 50);
          fill(200);
          if (switch2) {
            fill(100);
          }
          rect(width/5*4, height/5*4, 50, 50);
          fill(200);
          if (switch3) {
            fill(100);
          }
          rect(width/5, height/5*4, 50, 50);
          fill(200);
          if (switch4) {
            fill(100);
          }
          rect(width/5*4, height/5, 50, 50);
          fill(#7705A5);
          ellipse(charX, charY, width/40, height/24);

          charY = charY - height/360;
        }
        if (key == 'd' || key == 'D') {
          background(255);
          noStroke();
          fill(200);
          if (switch1) {
            fill(100);
          }
          rect(width/5, height/5, 50, 50);
          fill(200);
          if (switch2) {
            fill(100);
          }
          rect(width/5*4, height/5*4, 50, 50);
          fill(200);
          if (switch3) {
            fill(100);
          }
          rect(width/5, height/5*4, 50, 50);
          fill(200);
          if (switch4) {
            fill(100);
          }
          rect(width/5*4, height/5, 50, 50);
          fill(#7705A5);
          ellipse(charX, charY, width/40, height/24);

          charX = charX - width/600;
        }
      }
















      //BOSS ATTACKS
      if (!(playerTalk)) {   
        wordCount = wordCount + 1;
        if (wordCount>0 && wordCount<399 && (!(switch1 && switch2 && switch3 && switch4))) {
          charge = charge + 1;
        }
        if (switch1 && switch2 && switch3 && switch4) {
          wordCount = 0;
        }

        if (wordCount>300) {
          bossAttack = true;
        }

        if (bossAttack) {
          if (wordCount>400) {
            fill(255, 100, 100);
            rect(-width, bossY, width*width, 50);
            rect(bossX, -height, 50, height*height);
            if (charX+ width/40 > bossX && charX - width/40 < bossX) {
              shield = shield -5;
              if (shield < 1) {
                if (!(gameOver)) {
                  gameOver = true;
                  wordCount = 0;
                }
              }
            }
            if (charY+height/24 > bossY && charY-height/24<bossY) {
              shield = shield -5;
              if (shield < 1) {
                if (!(gameOver)) {
                  gameOver = true;
                  wordCount = 0;
                }
              }
            }
          }
          if (wordCount>500) {
            wordCount = 0;
            charge = 0;
            bossAttack = false;
          }
        }



        noStroke();
        fill(255, 0, 0);
        rect(bossX, bossY, 100, 100); 
        stroke(0);
        strokeWeight(5);
        fill(charge, 50, 50);
        rect(bossX, bossY, 50, 50);
        noStroke();

        //Boss movement
        if ((!(switch1 && switch2 && switch3 && switch4)) || (!(gameOver))) { 
          if (charX>bossX) {
            bossX =bossX + 1 * bossSpeed;
          }
          if (charX<bossX) {
            bossX =bossX - 1 * bossSpeed;
          }

          if (charY>bossY) {
            bossY =bossY + 1 * bossSpeed;
          }
          if (charY<bossY) {
            bossY =bossY - 1 * bossSpeed;
          }
        }
        //die on touch
        if (charX > bossX-50 && charX<bossX+50 && charY > bossY-50 && charY<bossY+50) {
          shield = shield -10;
          if (shield < 1) {
            if (!(gameOver)) {
              gameOver = true;
              wordCount = 0;
            }
          }
        }
        //Map 
        fill(0);
        rect(width/2, 0, width, 140);
        rect(width/2, height, width, 140);
        rect(0, 0, 50, height/1.2);
        rect(0, height, 50, height/1.2);
        rect(width, 0, 50, height/1.2);
        rect(width, height, 50, height/1.2);
        //right door
        rect(width, height/2, 40, height/1.5);

        if (!(openDoor)) {
          //left door
          rect(0, height/2, 40, height/1.5);
        }

        fill(50);
        rect(width/2, 700, 200, 20);
        //HealthBarPlayer
        if (shield>0) {
          fill(#7705A5);
          rect(width/2, 700, shield, 20);
        }

        //Boss Health
        fill(255, 0, 0);
        if (switch1) {
          fill(50);
        }
        rect(width/9, 40, 100, 20);
        fill(255, 0, 0);
        if (switch2) {
          fill(50);
        }
        rect(width/9*3, 40, 100, 20);
        fill(255, 0, 0);
        if (switch3) {
          fill(50);
        }
        rect(width/9*6, 40, 100, 20);
        fill(255, 0, 0);
        if (switch4) {
          fill(50);
        }
        rect(width/9*8, 40, 100, 20);
      }






      // Top left switch
      if (charX > 215 && charX < 265 && charY > 120 && charY <170) {
        if (!(switch1)) {
          textSize(20);
          fill(255, 255, 0);
          text("Press E to Interact", width/2, height/50);
          if (keyPressed) {
            if ((key == 'e' || key == 'E')) {
              switch1 = true;
              bossSpeed = bossSpeed + 0.1;
            }
          }
        }
      }



      //Top right switch
      if (charX > 935 && charX < 985 && charY > 120 && charY <170) {
        if (!(switch4)) {
          textSize(20);
          fill(255, 255, 0);
          text("Press E to Interact", width/2, height/50);
          if (keyPressed) {
            if ((key == 'e' || key == 'E')) {
              switch4 = true;
              bossSpeed = bossSpeed + 0.1;
            }
          }
        }
      }

      //bottom left switch

      if (charX > 215 && charX < 265 && charY > 550 && charY <600) {
        if (!(switch3)) {
          textSize(20);
          fill(255, 255, 0);
          text("Press E to Interact", width/2, height/50);
          if (keyPressed) {
            if ((key == 'e' || key == 'E')) {
              switch3 = true;
              bossSpeed = bossSpeed + 0.1;
            }
          }
        }
      }



      //bottom right switch
      if (charX > 935 && charX < 985 && charY > 550 && charY <600) {
        if (!(switch2)) {
          textSize(20);
          fill(255, 255, 0);
          text("Press E to Interact", width/2, height/50);
          if (keyPressed) {
            if ((key == 'e' || key == 'E')) {
              switch2 = true;
              bossSpeed = bossSpeed + 0.1;
            }
          }
        }
      }

      //activate all four switches to talk
      if (switch1 && switch2 && switch3 && switch4) {
        playerTalk = true;
      }

      //you lose get gud
      if (gameOver) {
        charX = 1100;
        charY = height/2;
        bossX = -200;
        bossY = height/2;
        switch1 = false;
        switch2 = false;
        switch3 = false;
        switch4 = false;
        shield = 200;
        charge = 0;
        bossSpeed = 1;
        room = 3;
        charX = 1100;
        charY = height/2;
        getKey = false;
        openDoor = false;
        playerTalk = true;
        checkObject = false;
        gotKey = false;
        getKey = false;
        room = room + 1;
        movingNextRoom = true;
        mapX = 713;
        mapY = 453;
        gameOver = false;
      }
    }
  }


  /*CREDITS YES FINNALY
   
   
   
   
   BWHAHAHAHAHAHAHHA
   
   
   I did like 99.9% of this
   expect for the background of the titlescreen
   But it was a royalty free image  that i edited heavily so calm down
   
   
   
   */
  //yes the credits are in room bigger than 4
  if (room>4) {
    println("lets us begin");
    background(0);
    textFont(font2);
    textAlign(CENTER, CENTER);
    wordCount = wordCount + 1;
    constrain(wordCount, 0, 3000);
    constrain(colour, -255, 255);
    if (wordCount>100 && wordCount<1250) {
      textSize(20);
      fill(colour, colour, 0);
      colour = colour + 1;
      text("Hold E to Speed Up", width/2, height/50);
    }

    //press e to skip if you doing a speed run
    if (keyPressed) {
      if (key== 'e' || key == 'E') {
        wordCount = wordCount + 50;
      }
    }

    //I don't know how to end games like this? So um.. lets do this?
    if (wordCount>50 && wordCount<150) {
      textSize(50);
      fill(255);
      text("After stopping that thing", width/2, height/2);
    }
    if (wordCount>250 && wordCount<350) {
      textSize(50);
      fill(255);
      text("The protagonist was able to escape", width/2, height/2);
    }
    if (wordCount>450 && wordCount<550) {
      textSize(70);
      fill(255);
      text("But however...", width/2, height/2);
    }
    if (wordCount>650 && wordCount<750) {
      textSize(50);
      fill(255);
      text("Will this story...", width/2, height/2);
    }
    if (wordCount>850 && wordCount<950) {
      textSize(80);
      fill(255);
      text("Get a happy ending?", width/2, height/2);
    }
    if (wordCount>1250) {
      textSize(100);
      fill(255);
      text("Finished For Now", width/2, height/2);
    }

    if (wordCount>1550) {
      background(255);
      //silhouette.resize(0, 730);
      //image(silhouette, 0, 0);
    }
    //yes perfect
    if (wordCount>1650 && wordCount<1750) {
      textSize(100);
      fill(0);
      text("Credits", width/2, height/2);
    }
    //me
    if (wordCount>1850 && wordCount<1950) {
      textSize(100);
      fill(0);
      text("Artists: Dario", width/2, height/2);
    }
    //me
    if (wordCount>2050 && wordCount<2150) {
      textSize(100);
      fill(0);
      text("Producers: Dario Au", width/2, height/2);
    }
    //me
    if (wordCount>2250 && wordCount<2350) {
      textSize(100);
      fill(0);
      text("Designers: Dario Au", width/2, height/2);
    }
    //me
    if (wordCount>2450 && wordCount<2550) {
      textSize(100);
      fill(0);
      text("Programmers: Dario Au", width/2, height/2);
    }
    //there isn't any sound in the game, sooooooooo
    if (wordCount>2650 && wordCount<2750) {
      textSize(100);
      fill(0);
      text("Audio:       ", width/2, height/2);
    }
    if (wordCount>2850) {
      textSize(100);
      fill(0);
      text("Thanks For Playing", width/2, height/2);
      textSize(20);
      text("click to leave", width/2, height/50);
      if (mousePressed) {
        if (mouseButton == LEFT) {
          //Accurate Numbers
          charX = 600;
          charY = 360;
          mapX = 0;
          mapY = 0;
          //Big Numbers
          floor = 1;
          room = -2;
          playerPicX = -1000;
          npcPicX = 2200;
          npcX = 479;
          npcY = 631;
          botX = 0;
          botY = 0;
          botX2 = 0;
          botY2 = 0;
          name = 0;
          wordCount = 0;
          introBack = 0;
          colour = 0;
          leaveTitle = -1200;
          getKey = false; //used for getting keys
          openDoor = false;//used for opening doors
          autoDoor = false;//used for opening doors
          playerTalk = false;//the player is talking, be patient
          checkObject = false; // if the player is analyzing an object this has a 50/50 chance of being used
          gotKey = false; // used if player has a key but alsp used for other stuff not key related
          showMap = false; // shows a minimap at the end of every room
          randomMumble = false;// the player is going crazy, likes talking for no reason
          movingNextRoom = false;//moves to the next room, what else would it do?
          leaveTitleStart = false;//leaves the title screen
          gameOver = false;//game over you lost git gud
          controls = false;// instructions are for the weak
          //bot controls
          left = false;  
          right = false;   
          up = true;   
          down = false;   
          left2 = false;  
          right2 = false;   
          up2 = true;   
          down2 = false;  
          charge = 0;
          bossSpeed = 1;
          shield = 200;
          bossX = -200;
          bossY = 360;
          bossAttack = false;
          shoot = true;
          switch1 = false;
          switch2 = false;
          switch3 = false;
          switch4 = false;
        }
      }
    }
  }






  //so i use this to see my mouse and to see how fast dialog is
  println(mouseX, "MouseX", mouseY, "MouseY");//mouse xy
  println(wordCount);//dialog speed
  println(botX, botY, "botXY");//bots xy
  println(switch1, switch2, switch3, switch4, playerTalk, gameOver);//true/false for stuff
}//Void Draw
