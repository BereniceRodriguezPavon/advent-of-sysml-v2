package L03_SantaWorkshop_Challenge {
        private import ISQ::*;
        private import SI::*;
        private import ScalarValues::*;

        // Base definition for all elves
        part def Elf {
                attribute skillType : SkillType;
                attribute skillLevel : Real;
                attribute weight : MassValue;
        }

        part def SantaWorkshop {
                // Work areas of the workshop with their elves
                part assemblyLine {
                        doc
                        /* Where toys are assembled. */

                        // Elves in assembly area
                        part headElf : Elf {
                                :>> skillType := SkillType::assembly;
                                :>> skillLevel := 200.0;
                                :>> weight := 30.0[kg];
                        }
                        part albert : Elf {
                                :>> skillType := SkillType::assembly;
                                :>> skillLevel := 50.0;
                                :>> weight := 20.0[kg];
                        }
                        part betty : Elf {
                                :>> skillType := SkillType::assembly;
                                :>> skillLevel := 100.0;
                                :>> weight := 18.0[kg];
                        }

                        part supervisor = headElf;
                }

                part qualityControl {
                        doc
                        /* Quality checking station. */

                        // Elves in quality control area
                        part charlie : Elf {
                                :>> skillType := SkillType::quality;
                                :>> skillLevel := 100.0;
                                :>> weight := 22.0[kg];
                        }
                        part helen : Elf {
                                :>> skillType := SkillType::quality;
                                :>> skillLevel := 150.0;
                                :>> weight := 18.0[kg];
                        }

                        part supervisor = charlie;
                }

                part packagingArea {
                        doc
                        /* Gift wrapping and packaging. */

                        // Elves in packaging area
                        part edward : Elf {
                                :>> skillType := SkillType::packaging;
                                :>> skillLevel := 100.0;
                                :>> weight := 25.0[kg];
                        }
                        part fiona : Elf {
                                :>> skillType := SkillType::packaging;
                                :>> skillLevel := 100.0;
                                :>> weight := 28.0[kg];
                        }

                        part supervisor = edward;
                }

                part metrology {
                        doc
                        /* Strict control of measurements*/

                        // Elves in metrology area
                        part diana : Elf {
                                :>> skillType := SkillType::quality;
                                :>> skillLevel := 100.0;
                                :>> weight := 19.0[kg];
                        }

                        part supervisor = diana;
                }

                part paint {
                        doc
                        /* Color is applied to the structure*/

                        // Elves in paint area
                        part george : Elf {
                                :>> skillType := SkillType::assembly;
                                :>> skillLevel := 150.0;
                                :>> weight := 21.0[kg];
                        }

                        part supervisor = george;
                }
        }
        // Skills from the two new areas are added.
        enum def SkillType {
                enum assembly;
                enum quality;
                enum packaging;
                enum metrology;
                enum paint;
        }
}
