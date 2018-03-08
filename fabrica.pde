import oscP5.*;
import netP5.*;

OscP5 oscP5;
NetAddress myRemoteLocation;


void setup() {
  size(400, 400);
  frameRate(25);
  oscP5 = new OscP5(this, 5500);
  myRemoteLocation = new NetAddress("127.0.0.1", 7400);
  String recordings = "/Users/hannahdavis/Documents/Fabrica/recordings/";
  selectFolder(recordings, iterate_recordings);
}


void draw() {
  background(0);
}

void iterate_recordings(File thisFile) {
  println("hi");
}

//void mousePressed() {
//  OscMessage myMessage = new OscMessage("/fabbrica/carillon/pmetal1");
//  myMessage.add(0);

//  oscP5.send(myMessage, myRemoteLocation);
//  receive_sensor();
//}

//void receive_sensor(endpoint) {
//  OscMessage myMessage = new OscMessage(endpoint);
//  oscP5.send(myMessage, myRemoteLocation);
//}


/* incoming osc message are forwarded to the oscEvent method. */
void oscEvent(OscMessage theOscMessage) {
  /* print the address pattern and the typetag of the received OscMessage */
  println("### received an osc message.");
  if (theOscMessage.checkTypetag("ff")) { //float float - this is on the real server
    println("abs value: "+theOscMessage.get(0).floatValue());
    println("perc value: "+theOscMessage.get(1).floatValue());
  }
  if (theOscMessage.checkTypetag("if")) { //int float - this is on the simulator
    println("abs value: "+theOscMessage.get(0).intValue());
    println("perc value: "+theOscMessage.get(1).floatValue());
  }
  //print(theOscMessage.addrInt());
  //print(" addrpattern: "+theOscMessage.addrPattern());
  //println(" typetag: "+theOscMessage.typetag());
}