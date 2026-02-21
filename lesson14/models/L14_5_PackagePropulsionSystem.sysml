package L14_5_PackagePropulsionSystem {
    private import ScalarValues::*;
    private import ISQ::*;
    private import SI::*;

//=============================================================================
// SUBPACKAGE: Reindeer Team System
// ============================================================================

// Skill Type Enumeration
    enum def SkillType {
        assembly;
        navigation;
        magic;
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
            constant :>> noseColor = "red";
        }
    }

}