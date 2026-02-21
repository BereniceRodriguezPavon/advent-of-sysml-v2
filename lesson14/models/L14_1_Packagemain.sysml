package L14_1_Packagemain {
    
// ============================================================================
// MAIN PACKAGE
// ===========================================================================
// //The main package includes the overall system structure.
// -We are working on redesigning Santa's sleigh.
// -It is the magical vehicle, pulled by flying reindeer, used to spread joy and illusions to children around the world on Christmas Eve
//============================================================================
 
enum def Color {
      brown;
      red;
      gold;
      white;
      blue;
   }

   part def mySantaSleigh {

      part structuresubsystem {
        doc /* The body of the sleigh,usually red,where the gifts are transported */ 

        part bodystructure {
            attribute color: Color = Color::red;
        }
        part snowrunnersstructure [2] {
            attribute color: Color = Color::gold;
        }
        part gifareastructure [1] {
            attribute color: Color = Color::red;
        }
        part seatforsantaclausstructure [1] {
            attribute color: Color = Color::red;
        }

    }
    part propulsionsubsystem {
        doc /* It has the function of providing the necessary driving force for the entire system to move */

        part reindeerteamPropulsion [9] {
            doc /* The team of 9 magical reindeer that pull Santa's sleigh */
            attribute color : Color = Color::brown;

            // The 9 reindeer team members:
            part dasher [1] { doc /* Fast and energetic reindeer */ }
            part dancer [1] { doc /* Graceful and elegant reindeer */ }
            part prancer [1] { doc /* Proud and spirited reindeer */ }
            part vixen [1] { doc /* Strong and clever reindeer */ }
            part comet [1] { doc /* Swift like a comet */ }
            part cupid [1] { doc /* Brings love and joy */ }
            part donner [1] { doc /* Thunder in German, powerful reindeer */ }
            part blitzen [1] { doc /* Lightning in German, fast reindeer */ }
            part rudolph [1] { doc /* The red-nosed reindeer who leads the team */
                attribute noseColor : Color = Color::red; 
            }
        }
        part harnessesandreinsPropulsion [1] {
            attribute color : Color = Color::gold;
        }
    }
    part navigationsubsystem {
        doc /* It fulfills the function of directing and controlling the trajectory */
        
        // The driver is Santa Claus
        part santaclausasoperatorNavigation;
        doc /* Santa Claus drives his magical flying sleigh pulled by nine reindeer, with Rudolph as the guide with his red nose.*/
    }
    part cargosubsystem {
        doc /* Function of storing,protecting and facilitating the delivery of gifts during the trip*/

        part BottomlessGiftBag [1] {
            attribute color : Color = Color::red;
        }
    }
   }
}
