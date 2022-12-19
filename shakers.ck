Scale sc; TimeGrid tg;

Shakers shaker => dac; 

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
  
  play(shaker,  "shaker",    note,   1,      1);
  play(shaker,  "shaker",    note,   1,      0.5);
  play(shaker,  "shaker",    note,   1,      1);
  play(shaker,  "shaker",    0,      0.6,    0.5);
  play(shaker,  "shaker",    note,   0.3,    0.5);
}



fun void play(StkInstrument instrument, string identifier, int note, float duration, float velocity){
    Std.mtof( 2*12 + 7 + note ) => instrument.freq;
    if (note == 0) {}
        else instrument.noteOn(velocity);
    tg.beat*duration => now;
     <<< "Instrument: ", identifier, ", Note: ", note, ", Duration: ", duration, ", Velocity: ", velocity >>>;
}

fun int determineNote(){

}