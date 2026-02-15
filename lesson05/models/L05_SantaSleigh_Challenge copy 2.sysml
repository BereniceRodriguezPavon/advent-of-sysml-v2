package L05_SantaSleigh_Challenge {
    private import ScalarValues::*;
    private import SI::*;
    private import ISQ::*;

// Enumerations

  enum def Color {
        red;
        gold;
        white;
        brown;
    }

    enum def SkillType {
        assembly;
        navigation;
        magic;
    }

// Basic Definitions

    part def Bag;

    part def OrdinaryBag specializes Bag;

    part def Runner;

    part def Person;

// Cargo Bay Architecture (Polymorphic Design)

    part def CargoBay {
        // Common access point to payload regardless of configuration
        ref part payload : Bag [1..*];
    }

    // Ordinary cargo bay: holds exactly one BottomlessGiftBag
    part def OrdinaryCargoBay specializes CargoBay {
        ref part payload : BottomlessGiftBag [1] redefines payload;
    }

    // Magical cargo bay: holds multiple ordinary bags
    part def MagicalCargoBay specializes CargoBay {
        ref part payload : OrdinaryBag [1..*] redefines payload;
    }

    // Bottomless bag definition
    part def BottomlessGiftBag specializes Bag {
        doc /* A magic container that stores any number of gifts */
        attribute infiniteCapacity : Boolean = true;
    }

// Sleigh Definitions

    part def Sleigh {
        part cargoBay : CargoBay [1];
        attribute bagColor : Color = Color::red;
    }

    part def SantaSleigh specializes Sleigh {
        doc /* Magical vehicle pulled by flying reindeer */

        // Exactly two runners, explicitly enumerated
        part leftRunner  : Runner [1];
        part rightRunner : Runner [1];

        // Referential usage (external entity)
        ref part mrsClaus : Person [1];
    }

 // Reindeer Definition

    part def Reindeer {
        attribute name   : String;
        attribute weight : MassValue;
        constant attribute noseColor;

        attribute energyLevel : Real;
        attribute skillLevel  : Real;
        attribute skillType   : SkillType;
    }

// Reindeer Team (9 total)

    part reindeerTeam {

        abstract ref part reindeer : Reindeer [9];

        ref part dasher : Reindeer subsets reindeer {
            :>> name = "Dasher";
            :>> weight = 35.0[kg];
            :>> skillType = SkillType::assembly;
            :>> skillLevel = 150.0;
        }

        ref part dancer : Reindeer subsets reindeer {
            :>> name = "Dancer";
            :>> weight = 32.0[kg];
            :>> skillType = SkillType::assembly;
            :>> skillLevel = 150.0;
        }

        ref part prancer : Reindeer subsets reindeer {
            :>> name = "Prancer";
            :>> weight = 36.0[kg];
            :>> skillType = SkillType::assembly;
            :>> skillLevel = 150.0;
        }

        ref part vixen : Reindeer subsets reindeer {
            :>> name = "Vixen";
            :>> weight = 34.0[kg];
            :>> skillType = SkillType::navigation;
            :>> skillLevel = 150.0;
        }

        ref part comet : Reindeer subsets reindeer {
            :>> name = "Comet";
            :>> weight = 33.0[kg];
            :>> skillType = SkillType::navigation;
            :>> skillLevel = 150.0;
        }

        ref part cupid : Reindeer subsets reindeer {
            :>> name = "Cupid";
            :>> weight = 34.0[kg];
            :>> skillType = SkillType::navigation;
            :>> skillLevel = 150.0;
        }

        ref part donner : Reindeer subsets reindeer {
            :>> name = "Donner";
            :>> weight = 36.0[kg];
            :>> skillType = SkillType::magic;
            :>> skillLevel = 150.0;
        }

        ref part blitzen : Reindeer subsets reindeer {
            :>> name = "Blitzen";
            :>> weight = 35.0[kg];
            :>> skillType = SkillType::magic;
            :>> skillLevel = 150.0;
        }

        ref part rudolph : Reindeer subsets reindeer {
            :>> name = "Rudolph";
            :>> weight = 38.0[kg];
            :>> skillType = SkillType::magic;
            :>> skillLevel = 200.0;
        }
    }

}

