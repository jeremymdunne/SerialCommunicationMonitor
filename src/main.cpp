#include <stdio.h>
#include <stdlib.h>
#include <iostream>
#include <string.h>     // string function definitions
#include <SerialCommunication.h>

using namespace std;

string possiblePorts[] = {"/dev/ttyUSB0","/dev/ttyUSB1"};
SerialCommunication arduino;

int main(){
  arduino.setPossibleLocations(possiblePorts,sizeof(possiblePorts)/sizeof(possiblePorts[0]));
  if(arduino.begin(9600) > 0){
    string cmd;
    arduino.serialWriteString("Hello!");
    while(1){
     if(arduino.serialReadString(&cmd)) cout << cmd;
     else cout << "ERROR!" << endl;
     cmd = "";
   }
 }
 else cout << "ERROR!" << endl;
}
