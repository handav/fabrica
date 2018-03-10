import oscP5.*;
import netP5.*;
import ddf.minim.*;
import ddf.minim.signals.*;
import controlP5.*;
import javax.sound.sampled.*;
import ddf.minim.ugens.*;

Minim              minim;
Minim              minim2;
Minim              minim3;
MultiChannelBuffer sampleBuffer;
MultiChannelBuffer sampleBuffer2;
MultiChannelBuffer sampleBuffer3;

AudioOutput        output;
AudioOutput        output2;
AudioOutput        output3;
Sampler            sampler;
Sampler            sampler2;
Sampler            sampler3;

Mixer.Info[] mixerInfo;

AudioPlayer player;
AudioPlayer player2;
AudioPlayer player3;

//OscP5 oscP5;
//NetAddress myRemoteLocation;


void setup() {
  size(400, 400);

  // create Minim and an AudioOutput
  minim  = new Minim(this);
  minim2  = new Minim(this);
  minim3  = new Minim(this);

  mixerInfo = AudioSystem.getMixerInfo();

  //for (int i = 0; i < mixerInfo.length; i++)
  //{
  //  println(i + " = " + mixerInfo[i].getName());
  //} 

  //Mixer mixer = AudioSystem.getMixer(mixerInfo[4]);
  //minim.setOutputMixer(mixer);
  //output = minim.getLineOut();

  sampleBuffer     = new MultiChannelBuffer( 1, 1024 );
  player = minim.loadFile("Fabrica_clip.mp3"); 
  println("about to play");
  player.play();
  frameRate(25);

  //oscP5 = new OscP5(this, 5500);
  //myRemoteLocation = new NetAddress("127.0.0.1", 7400);
  //String recordings = "/Users/hannahdavis/Documents/Fabrica/recordings/";
}


void draw() {
  background(0);
}

void mousePressed() {
  //sampleBuffer     = new MultiChannelBuffer( 1, 1024 );
  //player = minim.loadFile("Fabrica_clip.mp3"); 
  //player.play();
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
//void oscEvent(OscMessage theOscMessage) {
//  /* print the address pattern and the typetag of the received OscMessage */
//  println("### received an osc message.");
//  if (theOscMessage.checkTypetag("ff")) { //float float - this is on the real server
//    println("abs value: "+theOscMessage.get(0).floatValue());
//    println("perc value: "+theOscMessage.get(1).floatValue());
//  }
//  if (theOscMessage.checkTypetag("if")) { //int float - this is on the simulator
//    println("abs value: "+theOscMessage.get(0).intValue());
//    println("perc value: "+theOscMessage.get(1).floatValue());
//  }
//}