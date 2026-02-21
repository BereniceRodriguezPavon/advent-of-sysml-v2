// Challenge 13 is built strictly on the basis of challenge 12 (L12_Magicsleighpulledbyreindeer)//
package L13_Challenge_SantaClaus_and_thesleigh {
    private import ScalarValues::Real;

    //==============================================================================
    // 1. Basic Abstract definitions
    // Every Vehicle can be associated with a Person who performs the role of driver.
    //==============================================================================
    
    abstract part def Vehicle {
        ref part driver : Person[1];
    }
    abstract part def Person {
        ref part driving : Vehicle[0..*];
    }

    //==============================================================================
    // 2. Enumeration definition must come before use
    //==============================================================================

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

    //==============================================================================================================
    // 3. Specializations
    // SantaSleigh inherits everything defined in Vehicle
    // Directed relationship: Every Reindeer can be structurally related to a SantaSleigh through the "pulling" role.
    //==============================================================================================================

    part def Santa specializes Person {
        port control : ControlPort;
    }

    part def SantaSleigh specializes Vehicle {
        abstract ref part reindeer : Reindeer [9];
        port navigation : ~ControlPort;
    }
    part def Reindeer {
        ref part pulling : SantaSleigh;
        constant attribute noseColor : Color;
    }

    part def LeadReindeer specializes Reindeer;

    //===============================================================================================
    // 4. Formal connections
    // Connection def does not connect instances yet; it only defines the formal connection pattern.
    //===============================================================================================

    connection def Drives {
        end part driver : Person crosses driven.driver;
        end part driven : Vehicle crosses driver.driving;
    }
    connection def Harness {
        end part sleigh : SantaSleigh crosses reindeer.pulling;
        end part reindeer : Reindeer crosses sleigh.reindeer;
    }

    //===============================================================================================
    // 5. Command Enumeration
    //===============================================================================================

    enum def SleighOrderKind {
        enum takeOff;
        enum land;
        enum accelerate;
        enum decelerate;
        enum hover;
    }

    //================================================================================================
    // 6. Items exchanged between Santa and the Sleigh
    //================================================================================================

    item def SleighOrder {
        attribute order : SleighOrderKind;
    }

    item def SleighPosition {
        attribute latitude  : Real;
        attribute longitude : Real;
        attribute altitude  : Real;
    }

    //================================================================================================
    // 7. Port definition for Santa ↔ Sleigh interaction
    //================================================================================================

    port def ControlPort {
        out item order : SleighOrder;
        in  item position : SleighPosition;
    }

    //================================================================================================
    // 8. Interface definition
    //================================================================================================

    interface def SantaSleighControlInterface {

        end port santaSide  : ControlPort;
        end port sleighSide : ~ControlPort;

        flow of SleighOrder
            from santaSide.order
            to sleighSide.order;

        flow of SleighPosition
            from sleighSide.position
            to santaSide.position;
    }
    //================================================================================================
    // 9. Connection definition using the interface
    //================================================================================================

    connection def SantaSleighControl {

        end part santa  : Santa;
        end part sleigh : SantaSleigh;

        interface : SantaSleighControlInterface
            connect santa.control
            to sleigh.navigation;
    }
    //================================================================================================
    // 10. Concrete assembly
    //================================================================================================

    part def Reindeerpulledsleigh {
        part santa : Santa;
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

        // Santa controls the sleigh via interface
        connection controlLink : SantaSleighControl
            connect santa to sleigh;
    }
}