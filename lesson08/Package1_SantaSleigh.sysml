// Santa Sleigh model imported from Lesson 1

package Package1_SantaSleigh {
    doc /* Santa's Sleigh Model - Reorganized into modular packages */

    // Common definitions package
    package CommonDefinitions {
        doc /* Shared definitions used across the sleigh model */

        enum def Color {
            brown;
            red;
            gold;
            white;
        }
    }

    // Structure subsystem package
    package StructureSubsystem {
        doc /* The body of the sleigh, usually red, where the gifts are transported */

        private import Package1_SantaSleigh::CommonDefinitions::*;

        part def BodyStructure {
            attribute color: Color = Color::red;
        }

        part def SnowRunnerStructure {
            attribute color: Color = Color::gold;
        }

        part def GiftAreaStructure {
            attribute color: Color = Color::red;
        }

        part def SeatForSantaClausStructure {
            attribute color: Color = Color::red;
        }

        part def StructureSubsystem {
            part body: BodyStructure;
            part snowRunners: SnowRunnerStructure[2];
            part giftArea: GiftAreaStructure[1];
            part seatForSanta: SeatForSantaClausStructure[1];
        }
    }

    // Propulsion subsystem package
    package PropulsionSubsystem {
        doc /* Provides the necessary driving force for the entire system to move */

        private import Package1_SantaSleigh::CommonDefinitions::*;

        part def ReindeerTeam {
            attribute color: Color = Color::brown;
        }

        part def HarnessesAndReins {
            attribute color: Color = Color::gold;
        }

        part def PropulsionSubsystem {
            part reindeerTeam: ReindeerTeam[9];
            part harnessesAndReins: HarnessesAndReins[11];
        }
    }

    // Navigation subsystem package
    package NavigationSubsystem {
        doc /* Directs and controls the trajectory */

        part def SantaClausOperator {
            // Santa as the operator
        }

        part def NavigationSubsystem {
            part operator: SantaClausOperator;
        }
    }

    // Cargo subsystem package
    package CargoSubsystem {
        doc /* Stores, protects and facilitates the delivery of gifts during the trip */

        private import Package1_SantaSleigh::CommonDefinitions::*;

        part def SackWithGifts {
            attribute color: Color = Color::red;
        }

        part def CargoSubsystem {
            part giftSack: SackWithGifts[1];
        }
    }

    // Main sleigh integration
    package SleighIntegration {
        doc /* Main Santa's Sleigh assembly */

        private import Package1_SantaSleigh::StructureSubsystem::*;
        private import Package1_SantaSleigh::PropulsionSubsystem::*;
        private import Package1_SantaSleigh::NavigationSubsystem::*;
        private import Package1_SantaSleigh::CargoSubsystem::*;

        part def MySantaSleigh {
            doc /* It is the magical vehicle, pulled by flying reindeer, used to spread joy
                   and illusions to children around the world on Christmas Eve */

            attribute imgUrl = "file://./../images/SantaSleigh.jpg";

            part structure: StructureSubsystem;
            part propulsion: PropulsionSubsystem;
            part navigation: NavigationSubsystem;
            part cargo: CargoSubsystem;
        }
    }
}