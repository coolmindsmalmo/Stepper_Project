  //         ---               COOL MINDS ENKLA SPELKIT              ---
  //
  // Detta är den huvudsakliga spelklassen. Genom att förlänga klassen "game",
  // och ge den sina egna klasser, blir det enklare att göra ett spel.
  //
  //
  //         ---              INSTRUKTIONER  FÖR KLASSEN             ---
  //
  // 1. Spelets data-folder.
  // Den enda variabeln vi behöver deklarera är spelets namn. Detta används i 
  // huvudmenyn, men framför allt för att bestämma var spelets extena filer 
  // befinner sig.
  //
  // Skapa en ny folder i data-foldern, och ge den exakt samma namn som- variabeln
  // gameName. Klassen försöker automatiskt att hitta ett par filer -
  // - Spelets huvudsakliga typsnitt (Filen bör heta Main Font)
  // - Spelets huvudsakliga musikslinga (Filen bör heta Music)
  // - Spelets förhandsgransknings-bild i huvudmenyn (Filen bör heta Preview Image)
  //
  // 2.
  // I konstruktorn, börja med att kalla super(); Detta gör så att basklassen laddar
  // in alla fördefinerade assets. Därefter använder man addSoundEffect(String filnamn),
  // och addGameObject(gameObject som man vill ska loopa).
  // 
  // 3.
  // Man kör spelet genom att kalla game.play() i draw. Vill man visa en Game Over-skärm, 
  // och en highscore-skärm, så kallar man antingen gameOver(), eller highscore(). Klassen
  // kommer då att köra de klasserna som man i förra steget definerade.
  // Vill man stoppa spelet så kan man enkelt göra det via endGame().
  // Vill man reseta spelet, så är det enklast att göra det genom att deklarera en ny 
  // instans av spelet.
  
class asteroidEscape extends game {
  
  public String gameName = "Asteroid Escape";
    
  public asteroidEscape() {
    super("Asteroid Escape");
    
    //Dessa kommer man åt genom att referera till soundEffects[x], där x är dess position i 
    //ordningen man lade till dom, med start 0
    addSoundEffect("Game Over Sound.wav");
    addSoundEffect("Hit Sound.wav");
    addSoundEffect("Explosion Sound.wav");
    
    //gameOverScreen = new gameOver(this);
    highscoreScreen = new highscoreScreen(this);
    
    UI = new gameUI(this);
    
    addGameObject(new environment(this));
    addGameObject(UI);
    addGameObject(new player(this, UI));
  }
}