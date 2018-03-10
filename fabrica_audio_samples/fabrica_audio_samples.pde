import oscP5.*;
import netP5.*;
import ddf.minim.*;
import ddf.minim.signals.*;
import controlP5.*;
import javax.sound.sampled.*;
import ddf.minim.ugens.*;

Minim              minim;
MultiChannelBuffer sampleBuffer;
AudioPlayer player;

OscP5 oscP5;
NetAddress myRemoteLocation;

int beats = 0;
int start_time = 0;

String mood = "";

void setup()
{
  size(20, 20, P3D);
  frameRate(2);

  oscP5 = new OscP5(this, 5500);
  myRemoteLocation = new NetAddress("127.0.0.1", 7400);
  clear();

  minim  = new Minim(this);
  sampleBuffer     = new MultiChannelBuffer( 1, 1024 );
  player = minim.loadFile("Fabrica_output.mp3"); 
  player.play();
  start_time = frameCount;
}

void water() {
  OscMessage myMessage = new OscMessage("/fabbrica/ledwall/single");
  myMessage.add(4);
  myMessage.add(random(10));
  myMessage.add(random(180));
  myMessage.add(38);
  myMessage.add(250);
  oscP5.send(myMessage, myRemoteLocation);
}

void chika() {
  clear();

  OscMessage myMessage = new OscMessage("/fabbrica/ledwall/single");
  int random_yellow = int(random(20));
  myMessage.add(1);
  myMessage.add(0);
  myMessage.add(225);
  myMessage.add(223+random_yellow);
  myMessage.add(0);
  oscP5.send(myMessage, myRemoteLocation);
}

void rectangle() {
  OscMessage myMessage = new OscMessage("/fabbrica/ledwall/rect");
  myMessage.add(0);
  myMessage.add(0);
  myMessage.add(4);
  myMessage.add(9);
  myMessage.add(225);
  myMessage.add(223);
  myMessage.add(0);
  oscP5.send(myMessage, myRemoteLocation);
}

void circle() {
  clear();
  OscMessage myMessage = new OscMessage("/fabbrica/ledwall/circle");
  myMessage.add(2);
  myMessage.add(4);
  myMessage.add(3);
  myMessage.add(225);
  myMessage.add(105);
  myMessage.add(180);
  oscP5.send(myMessage, myRemoteLocation);
}

void draw()
{

  int new_beats = frameCount - start_time;
  if (beats != new_beats) {
    if (beats < 33 || beats >= 284) {
      water();
    }
    if (beats == 33 || beats == 72) {
      clear();
    }
    if (beats >= 33 && beats < 72) {
      chika();
    }
    if (beats >= 76) {
      if (beats % 4 == 0) {
        rectangle();
      }
      if (beats == 91) {
        circle();
      }
    }
    println(beats);
  }
  beats = new_beats;
}

void clear() {
  OscMessage myMessage = new OscMessage("/fabbrica/ledwall/reset");
  oscP5.send(myMessage, myRemoteLocation);
}