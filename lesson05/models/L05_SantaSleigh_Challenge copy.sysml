package L05_SantaSleigh_Challenge {
    private import ScalarValues::*;
    private import SI::*;
    private import ISQ::*;

    // Authorized color palette
    enum def Color {
        red;
        gold;
        white;
        brown;
    }

    // Skill type enumeration
    enum def SkillType {
        assembly;
        navigation;
        magic;
    }

    // Base definitions for containers
    part def Bag;

    // Two runners are added to the structure of Santa's sleigh
    part def Runner;

    // Base sleigh definition
    part def Sleigh {
        part cargoBay : Bag;
        attribute Bagcolor : Color = Color::red;
    }

    // The bag has infinite capacity (bottomless)
    part def BottomlessGiftBag specializes Bag {
        doc /* A magic container that stores any number of gifts */
        attribute infiniteCapacity : Boolean = true;
    }

    // Santa's special sleigh definition
    part def SantaSleigh specializes Sleigh {
        doc /* It is the magical vehicle,pulled by flying reindeer, used to spread joy and illusions to children around the world on Christmas Eve */

        part leftRunner  : Runner [1];
        part rightRunner : Runner [1];

        // The cargo bay payload is called giftBag and is always a BottomlessGiftBag
        part giftBag : BottomlessGiftBag [1] redefines cargoBay;
    }

    // Person definition
    part def Person;

    // Mrs. Claus (Santa has to communicate with her during work)
    part def MrsClaus {
        ref part mrsClaus : Person [1];
    }

    // Santa's nine reindeer
    part def Reindeer {
        attribute energyLevel : Real;
        constant attribute noseColor;
        attribute weight : MassValue;
        attribute skillLevel : Real;
        attribute skillType : SkillType;
    }

    part reindeerTeam {
        abstract ref part reindeer : Reindeer[9];

        ref part dasher : Reindeer subsets reindeer {
            :>> skillType = SkillType::assembly;
            :>> skillLevel = 150.0;
            :>> weight = 35.0[kg];
        }

        ref part dancer : Reindeer subsets reindeer {
            :>> skillType = SkillType::assembly;
            :>> skillLevel = 150.0;
            :>> weight = 32.0[kg];
        }

        ref part prancer : Reindeer subsets reindeer {
            :>> skillType = SkillType::assembly;
            :>> skillLevel = 150.0;
            :>> weight = 36.0[kg];
        }

        ref part vixen : Reindeer subsets reindeer {
            :>> skillType = SkillType::assembly;
            :>> skillLevel = 150.0;
            :>> weight = 34.0[kg];
        }

        ref part comet : Reindeer subsets reindeer {
            :>> skillType = SkillType::assembly;
            :>> skillLevel = 150.0;
            :>> weight = 33.0[kg];
        }

        ref part cupid : Reindeer subsets reindeer {
            :>> skillType = SkillType::assembly;
            :>> skillLevel = 150.0;
            :>> weight = 34.0[kg];
        }

        ref part donner : Reindeer subsets reindeer {
            :>> skillType = SkillType::assembly;
            :>> skillLevel = 150.0;
            :>> weight = 36.0[kg];
        }

        ref part blitzen : Reindeer subsets reindeer {
            :>> skillType = SkillType::assembly;
            :>> skillLevel = 150.0;
            :>> weight = 35.0[kg];
        }

        ref part rudolph : Reindeer subsets reindeer {
            :>> skillType = SkillType::assembly;
            :>> skillLevel = 200.0;
            :>> weight = 38.0[kg];
        }
    }
}