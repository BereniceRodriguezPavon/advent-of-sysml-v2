package L14_4_packageSleighSystem {

//=============================================================================
// SUBPACKAGE: Sleigh System
// ============================================================================

    private import ScalarValues::*;
    private import ISQ::*;
    private import SI::*;

    // Enumerations

    enum def Color {
        red;
        gold;
        white;
        brown;
        blue;
    }

    // Part definitions
    part def Hallway {
        doc /* Corridor or passage in a structure */
        attribute width : ISQ::LengthValue;
        attribute length : ISQ::LengthValue;
    }
    part def Operator {
        doc/* It refers to the person driving the sleigh */
        attribute name : ScalarValues::String = "Santa Claus";
    }

    part def Person {
        doc /* Human individual */
        attribute name : ScalarValues::String;
        attribute age : ScalarValues::Integer;
        // Reserved space for Mrs. Claus
    }
    part def Sleigh {
        attribute weight : ISQ::MassValue;
        attribute length : ISQ::LengthValue;
        attribute width : ISQ::LengthValue;
        attribute height : ISQ::LengthValue;
        attribute color : Color;
    }

    // Generic Sleigh
    part sleigh : Sleigh {
        attribute :>> weight = 500[kg];
        attribute :>> length = 6[m];
        attribute :>> width = 2.5[m];
        attribute :>> height = 2[m];
        attribute :>> color = Color::red;
    }

    // Santa's special sleigh
    // Use 'specializes' to inherit everything from the generic sleigh and create a special sleigh for Santa Claus
    // Santa's sleigh redefines the dimensions and attributes

    part def SantaSleigh specializes Sleigh {
        doc /* Magical vehicle pulled by flying reindeer */
        attribute :>> weight = 200[kg];
        attribute :>> length = 4[m];
        attribute :>> width = 2[m];
        attribute :>> height = 1.5[m];
        attribute :>> color = Color::red;

        // Santa's sleigh has special features
        attribute passengerCapacity : ScalarValues::Integer default 2;
        attribute loadCapacity : ISQ::MassValue {
            assert constraint { loadCapacity >= 1000[kg] }
        }
        attribute material : ScalarValues::String default "magic pine wood";
        constant attribute santaSeatsColor : Color = Color::gold;

        // Exactly two hallway, explicitly enumerated
        part leftHallway  : Hallway [1];
        part rightHallway : Hallway [1];

        // Referential usage (external entity)
        ref part mrsClaus : Person [1];
    }
}


