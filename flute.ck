Scale sc; TimeGrid tg;

Flute inst => dac; 

tg.set( 1::minute/60/2, 4, 4 );

[ 61, 63, 65, 66, 68 ] @=> int bass[];

tg.sync();

while( true ) { //infinite loop
  tg.guess() => int i; //global beat indicator
  tg.m => int m; //measure indicator
    
       // clear
    inst.clear( 1.0 );

    // set
    Math.random2f( 0, 1 ) => inst.jetDelay;
    Math.random2f( 0, 1 ) => inst.jetReflection;
    Math.random2f( 0, 1 ) => inst.endReflection;
    Math.random2f( 0, 1 ) => inst.noiseGain;
    Math.random2f( 0, 12 ) => inst.vibratoFreq;
    Math.random2f( 0, 1 ) => inst.vibratoGain;
    Math.random2f( 0, 1 ) => inst.pressure;

    // print
    <<< "---", "" >>>;
    <<< "jetDelay:", inst.jetDelay() >>>;
    <<< "jetReflection:", inst.jetReflection() >>>;
    <<< "endReflection:", inst.endReflection() >>>;
    <<< "noiseGain:", inst.noiseGain() >>>;
    <<< "vibratoFreq:", inst.vibratoFreq() >>>;
    <<< "vibratoGain:", inst.vibratoGain() >>>;
    <<< "breath pressure:", inst.pressure() >>>;

    //arp( 2, 7, [0,2,4] ) => int a; //the arp/melodic contour
    sc.arp(2) => int a;
    sc.scale( a+bass[m], sc.maj ) => int note; //select the bassnote
    Std.mtof( 3*12 + 7 + note ) => inst.freq; //7 semitones from C is G


  tg.beat => now; //advance by one beat
}
