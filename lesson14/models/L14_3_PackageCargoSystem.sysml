package L14_3_PakageCargoSystem {

    private import ScalarValues::*;
    private import ISQ::*;
    private import SI::*;

// ============================================================================
// SUBPACKAGE: Cargo System
// ===========================================================================

package CargoSystem {
        public enum def Color {
            enum red;
        }

        part def Bag {
            doc /* Santa's gift bag with specialized properties */
            attribute width : LengthValue;
            attribute length : LengthValue;
            attribute height : LengthValue;
            attribute material : String = "soft and highly resistant";
            attribute color : Color = Color::red;
        }

        part def BottomlessGiftBag specializes Bag {
            doc /* A magic container that stores any number of gifts */
            attribute infiniteCapacity : Boolean = true;
            attribute :>> width = 2[m];
            attribute :>> length = 4[m];
            attribute :>> height = 1.5[m];
        }

        // Cargo area definition based on Santa's sleigh dimensions
        part def CargoArea {
            doc /* Dedicated cargo space for the magical gift bag */
            attribute cargoLength : LengthValue = 4[m];
            attribute cargoWidth : LengthValue = 2[m];
            attribute cargoHeight : LengthValue = 1.5[m];
            attribute floorArea : AreaValue = 8[m^2]; // 4m x 2m
            attribute cargoVolume : VolumeValue = 12[m^3]; // 4m x 2m x 1.5m
            attribute maxCapacity : Integer = 1; // Solo una bolsa mágica

            part magicalBag : BottomlessGiftBag [1]; // Exactamente una bolsa mágica
        }
    }

    }