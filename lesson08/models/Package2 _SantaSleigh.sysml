// Reindeer model imported from Lesson 5.

package SantaSleigh {
    private import ScalarValues::*;
    private import ISQ::*;
    private import SI::*;

    // ============================================================================
    // SUBPACKAGE: Common Types
    // ============================================================================
    package CommonTypes {
        public enum def Color {
            enum red;
            enum gold;
            enum white;
            enum brown;
            enum blue;
        }

        public enum def SkillType {
            enum assembly;
            enum navigation;
            enum magic;
        }

        public part def Person;
        public part def Hallway;
    }

    // ============================================================================
    // SUBPACKAGE: Cargo System
    // ============================================================================
    package CargoSystem {
        public part def Bag;

        public part def OrdinaryBag specializes Bag;

        public part def BottomlessGiftBag specializes Bag {
            doc /* A magic container that stores any number of gifts */
            attribute infiniteCapacity : Boolean = true;
        }

        // Cargo Bay Architecture (Polymorphic Design)
        public part def CargoBay {
            // Common access point to payload regardless of configuration
            ref part payload : Bag [1..*];
        }

        // Ordinary cargo bay: holds exactly one BottomlessGiftBag
        public part def OrdinaryCargoBay specializes CargoBay {
            ref part payload : BottomlessGiftBag [1] redefines payload;
        }

        // Magical cargo bay: holds multiple ordinary bags
        public part def MagicalCargoBay specializes CargoBay {
            ref part payload : OrdinaryBag [1..*] redefines payload;
        }
    }

    // ============================================================================
    // SUBPACKAGE: Sleigh System
    // ============================================================================
    package SleighSystem {
        private import CommonTypes::*;
        private import CargoSystem::*;

        public part def Sleigh {
            part cargoBay : CargoBay [1];
            attribute bagColor : Color = Color::red;
        }

        public part def SantaSleigh specializes Sleigh {
            doc /* Magical vehicle pulled by flying reindeer */

            // Exactly two hallway, explicitly enumerated
            part leftHallway  : Hallway [1];
            part rightHallway : Hallway [1];

            // Referential usage (external entity)
            ref part mrsClaus : Person [1];
        }
    }

    // ============================================================================
    // SUBPACKAGE: Reindeer System
    // ============================================================================
    package ReindeerSystem {
        private import ScalarValues::*;
        private import ISQ::*;
        private import SI::*;
        private import CommonTypes::*;

        public attribute def ReindeerFeatures {
            //Not variables, so cannot be constant!
            attribute eyecolor : Color;
            attribute noseColor : Color;
            attribute antlerLength : LengthValue;
            attribute skillLevel  : Real;
            attribute skillType   : SkillType;
            attribute name   : String;
        }

        public part def Reindeer {
            attribute features : ReindeerFeatures;
            attribute weight : MassValue default 110 [kg];
        }

        // ============================================================================
        // NESTED PACKAGE: Reindeer Team Instances
        // ============================================================================
        package Team {
            
            private import ReindeerSystem::*;
            private import CommonTypes::*;

            public part reindeerTeam {
                doc /* The team of reindeer pulling the magic sleigh*/

                part dasher : Reindeer {
                    attribute :>> features : ReindeerFeatures {
                        attribute :>> eyecolor = Color::brown;
                        attribute :>> noseColor = Color::brown;
                        attribute :>> antlerLength = 60 [cm];
                        attribute :>> skillLevel = 150;
                        attribute :>> skillType = SkillType::assembly;
                        attribute :>> name = "Dasher";
                    }
                    attribute :>> weight = 100 [kg];
                }

                part dancer : Reindeer {
                    attribute :>> features : ReindeerFeatures {
                        attribute :>> eyecolor = Color::brown;
                        attribute :>> noseColor = Color::brown;
                        attribute :>> antlerLength = 60 [cm];
                        attribute :>> skillLevel = 150;
                        attribute :>> skillType = SkillType::magic;
                        attribute :>> name = "Dancer";
                    }
                    attribute :>> weight = 100 [kg];
                }

                part prancer : Reindeer {
                    attribute :>> features : ReindeerFeatures {
                        attribute :>> eyecolor = Color::brown;
                        attribute :>> noseColor = Color::brown;
                        attribute :>> antlerLength = 60 [cm];
                        attribute :>> skillLevel = 150;
                        attribute :>> skillType = SkillType::navigation;
                        attribute :>> name = "Prancer";
                    }
                    attribute :>> weight = 100 [kg];
                }

                part vixen : Reindeer {
                    attribute :>> features : ReindeerFeatures {
                        attribute :>> eyecolor = Color::brown;
                        attribute :>> noseColor = Color::brown;
                        attribute :>> antlerLength = 60 [cm];
                        attribute :>> skillLevel = 150;
                        attribute :>> skillType = SkillType::magic;
                        attribute :>> name = "Vixen";
                    }
                    attribute :>> weight = 100 [kg];
                }

                part comet : Reindeer {
                    attribute :>> features : ReindeerFeatures {
                        attribute :>> eyecolor = Color::brown;
                        attribute :>> noseColor = Color::brown;
                        attribute :>> antlerLength = 60 [cm];
                        attribute :>> skillLevel = 150;
                        attribute :>> skillType = SkillType::magic;
                        attribute :>> name = "Comet";
                    }
                    attribute :>> weight = 100 [kg];
                }

                part cupid : Reindeer {
                    attribute :>> features : ReindeerFeatures {
                        attribute :>> eyecolor = Color::brown;
                        attribute :>> noseColor = Color::brown;
                        attribute :>> antlerLength = 60 [cm];
                        attribute :>> skillLevel = 150;
                        attribute :>> skillType = SkillType::magic;
                        attribute :>> name = "Cupid";
                    }
                    attribute :>> weight = 100 [kg];
                }

                part donner : Reindeer {
                    attribute :>> features : ReindeerFeatures {
                        attribute :>> eyecolor = Color::brown;
                        attribute :>> noseColor = Color::brown;
                        attribute :>> antlerLength = 60 [cm];
                        attribute :>> skillLevel = 150;
                        attribute :>> skillType = SkillType::magic;
                        attribute :>> name = "Donner";
                    }
                    attribute :>> weight = 100 [kg];
                }

                part blitzen : Reindeer {
                    attribute :>> features : ReindeerFeatures {
                        attribute :>> eyecolor = Color::brown;
                        attribute :>> noseColor = Color::brown;
                        attribute :>> antlerLength = 60 [cm];
                        attribute :>> skillLevel = 150;
                        attribute :>> skillType = SkillType::magic;
                        attribute :>> name = "Blitzen";
                    }
                    attribute :>> weight = 100 [kg];
                }

                part rudolph : Reindeer {
                    attribute :>> features : ReindeerFeatures {
                        attribute :>> eyecolor = Color::blue;
                        attribute :>> noseColor = Color::red;
                        attribute :>> antlerLength = 70 [cm];
                        attribute :>> skillLevel = 200;
                        attribute :>> skillType = SkillType::navigation;
                        attribute :>> name = "Rudolph";
                    }
                    attribute :>> weight = 110 [kg];
                }
            }
        }
    }
}
