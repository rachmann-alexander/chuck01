Scale sc; TimeGrid tg;

BandedWG inst => dac; //plucked string

tg.set( 1::minute/60/2, 4, 4 ); 

[0] @=> int bass[];

tg.sync();

while( true ) { //infinite loop
  tg.guess() => int i; //global beat indicator
  tg.m => int m; //measure indicator

    //arp( 2, 7, [0,2,4] ) => int a; //the arp/melodic contour
    sc.arp(2) => int a;
    //10 => int a;
    sc.scale( a+bass[m], sc.maj ) => int note; //select the bassnote
    Std.mtof( 3*12 + 7 + note ) => inst.freq; //7 semitones from C is G

  inst.noteOn( 0.7 ); //play a note
  tg.beat/3*2 => now; //advance by one beat  
  inst.noteOn( 0.7 ); //play a note
  tg.beat/3 => now; //advance by one beat
    
  inst.noteOn( 0.7 ); //play a note
  tg.beat/3*2 => now; //advance by one beat  
  //inst.noteOn( 0.7 ); //play a note
  tg.beat/3 => now; //advance by one beat
    
  inst.noteOn( 0.7 ); //play a note
  tg.beat/3*2 => now; //advance by one beat  
  inst.noteOn( 0.7 ); //play a note
  tg.beat/3 => now; //advance by one beat
    
  inst.noteOn( 0.7 ); //play a note
  tg.beat/3*2 => now; //advance by one beat  
  //inst.noteOn( 0.7 ); //play a note
  tg.beat/3 => now; //advance by one beat
  
}
