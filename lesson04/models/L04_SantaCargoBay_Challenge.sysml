package L04_SantaCargoBay_Challenge {
    private import ScalarValues::*;

    // Base definitions for gift items
    part def Item;
    part def ToyTrain specializes Item;
    part def TeddyBear specializes Item;
    part def CandyCane specializes Item;

    // Base definitions for containers
    part def Bag;

    // Base sleigh definition
    part def Sleigh {
        part cargoBay : Bag;
    }

    // Bottomless gift bag definition
    part def BottomlessGiftBag {
        doc /* A magic container that stores any number of gifts */

        attribute infiniteCapacity : Boolean = true;
        
        // The bag has infinite capacity (bottomless)

        part contents : Item [1..*];
        // Contains at least one item (gifts)

        // Mandatory items that must be in the bag
        part mandatoryTrain : ToyTrain [1] subsets contents;
        // The gift bag must contain at least one toy train

        part mandatoryTeddy : TeddyBear [1] subsets contents;
        // The gift bag must contain at least one teddy bear

        part mandatoryCandy : CandyCane [1] subsets contents;
        // The gift bag must contain at least one candy cane

    }

    // Santa's special sleigh
    part def SantaSleigh specializes Sleigh {
        doc /* Santa's special sleigh with a bottomless gift bag */

        // The cargo bay payload is called giftBag and is always a BottomlessGiftBag
        part giftBag : BottomlessGiftBag [1] redefines cargoBay;
    }
}
