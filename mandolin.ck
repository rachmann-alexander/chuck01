Scale sc; TimeGrid tg;

// patch
Mandolin moog => dac;

tg.set( 1::minute/60/2, 4, 4 );

tg.sync();



// infinite time loop
while( true )
{
   tg.guess() => int i; //global beat indicator
  tg.m => int m; //measure indicator

    // set freq
    sc.scale( 57, sc.maj ) => int note; //select the bassnote
    Std.mtof( 3*12 + 7 + note ) => moog.freq; //7 semitones from C is G
    
    // go
    1 => moog.noteOn;

    // advance time
  //  tg.beat*2 => now; //advance by one beat
    
  
  tg.beat/3*2 => now; //advance by one beat  
  
  tg.beat/3 => now; //advance by one beat
    
  
  tg.beat/3*2 => now; //advance by one beat  
  1 => moog.noteOn;
  tg.beat/3 => now; //advance by one beat
    
  //inst.noteOn( 0.7 ); //play a note
  tg.beat/3*2 => now; //advance by one beat  
  //inst.noteOn( 0.7 ); //play a note
  tg.beat/3 => now; //advance by one beat
    
  //inst.noteOn( 0.7 ); //play a note
  tg.beat/3*2 => now; //advance by one beat  
  //inst.noteOn( 0.7 ); //play a note
  tg.beat/3 => now; //advance by one beat
}