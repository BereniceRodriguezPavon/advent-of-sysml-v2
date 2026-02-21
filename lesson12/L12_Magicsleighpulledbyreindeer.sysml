package L12_Magicsleighpulledbyreindeer {

    //==============================================================================
    // A new connection is being modeled that will link Santa Claus to the sleigh.
    //==============================================================================

    // 1. Basic Abstract definitions
    // Every Vehicle can be associated with a Person who performs the role of driver.

    abstract part def Vehicle {
        ref part driver : Person[1];
    }
    abstract part def Person {
        ref part driving : Vehicle[0..*];
    }

    // 2. Enumeration definition must come before use
    enum def Color {
        enum orange;
        enum yellow;
        enum green;
        enum blue;
        enum indigo;
        enum violet;
        enum silver;
        enum gold;
        enum red;
    }

    // 3. Specializations
    // SantaSleigh inherits everything defined in Vehicle
    // Directed relationship: Every Reindeer can be structurally related to a SantaSleigh through the "pulling" role.

    part def Santa specializes Person;

    part def SantaSleigh specializes Vehicle {
        abstract ref part reindeer : Reindeer [9];
    }
    part def Reindeer {
        ref part pulling : SantaSleigh;
        constant attribute noseColor : Color;
    }

    part def LeadReindeer specializes Reindeer;

    // 4. Formal connections
    // Connection def does not connect instances yet; it only defines the formal connection pattern.

    connection def Drives {
        end part driver : Person crosses driven.driver;
        end part driven : Vehicle crosses driver.driving;
    }
    connection def Harness {
        end part sleigh : SantaSleigh crosses reindeer.pulling;
        end part reindeer : Reindeer crosses sleigh.reindeer;
    }
    // 5. Concrete assembly

    part def Reindeerpulledsleigh {
        part santa : Person;
        part sleigh : SantaSleigh;

        // 9 reindeer required
        abstract part reindeer : Reindeer [9];
        ref part dasher subsets reindeer { constant attribute redefines noseColor = Color::orange; }
        ref part dancer subsets reindeer { constant attribute redefines noseColor = Color::yellow; }
        ref part prancer subsets reindeer { constant attribute redefines noseColor = Color::green; }
        ref part vixen subsets reindeer { constant attribute redefines noseColor = Color::blue; }
        ref part comet subsets reindeer { constant attribute redefines noseColor = Color::indigo; }
        ref part cupid subsets reindeer { constant attribute redefines noseColor = Color::violet; }
        ref part donner subsets reindeer { constant attribute redefines noseColor = Color::silver; }
        ref part blitzen subsets reindeer { constant attribute redefines noseColor = Color::gold; }
        part rudolph : LeadReindeer[1] subsets reindeer { constant attribute redefines noseColor = Color::red; } 

        // Connect reindeer to sleigh
        connect [1] sleigh to [9] reindeer;

        // Specific connection Harness ↔ sleigh ↔ rudolph
        connection harnesses : Harness connect [1] sleigh to [9] reindeer;
        connection subsets harnesses {
            end [1] part :>> sleigh references sleigh;
            end [1] part :>> reindeer references rudolph;
        }

        // Connect Santa to the sleigh
        connection driveSleigh : Drives connect santa to sleigh;
    }
}