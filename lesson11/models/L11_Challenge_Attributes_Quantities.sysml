package L11_Challenge_Attributes_Quantities {

    // Challenge L11_Attributes_Quantities
    // TODO: extend "Sleigh" to specialize "Vehicle"

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
    }

    // BoundingBox definition
    part def BoundingBox {
        attribute length : ISQ::LengthValue;
        attribute width : ISQ::LengthValue;
        attribute height : ISQ::LengthValue;
    }

    // BoundingBox that defines the special dimensions of Santa's sleigh
    part boundingBox : BoundingBox {
        attribute :>> length = 4[m];
        attribute :>> width = 2[m];
        attribute :>> height = 1.5[m];
    }
}
