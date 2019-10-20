class MainMenuState extends State
{

  MainMenuState(){
    orientation(LANDSCAPE);

  }
 
  void update(){
    textFont(font);
    fill(255);
   
    textSize(100);
    textAlign(CENTER, BOTTOM);
    text("Welcome to Pocket Planets!", width/2, height/2 - 100);
    
    
    textSize(65);
    textAlign(CENTER, CENTER);
    text("Press anywhere to play!", width/2, height/2 + 150);
   

    
    if(touchIsStarted){
        println("touch started");
        //go to the homepage of the game, starBuilderState
        
    }
  }
  

}
