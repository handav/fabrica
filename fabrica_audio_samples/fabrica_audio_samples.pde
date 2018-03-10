import oscP5.*;
import netP5.*;
import ddf.minim.*;
import ddf.minim.signals.*;
import controlP5.*;
import javax.sound.sampled.*;
import ddf.minim.ugens.*;

Minim minim;
MultiChannelBuffer sampleBuffer;
AudioPlayer player;

OscP5 oscP5;
NetAddress myRemoteLocation;

int beats = 0;
int new_beats = 0;
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
  myMessage.add(random(150));
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
  clear();
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

void chaotic() {
  clear();
  int random_x = int(random(5));
  int random_y = int(random(10));

  OscMessage myMessage = new OscMessage("/fabbrica/ledwall/line");
  myMessage.add(0);
  myMessage.add(0);
  myMessage.add(random_x);
  myMessage.add(random_y);
  oscP5.send(myMessage, myRemoteLocation);
}

void draw()
{

  new_beats = frameCount - start_time;
  if (beats != new_beats) {
    if (beats < 33 || beats >= 284) {
      water();
    }
    if (beats == 33 || beats == 72 || beats == 191 || beats == 236 || beats == 280) {
      clear();
    }
    if (beats >= 33 && beats < 72) {
      chika();
    }
    if (beats >= 76) {
      if (beats == 91 || beats == 107 || beats == 123 || beats == 139 || beats == 155 || beats == 171 || beats == 235 || beats == 251) {
        circle();
      }
      if (beats >=203 &&  beats < 235) {
        chaotic();
      } else {
        if (beats % 4 == 0 && (beats < 191 || (beats > 236 && beats < 280))) {
          rectangle();
        }
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