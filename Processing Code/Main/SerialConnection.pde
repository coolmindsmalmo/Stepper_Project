class serialConnection {
  Serial myPort;
  boolean noPort = false;

  public serialConnection() {
    try {
      String portName = Serial.list()[0];
      myPort = new Serial(getPApplet(), portName, 9600);
      myPort.buffer(0);
    }
    catch(Exception e) {
      println(" No serial ports : presss space to activate ");
      noPort=true;
    }
  }

  public void update() {
    if (!noPort) {  
      if (myPort.available() > 0) {
        bikeValue = myPort.read();     
        // println(bikeValue);

        if (bikeValue<252) {
        } else { 
          bikeValue = 252;
          switch(bikeValue) {
          case 256-1:
            leftButton=true;
            break;
          case 256-2:
            leftButton=false;
            break;
          case 256-3:
            rightButton=true;
            break;
          case 256-4:
            rightButton=false;
            break;
          }
        }       
      }
    }
  }
}