// 
float arg;
// drums are controlled by the ket
void sendDrumMessage() {
  
 // arg = (float) key;
  
  /* create a new OscMessage with an address pattern, in this case /test. */
  OscMessage myOscMessage = new OscMessage("/test");
  if( key == 'q')
    myOscMessage.add(1);
  else if( key == 'w') 
    myOscMessage.add(2);
  else if( key == 'e')
    myOscMessage.add(3);
  else if( key == 'r')
    myOscMessage.add(4);
  else if( key == 't')
    myOscMessage.add(5);
  else if( key == 'y') 
    myOscMessage.add(6);   
  else if( key == 'u')
    myOscMessage.add(7);
  else if( key == 'i')
    myOscMessage.add(8);
  else if( key == 'o')
    myOscMessage.add(9);
    else if( key == 'p')
    myOscMessage.add(10);
  else if( key == 'a')
    myOscMessage.add(11);
  else if( key == 's')
    myOscMessage.add(12);
  else if( key == 'd')
    myOscMessage.add(13);
    else if( key == 'f')
    myOscMessage.add(14);
  else if( key == 'g')
    myOscMessage.add(15);
  else if( key == 'h')
    myOscMessage.add(16);
  else if( key == 'j')
    myOscMessage.add(17);
    else if( key == 'k')
    myOscMessage.add(18);
  else if( key == 'l')
    myOscMessage.add(19);
    
  /* send the OscMessage to a remote location specified in myNetAddress */
  oscP5.send(myOscMessage, station1); 
  
}
/* incoming osc message are forwarded to the oscEvent method. */
void oscEvent(OscMessage theOscMessage) {
  /* get and print the address pattern and the typetag of the received OscMessage */
  //println("### received an osc message with addrpattern "+theOscMessage.addrPattern()+" and typetag "+theOscMessage.typetag());
  
  
  if(theOscMessage.checkAddrPattern("/test")==true) {
    if(theOscMessage.checkTypetag("f")) {
    /* check if the typetag is the right one. */
      print("boo");
   
      /* parse theOscMessage and extract the values from the osc message arguments. */
      arg = theOscMessage.get(0).floatValue();  // get the first osc argument

    }
  }
 
//theOscMessage.print();
  //arg = theOscMessage.get(0).floatValue();
  oscBool = true;
  
}