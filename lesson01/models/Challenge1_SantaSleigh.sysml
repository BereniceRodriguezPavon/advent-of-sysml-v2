package Challenge1_SantaSleigh {
   enum def Color {
      brown;
      red;
      gold;
      white;
   }

   part def mySantaSleigh {
    doc Description
    /* It is the magical vehicle,pulled by flying reindeer, used to spread joy and illusions to children around the world on Christmas Eve */
    
    attribute imgUrl = "file://./../images/SantaSleigh.jpg"; 

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
            attribute color : Color = Color::brown;  
            }
        part harnessesandreinsPropulsion [1] {
            attribute color : Color = Color::gold;
        }
    }
    part navigationsubsystem {
        doc /* It fulfills the function of directing and controlling the trajectory */

        part santaclausasoperatorNavigation {
           
        }
    }
    part cargosubsystem {
        doc /* Function of storing,protecting and facilitating the delivery of gifts during the trip*/

        part sackwithgiftCargo [1] {
            attribute color : Color = Color::red;
        }
    }
   }
}