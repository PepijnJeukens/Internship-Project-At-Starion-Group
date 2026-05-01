package PartsGenerated {

    private import FunctionsGenerated::*;

    part def LogicalSystem_e9b6 {
        doc
        /* ID: e9b6d7d4-c7b8-46f6-b440-f00ed9420157 */
        part eps_cc31 : EPS_cc31;
        part adcs_821a : ADCS_821a;
        part bitflipPayload_0da2 : BitflipPayload_0da2;
        part dicePayload_c4be : DicePayload_c4be;
        part obc_b6d9 : OBC_b6d9;
        part thermalControl_d84f : ThermalControl_d84f;
        part antenna_ce6f : Antenna_ce6f;
        part payloadManager_9476 : PayloadManager_9476;
    }

    part def EPS_cc31 {
        doc
        /* ID: cc31669c-28df-47f9-bc1a-9c81e817f50e */
        port CP1_d020 : OBC_EPS_I2CConnectionPoint_EPS {
            doc
            /* ID: d0209b2f-9055-4563-bf84-6fbed595ba3e */
        }
        perform action storeEnergyInTheBatteries_baf4 : StoreEnergyInTheBatteries_baf4 {
            doc
            /* ID: baf48e46-1ee3-431d-a66d-6661df76b0b2 */
        }
    }

    part def ADCS_821a {
        doc
        /* ID: 821a0d99-b5db-4f0c-9139-bf5fc1ee49bc */
        port CP1_b87e : OBC_ADCS_I2CConnectionPoint_ADCS {
            doc
            /* ID: b87eeb52-3547-4a81-a203-9f6da491f153 */
        }
        perform action determineSpinRate_f542 : DetermineSpinRate_f542 {
            doc
            /* ID: f5426c90-6c17-4a80-83cf-23ba962a60f6 */
        }
        perform action controlSpinRate_abee : ControlSpinRate_abee {
            doc
            /* ID: abeed69d-e2aa-4cf1-8d56-c0acbd4cc969 */
        }
        perform action determineAttitude_2f97 : DetermineAttitude_2f97 {
            doc
            /* ID: 2f972f37-cf26-48c2-9740-735735572f77 */
        }
        perform action changeAttitudeToDesiredAttitude_cc1b : ChangeAttitudeToDesiredAttitude_cc1b {
            doc
            /* ID: cc1b7198-63b7-4c57-a802-1c8dd45f8246 */
        }
    }

    part def BitflipPayload_0da2 {
        doc
        /* ID: 0da27ac2-ad89-47ce-bd53-fff6ac3a8020 */
        port CP1_508e : PM_BP_I2CConnectionPoint_BitflipPayload {
            doc
            /* ID: 508e5659-f92c-4af1-a320-41820d470bce */
        }
        perform action storeTheInitialStateDataOnTheUnprotectedMemoryBoards_96de : StoreTheInitialStateDataOnTheUnprotectedMemoryBoards_96de {
            doc
            /* ID: 96de4b44-1565-4a12-ad53-4dbd015c4a68 */
        }
        perform action bitflipsOccur_ac1a : BitflipsOccur_ac1a {
            doc
            /* ID: ac1a9c7b-01e5-4ea5-9387-665e28c21dc6 */
        }
    }

    part def DicePayload_c4be {
        doc
        /* ID: c4be105c-ef8b-4729-b6cf-9bc2cf169302 */
        port CP1_6534 : PM_DP_I2CConnectionPoint_DicePayload {
            doc
            /* ID: 6534cbe4-6ec4-46bc-941d-101cb5364811 */
        }
        perform action clampDice_8f2d : ClampDice_8f2d {
            doc
            /* ID: 8f2d59dc-b881-4d90-9fad-656da67d4b72 */
        }
        perform action turnOnLEDs_5e6d : TurnOnLEDs_5e6d {
            doc
            /* ID: 5e6d67ff-ce6d-4d92-8c29-3115e6ed8770 */
        }
        perform action takeImage_378c : TakeImage_378c {
            doc
            /* ID: 378c7213-9260-4519-8684-c82af1862c6d */
        }
        perform action turnOffLEDs_7c06 : TurnOffLEDs_7c06 {
            doc
            /* ID: 7c06dc51-a46b-48ba-8a41-42145e2de974 */
        }
        perform action unclampDice_a4a8 : UnclampDice_a4a8 {
            doc
            /* ID: a4a80a74-d9a4-45e9-8886-688ea5ee78bc */
        }
    }

    part def OBC_b6d9 {
        doc
        /* ID: b6d9733d-3493-4013-876a-fc08329b311c */
        port CP1_85ee : Antenna_OBC_I2CConnectionPoint_OBC {
            doc
            /* ID: 85ee03e6-1c2b-4cb7-b3e4-2995436c4037 */
        }
        port CP2_47ed : OBC_EPS_I2CConnectionPoint_OBC {
            doc
            /* ID: 47ed9170-3a5e-462c-93f6-0fee63cdf1cc */
        }
        port CP3_e592 : OBC_ADCS_I2CConnectionPoint_OBC {
            doc
            /* ID: e592187c-c8fa-455b-b0eb-fd8993263e44 */
        }
        port CP4_0ac6 : OBC_TC_I2CConnectionPoint_OBC {
            doc
            /* ID: 0ac662fd-9b18-4657-9050-a390d78f07e1 */
        }
        port CP5_b492 : OBC_PM_I2CConnectionPoint_OBC {
            doc
            /* ID: b49254c8-12bb-44e6-aae3-d5fa2874eb53 */
        }
        perform action commandPMToOperateTheDicePayload_b4e5 : CommandPMToOperateTheDicePayload_b4e5 {
            doc
            /* ID: b4e50bd0-b37e-4a5f-b540-d3911f79e49a */
        }
        perform action retrieveDiceImageResults_332d : RetrieveDiceImageResults_332d {
            doc
            /* ID: 332d6866-bf93-40fe-9e0e-51f7af89aa1f */
        }
        perform action shareImageDataWithPM_ebaa : ShareImageDataWithPM_ebaa {
            doc
            /* ID: ebaaf0bd-9537-473c-b473-d4150e0887a2 */
        }
        perform action retrieveBitflipLocations_4248 : RetrieveBitflipLocations_4248 {
            doc
            /* ID: 4248d537-c4ab-49bd-b9c6-99bdef44f0f8 */
        }
        perform action commandAllSubsystemsToPerformTheirOperations_6fa8 : CommandAllSubsystemsToPerformTheirOperations_6fa8 {
            doc
            /* ID: 6fa8e60e-c0ba-46a6-9c42-351c7cdbe3b8 */
        }
        perform action placeSatelliteInSAFEMode_5654 : PlaceSatelliteInSAFEMode_5654 {
            doc
            /* ID: 5654fd01-21a7-42cb-ac6b-bbfee9d6393b */
        }
        perform action placeKeepSatelliteInNOMINALMode_d510 : PlaceKeepSatelliteInNOMINALMode_d510 {
            doc
            /* ID: d510ea24-2aba-4e22-929a-9fdf828d6a92 */
        }
        perform action requestSpecialDiceImageLocation_3b34 : RequestSpecialDiceImageLocation_3b34 {
            doc
            /* ID: 3b34b713-414c-4623-ada0-add7bfbd624f */
        }
        perform action turnOffRequiredSubsystem_829f : TurnOffRequiredSubsystem_829f {
            doc
            /* ID: 829f3c9e-46a0-42eb-840c-adb3bae859a0 */
        }
        perform action housekeeping_b6bd : Housekeeping_b6bd {
            doc
            /* ID: b6bd518f-0f36-40ef-adf8-66be1c413f75 */
        }
        perform action batteryChargeLevel_37e0 : BatteryChargeLevel_37e0 {
            doc
            /* ID: 37e02520-e4a2-4461-8e1f-b1876a86e4ea */
        }
        perform action spinRate_eec7 : SpinRate_eec7 {
            doc
            /* ID: eec7e4aa-dae5-49ce-bde8-3a247a5d5795 */
        }
        perform action temperature_235d : Temperature_235d {
            doc
            /* ID: 235d579f-1346-4c5e-952d-14832f0b2778 */
        }
        perform action combineAllGeneratedData_5334 : CombineAllGeneratedData_5334 {
            doc
            /* ID: 53343957-4564-4f9a-9aae-a4192e973bb0 */
        }
    }

    part def ThermalControl_d84f {
        doc
        /* ID: d84f4ed9-12d7-48a8-af71-0f52fd9a0f8e */
        port CP1_61d1 : OBC_TC_I2CConnectionPoint_ThermalControl {
            doc
            /* ID: 61d1be66-b446-4635-94fb-b682a3ed9725 */
        }
        perform action determineTemperatures_504e : DetermineTemperatures_504e {
            doc
            /* ID: 504e92b3-3754-4490-8cbd-134f658613d8 */
        }
    }

    part def Antenna_ce6f {
        doc
        /* ID: ce6fb7aa-db3c-4df9-b868-c36a3838e9a6 */
        port CP1_cead : Groundstation_Antenna_UHFConnectionPoint_Antenna {
            doc
            /* ID: ceadb698-04d1-46d2-ae45-c6adab619cdc */
        }
        port CP2_1787 : Antenna_Groundstation_VHFConnectionPoint_Antenna {
            doc
            /* ID: 1787aead-2a12-4816-95bb-d69ff976c449 */
        }
        port CP3_be5f : Antenna_OBC_I2CConnectionPoint_Antenna {
            doc
            /* ID: be5fd6b4-7be6-4c66-a9cc-b0b25181d9c4 */
        }
        perform action receiveEducationalSpaceExperimentPlanning_81e9 : ReceiveEducationalSpaceExperimentPlanning_81e9 {
            doc
            /* ID: 81e914fd-b36f-4bb3-bafc-1e6eca235c2f */
        }
        perform action transmitEducationalSpaceExperimentResults_2a0b : TransmitEducationalSpaceExperimentResults_2a0b {
            doc
            /* ID: 2a0bc565-fae1-4e50-97b5-880ef4ca0713 */
        }
        perform action receiveImageData_1eba : ReceiveImageData_1eba {
            doc
            /* ID: 1eba14d8-a71c-4d06-bcbb-04e9ad5bcf0c */
        }
        perform action transmitSpaceRadiationExperimentResults_fdbc : TransmitSpaceRadiationExperimentResults_fdbc {
            doc
            /* ID: fdbc8ba2-65cb-403f-9f95-072e03d2ddf9 */
        }
        perform action receiveMissionOperations_3937 : ReceiveMissionOperations_3937 {
            doc
            /* ID: 39375bff-ee87-4e96-a491-db20a94ffb3c */
        }
        perform action transmitMissionStatus_857f : TransmitMissionStatus_857f {
            doc
            /* ID: 857fe992-ec40-4aff-afd9-55fdbcc42465 */
        }
        perform action receiveDataCollectionCommand_d32a : ReceiveDataCollectionCommand_d32a {
            doc
            /* ID: d32a8cb2-f6f8-457a-b712-cd26e8a93c6a */
        }
        perform action transmitEducationalData_d69b : TransmitEducationalData_d69b {
            doc
            /* ID: d69b6c70-2208-4637-a86f-5aaa7314710b */
        }
    }

    part def PayloadManager_9476 {
        doc
        /* ID: 94769f80-60d0-4edd-891b-bf5b10200191 */
        port CP1_5a2a : OBC_PM_I2CConnectionPoint_PayloadManager {
            doc
            /* ID: 5a2a02df-4dc3-47b7-838d-38165a0f126d */
        }
        port CP2_b7b3 : PM_DP_I2CConnectionPoint_PayloadManager {
            doc
            /* ID: b7b35f2c-5ba5-48eb-8ab3-77d9611452da */
        }
        port CP3_841a : PM_BP_I2CConnectionPoint_PayloadManager {
            doc
            /* ID: 841ab255-9028-4230-beed-0634d256be22 */
        }
        perform action startTheDiceSequence_d389 : StartTheDiceSequence_d389 {
            doc
            /* ID: d389d433-5794-4ed2-92e3-ec3224cf3ef2 */
        }
        perform action storeDiceImageResults_bb51 : StoreDiceImageResults_bb51 {
            doc
            /* ID: bb512222-ef64-4d5d-82b5-d7db7b15ba8b */
        }
        perform action storeImageDataInitialStateOnPM_ac59 : StoreImageDataInitialStateOnPM_ac59 {
            doc
            /* ID: ac59a36c-e8c8-4ebe-8ea1-dfb00c3e9cfe */
        }
        perform action checkForAmountOfBitflips_7d87 : CheckForAmountOfBitflips_7d87 {
            doc
            /* ID: 7d87c049-12cc-4a43-b950-828834883f72 */
        }
        perform action numberOfBitflips_92e9 : NumberOfBitflips_92e9 {
            doc
            /* ID: 92e98ac3-eec0-46cf-af95-2a93cbd590ed */
        }
        perform action determineTheLocationsOfTheBitflips_18b2 : DetermineTheLocationsOfTheBitflips_18b2 {
            doc
            /* ID: 18b2b6a3-c411-4d5a-b95f-fdb9675f9178 */
        }
    }

    part def PrimarySchoolStudents_8d3d {
        doc
        /* ID: 8d3d1a07-6ad6-4a12-9e1c-91e4247b5812 */
        port CP1_df1f : PST_PSS_ClassConnectionPoint_PrimarySchoolStudents {
            doc
            /* ID: df1fbcac-4bc0-4a14-87a1-a50f6052cacf */
        }
        part test_5aea : Test_5aea;
        part test2_410b : Test2_410b;
        perform action participateInLesson_686a : ParticipateInLesson_686a {
            doc
            /* ID: 686aa9e3-b6c9-44a7-b5b3-93bbd246195b */
        }
        perform action becomeInspiredBySpaceMission_7b65 : BecomeInspiredBySpaceMission_7b65 {
            doc
            /* ID: 7b6556ea-3d94-48da-98a1-a630a645afd1 */
        }
    }

    part def Test_5aea {
        doc
        /* ID: 5aea1712-c85f-4207-a441-7a6299a0a9e8 */
    }

    part def Test2_410b {
        doc
        /* ID: 410bd533-f7e9-47b7-9bad-088595f4652a */
    }

    part def HighSchoolStudents_649e {
        doc
        /* ID: 649edc1a-554d-416a-9185-6ea0bea84797 */
        port CP1_0833 : HST_HSS_ClassConnectionPoint_HighSchoolStudents {
            doc
            /* ID: 0833e61b-a2a0-48fe-a76b-73dd8d2dc30a */
        }
        perform action participateInLesson_3e27 : ParticipateInLesson_3e27 {
            doc
            /* ID: 3e277472-9cd8-43c7-8bd8-bbfa389f9d6b */
        }
        perform action learnAboutTheEffectOfSpaceRadiationAndMitigationTechniquesWithProgramming_96b4 : LearnAboutTheEffectOfSpaceRadiationAndMitigationTechniquesWithProgramming_96b4 {
            doc
            /* ID: 96b43304-58e7-4fc3-98a2-027943608beb */
        }
        perform action selectImage_7b1b : SelectImage_7b1b {
            doc
            /* ID: 7b1be887-d3e1-4f6c-9a21-28226c6fc5ae */
        }
    }

    part def PrimarySchoolTeacher_a0a9 {
        doc
        /* ID: a0a979c6-d781-4ce9-a0a1-e70283b427d5 */
        port CP1_4488 : EW_PST_HTMLConnectionPoint_PrimarySchoolTeacher {
            doc
            /* ID: 448839e0-f4fa-4ed1-afe4-646090ce0435 */
        }
        port CP2_6dd3 : PST_PSS_ClassConnectionPoint_PrimarySchoolTeacher {
            doc
            /* ID: 6dd3e2a8-9556-42d9-a719-ab2c413b3d2e */
        }
        perform action prepareSpaceLesson_368d : PrepareSpaceLesson_368d {
            doc
            /* ID: 368d2b4f-9d1a-4da1-b7c9-54e6751080cf */
        }
    }

    part def HighSchoolTeacher_33d6 {
        doc
        /* ID: 33d6b1fd-3116-49bc-8c28-d4332ac003bf */
        port CP1_321e : EW_HST_HTMLConnectionPoint_HighSchoolTeacher {
            doc
            /* ID: 321ed5b2-5065-4c4a-ac70-e55c77dff1b9 */
        }
        port CP2_cd92 : HST_HSS_ClassConnectionPoint_HighSchoolTeacher {
            doc
            /* ID: cd9223af-1561-4c3a-af4d-ecc39c820aaa */
        }
        perform action prepareSpaceRadiationLesson_c0f4 : PrepareSpaceRadiationLesson_c0f4 {
            doc
            /* ID: c0f4939f-f3e3-406d-b197-72a895badd14 */
        }
        perform action checkImage_3804 : CheckImage_3804 {
            doc
            /* ID: 3804c02d-3320-4212-bbe8-969a98a5bf25 */
        }
    }

    part def GroundStation_c28f {
        doc
        /* ID: c28f4c03-1ee6-416c-b801-71e21e7744fd */
        port CP1_9b89 : Groundstation_Antenna_UHFConnectionPoint_GroundStation {
            doc
            /* ID: 9b89a17d-0b94-4520-9f91-c702d144a716 */
        }
        port CP2_0b96 : Antenna_Groundstation_VHFConnectionPoint_GroundStation {
            doc
            /* ID: 0b966a2f-2e0c-4ab5-9266-84c213d871bd */
        }
        port CP3_0a67 : DVS_GS_HDMIConnectionPoint_GroundStation {
            doc
            /* ID: 0a678d23-1012-4ea2-9cad-9f145d26165c */
        }
        perform action transmitMissionOperations_d957 : TransmitMissionOperations_d957 {
            doc
            /* ID: d9573e50-01e8-4c99-ab00-f1a407fe1ae2 */
        }
        perform action receiveMissionStatus_1718 : ReceiveMissionStatus_1718 {
            doc
            /* ID: 17184e40-1957-452f-9d7a-94825388711f */
        }
        perform action transmitCommandForDataCollection_47bc : TransmitCommandForDataCollection_47bc {
            doc
            /* ID: 47bcd7e2-5cb9-47ef-9d2b-1a388c641201 */
        }
        perform action recieveEducationalData_d30c : RecieveEducationalData_d30c {
            doc
            /* ID: d30cf183-45c9-4b1f-a204-7b540f1bd826 */
        }
        perform action transmitImageData_78b4 : TransmitImageData_78b4 {
            doc
            /* ID: 78b40c68-5e84-4bee-9e58-e7f6073ea904 */
        }
        perform action receiveSpaceRadiationExperimentResults_ae11 : ReceiveSpaceRadiationExperimentResults_ae11 {
            doc
            /* ID: ae113ac2-1fe0-4742-b14f-f80839daab99 */
        }
        perform action transmitEducationalSpaceExperimentPlanning_eb64 : TransmitEducationalSpaceExperimentPlanning_eb64 {
            doc
            /* ID: eb64b3ff-4967-4e50-a133-65b315d9b022 */
        }
        perform action receiveEducationalSpaceExperimentResults_1b82 : ReceiveEducationalSpaceExperimentResults_1b82 {
            doc
            /* ID: 1b82d780-f260-40d1-a98e-ac30a62efd53 */
        }
    }

    part def DVSTeam_4003 {
        doc
        /* ID: 40038c2d-5179-4379-b016-8d6c0b64d2c2 */
        port CP1_41aa : DVS_GS_HDMIConnectionPoint_DVSTeam {
            doc
            /* ID: 41aadbe5-858f-46d8-8fbe-fabf926d0042 */
        }
        port CP2_9fe6 : DVS_EW_HTMLConnectionPoint_DVSTeam {
            doc
            /* ID: 9fe6157a-fffa-4670-94bf-ca5fb3ad9bca */
        }
        perform action prepareEducationalSpaceExperiment_83c0 : PrepareEducationalSpaceExperiment_83c0 {
            doc
            /* ID: 83c084dc-78e3-46be-9222-026cf473548f */
        }
        perform action prepareSpaceRadiationExperiment_7ffb : PrepareSpaceRadiationExperiment_7ffb {
            doc
            /* ID: 7ffba36f-a357-4c05-88a5-71341d38b279 */
        }
        perform action planAndScheduleDataCollection_22bb : PlanAndScheduleDataCollection_22bb {
            doc
            /* ID: 22bb4b0d-d8f7-400d-ab7e-6c74961d6c60 */
        }
        perform action planMissionOperations_3b3a : PlanMissionOperations_3b3a {
            doc
            /* ID: 3b3ae73a-f572-41b1-9606-a3f2f6b12c94 */
        }
        perform action monitorMissionStatus_d739 : MonitorMissionStatus_d739 {
            doc
            /* ID: d7394d74-2b17-4b5f-8c5d-13e836729781 */
        }
        perform action separateEducationalModulesData_c249 : SeparateEducationalModulesData_c249 {
            doc
            /* ID: c2494739-b868-412c-b7c1-10a0c1f9cc5b */
        }
        perform action checkTheSpaceRadiationExperimentResults_459a : CheckTheSpaceRadiationExperimentResults_459a {
            doc
            /* ID: 459a866d-d595-42f2-976f-1a5f07a5b273 */
        }
        perform action checkEducationalSpaceExperimentResults_35a2 : CheckEducationalSpaceExperimentResults_35a2 {
            doc
            /* ID: 35a24362-312d-4186-a017-a5392dd42019 */
        }
    }

    part def EducationalWebsite_6571 {
        doc
        /* ID: 65712ea8-162f-455c-aae4-3ad3be1cdce8 */
        port CP1_95cd : DVS_EW_HTMLConnectionPoint_EducationalWebsite {
            doc
            /* ID: 95cdf29f-e344-44f8-b61e-577717021b72 */
        }
        port CP2_021d : EW_HST_HTMLConnectionPoint_EducationalWebsite {
            doc
            /* ID: 021d03f2-445a-45c0-b4b0-4b22b02fc5cf */
        }
        port CP3_afdd : EW_PST_HTMLConnectionPoint_EducationalWebsite {
            doc
            /* ID: afdd1749-f904-4953-8039-ceaebd187684 */
        }
        perform action provideExperimentResultToSchools_58a8 : ProvideExperimentResultToSchools_58a8 {
            doc
            /* ID: 58a8978e-aa3b-4655-8f0d-cea4b613ac52 */
        }
        perform action provideSpaceRadiationExperimentResultsToSchools_8138 : ProvideSpaceRadiationExperimentResultsToSchools_8138 {
            doc
            /* ID: 8138e835-a182-4b1b-b0d5-c971ad777e81 */
        }
        perform action hostEducationalData_fc85 : HostEducationalData_fc85 {
            doc
            /* ID: fc857f9a-d700-430b-b3b1-f4f2c73ba7c5 */
        }
        perform action storeImages_f9a5 : StoreImages_f9a5 {
            doc
            /* ID: f9a5a0ed-5e07-411e-ba50-af3f719157d6 */
        }
    }

    part def GroundStation_692a {
        doc
        /* ID: 692ae12f-f838-4fcf-bc77-55f495c56a54 */
        part antenna_9ead : Antenna_9ead;
        part operator_1c33 : Operator_1c33;
    }

    part def Antenna_9ead {
        doc
        /* ID: 9ead977e-6a37-4971-b77b-253a905b47cc */
        perform action codeTransmitBeacon_cc7f : CODETransmitBeacon_cc7f {
            doc
            /* ID: cc7fbf0b-fb3a-43c6-b372-32169540be49 */
        }
    }

    part def Operator_1c33 {
        doc
        /* ID: 1c33ebbd-2da0-4288-ba8f-ee9daf843823 */
    }

    part def PrimarySchool_dfaf {
        doc
        /* ID: dfaf4a34-e947-4770-8baa-881df8680e31 */
        part pTeacher_7f28 : PTeacher_7f28;
        part pStudent_1c99 : PStudent_1c99;
    }

    part def PTeacher_7f28 {
        doc
        /* ID: 7f28d4d3-5451-4b38-8759-c181de964885 */
    }

    part def PStudent_1c99 {
        doc
        /* ID: 1c993e30-74f8-4931-89f9-ade8c138fd79 */
    }

    part def HighSchool_7ee1 {
        doc
        /* ID: 7ee1c80d-f27f-4748-a815-3df8b92d4bee */
        part hTeacher_5ece : HTeacher_5ece;
        part hStudent_cf75 : HStudent_cf75;
    }

    part def HTeacher_5ece {
        doc
        /* ID: 5ece2182-5a03-4b25-8cfa-893d9b3337a6 */
    }

    part def HStudent_cf75 {
        doc
        /* ID: cf756c0c-c185-498d-94ea-afaa1d15de8c */
    }

    part def DaVinciSatelliteTeam_5ef2 {
        doc
        /* ID: 5ef24e08-1ddf-46f1-833f-eb32bd814165 */
        part techTeam_1aa0 : TechTeam_1aa0;
        part businessTeam_09c2 : BusinessTeam_09c2;
        part educationTeam_f7ff : EducationTeam_f7ff;
        perform action codeSignTheSponsorContract_5110 : CODESignTheSponsorContract_5110 {
            doc
            /* ID: 5110203f-3433-4b37-8e4a-7b2a39a887b3 */
        }
    }

    part def TechTeam_1aa0 {
        doc
        /* ID: 1aa09486-55d5-4ee8-a605-326eb85a3ef9 */
        part seTeam_deb6 : SETeam_deb6;
        part aivTeam_e426 : AIVTeam_e426;
    }

    part def SETeam_deb6 {
        doc
        /* ID: deb670c6-d0ad-4a6c-9c29-504e41b37601 */
    }

    part def AIVTeam_e426 {
        doc
        /* ID: e4266fdf-78e3-4ecd-96f9-9942d89c417c */
    }

    part def BusinessTeam_09c2 {
        doc
        /* ID: 09c27a8e-4f73-4f9f-8eca-d6f6c76e0599 */
        perform action codeSelectCompaniesThatProduceComponents_91c3 : CODESelectCompaniesThatProduceComponents_91c3 {
            doc
            /* ID: 91c339dd-0099-46a1-9e46-9658faa25350 */
        }
        perform action codeTest21_c0a4 : CODETest21_c0a4 {
            doc
            /* ID: c0a496ed-9eed-40ee-a4d1-236467e64149 */
        }
        perform action codeMakeASponsorContract_8a8f : CODEMakeASponsorContract_8a8f {
            doc
            /* ID: 8a8f7fbe-749b-4b2a-8df3-49d0a2a37df0 */
        }
    }

    part def EducationTeam_f7ff {
        doc
        /* ID: f7fff55f-5213-487b-a316-34d6e427c1b5 */
        part test_6a19 : Test_6a19;
    }

    part def Test_6a19 {
        doc
        /* ID: 6a1996c8-fae7-469e-8f98-31d7eab668c7 */
    }

    port def Groundstation_Antenna_UHFConnectionPoint_GroundStation {
        /* exchange allocation items */
        out item uplinkImageData : UplinkImageData;
        out item uplinkDataCollectionCommand : UplinkDataCollectionCommand;
        out item uplinkMissionOperations : UplinkMissionOperations;
        out item uplinkEducationalSpaceExperimentPlanning : UplinkEducationalSpaceExperimentPlanning;
    }

    port def Groundstation_Antenna_UHFConnectionPoint_Antenna {
        /* exchange allocation items */
        in item uplinkImageData : UplinkImageData;
        in item uplinkDataCollectionCommand : UplinkDataCollectionCommand;
        in item uplinkMissionOperations : UplinkMissionOperations;
        in item uplinkEducationalSpaceExperimentPlanning : UplinkEducationalSpaceExperimentPlanning;
    }

    port def Antenna_Groundstation_VHFConnectionPoint_Antenna {
        /* exchange allocation items */
        out item downlinkEducationalData : DownlinkEducationalData;
        out item downlinkEducationalSpaceExperimentResults : DownlinkEducationalSpaceExperimentResults;
        out item downlinkMissionStatus : DownlinkMissionStatus;
        out item downlinkSpaceRadiationExperimentResults : DownlinkSpaceRadiationExperimentResults;
    }

    port def Antenna_Groundstation_VHFConnectionPoint_GroundStation {
        /* exchange allocation items */
        in item downlinkEducationalData : DownlinkEducationalData;
        in item downlinkEducationalSpaceExperimentResults : DownlinkEducationalSpaceExperimentResults;
        in item downlinkMissionStatus : DownlinkMissionStatus;
        in item downlinkSpaceRadiationExperimentResults : DownlinkSpaceRadiationExperimentResults;
    }

    port def DVS_GS_HDMIConnectionPoint_DVSTeam {
        /* exchange allocation items */
        out item relayEducationalSpaceExperimentResults : RelayEducationalSpaceExperimentResults;
        out item relaySpaceRadiationExperimentResults : RelaySpaceRadiationExperimentResults;
        out item relayImageForSpaceRadiationExperiment : RelayImageForSpaceRadiationExperiment;
        out item relayEducationalDataWithDVSTeam : RelayEducationalDataWithDVSTeam;
        out item relayEducationalSpaceExperimentPlanning : RelayEducationalSpaceExperimentPlanning;
        out item relayDataCollectionScheduleWithGroundStation : RelayDataCollectionScheduleWithGroundStation;
        out item relayMissionOperationsWithGroundStation : RelayMissionOperationsWithGroundStation;
        out item relayMissionOperationalStatusWithDVSTeam : RelayMissionOperationalStatusWithDVSTeam;
    }

    port def DVS_GS_HDMIConnectionPoint_GroundStation {
        /* exchange allocation items */
        in item relayEducationalSpaceExperimentResults : RelayEducationalSpaceExperimentResults;
        in item relaySpaceRadiationExperimentResults : RelaySpaceRadiationExperimentResults;
        in item relayImageForSpaceRadiationExperiment : RelayImageForSpaceRadiationExperiment;
        in item relayEducationalDataWithDVSTeam : RelayEducationalDataWithDVSTeam;
        in item relayEducationalSpaceExperimentPlanning : RelayEducationalSpaceExperimentPlanning;
        in item relayDataCollectionScheduleWithGroundStation : RelayDataCollectionScheduleWithGroundStation;
        in item relayMissionOperationsWithGroundStation : RelayMissionOperationsWithGroundStation;
        in item relayMissionOperationalStatusWithDVSTeam : RelayMissionOperationalStatusWithDVSTeam;
    }

    port def DVS_EW_HTMLConnectionPoint_DVSTeam {
        /* exchange allocation items */
        out item uploadEducationalSpaceExperimentResults : UploadEducationalSpaceExperimentResults;
        out item uploadSpaceRadiationResultsToTheWebsite : UploadSpaceRadiationResultsToTheWebsite;
        out item uploadTheDataOfTheEducationalModules : UploadTheDataOfTheEducationalModules;
        out item selectTheLatestImage : SelectTheLatestImage;
    }

    port def DVS_EW_HTMLConnectionPoint_EducationalWebsite {
        /* exchange allocation items */
        in item uploadEducationalSpaceExperimentResults : UploadEducationalSpaceExperimentResults;
        in item uploadSpaceRadiationResultsToTheWebsite : UploadSpaceRadiationResultsToTheWebsite;
        in item uploadTheDataOfTheEducationalModules : UploadTheDataOfTheEducationalModules;
        in item selectTheLatestImage : SelectTheLatestImage;
    }

    port def EW_HST_HTMLConnectionPoint_EducationalWebsite {
        /* exchange allocation items */
        out item uploadImageToTheWebsite : UploadImageToTheWebsite;
        out item accessSpaceRadiationExperimentResults : AccessSpaceRadiationExperimentResults;
    }

    port def EW_HST_HTMLConnectionPoint_HighSchoolTeacher {
        /* exchange allocation items */
        in item uploadImageToTheWebsite : UploadImageToTheWebsite;
        in item accessSpaceRadiationExperimentResults : AccessSpaceRadiationExperimentResults;
    }

    port def EW_PST_HTMLConnectionPoint_EducationalWebsite {
        /* exchange allocation items */
        out item accessExperimentResults : AccessExperimentResults;
    }

    port def EW_PST_HTMLConnectionPoint_PrimarySchoolTeacher {
        /* exchange allocation items */
        in item accessExperimentResults : AccessExperimentResults;
    }

    port def HST_HSS_ClassConnectionPoint_HighSchoolTeacher {
        /* exchange allocation items */
        out item teachSpaceRadiationLesson : TeachSpaceRadiationLesson;
        out item giveImageToTheTeacher : GiveImageToTheTeacher;
    }

    port def HST_HSS_ClassConnectionPoint_HighSchoolStudents {
        /* exchange allocation items */
        in item teachSpaceRadiationLesson : TeachSpaceRadiationLesson;
        in item giveImageToTheTeacher : GiveImageToTheTeacher;
    }

    port def PST_PSS_ClassConnectionPoint_PrimarySchoolTeacher {
        /* exchange allocation items */
        out item teachLessonUsingExperiment : TeachLessonUsingExperiment;
    }

    port def PST_PSS_ClassConnectionPoint_PrimarySchoolStudents {
        /* exchange allocation items */
        in item teachLessonUsingExperiment : TeachLessonUsingExperiment;
    }

    port def Antenna_OBC_I2CConnectionPoint_Antenna {
        /* exchange allocation items */
        out item commandAntennaToDownlinkDiceImageResults : CommandAntennaToDownlinkDiceImageResults;
        out item relayBitflipImageDataToOBC : RelayBitflipImageDataToOBC;
        out item relayMissionOperationsToOBC : RelayMissionOperationsToOBC;
        out item relayCommandForDataCollection : RelayCommandForDataCollection;
        out item commandAntennaToDownlinkAllGeneratedData : CommandAntennaToDownlinkAllGeneratedData;
        out item relayEducationalData : RelayEducationalData;
        out item relayDicePlanningToOBC : RelayDicePlanningToOBC;
        out item commandAntennaToDownlinkSpaceRadiationExperimentResults : CommandAntennaToDownlinkSpaceRadiationExperimentResults;
    }

    port def Antenna_OBC_I2CConnectionPoint_OBC {
        /* exchange allocation items */
        in item commandAntennaToDownlinkDiceImageResults : CommandAntennaToDownlinkDiceImageResults;
        in item relayBitflipImageDataToOBC : RelayBitflipImageDataToOBC;
        in item relayMissionOperationsToOBC : RelayMissionOperationsToOBC;
        in item relayCommandForDataCollection : RelayCommandForDataCollection;
        in item commandAntennaToDownlinkAllGeneratedData : CommandAntennaToDownlinkAllGeneratedData;
        in item relayEducationalData : RelayEducationalData;
        in item relayDicePlanningToOBC : RelayDicePlanningToOBC;
        in item commandAntennaToDownlinkSpaceRadiationExperimentResults : CommandAntennaToDownlinkSpaceRadiationExperimentResults;
    }

    port def OBC_EPS_I2CConnectionPoint_OBC {
        /* exchange allocation items */
        out item checkEnergyLevels : CheckEnergyLevels;
        out item energyLevel : EnergyLevel;
    }

    port def OBC_EPS_I2CConnectionPoint_EPS {
        /* exchange allocation items */
        in item checkEnergyLevels : CheckEnergyLevels;
        in item energyLevel : EnergyLevel;
    }

    port def OBC_ADCS_I2CConnectionPoint_OBC {
        /* exchange allocation items */
        out item commandADCSToRepositionTheSatellite : CommandADCSToRepositionTheSatellite;
        out item spinRateBetweenOperationalMarginAndCriticalLevel : SpinRateBetweenOperationalMarginAndCriticalLevel;
        out item checkSpinRate : CheckSpinRate;
        out item relayThatTheSatelliteIsInDesiredAttitude : RelayThatTheSatelliteIsInDesiredAttitude;
        out item spinRate : SpinRate;
    }

    port def OBC_ADCS_I2CConnectionPoint_ADCS {
        /* exchange allocation items */
        in item commandADCSToRepositionTheSatellite : CommandADCSToRepositionTheSatellite;
        in item spinRateBetweenOperationalMarginAndCriticalLevel : SpinRateBetweenOperationalMarginAndCriticalLevel;
        in item checkSpinRate : CheckSpinRate;
        in item relayThatTheSatelliteIsInDesiredAttitude : RelayThatTheSatelliteIsInDesiredAttitude;
        in item spinRate : SpinRate;
    }

    port def OBC_TC_I2CConnectionPoint_OBC {
        /* exchange allocation items */
        out item checkTemperatures : CheckTemperatures;
        out item temperatureLevel : TemperatureLevel;
    }

    port def OBC_TC_I2CConnectionPoint_ThermalControl {
        /* exchange allocation items */
        in item checkTemperatures : CheckTemperatures;
        in item temperatureLevel : TemperatureLevel;
    }

    port def OBC_PM_I2CConnectionPoint_OBC {
        /* exchange allocation items */
        out item relayBitflipImageDataToPM : RelayBitflipImageDataToPM;
        out item shareDiceImageResults : ShareDiceImageResults;
        out item shareBitflipLocations : ShareBitflipLocations;
        out item giveCommandToStartDiceToPM : GiveCommandToStartDiceToPM;
    }

    port def OBC_PM_I2CConnectionPoint_PayloadManager {
        /* exchange allocation items */
        in item relayBitflipImageDataToPM : RelayBitflipImageDataToPM;
        in item shareDiceImageResults : ShareDiceImageResults;
        in item shareBitflipLocations : ShareBitflipLocations;
        in item giveCommandToStartDiceToPM : GiveCommandToStartDiceToPM;
    }

    port def PM_DP_I2CConnectionPoint_PayloadManager {
        /* exchange allocation items */
        out item relayCommandToTheDicePayload : RelayCommandToTheDicePayload;
        out item diceAreUnclamped : DiceAreUnclamped;
    }

    port def PM_DP_I2CConnectionPoint_DicePayload {
        /* exchange allocation items */
        in item relayCommandToTheDicePayload : RelayCommandToTheDicePayload;
        in item diceAreUnclamped : DiceAreUnclamped;
    }

    port def PM_BP_I2CConnectionPoint_PayloadManager {
        /* exchange allocation items */
        out item numberOfBitflips : NumberOfBitflips;
        out item notEnoughBitflipsHaveOccured : NotEnoughBitflipsHaveOccured;
        out item shareTheInitialImageData : ShareTheInitialImageData;
    }

    port def PM_BP_I2CConnectionPoint_BitflipPayload {
        /* exchange allocation items */
        in item numberOfBitflips : NumberOfBitflips;
        in item notEnoughBitflipsHaveOccured : NotEnoughBitflipsHaveOccured;
        in item shareTheInitialImageData : ShareTheInitialImageData;
    }

    interface def Groundstation_Antenna_UHF_Interface {
        end port groundStationC28fPort : Groundstation_Antenna_UHFConnectionPoint_GroundStation;
        end port antennaCe6fPort : Groundstation_Antenna_UHFConnectionPoint_Antenna;
        flow of UplinkImageData from groundStationC28fPort.uplinkImageData to antennaCe6fPort.uplinkImageData;
        flow of UplinkDataCollectionCommand from groundStationC28fPort.uplinkDataCollectionCommand to antennaCe6fPort.uplinkDataCollectionCommand;
        flow of UplinkMissionOperations from groundStationC28fPort.uplinkMissionOperations to antennaCe6fPort.uplinkMissionOperations;
        flow of UplinkEducationalSpaceExperimentPlanning from groundStationC28fPort.uplinkEducationalSpaceExperimentPlanning to antennaCe6fPort.uplinkEducationalSpaceExperimentPlanning;
    }

    interface def Antenna_Groundstation_VHF_Interface {
        end port antennaCe6fPort : Antenna_Groundstation_VHFConnectionPoint_Antenna;
        end port groundStationC28fPort : Antenna_Groundstation_VHFConnectionPoint_GroundStation;
        flow of DownlinkEducationalData from antennaCe6fPort.downlinkEducationalData to groundStationC28fPort.downlinkEducationalData;
        flow of DownlinkEducationalSpaceExperimentResults from antennaCe6fPort.downlinkEducationalSpaceExperimentResults to groundStationC28fPort.downlinkEducationalSpaceExperimentResults;
        flow of DownlinkEducationalData from antennaCe6fPort.downlinkEducationalData to groundStationC28fPort.downlinkEducationalData;
        flow of DownlinkEducationalData from antennaCe6fPort.downlinkEducationalData to groundStationC28fPort.downlinkEducationalData;
        flow of DownlinkMissionStatus from antennaCe6fPort.downlinkMissionStatus to groundStationC28fPort.downlinkMissionStatus;
        flow of DownlinkSpaceRadiationExperimentResults from antennaCe6fPort.downlinkSpaceRadiationExperimentResults to groundStationC28fPort.downlinkSpaceRadiationExperimentResults;
    }

    interface def DVS_GS_HDMI_Interface {
        end port dvsTeam4003Port : DVS_GS_HDMIConnectionPoint_DVSTeam;
        end port groundStationC28fPort : DVS_GS_HDMIConnectionPoint_GroundStation;
        flow of RelayEducationalSpaceExperimentResults from dvsTeam4003Port.relayEducationalSpaceExperimentResults to groundStationC28fPort.relayEducationalSpaceExperimentResults;
        flow of RelaySpaceRadiationExperimentResults from dvsTeam4003Port.relaySpaceRadiationExperimentResults to groundStationC28fPort.relaySpaceRadiationExperimentResults;
        flow of RelayImageForSpaceRadiationExperiment from dvsTeam4003Port.relayImageForSpaceRadiationExperiment to groundStationC28fPort.relayImageForSpaceRadiationExperiment;
        flow of RelayEducationalDataWithDVSTeam from dvsTeam4003Port.relayEducationalDataWithDVSTeam to groundStationC28fPort.relayEducationalDataWithDVSTeam;
        flow of RelayEducationalSpaceExperimentPlanning from dvsTeam4003Port.relayEducationalSpaceExperimentPlanning to groundStationC28fPort.relayEducationalSpaceExperimentPlanning;
        flow of RelayDataCollectionScheduleWithGroundStation from dvsTeam4003Port.relayDataCollectionScheduleWithGroundStation to groundStationC28fPort.relayDataCollectionScheduleWithGroundStation;
        flow of RelayMissionOperationsWithGroundStation from dvsTeam4003Port.relayMissionOperationsWithGroundStation to groundStationC28fPort.relayMissionOperationsWithGroundStation;
        flow of RelayMissionOperationalStatusWithDVSTeam from dvsTeam4003Port.relayMissionOperationalStatusWithDVSTeam to groundStationC28fPort.relayMissionOperationalStatusWithDVSTeam;
    }

    interface def DVS_EW_HTML_Interface {
        end port dvsTeam4003Port : DVS_EW_HTMLConnectionPoint_DVSTeam;
        end port educationalWebsite6571Port : DVS_EW_HTMLConnectionPoint_EducationalWebsite;
        flow of UploadEducationalSpaceExperimentResults from dvsTeam4003Port.uploadEducationalSpaceExperimentResults to educationalWebsite6571Port.uploadEducationalSpaceExperimentResults;
        flow of UploadSpaceRadiationResultsToTheWebsite from dvsTeam4003Port.uploadSpaceRadiationResultsToTheWebsite to educationalWebsite6571Port.uploadSpaceRadiationResultsToTheWebsite;
        flow of UploadTheDataOfTheEducationalModules from dvsTeam4003Port.uploadTheDataOfTheEducationalModules to educationalWebsite6571Port.uploadTheDataOfTheEducationalModules;
        flow of SelectTheLatestImage from dvsTeam4003Port.selectTheLatestImage to educationalWebsite6571Port.selectTheLatestImage;
    }

    interface def EW_HST_HTML_Interface {
        end port educationalWebsite6571Port : EW_HST_HTMLConnectionPoint_EducationalWebsite;
        end port highSchoolTeacher33d6Port : EW_HST_HTMLConnectionPoint_HighSchoolTeacher;
        flow of UploadImageToTheWebsite from educationalWebsite6571Port.uploadImageToTheWebsite to highSchoolTeacher33d6Port.uploadImageToTheWebsite;
        flow of AccessSpaceRadiationExperimentResults from educationalWebsite6571Port.accessSpaceRadiationExperimentResults to highSchoolTeacher33d6Port.accessSpaceRadiationExperimentResults;
    }

    interface def EW_PST_HTML_Interface {
        end port educationalWebsite6571Port : EW_PST_HTMLConnectionPoint_EducationalWebsite;
        end port primarySchoolTeacherA0a9Port : EW_PST_HTMLConnectionPoint_PrimarySchoolTeacher;
        flow of AccessExperimentResults from educationalWebsite6571Port.accessExperimentResults to primarySchoolTeacherA0a9Port.accessExperimentResults;
    }

    interface def HST_HSS_Class_Interface {
        end port highSchoolTeacher33d6Port : HST_HSS_ClassConnectionPoint_HighSchoolTeacher;
        end port highSchoolStudents649ePort : HST_HSS_ClassConnectionPoint_HighSchoolStudents;
        flow of TeachSpaceRadiationLesson from highSchoolTeacher33d6Port.teachSpaceRadiationLesson to highSchoolStudents649ePort.teachSpaceRadiationLesson;
        flow of GiveImageToTheTeacher from highSchoolTeacher33d6Port.giveImageToTheTeacher to highSchoolStudents649ePort.giveImageToTheTeacher;
    }

    interface def PST_PSS_Class_Interface {
        end port primarySchoolTeacherA0a9Port : PST_PSS_ClassConnectionPoint_PrimarySchoolTeacher;
        end port primarySchoolStudents8d3dPort : PST_PSS_ClassConnectionPoint_PrimarySchoolStudents;
        flow of TeachLessonUsingExperiment from primarySchoolTeacherA0a9Port.teachLessonUsingExperiment to primarySchoolStudents8d3dPort.teachLessonUsingExperiment;
    }

    interface def Antenna_OBC_I2C_Interface {
        end port antennaCe6fPort : Antenna_OBC_I2CConnectionPoint_Antenna;
        end port obcb6d9Port : Antenna_OBC_I2CConnectionPoint_OBC;
        flow of CommandAntennaToDownlinkDiceImageResults from antennaCe6fPort.commandAntennaToDownlinkDiceImageResults to obcb6d9Port.commandAntennaToDownlinkDiceImageResults;
        flow of RelayBitflipImageDataToOBC from antennaCe6fPort.relayBitflipImageDataToOBC to obcb6d9Port.relayBitflipImageDataToOBC;
        flow of RelayMissionOperationsToOBC from antennaCe6fPort.relayMissionOperationsToOBC to obcb6d9Port.relayMissionOperationsToOBC;
        flow of RelayCommandForDataCollection from antennaCe6fPort.relayCommandForDataCollection to obcb6d9Port.relayCommandForDataCollection;
        flow of CommandAntennaToDownlinkAllGeneratedData from antennaCe6fPort.commandAntennaToDownlinkAllGeneratedData to obcb6d9Port.commandAntennaToDownlinkAllGeneratedData;
        flow of RelayEducationalData from antennaCe6fPort.relayEducationalData to obcb6d9Port.relayEducationalData;
        flow of RelayDicePlanningToOBC from antennaCe6fPort.relayDicePlanningToOBC to obcb6d9Port.relayDicePlanningToOBC;
        flow of CommandAntennaToDownlinkSpaceRadiationExperimentResults from antennaCe6fPort.commandAntennaToDownlinkSpaceRadiationExperimentResults to obcb6d9Port.commandAntennaToDownlinkSpaceRadiationExperimentResults;
    }

    interface def OBC_EPS_I2C_Interface {
        end port obcb6d9Port : OBC_EPS_I2CConnectionPoint_OBC;
        end port epsCc31Port : OBC_EPS_I2CConnectionPoint_EPS;
        flow of CheckEnergyLevels from obcb6d9Port.checkEnergyLevels to epsCc31Port.checkEnergyLevels;
        flow of EnergyLevel from obcb6d9Port.energyLevel to epsCc31Port.energyLevel;
    }

    interface def OBC_ADCS_I2C_Interface {
        end port obcb6d9Port : OBC_ADCS_I2CConnectionPoint_OBC;
        end port adcs821aPort : OBC_ADCS_I2CConnectionPoint_ADCS;
        flow of CommandADCSToRepositionTheSatellite from obcb6d9Port.commandADCSToRepositionTheSatellite to adcs821aPort.commandADCSToRepositionTheSatellite;
        flow of SpinRateBetweenOperationalMarginAndCriticalLevel from obcb6d9Port.spinRateBetweenOperationalMarginAndCriticalLevel to adcs821aPort.spinRateBetweenOperationalMarginAndCriticalLevel;
        flow of CheckSpinRate from obcb6d9Port.checkSpinRate to adcs821aPort.checkSpinRate;
        flow of RelayThatTheSatelliteIsInDesiredAttitude from obcb6d9Port.relayThatTheSatelliteIsInDesiredAttitude to adcs821aPort.relayThatTheSatelliteIsInDesiredAttitude;
        flow of SpinRate from obcb6d9Port.spinRate to adcs821aPort.spinRate;
    }

    interface def OBC_TC_I2C_Interface {
        end port obcb6d9Port : OBC_TC_I2CConnectionPoint_OBC;
        end port thermalControlD84fPort : OBC_TC_I2CConnectionPoint_ThermalControl;
        flow of CheckTemperatures from obcb6d9Port.checkTemperatures to thermalControlD84fPort.checkTemperatures;
        flow of TemperatureLevel from obcb6d9Port.temperatureLevel to thermalControlD84fPort.temperatureLevel;
    }

    interface def OBC_PM_I2C_Interface {
        end port obcb6d9Port : OBC_PM_I2CConnectionPoint_OBC;
        end port payloadManager9476Port : OBC_PM_I2CConnectionPoint_PayloadManager;
        flow of RelayBitflipImageDataToPM from obcb6d9Port.relayBitflipImageDataToPM to payloadManager9476Port.relayBitflipImageDataToPM;
        flow of ShareDiceImageResults from obcb6d9Port.shareDiceImageResults to payloadManager9476Port.shareDiceImageResults;
        flow of ShareBitflipLocations from obcb6d9Port.shareBitflipLocations to payloadManager9476Port.shareBitflipLocations;
        flow of GiveCommandToStartDiceToPM from obcb6d9Port.giveCommandToStartDiceToPM to payloadManager9476Port.giveCommandToStartDiceToPM;
    }

    interface def PM_DP_I2C_Interface {
        end port payloadManager9476Port : PM_DP_I2CConnectionPoint_PayloadManager;
        end port dicePayloadC4bePort : PM_DP_I2CConnectionPoint_DicePayload;
        flow of RelayCommandToTheDicePayload from payloadManager9476Port.relayCommandToTheDicePayload to dicePayloadC4bePort.relayCommandToTheDicePayload;
        flow of DiceAreUnclamped from payloadManager9476Port.diceAreUnclamped to dicePayloadC4bePort.diceAreUnclamped;
    }

    interface def PM_BP_I2C_Interface {
        end port payloadManager9476Port : PM_BP_I2CConnectionPoint_PayloadManager;
        end port bitflipPayload0da2Port : PM_BP_I2CConnectionPoint_BitflipPayload;
        flow of NumberOfBitflips from payloadManager9476Port.numberOfBitflips to bitflipPayload0da2Port.numberOfBitflips;
        flow of NotEnoughBitflipsHaveOccured from payloadManager9476Port.notEnoughBitflipsHaveOccured to bitflipPayload0da2Port.notEnoughBitflipsHaveOccured;
        flow of ShareTheInitialImageData from payloadManager9476Port.shareTheInitialImageData to bitflipPayload0da2Port.shareTheInitialImageData;
    }

    connection def Groundstation_Antenna_UHF {
        doc
        /* ID: 7e77c7a6-9df0-4ca9-957c-f802f5b41a84 */
        end part groundStationC28f : GroundStation_c28f;
        end part antennaCe6f : Antenna_ce6f;
        interface : Groundstation_Antenna_UHF connect groundStationC28f.CP1_9b89 to antennaCe6f.CP1_cead;
    }

    connection def Antenna_Groundstation_VHF {
        doc
        /* ID: 90be11ae-e201-4be3-b7ae-3df18d23c569 */
        end part antennaCe6f : Antenna_ce6f;
        end part groundStationC28f : GroundStation_c28f;
        interface : Antenna_Groundstation_VHF connect antennaCe6f.CP2_1787 to groundStationC28f.CP2_0b96;
    }

    connection def DVS_GS_HDMI {
        doc
        /* ID: e3d235b8-88e0-41cc-9ae7-6da3dcd39aae */
        end part dvsTeam4003 : DVSTeam_4003;
        end part groundStationC28f : GroundStation_c28f;
        interface : DVS_GS_HDMI connect dvsTeam4003.CP1_41aa to groundStationC28f.CP3_0a67;
    }

    connection def DVS_EW_HTML {
        doc
        /* ID: 82bdc1b8-4a60-4b9c-9084-39c2e38cb0de */
        end part dvsTeam4003 : DVSTeam_4003;
        end part educationalWebsite6571 : EducationalWebsite_6571;
        interface : DVS_EW_HTML connect dvsTeam4003.CP2_9fe6 to educationalWebsite6571.CP1_95cd;
    }

    connection def EW_HST_HTML {
        doc
        /* ID: 42483b1f-7681-407e-a898-3b50d890da87 */
        end part educationalWebsite6571 : EducationalWebsite_6571;
        end part highSchoolTeacher33d6 : HighSchoolTeacher_33d6;
        interface : EW_HST_HTML connect educationalWebsite6571.CP2_021d to highSchoolTeacher33d6.CP1_321e;
    }

    connection def EW_PST_HTML {
        doc
        /* ID: b72c1aa8-2364-4540-9538-371af6bfe681 */
        end part educationalWebsite6571 : EducationalWebsite_6571;
        end part primarySchoolTeacherA0a9 : PrimarySchoolTeacher_a0a9;
        interface : EW_PST_HTML connect educationalWebsite6571.CP3_afdd to primarySchoolTeacherA0a9.CP1_4488;
    }

    connection def HST_HSS_Class {
        doc
        /* ID: 09542438-1e35-4755-aaeb-c25da0010d9d */
        end part highSchoolTeacher33d6 : HighSchoolTeacher_33d6;
        end part highSchoolStudents649e : HighSchoolStudents_649e;
        interface : HST_HSS_Class connect highSchoolTeacher33d6.CP2_cd92 to highSchoolStudents649e.CP1_0833;
    }

    connection def PST_PSS_Class {
        doc
        /* ID: bff9fda2-07ce-4800-9029-8a08450ef050 */
        end part primarySchoolTeacherA0a9 : PrimarySchoolTeacher_a0a9;
        end part primarySchoolStudents8d3d : PrimarySchoolStudents_8d3d;
        interface : PST_PSS_Class connect primarySchoolTeacherA0a9.CP2_6dd3 to primarySchoolStudents8d3d.CP1_df1f;
    }

    connection def Antenna_OBC_I2C {
        doc
        /* ID: 43c701b7-ec72-4d58-bb50-caa2e8edba02 */
        end part antennaCe6f : Antenna_ce6f;
        end part obcb6d9 : OBC_b6d9;
        interface : Antenna_OBC_I2C connect antennaCe6f.CP3_be5f to obcb6d9.CP1_85ee;
    }

    connection def OBC_EPS_I2C {
        doc
        /* ID: 2aa622c5-a4a8-429d-ba35-4a5c3db78101 */
        end part obcb6d9 : OBC_b6d9;
        end part epsCc31 : EPS_cc31;
        interface : OBC_EPS_I2C connect obcb6d9.CP2_47ed to epsCc31.CP1_d020;
    }

    connection def OBC_ADCS_I2C {
        doc
        /* ID: 7f4a5d6e-f6ed-4437-b761-24bf3528d841 */
        end part obcb6d9 : OBC_b6d9;
        end part adcs821a : ADCS_821a;
        interface : OBC_ADCS_I2C connect obcb6d9.CP3_e592 to adcs821a.CP1_b87e;
    }

    connection def OBC_TC_I2C {
        doc
        /* ID: 7da52f53-feee-4162-9e29-7c85c30d764c */
        end part obcb6d9 : OBC_b6d9;
        end part thermalControlD84f : ThermalControl_d84f;
        interface : OBC_TC_I2C connect obcb6d9.CP4_0ac6 to thermalControlD84f.CP1_61d1;
    }

    connection def OBC_PM_I2C {
        doc
        /* ID: 2dec7d3c-d1b0-4b18-86dd-0012d06c6cfc */
        end part obcb6d9 : OBC_b6d9;
        end part payloadManager9476 : PayloadManager_9476;
        interface : OBC_PM_I2C connect obcb6d9.CP5_b492 to payloadManager9476.CP1_5a2a;
    }

    connection def PM_DP_I2C {
        doc
        /* ID: 876b884b-20ac-4073-8f00-b7ca4ad2f9dc */
        end part payloadManager9476 : PayloadManager_9476;
        end part dicePayloadC4be : DicePayload_c4be;
        interface : PM_DP_I2C connect payloadManager9476.CP2_b7b3 to dicePayloadC4be.CP1_6534;
    }

    connection def PM_BP_I2C {
        doc
        /* ID: a6e19c3c-f682-4301-84ff-fcb4853a1964 */
        end part payloadManager9476 : PayloadManager_9476;
        end part bitflipPayload0da2 : BitflipPayload_0da2;
        interface : PM_BP_I2C connect payloadManager9476.CP3_841a to bitflipPayload0da2.CP1_508e;
    }

}