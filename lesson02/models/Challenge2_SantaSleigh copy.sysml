package L02_SantaSleigh {
    private import ScalarValues::*;

    part def SantaSleigh {
        // Components of the sleigh
        part cockpit {
            doc /* This is where Santa sits. */
            ref item driver = santa;
        }
        part cargoBay  { doc /* Place for the GiftBag. */  }
        part dashboard {
             doc
             /* Naughty-Nice dashboard. */
             part toggle1;
             part display{
                part buttonA;
                part buttonB;
             }
             }
        

        // Entities related to the sleigh
        ref item santa;
        abstract ref part reindeer : Reindeer [9];
       
        ref part dasher  subsets reindeer { constant attribute redefines noseColor = ColorPalette::orange; }
        ref part dancer  subsets reindeer { constant attribute redefines noseColor = ColorPalette::yellow; }
        ref part prancer subsets reindeer { constant attribute redefines noseColor = ColorPalette::green;  }
        ref part vixen   subsets reindeer { constant attribute redefines noseColor = ColorPalette::blue;   }
        ref part comet   subsets reindeer { constant attribute redefines noseColor = ColorPalette::indigo; }
        ref part cupid   subsets reindeer { constant attribute redefines noseColor = ColorPalette::violet; }
        ref part donner  subsets reindeer { constant attribute redefines noseColor = ColorPalette::silver; }
        ref part blitzen subsets reindeer { constant attribute redefines noseColor = ColorPalette::gold;   }
        ref part rudolph subsets reindeer { constant attribute redefines noseColor = ColorPalette::red;    
                                                     attribute redefines energyLevel := 200.0;      }
    }

    part def Reindeer {
        constant attribute noseColor : ColorPalette;
        attribute energyLevel : Real default := 100.0;
    }

    enum def ColorPalette {
        enum orange; enum yellow; enum green;
        enum blue;   enum indigo; enum violet;
        enum silver; enum gold;   enum red;
    }
}
