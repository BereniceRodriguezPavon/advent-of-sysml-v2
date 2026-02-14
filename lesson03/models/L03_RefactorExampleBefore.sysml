package L03_RefactorExampleBefore {
  private import ScalarValues::*;

  // Define a reusable Reindeer part definition with default energy level
  part def Reindeer {
    attribute energyLevel : Real default 100.0;
  }

  part def SantaSleigh {
    // Standard reindeer use default energy level (100.0)
    ref part dasher : Reindeer;
    ref part dancer : Reindeer;
    ref part prancer : Reindeer;
    ref part vixen : Reindeer;
    ref part comet : Reindeer;
    ref part cupid : Reindeer;
    ref part donner : Reindeer;
    ref part blitzen : Reindeer;

    // Rudolph has special energy level
    ref part rudolph : Reindeer { attribute :>> energyLevel := 200.0; }
  }
}
