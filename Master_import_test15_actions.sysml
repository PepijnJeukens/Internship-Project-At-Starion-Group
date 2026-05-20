package Actions15 {

    action def PrepareEducationalSpaceExperiment_83c0 {
        doc
        /* ID: 83c084dc-78e3-46be-9222-026cf473548f */
        port outPublishexperimentresults_55b4 : RelayEducationalSpaceExperimentPlanningFuncOut {
            doc
            /* ID: 55b4c079-dd27-4830-887a-d64df0f45c5f */
        }
    }

    action def ProvideExperimentResultToSchools_58a8 {
        doc
        /* ID: 58a8978e-aa3b-4655-8f0d-cea4b613ac52 */
        port outAccessexperimentresults_ed57 : AccessExperimentResultsFuncOut {
            doc
            /* ID: ed57f638-23af-4313-bff1-329a912301b2 */
        }
        port inPublishexperimentresults_ccdd : UploadEducationalSpaceExperimentResultsFuncIn {
            doc
            /* ID: ccdd075d-3fc6-4198-9fdc-b95e16bab33d */
        }
    }

    action def PrepareSpaceLesson_368d {
        doc
        /* ID: 368d2b4f-9d1a-4da1-b7c9-54e6751080cf */
        port inAccessexperimentresults_0b41 : AccessExperimentResultsFuncIn {
            doc
            /* ID: 0b41b6bd-aa8f-4bd4-9eea-68ca6e5adb67 */
        }
        port outTeachlessonusingexperiment_a7db : TeachLessonUsingExperimentFuncOut {
            doc
            /* ID: a7dbca42-a331-4156-b9de-05d7486107a9 */
        }
    }

    action def ParticipateInLesson_686a {
        doc
        /* ID: 686aa9e3-b6c9-44a7-b5b3-93bbd246195b */
        port inTeachlessonusingexperiment_36fc : TeachLessonUsingExperimentFuncIn {
            doc
            /* ID: 36fce599-37e7-4b07-9ccc-c813e7813764 */
        }
        port outObservespaceexperimentresults_4ed3 : ObserveSpaceExperimentResultsFuncOut {
            doc
            /* ID: 4ed3d8f2-4418-4e9f-93e7-2a96e45d3112 */
        }
    }

    action def BecomeInspiredBySpaceMission_7b65 {
        doc
        /* ID: 7b6556ea-3d94-48da-98a1-a630a645afd1 */
        port inObservespaceexperimentresults_4796 : ObserveSpaceExperimentResultsFuncIn {
            doc
            /* ID: 47964388-c46b-40fa-a72c-8f37c3f0dae8 */
        }
    }

    action def PrepareSpaceRadiationExperiment_7ffb {
        doc
        /* ID: 7ffba36f-a357-4c05-88a5-71341d38b279 */
        port outPublishspaceradiationexperimentresults_eee1 : RelayImageForSpaceRadiationExperimentFuncOut {
            doc
            /* ID: eee102b1-2757-4a42-8248-20653dcf68a3 */
        }
        port FIP1_b215 : SelectTheLatestImageFuncIn {
            doc
            /* ID: b2154075-a4de-44d5-a1f7-6623ffc5b462 */
        }
    }

    action def ProvideSpaceRadiationExperimentResultsToSchools_8138 {
        doc
        /* ID: 8138e835-a182-4b1b-b0d5-c971ad777e81 */
        port outAccessspaceradiationexperimentresults_ab8e : AccessSpaceRadiationExperimentResultsFuncOut {
            doc
            /* ID: ab8e2376-9b89-46fb-b329-16e8458c8524 */
        }
        port inPublishspaceradiationexperimentresults_d2e2 : UploadSpaceRadiationResultsToTheWebsiteFuncIn {
            doc
            /* ID: d2e28ba1-73ed-4cb6-bc83-61f228df00ad */
        }
    }

    action def PrepareSpaceRadiationLesson_c0f4 {
        doc
        /* ID: c0f4939f-f3e3-406d-b197-72a895badd14 */
        port inAccessspaceradiationexperimentresults_9971 : AccessSpaceRadiationExperimentResultsFuncIn {
            doc
            /* ID: 99713955-b3d3-4aa2-90a3-84b24ae158fd */
        }
        port outTeachspaceradiationlesson_c831 : TeachSpaceRadiationLessonFuncOut {
            doc
            /* ID: c8313cf4-2f46-4962-b277-bf9da2c0081f */
        }
    }

    action def ParticipateInLesson_3e27 {
        doc
        /* ID: 3e277472-9cd8-43c7-8bd8-bbfa389f9d6b */
        port inTeachspaceradiationlesson_330f : TeachSpaceRadiationLessonFuncIn {
            doc
            /* ID: 330f21fd-acdf-414f-ade8-85638cfd1157 */
        }
        port outAnalysetheeffectofspaceradiation_1315 : AnalyseTheEffectOfSpaceRadiationFuncOut {
            doc
            /* ID: 13156a70-eb47-4884-a754-81a849b66a5e */
        }
    }

    action def LearnAboutTheEffectOfSpaceRadiationAndMitigationTechniquesWithProgramming_96b4 {
        doc
        /* ID: 96b43304-58e7-4fc3-98a2-027943608beb */
        port inAnalysetheeffectofspaceradiation_6923 : AnalyseTheEffectOfSpaceRadiationFuncIn {
            doc
            /* ID: 6923ac1d-740b-4a22-9676-df8f15a83c3b */
        }
    }

    action def PlanAndScheduleDataCollection_22bb {
        doc
        /* ID: 22bb4b0d-d8f7-400d-ab7e-6c74961d6c60 */
        port outSharedatacollectionschedule_89e9 : RelayDataCollectionScheduleWithGroundStationFuncOut {
            doc
            /* ID: 89e997b1-2b18-4723-ad70-cc2b2e7704a0 */
        }
    }

    action def HostEducationalData_fc85 {
        doc
        /* ID: fc857f9a-d700-430b-b3b1-f4f2c73ba7c5 */
        port inPublishmissiondata_1de5 : UploadTheDataOfTheEducationalModulesFuncIn {
            doc
            /* ID: 1de5740a-0c12-4e9b-b31e-5d775299544a */
        }
    }

    action def PlanMissionOperations_3b3a {
        doc
        /* ID: 3b3ae73a-f572-41b1-9606-a3f2f6b12c94 */
        port outCommunicatemissionoperationplan_34b4 : RelayMissionOperationsWithGroundStationFuncOut {
            doc
            /* ID: 34b48ab5-2fff-4378-9a36-cd3c0596c9bf */
        }
    }

    action def MonitorMissionStatus_d739 {
        doc
        /* ID: d7394d74-2b17-4b5f-8c5d-13e836729781 */
        port inProvidemissiontelemetry_562f : RelayMissionOperationalStatusWithDVSTeamFuncIn {
            doc
            /* ID: 562f17e3-e8d0-4f5b-9ab1-7a80185fee7e */
        }
    }

    action def TransmitMissionOperations_d957 {
        doc
        /* ID: d9573e50-01e8-4c99-ab00-f1a407fe1ae2 */
        port FIP1_c90a : RelayMissionOperationsWithGroundStationFuncIn {
            doc
            /* ID: c90a03c5-8718-4785-b615-b7bf9ab5d83c */
        }
        port FOP1_4363 : UplinkMissionOperationsFuncOut {
            doc
            /* ID: 43637000-1aa2-4869-91cb-28308a6e5912 */
        }
    }

    action def ReceiveMissionStatus_1718 {
        doc
        /* ID: 17184e40-1957-452f-9d7a-94825388711f */
        port FOP1_ac6c : RelayMissionOperationalStatusWithDVSTeamFuncOut {
            doc
            /* ID: ac6c49e5-7f99-4242-b608-f2836992f055 */
        }
        port FIP1_24b3 : DownlinkMissionStatusFuncIn {
            doc
            /* ID: 24b33abf-8a92-48aa-8b5b-79d9f1a530f3 */
        }
    }

    action def TransmitCommandForDataCollection_47bc {
        doc
        /* ID: 47bcd7e2-5cb9-47ef-9d2b-1a388c641201 */
        port FIP1_afbd : RelayDataCollectionScheduleWithGroundStationFuncIn {
            doc
            /* ID: afbd7be9-f140-4bce-8c2c-ffe4ba8ba0d1 */
        }
        port FOP1_1974 : UplinkDataCollectionCommandFuncOut {
            doc
            /* ID: 197486c6-8760-422b-b600-11b038dfb45a */
        }
    }

    action def RecieveEducationalData_d30c {
        doc
        /* ID: d30cf183-45c9-4b1f-a204-7b540f1bd826 */
        port FOP1_cb6b : RelayEducationalDataWithDVSTeamFuncOut {
            doc
            /* ID: cb6b4e42-9bcb-4943-b47e-d06be7abc5c9 */
        }
        port FIP1_83f6 : DownlinkEducationalDataFuncIn {
            doc
            /* ID: 83f6b283-2d3d-4457-92d1-4486089da048 */
        }
        port FIP2_6e09 : DownlinkEducationalDataFuncIn {
            doc
            /* ID: 6e093780-bf1a-422e-8b11-4ed1d1ce8f26 */
        }
        port FIP3_d2ac : DownlinkEducationalDataFuncIn {
            doc
            /* ID: d2ace4c5-f9dc-4063-90cc-f391d32c7381 */
        }
    }

    action def SeparateEducationalModulesData_c249 {
        doc
        /* ID: c2494739-b868-412c-b7c1-10a0c1f9cc5b */
        port FIP1_0807 : RelayEducationalDataWithDVSTeamFuncIn {
            doc
            /* ID: 08074d8e-57b4-4053-b2cc-770f37a04761 */
        }
        port FOP1_0eef : UploadTheDataOfTheEducationalModulesFuncOut {
            doc
            /* ID: 0eef0e06-0438-43af-a745-cfcd47263df1 */
        }
    }

    action def SelectImage_7b1b {
        doc
        /* ID: 7b1be887-d3e1-4f6c-9a21-28226c6fc5ae */
        port FOP1_0efb : GiveImageToTheTeacherFuncOut {
            doc
            /* ID: 0efba4a0-e826-4eff-8242-d633ff474fb9 */
        }
    }

    action def CheckImage_3804 {
        doc
        /* ID: 3804c02d-3320-4212-bbe8-969a98a5bf25 */
        port FIP1_fb07 : GiveImageToTheTeacherFuncIn {
            doc
            /* ID: fb07c5c7-06f2-48d7-8ad2-71a38c315040 */
        }
        port FOP1_deed : UploadImageToTheWebsiteFuncOut {
            doc
            /* ID: deed147c-677c-4447-acc3-494849cb533c */
        }
    }

    action def StoreImages_f9a5 {
        doc
        /* ID: f9a5a0ed-5e07-411e-ba50-af3f719157d6 */
        port FIP1_94a7 : UploadImageToTheWebsiteFuncIn {
            doc
            /* ID: 94a79c8b-c5d1-41d0-b169-a8e7daa80e48 */
        }
        port FOP1_5d06 : SelectTheLatestImageFuncOut {
            doc
            /* ID: 5d06af15-bcdd-4e96-8a0b-ca5d9adf3ada */
        }
    }

    action def TransmitImageData_78b4 {
        doc
        /* ID: 78b40c68-5e84-4bee-9e58-e7f6073ea904 */
        port FIP1_f993 : RelayImageForSpaceRadiationExperimentFuncIn {
            doc
            /* ID: f993410e-66a5-4b7b-a129-dfa22006cb2b */
        }
        port FOP1_04b2 : UplinkImageDataFuncOut {
            doc
            /* ID: 04b21a2c-75b8-4295-8bd0-9076a011f830 */
        }
    }

    action def ReceiveSpaceRadiationExperimentResults_ae11 {
        doc
        /* ID: ae113ac2-1fe0-4742-b14f-f80839daab99 */
        port FOP1_18e7 : RelaySpaceRadiationExperimentResultsFuncOut {
            doc
            /* ID: 18e7fb76-dbae-463b-89fa-10db3c53124d */
        }
        port FIP1_948d : DownlinkSpaceRadiationExperimentResultsFuncIn {
            doc
            /* ID: 948ddf2d-c74e-4cf8-ba59-bf2165a5c1c3 */
        }
    }

    action def CheckTheSpaceRadiationExperimentResults_459a {
        doc
        /* ID: 459a866d-d595-42f2-976f-1a5f07a5b273 */
        port FIP1_a9b7 : RelaySpaceRadiationExperimentResultsFuncIn {
            doc
            /* ID: a9b71b61-e328-4ec7-82ca-593d67f710e6 */
        }
        port FOP1_97da : UploadSpaceRadiationResultsToTheWebsiteFuncOut {
            doc
            /* ID: 97da8fdd-5d75-4d6f-acb8-f64b3f4e3e19 */
        }
    }

    action def TransmitEducationalSpaceExperimentPlanning_eb64 {
        doc
        /* ID: eb64b3ff-4967-4e50-a133-65b315d9b022 */
        port FIP1_3258 : RelayEducationalSpaceExperimentPlanningFuncIn {
            doc
            /* ID: 32588cc0-9e5e-4a3f-8d5d-029cbdc9dd14 */
        }
        port FOP1_8d19 : UplinkEducationalSpaceExperimentPlanningFuncOut {
            doc
            /* ID: 8d19a9ce-8403-4205-b724-d20941e1cd07 */
        }
    }

    action def ReceiveEducationalSpaceExperimentResults_1b82 {
        doc
        /* ID: 1b82d780-f260-40d1-a98e-ac30a62efd53 */
        port FOP1_18b2 : RelayEducationalSpaceExperimentResultsFuncOut {
            doc
            /* ID: 18b260ea-f1be-468f-8a74-2143f689f0f2 */
        }
        port FIP1_a075 : DownlinkEducationalSpaceExperimentResultsFuncIn {
            doc
            /* ID: a0755060-bec2-4665-855d-3bc2d7d8c4a5 */
        }
    }

    action def CheckEducationalSpaceExperimentResults_35a2 {
        doc
        /* ID: 35a24362-312d-4186-a017-a5392dd42019 */
        port FIP1_5389 : RelayEducationalSpaceExperimentResultsFuncIn {
            doc
            /* ID: 53898fef-7cba-4a83-974e-be0ffed0ebc2 */
        }
        port FOP1_6617 : UploadEducationalSpaceExperimentResultsFuncOut {
            doc
            /* ID: 661780d2-d4ce-46db-b3de-741875cc94b2 */
        }
    }

    action def Receive_acab {
        doc
        /* ID: acab9cf0-43eb-438c-92ee-ddfaf46ca46b */
        action receiveEducationalSpaceExperimentPlanning_81e9 : ReceiveEducationalSpaceExperimentPlanning_81e9;
        action receiveMissionOperations_3937 : ReceiveMissionOperations_3937;
        action receiveImageData_1eba : ReceiveImageData_1eba;
        action receiveDataCollectionCommand_d32a : ReceiveDataCollectionCommand_d32a;
    }

    action def ReceiveEducationalSpaceExperimentPlanning_81e9 {
        doc
        /* ID: 81e914fd-b36f-4bb3-bafc-1e6eca235c2f */
        port FIP1_41fb : UplinkEducationalSpaceExperimentPlanningFuncIn {
            doc
            /* ID: 41fbe79c-4035-4f85-8ba5-52ca28551fe5 */
        }
        port FOP1_4441 : GiveCommandToPerformEducationalSpaceExperimentFuncOut {
            doc
            /* ID: 4441ecd7-5b99-4823-9f99-30829aa72b7a */
        }
        port FOP2_7f0e : RelayDicePlanningToOBCFuncOut {
            doc
            /* ID: 7f0ec13a-f118-498b-becb-babd62ec3c1c */
        }
    }

    action def ReceiveMissionOperations_3937 {
        doc
        /* ID: 39375bff-ee87-4e96-a491-db20a94ffb3c */
        port FIP1_1fa4 : UplinkMissionOperationsFuncIn {
            doc
            /* ID: 1fa4f798-0f65-4629-b532-da1236a283bd */
        }
        port FOP2_bd69 : RelayMissionOperationsToOBCFuncOut {
            doc
            /* ID: bd697a4e-5f7b-4f4a-a2ac-489020e12cbc */
        }
    }

    action def ReceiveImageData_1eba {
        doc
        /* ID: 1eba14d8-a71c-4d06-bcbb-04e9ad5bcf0c */
        port FIP1_daf1 : UplinkImageDataFuncIn {
            doc
            /* ID: daf11ef1-a7b6-4310-a0a5-414ad33599cb */
        }
        port FOP1_9e0d : MoveImageDataToCorrectLocationFuncOut {
            doc
            /* ID: 9e0dcbda-a50d-4d91-aa51-19ec3143b79a */
        }
        port FOP2_36a3 : RelayBitflipImageDataToOBCFuncOut {
            doc
            /* ID: 36a3a60a-0599-49f7-b4be-4df68c4c54d2 */
        }
    }

    action def ReceiveDataCollectionCommand_d32a {
        doc
        /* ID: d32a8cb2-f6f8-457a-b712-cd26e8a93c6a */
        port FIP1_c421 : UplinkDataCollectionCommandFuncIn {
            doc
            /* ID: c421f6cb-8b8e-4e23-bdcf-1e7fc9585970 */
        }
        port FOP1_a486 : GiveCommandForDataCollectionFuncOut {
            doc
            /* ID: a48603d2-d825-4878-b1dd-a976f1338205 */
        }
        port FOP2_5d5b : GiveCommandForDataCollectionFuncOut {
            doc
            /* ID: 5d5b742e-64c1-48e2-ac02-cac266e94687 */
        }
        port FOP3_d1bf : RelayCommandForDataCollectionFuncOut {
            doc
            /* ID: d1bf2d17-f1dc-4dbe-9454-6d3bf289aef5 */
        }
    }

    action def Experiment_f312 {
        doc
        /* ID: f3121766-76df-4ad8-8d3c-fd409c82da84 */
        action performEducationalSpaceExperiment_fb50 : PerformEducationalSpaceExperiment_fb50;
        action doTheSpaceRadiationExperiment_752c : DoTheSpaceRadiationExperiment_752c;
    }

    action def PerformEducationalSpaceExperiment_fb50 {
        doc
        /* ID: fb50d2dc-75e0-4cca-8a83-7f0c17acdc22 */
        port FIP1_be1a : GiveCommandToPerformEducationalSpaceExperimentFuncIn {
            doc
            /* ID: be1afb54-5c32-47d2-984e-e78a21d7b6f9 */
        }
        port FOP1_482a : MoveResultsOfTheEducationalSpaceExperimentToTheCorrectLocationFuncOut {
            doc
            /* ID: 482a6a98-6bc5-49d6-a439-73f964b143c8 */
        }
    }

    action def DoTheSpaceRadiationExperiment_752c {
        doc
        /* ID: 752cf659-495c-4f29-842e-a08e933eed21 */
        port FIP1_50d6 : MoveImageDataToCorrectLocationFuncIn {
            doc
            /* ID: 50d64594-af88-49ab-8b64-440af614fb45 */
        }
        port FOP1_034b : MoveSpaceRadiationExperimentResultsToCorrectLocationFuncOut {
            doc
            /* ID: 034be360-feef-424e-a8d6-3fc5836c5221 */
        }
    }

    action def Transmit_e714 {
        doc
        /* ID: e714326b-f82d-4bd6-a97f-571244372844 */
        action transmitSpaceRadiationExperimentResults_fdbc : TransmitSpaceRadiationExperimentResults_fdbc;
        action transmitMissionStatus_857f : TransmitMissionStatus_857f;
        action transmitEducationalSpaceExperimentResults_2a0b : TransmitEducationalSpaceExperimentResults_2a0b;
        action transmitEducationalData_d69b : TransmitEducationalData_d69b;
    }

    action def TransmitSpaceRadiationExperimentResults_fdbc {
        doc
        /* ID: fdbc8ba2-65cb-403f-9f95-072e03d2ddf9 */
        port FIP2_5bf4 : GiveCommandForDataCollectionFuncIn {
            doc
            /* ID: 5bf4bbb8-a366-4771-8a4a-2cd12e9cf7d0 */
        }
        port FIP1_35fc : MoveSpaceRadiationExperimentResultsToCorrectLocationFuncIn {
            doc
            /* ID: 35fc22ac-080b-4847-ae70-c9a4f12f6a84 */
        }
        port FOP1_0783 : DownlinkSpaceRadiationExperimentResultsFuncOut {
            doc
            /* ID: 0783474b-8cc5-42ca-8bd8-23eca21e4941 */
        }
        port FOP2_4373 : DownlinkEducationalDataFuncOut {
            doc
            /* ID: 4373a64e-d6be-42f1-8f01-470bd9183aa4 */
        }
        port FIP3_ba9c : CommandAntennaToDownlinkSpaceRadiationExperimentResultsFuncIn {
            doc
            /* ID: ba9c4e80-4417-4dce-81fd-1f1486e918d7 */
        }
    }

    action def TransmitMissionStatus_857f {
        doc
        /* ID: 857fe992-ec40-4aff-afd9-55fdbcc42465 */
        port FOP1_bdb4 : DownlinkMissionStatusFuncOut {
            doc
            /* ID: bdb43da9-7eee-435b-bca9-bfad4424495b */
        }
        port FIP2_df09 : CommandAntennaToDownlinkAllGeneratedDataFuncIn {
            doc
            /* ID: df09ee6b-edb5-4793-90e2-dee8f5b07757 */
        }
    }

    action def TransmitEducationalSpaceExperimentResults_2a0b {
        doc
        /* ID: 2a0bc565-fae1-4e50-97b5-880ef4ca0713 */
        port FIP2_b54e : GiveCommandForDataCollectionFuncIn {
            doc
            /* ID: b54ebb51-d0ab-432f-a130-c019c8bdf7e3 */
        }
        port FIP1_bb7f : MoveResultsOfTheEducationalSpaceExperimentToTheCorrectLocationFuncIn {
            doc
            /* ID: bb7f9d03-1b67-4814-9058-4497130a060a */
        }
        port FOP1_79b7 : DownlinkEducationalSpaceExperimentResultsFuncOut {
            doc
            /* ID: 79b7c503-dd93-4abf-b4c1-c05f4b880c3f */
        }
        port FOP2_4a86 : DownlinkEducationalDataFuncOut {
            doc
            /* ID: 4a86959d-8f68-4fc0-8c06-a45c1ae641cf */
        }
        port FIP3_2128 : CommandAntennaToDownlinkDiceImageResultsFuncIn {
            doc
            /* ID: 212821df-5c4c-4e5b-9026-d5f393c7fdd3 */
        }
    }

    action def TransmitEducationalData_d69b {
        doc
        /* ID: d69b6c70-2208-4637-a86f-5aaa7314710b */
        port FOP1_70e5 : DownlinkEducationalDataFuncOut {
            doc
            /* ID: 70e5a59f-ba48-4168-b2ae-5a86dc20303b */
        }
        port FIP1_1ec8 : RelayEducationalDataFuncIn {
            doc
            /* ID: 1ec856e2-0a12-48f4-a369-431e8d164b6c */
        }
    }

    action def CommandPMToOperateTheDicePayload_b4e5 {
        doc
        /* ID: b4e50bd0-b37e-4a5f-b540-d3911f79e49a */
        port FIP1_10fa : RelayDicePlanningToOBCFuncIn {
            doc
            /* ID: 10fa20bb-e854-4ae5-a202-1feaefe084c3 */
        }
        port FOP1_1a9f : GiveCommandToStartDiceToPMFuncOut {
            doc
            /* ID: 1a9fe0bc-1d53-40d8-8796-28794c27b0cf */
        }
        port FIP2_a98d : RelayScheduleForTheDicePayloadFuncIn {
            doc
            /* ID: a98d0a90-ea91-43aa-b3c7-b662d0661957 */
        }
        port FIP3_04f5 : RelayThatTheSatelliteIsInDesiredAttitudeFuncIn {
            doc
            /* ID: 04f57b21-e82d-4d2c-91e4-3f2dc91de9f9 */
        }
    }

    action def StartTheDiceSequence_d389 {
        doc
        /* ID: d389d433-5794-4ed2-92e3-ec3224cf3ef2 */
        port FIP1_f2a3 : GiveCommandToStartDiceToPMFuncIn {
            doc
            /* ID: f2a3e905-2ce5-472e-80f7-f7e3cb87eeb7 */
        }
        port FOP1_c765 : RelayCommandToTheDicePayloadFuncOut {
            doc
            /* ID: c765bb21-d09c-4777-a8a7-ed9e9e15ce65 */
        }
    }

    action def ClampDice_8f2d {
        doc
        /* ID: 8f2d59dc-b881-4d90-9fad-656da67d4b72 */
        port FIP1_ba24 : RelayCommandToTheDicePayloadFuncIn {
            doc
            /* ID: ba241815-0299-492b-ae2c-8d8150c46ba0 */
        }
        port FOP1_d6b7 : DiceAreClampedFuncOut {
            doc
            /* ID: d6b7d89b-c473-4d91-9057-94d9f62ac2c7 */
        }
    }

    action def TurnOnLEDs_5e6d {
        doc
        /* ID: 5e6d67ff-ce6d-4d92-8c29-3115e6ed8770 */
        port FIP1_77b9 : DiceAreClampedFuncIn {
            doc
            /* ID: 77b92e4e-2796-4396-a962-2e152b47afe3 */
        }
        port FOP1_4ccd : LEDsAreTurnedOnFuncOut {
            doc
            /* ID: 4ccd1adb-776e-4dfc-bf40-3a47408c94cb */
        }
    }

    action def TakeImage_378c {
        doc
        /* ID: 378c7213-9260-4519-8684-c82af1862c6d */
        port FIP1_54a8 : LEDsAreTurnedOnFuncIn {
            doc
            /* ID: 54a8f72a-24a8-43af-a533-ee98ae8c327d */
        }
        port FOP1_c112 : ImageIsTakenFuncOut {
            doc
            /* ID: c112369c-b0db-44eb-833b-43dd144b40e7 */
        }
    }

    action def TurnOffLEDs_7c06 {
        doc
        /* ID: 7c06dc51-a46b-48ba-8a41-42145e2de974 */
        port FIP1_6733 : ImageIsTakenFuncIn {
            doc
            /* ID: 673357d4-6032-450d-813a-227cbee32ff0 */
        }
        port FOP1_b26d : LEDsAreTurnedOffFuncOut {
            doc
            /* ID: b26dba9b-e723-4bef-9628-4c29ad5d7a4c */
        }
    }

    action def UnclampDice_a4a8 {
        doc
        /* ID: a4a80a74-d9a4-45e9-8886-688ea5ee78bc */
        port FIP1_d1a4 : LEDsAreTurnedOffFuncIn {
            doc
            /* ID: d1a45005-fbe2-45d7-8cd6-8554c1263263 */
        }
        port FOP1_fb97 : DiceAreUnclampedFuncOut {
            doc
            /* ID: fb97de0c-48b0-458e-98a1-4107a0699fe4 */
        }
    }

    action def StoreDiceImageResults_bb51 {
        doc
        /* ID: bb512222-ef64-4d5d-82b5-d7db7b15ba8b */
        port FIP1_d691 : DiceAreUnclampedFuncIn {
            doc
            /* ID: d6910992-206d-402c-a6b8-c75fea98aadb */
        }
        port FOP1_848b : ShareDiceImageResultsFuncOut {
            doc
            /* ID: 848b8012-9c74-4a65-ac2c-d0b9ec01dedf */
        }
    }

    action def RetrieveDiceImageResults_332d {
        doc
        /* ID: 332d6866-bf93-40fe-9e0e-51f7af89aa1f */
        port FIP1_a61b : ShareDiceImageResultsFuncIn {
            doc
            /* ID: a61b335e-bd75-4e6a-a236-59064d3a5936 */
        }
        port FOP1_18ab : CommandAntennaToDownlinkDiceImageResultsFuncOut {
            doc
            /* ID: 18ab64ce-d12a-4b9d-bf22-223c136827b6 */
        }
        port FOP2_ac1f : DiceDataFuncOut {
            doc
            /* ID: ac1f1a1b-13c8-446f-b59a-22be1591bc07 */
        }
    }

    action def ShareImageDataWithPM_ebaa {
        doc
        /* ID: ebaaf0bd-9537-473c-b473-d4150e0887a2 */
        port FIP1_add4 : RelayBitflipImageDataToOBCFuncIn {
            doc
            /* ID: add42680-1060-48c7-b490-59a312290a45 */
        }
        port FOP1_be87 : RelayBitflipImageDataToPMFuncOut {
            doc
            /* ID: be8775ff-dbf9-4b7f-b872-3cc01c4b019f */
        }
        port FIP2_5f18 : RelayScheduleForTheBitflipPayloadFuncIn {
            doc
            /* ID: 5f18182a-c379-4670-9289-e2068fffe323 */
        }
    }

    action def StoreImageDataInitialStateOnPM_ac59 {
        doc
        /* ID: ac59a36c-e8c8-4ebe-8ea1-dfb00c3e9cfe */
        port FIP1_16f1 : RelayBitflipImageDataToPMFuncIn {
            doc
            /* ID: 16f14672-a530-4ddc-b679-ab2566e46e58 */
        }
        port FOP1_59de : ShareTheInitialImageDataFuncOut {
            doc
            /* ID: 59de9ceb-43eb-463a-ac02-afb907cb65fc */
        }
    }

    action def StoreTheInitialStateDataOnTheUnprotectedMemoryBoards_96de {
        doc
        /* ID: 96de4b44-1565-4a12-ad53-4dbd015c4a68 */
        port FIP1_b440 : ShareTheInitialImageDataFuncIn {
            doc
            /* ID: b440d4c7-09d2-4652-be0c-7fb8d906cf7e */
        }
        port FOP1_21f3 : TimePassesFuncOut {
            doc
            /* ID: 21f3cb8e-7152-469d-9392-fd5e27e050f0 */
        }
    }

    action def CheckForAmountOfBitflips_7d87 {
        doc
        /* ID: 7d87c049-12cc-4a43-b950-828834883f72 */
        port FOP1_212e : NumberOfBitflipsFuncOut {
            doc
            /* ID: 212e4a51-0584-4812-a69a-270b82451632 */
        }
        port FIP1_a292 : NumberOfBitflipsFuncIn {
            doc
            /* ID: a2926487-f7cd-4319-ac93-2b468b3f0a4a */
        }
    }

    action def NumberOfBitflips_92e9 {
        doc
        /* ID: 92e98ac3-eec0-46cf-af95-2a93cbd590ed */
        port FIP1_e3e4 : NumberOfBitflipsFuncIn {
            doc
            /* ID: e3e4c039-3e9b-4e3d-91ef-cd1a23dc33d5 */
        }
        port FOP1_bf60 : NotEnoughBitflipsHaveOccuredFuncOut {
            doc
            /* ID: bf606c4a-cbfb-4d53-bd59-5f41c9aa3e53 */
        }
        port FOP2_c072 : EnoughBitflipsHaveOccuredFuncOut {
            doc
            /* ID: c072391d-2879-4599-b2a8-55b5ce056ddd */
        }
    }

    action def DetermineTheLocationsOfTheBitflips_18b2 {
        doc
        /* ID: 18b2b6a3-c411-4d5a-b95f-fdb9675f9178 */
        port FIP1_13b5 : EnoughBitflipsHaveOccuredFuncIn {
            doc
            /* ID: 13b57757-6805-4388-bd9a-212865a7a480 */
        }
        port FOP1_1f6b : ShareBitflipLocationsFuncOut {
            doc
            /* ID: 1f6bcf03-4d8a-4d77-9d4c-e71d82977157 */
        }
    }

    action def BitflipsOccur_ac1a {
        doc
        /* ID: ac1a9c7b-01e5-4ea5-9387-665e28c21dc6 */
        port FIP1_31de : TimePassesFuncIn {
            doc
            /* ID: 31dec1b3-b806-42c8-a598-442ec8431000 */
        }
        port FIP2_3a81 : NotEnoughBitflipsHaveOccuredFuncIn {
            doc
            /* ID: 3a81152c-c9f0-4a31-8ee8-e9e743122cf5 */
        }
        port FOP1_3b5c : NumberOfBitflipsFuncOut {
            doc
            /* ID: 3b5c3279-5b45-460a-8017-05a3f775496a */
        }
    }

    action def RetrieveBitflipLocations_4248 {
        doc
        /* ID: 4248d537-c4ab-49bd-b9c6-99bdef44f0f8 */
        port FIP1_19f4 : ShareBitflipLocationsFuncIn {
            doc
            /* ID: 19f4d284-cd39-4c74-82a1-b48e517013ef */
        }
        port FOP1_7c96 : CommandAntennaToDownlinkSpaceRadiationExperimentResultsFuncOut {
            doc
            /* ID: 7c966aa0-3d22-4f57-a2d1-fef420d5be19 */
        }
        port FOP2_344e : BitflipDataFuncOut {
            doc
            /* ID: 344e1dfc-e8b1-42d5-8eef-7cd95a8c5bcd */
        }
    }

    action def CommandAllSubsystemsToPerformTheirOperations_6fa8 {
        doc
        /* ID: 6fa8e60e-c0ba-46a6-9c42-351c7cdbe3b8 */
        port FIP1_e746 : RelayMissionOperationsToOBCFuncIn {
            doc
            /* ID: e7465e1f-ee81-405c-b4fb-777a4a21cc9d */
        }
        port FIP2_9eac : RelayCommandForDataCollectionFuncIn {
            doc
            /* ID: 9eac541e-6644-467d-8feb-4eca694b1180 */
        }
        port FOP1_4cce : RelayScheduleForTheDicePayloadFuncOut {
            doc
            /* ID: 4cce368a-c41b-4163-8c3d-e130cb2bea27 */
        }
        port FOP2_e319 : RelayScheduleForTheBitflipPayloadFuncOut {
            doc
            /* ID: e3193125-f8c0-462d-b47b-5c626d29a468 */
        }
        port FOP3_8316 : CheckEnergyLevelsFuncOut {
            doc
            /* ID: 83166641-5792-4c54-90aa-7038e8c5eaa6 */
        }
        port FOP4_5759 : CheckSpinRateFuncOut {
            doc
            /* ID: 57596c4a-ff7c-44d3-8995-1149287b7280 */
        }
        port FOP5_edce : CheckTemperaturesFuncOut {
            doc
            /* ID: edce464a-af8e-4e74-b01c-619a30104d0c */
        }
        port FOP6_f152 : SpecialDiceImageRequestFuncOut {
            doc
            /* ID: f1526904-8f7d-46ce-b61a-59529dea02ad */
        }
    }

    action def StoreEnergyInTheBatteries_baf4 {
        doc
        /* ID: baf48e46-1ee3-431d-a66d-6661df76b0b2 */
        port FIP1_e1d3 : CheckEnergyLevelsFuncIn {
            doc
            /* ID: e1d31c0c-fc94-49fb-8d80-a8c99d22267d */
        }
        port FOP1_6adf : EnergyLevelFuncOut {
            doc
            /* ID: 6adfc420-d197-48db-91eb-46e1af523619 */
        }
    }

    action def BatteryChargeLevel_37e0 {
        doc
        /* ID: 37e02520-e4a2-4461-8e1f-b1876a86e4ea */
        port FOP1_8adc : EnergyLevelBelowMarginFuncOut {
            doc
            /* ID: 8adc0a7d-9d17-4488-ad18-c4c57d6eeccd */
        }
        port FOP2_1bef : EnergyLevelAboveMarginFuncOut {
            doc
            /* ID: 1beffea1-0f65-4a2a-8335-9f9c16904059 */
        }
        port FIP1_71af : EnergyLevelFuncIn {
            doc
            /* ID: 71af2fe3-86d5-4998-bb79-3562373cb42b */
        }
    }

    action def PlaceSatelliteInSAFEMode_5654 {
        doc
        /* ID: 5654fd01-21a7-42cb-ac6b-bbfee9d6393b */
        port FIP1_5313 : EnergyLevelBelowMarginFuncIn {
            doc
            /* ID: 53138888-0fa1-4eb4-8f31-b075e0532ed0 */
        }
        port FIP2_d8a5 : SpinRateAboveCriticalLevelFuncIn {
            doc
            /* ID: d8a5968d-6277-4edf-9b18-a67cae758ee2 */
        }
        port FIP3_a07a : TemperatureIsAtACriticalLevelFuncIn {
            doc
            /* ID: a07ae6c7-0237-4f17-831e-6d70043d8395 */
        }
    }

    action def PlaceKeepSatelliteInNOMINALMode_d510 {
        doc
        /* ID: d510ea24-2aba-4e22-929a-9fdf828d6a92 */
        port FIP1_ba40 : EnergyLevelAboveMarginFuncIn {
            doc
            /* ID: ba400aad-cc7d-4336-b11a-a646548116cb */
        }
        port FIP2_b07a : SpinRateBelowOperationalMarginFuncIn {
            doc
            /* ID: b07a7433-666f-4b61-9be9-8e6054c120fd */
        }
        port FIP3_9040 : TemperatureWithinOperationalMarginFuncIn {
            doc
            /* ID: 9040237a-141c-4328-9358-a9ea1900bc1c */
        }
    }

    action def DetermineSpinRate_f542 {
        doc
        /* ID: f5426c90-6c17-4a80-83cf-23ba962a60f6 */
        port FIP1_a1aa : CheckSpinRateFuncIn {
            doc
            /* ID: a1aaedd8-b86a-4b70-8d49-5e0b1395f9cf */
        }
        port FOP1_381b : SpinRateFuncOut {
            doc
            /* ID: 381bcd6f-aee8-4d1c-b69f-dcfc7f67a27d */
        }
    }

    action def SpinRate_eec7 {
        doc
        /* ID: eec7e4aa-dae5-49ce-bde8-3a247a5d5795 */
        port FOP1_d33f : SpinRateAboveCriticalLevelFuncOut {
            doc
            /* ID: d33fbad0-8798-4b67-870c-c5ae622c4564 */
        }
        port FOP2_8547 : SpinRateBetweenOperationalMarginAndCriticalLevelFuncOut {
            doc
            /* ID: 8547f591-c87b-47d9-bb9f-e61a5785df3c */
        }
        port FOP3_be70 : SpinRateBelowOperationalMarginFuncOut {
            doc
            /* ID: be7077c0-1b8f-4efe-936d-7d7e1743bbf8 */
        }
        port FIP1_b691 : SpinRateFuncIn {
            doc
            /* ID: b69135c3-e4e3-4443-ae46-62a5fafd39be */
        }
    }

    action def ControlSpinRate_abee {
        doc
        /* ID: abeed69d-e2aa-4cf1-8d56-c0acbd4cc969 */
        port FIP1_aa0f : SpinRateBetweenOperationalMarginAndCriticalLevelFuncIn {
            doc
            /* ID: aa0f916e-c512-4c3e-a81c-e68ebe4a26cc */
        }
    }

    action def DetermineAttitude_2f97 {
        doc
        /* ID: 2f972f37-cf26-48c2-9740-735735572f77 */
        port FOP1_bad0 : AttitudeInformationFuncOut {
            doc
            /* ID: bad0b0f4-a2af-4a7e-a884-64202d6760e0 */
        }
        port FIP1_5399 : CommandADCSToRepositionTheSatelliteFuncIn {
            doc
            /* ID: 5399a4d5-c0a7-463d-88ef-c15966aa1300 */
        }
    }

    action def RequestSpecialDiceImageLocation_3b34 {
        doc
        /* ID: 3b34b713-414c-4623-ada0-add7bfbd624f */
        port FIP1_1781 : SpecialDiceImageRequestFuncIn {
            doc
            /* ID: 1781ec48-8dd6-4b58-af0b-091ebe1bbd91 */
        }
        port FOP1_9abf : CommandADCSToRepositionTheSatelliteFuncOut {
            doc
            /* ID: 9abf5e3a-7303-43e6-87da-78dd61e44f1a */
        }
    }

    action def ChangeAttitudeToDesiredAttitude_cc1b {
        doc
        /* ID: cc1b7198-63b7-4c57-a802-1c8dd45f8246 */
        port FIP1_d5bc : AttitudeInformationFuncIn {
            doc
            /* ID: d5bcbaf7-c1a8-4e05-a086-6034f228c67d */
        }
        port FOP1_1b7b : RelayThatTheSatelliteIsInDesiredAttitudeFuncOut {
            doc
            /* ID: 1b7b082a-3d28-4437-a676-594f4d2b115a */
        }
    }

    action def DetermineTemperatures_504e {
        doc
        /* ID: 504e92b3-3754-4490-8cbd-134f658613d8 */
        port FIP1_88f8 : CheckTemperaturesFuncIn {
            doc
            /* ID: 88f8a192-a1cf-405d-b1d6-f4fa1c4cd288 */
        }
        port FOP1_f535 : TemperatureLevelFuncOut {
            doc
            /* ID: f5352e19-c85d-408a-8f96-9ddd162dafbd */
        }
    }

    action def Temperature_235d {
        doc
        /* ID: 235d579f-1346-4c5e-952d-14832f0b2778 */
        port FOP1_8409 : TemperatureIsAtACriticalLevelFuncOut {
            doc
            /* ID: 840966d9-efe1-4028-981e-0423123326d7 */
        }
        port FOP2_992c : TemperatureWithinOperationalMarginFuncOut {
            doc
            /* ID: 992c492b-ace7-49ba-99c7-127575550add */
        }
        port FOP3_d872 : TemperatureBetweenOperationalMarginAndCriticalLevelFuncOut {
            doc
            /* ID: d87296ca-de00-45fc-9f98-1793388e8792 */
        }
        port FIP1_8cfb : TemperatureLevelFuncIn {
            doc
            /* ID: 8cfbe5c2-8e28-435e-ae72-ceb9d8923af2 */
        }
    }

    action def TurnOffRequiredSubsystem_829f {
        doc
        /* ID: 829f3c9e-46a0-42eb-840c-adb3bae859a0 */
        port FIP1_9d88 : TemperatureBetweenOperationalMarginAndCriticalLevelFuncIn {
            doc
            /* ID: 9d8841f5-5add-484a-b4ee-6a9bcd171a13 */
        }
    }

    action def Housekeeping_b6bd {
        doc
        /* ID: b6bd518f-0f36-40ef-adf8-66be1c413f75 */
        port FIP1_0b3b : EnergyLevelFuncIn {
            doc
            /* ID: 0b3b6710-469c-4270-8dcc-0b2878125f94 */
        }
        port FIP1_06ff : SpinRateFuncIn {
            doc
            /* ID: 06ffa2e1-e72e-4de3-bfd5-6e4b378e58f4 */
        }
        port FIP1_f8c8 : TemperatureLevelFuncIn {
            doc
            /* ID: f8c877fc-ccf5-4c0c-90eb-f858bcadc5e0 */
        }
        port FOP1_0cc9 : EnergyLevelFuncOut {
            doc
            /* ID: 0cc96c1c-68f1-44b0-ad45-e9cbb32388bf */
        }
        port FOP2_3dc1 : SpinRateFuncOut {
            doc
            /* ID: 3dc1975b-27be-4def-9fac-ea51ae273611 */
        }
        port FOP3_e306 : TemperatureLevelFuncOut {
            doc
            /* ID: e30668a5-a437-4585-89ca-e61e87ac5c5c */
        }
        port FOP4_c168 : HousekeepingDataFuncOut {
            doc
            /* ID: c168d502-7813-418a-bc51-9b4ba1d3ae4d */
        }
    }

    action def CombineAllGeneratedData_5334 {
        doc
        /* ID: 53343957-4564-4f9a-9aae-a4192e973bb0 */
        port FIP1_03db : DiceDataFuncIn {
            doc
            /* ID: 03db543d-5285-42be-ab20-3d1c96bc0684 */
        }
        port FIP3_ee05 : BitflipDataFuncIn {
            doc
            /* ID: ee05ea31-5516-4700-b1cd-4845376a9410 */
        }
        port FIP2_70c7 : HousekeepingDataFuncIn {
            doc
            /* ID: 70c7d80d-1e4a-497b-ac70-cf924e29417c */
        }
        port FOP1_b29a : CommandAntennaToDownlinkAllGeneratedDataFuncOut {
            doc
            /* ID: b29a3d39-199a-4369-b7c0-a0bd261480bf */
        }
        port FOP2_26cb : RelayEducationalDataFuncOut {
            doc
            /* ID: 26cb1a0a-c813-42c9-8d8a-9811b22c84e6 */
        }
    }

    action def CODESelectCompaniesThatProduceComponents_91c3 {
        doc
        /* ID: 91c339dd-0099-46a1-9e46-9658faa25350 */
        action codeTest1_81c2 : CODETest1_81c2;
    }

    action def CODETest1_81c2 {
        doc
        /* ID: 81c2f560-1b16-4dd1-9120-09768041307a */
    }

    action def CODEMakeASponsorContract_8a8f {
        doc
        /* ID: 8a8f7fbe-749b-4b2a-8df3-49d0a2a37df0 */
        action codeTest21_c0a4 : CODETest21_c0a4;
        action codeTest22_c1c4 : CODETest22_c1c4;
    }

    action def CODETest21_c0a4 {
        doc
        /* ID: c0a496ed-9eed-40ee-a4d1-236467e64149 */
    }

    action def CODETest22_c1c4 {
        doc
        /* ID: c1c48442-4f48-4258-9f6b-96bb8eef1bda */
    }

    action def CODESignTheSponsorContract_5110 {
        doc
        /* ID: 5110203f-3433-4b37-8e4a-7b2a39a887b3 */
    }

    action def CODETransmitBeacon_cc7f {
        doc
        /* ID: cc7fbf0b-fb3a-43c6-b372-32169540be49 */
    }

    item def RelayEducationalSpaceExperimentPlanning {
        doc
        /* ID: c0242900-dffb-4690-9fc8-c6dda430cb9c */
    }

    item def AccessExperimentResults {
        doc
        /* ID: dfb44547-58f7-4dc2-9d65-01f9f207f0b2 */
    }

    item def TeachLessonUsingExperiment {
        doc
        /* ID: e0fc86bb-d1a4-48e0-b5d4-6c3e80fd8cab */
    }

    item def ObserveSpaceExperimentResults {
        doc
        /* ID: 579c4bd4-4c93-425d-9447-8f31bffbaa43 */
    }

    item def RelayImageForSpaceRadiationExperiment {
        doc
        /* ID: 3a71fece-df36-465e-ad42-f51d80c9a83b */
    }

    item def AccessSpaceRadiationExperimentResults {
        doc
        /* ID: c8486300-81b7-43c7-bb83-863ae6adfe29 */
    }

    item def TeachSpaceRadiationLesson {
        doc
        /* ID: 9e778685-fd50-4f3b-b0a7-1c7d7916e313 */
    }

    item def AnalyseTheEffectOfSpaceRadiation {
        doc
        /* ID: 685493ba-f694-42c4-b19a-d972453c900e */
    }

    item def RelayDataCollectionScheduleWithGroundStation {
        doc
        /* ID: b78825bb-d722-42ff-8fa2-6a7a065b7cdf */
    }

    item def RelayMissionOperationsWithGroundStation {
        doc
        /* ID: 0c55bced-a5e2-4702-ae2b-0fc04a67216a */
    }

    item def UplinkMissionOperations {
        doc
        /* ID: 01d5b94d-5de3-408f-bd3d-7ac418e357c5 */
    }

    item def RelayMissionOperationalStatusWithDVSTeam {
        doc
        /* ID: 06415cdc-b5f3-4993-ae0f-715655218d34 */
    }

    item def UplinkDataCollectionCommand {
        doc
        /* ID: 21f0e3c0-96f9-4bac-942c-588945c70586 */
    }

    item def RelayEducationalDataWithDVSTeam {
        doc
        /* ID: 46613fbd-de81-4137-9a92-75d2ad7131e5 */
    }

    item def UploadTheDataOfTheEducationalModules {
        doc
        /* ID: 1654e70b-4cca-4652-8ec7-97b67729b838 */
    }

    item def GiveImageToTheTeacher {
        doc
        /* ID: 75c4de4c-ef8d-461e-a0be-48f9f752bf29 */
    }

    item def UploadImageToTheWebsite {
        doc
        /* ID: 7b62fac1-1875-4676-b10a-70bba4ffd0d1 */
    }

    item def SelectTheLatestImage {
        doc
        /* ID: 4e08a00f-9951-4dd8-b931-b438a81f084a */
    }

    item def UplinkImageData {
        doc
        /* ID: 7951de38-a6fe-4aca-8369-a6971121ae31 */
    }

    item def RelaySpaceRadiationExperimentResults {
        doc
        /* ID: d9af8525-7873-4e9a-9cf4-76899f45dd25 */
    }

    item def UploadSpaceRadiationResultsToTheWebsite {
        doc
        /* ID: b665b142-43e3-4af1-8fde-c35aacf8c290 */
    }

    item def UplinkEducationalSpaceExperimentPlanning {
        doc
        /* ID: 3f914662-8406-41f7-baa9-3a73db942063 */
    }

    item def RelayEducationalSpaceExperimentResults {
        doc
        /* ID: bdcf78f8-7f97-4255-be39-81ece5dffd11 */
    }

    item def UploadEducationalSpaceExperimentResults {
        doc
        /* ID: 7eb1d7f1-6931-44f4-a036-72d87fa9bedb */
    }

    item def GiveCommandToPerformEducationalSpaceExperiment {
        doc
        /* ID: 6041ea5d-dd39-4852-92b8-6aab97b6c1c3 */
    }

    item def RelayDicePlanningToOBC {
        doc
        /* ID: 58a1caac-d292-4fb3-afe7-ba75241bb309 */
    }

    item def RelayMissionOperationsToOBC {
        doc
        /* ID: a1a1fe88-d235-4b7d-b4b4-99f76e06086d */
    }

    item def MoveImageDataToCorrectLocation {
        doc
        /* ID: 18d89755-2536-45f6-96b5-f5716133660a */
    }

    item def RelayBitflipImageDataToOBC {
        doc
        /* ID: 96b31011-f3da-4cd4-a533-b108d0865e8d */
    }

    item def GiveCommandForDataCollection {
        doc
        /* ID: 995394c8-21a6-4bcc-a576-65166292ce51 */
    }

    item def RelayCommandForDataCollection {
        doc
        /* ID: e981d2e0-df6d-4bb6-85bb-8fc95ac31dba */
    }

    item def MoveResultsOfTheEducationalSpaceExperimentToTheCorrectLocation {
        doc
        /* ID: ce91e96c-19bc-4170-8076-ae6b3f1a22f3 */
    }

    item def MoveSpaceRadiationExperimentResultsToCorrectLocation {
        doc
        /* ID: 14d60886-3892-4271-95cf-d1a67a41321e */
    }

    item def DownlinkSpaceRadiationExperimentResults {
        doc
        /* ID: fbfc07a6-f5f5-40ce-9564-c684733a368d */
    }

    item def DownlinkEducationalData {
        doc
        /* ID: 89977dce-ba9b-46a6-a207-5182312156ce */
    }

    item def DownlinkMissionStatus {
        doc
        /* ID: bc312760-2a85-430e-8dc3-f0eb8e7d971d */
    }

    item def DownlinkEducationalSpaceExperimentResults {
        doc
        /* ID: d6959ab3-2b4e-400c-8fd5-3dea78d9a89c */
    }

    item def GiveCommandToStartDiceToPM {
        doc
        /* ID: 3c1f7ce1-0c61-4348-ba4a-9c9abc49b992 */
    }

    item def RelayCommandToTheDicePayload {
        doc
        /* ID: 954e51a6-2335-408a-a90a-b67241669f14 */
    }

    item def DiceAreClamped {
        doc
        /* ID: 2f0bbda5-1312-49e2-a043-fa1b4b7669c0 */
    }

    item def LEDsAreTurnedOn {
        doc
        /* ID: 7b42c70c-6dff-4000-af44-7c2252337458 */
    }

    item def ImageIsTaken {
        doc
        /* ID: 805932b2-4e92-4efc-abab-fa513cc237b2 */
    }

    item def LEDsAreTurnedOff {
        doc
        /* ID: e4df3efe-0497-4052-8b9e-933539d4417b */
    }

    item def DiceAreUnclamped {
        doc
        /* ID: dd123c0a-64f0-4427-bc88-a345bbc6cb0a */
    }

    item def ShareDiceImageResults {
        doc
        /* ID: 65764d5e-b0ba-4a98-8fc2-00875aef269b */
    }

    item def CommandAntennaToDownlinkDiceImageResults {
        doc
        /* ID: e90eeffd-8aa4-4f12-a12c-47aa03b13ff3 */
    }

    item def DiceData {
        doc
        /* ID: f19560ab-f40d-4acd-a1e3-1c03c95395b6 */
    }

    item def RelayBitflipImageDataToPM {
        doc
        /* ID: ba5a7db2-6ac3-44c3-a3e6-52459a628456 */
    }

    item def ShareTheInitialImageData {
        doc
        /* ID: fe426bd7-2458-4ca2-a200-d4584353d25d */
    }

    item def TimePasses {
        doc
        /* ID: d6ef2c44-b055-4a8f-9bae-477bce95a53f */
    }

    item def NumberOfBitflips {
        doc
        /* ID: 8111345d-ccf3-4867-901a-7a57a603b830 */
    }

    item def NotEnoughBitflipsHaveOccured {
        doc
        /* ID: 87857051-b129-497b-9098-e0720ea8e348 */
    }

    item def EnoughBitflipsHaveOccured {
        doc
        /* ID: bd1dfff9-6be9-48d6-a793-5d2e4060c3a0 */
    }

    item def ShareBitflipLocations {
        doc
        /* ID: 4d40ddcf-c1d2-4c02-8794-68d8365164d8 */
    }

    item def CommandAntennaToDownlinkSpaceRadiationExperimentResults {
        doc
        /* ID: 98822aed-51fb-40ed-a21d-3913cb562e7b */
    }

    item def BitflipData {
        doc
        /* ID: 6d95def2-2976-4641-bb02-5f9bf362e66f */
    }

    item def RelayScheduleForTheDicePayload {
        doc
        /* ID: b11d9f7e-afbc-47f7-9e7b-8604d7fdaf1e */
    }

    item def RelayScheduleForTheBitflipPayload {
        doc
        /* ID: 5b4a3299-9d66-46dd-b7f1-3d13cf5f5d6a */
    }

    item def CheckEnergyLevels {
        doc
        /* ID: da070108-0a92-4c69-b0a7-8e1f43b590c3 */
    }

    item def CheckSpinRate {
        doc
        /* ID: 0a087fcc-a5ee-480c-adbc-a81bf78a3988 */
    }

    item def CheckTemperatures {
        doc
        /* ID: 5007671a-8dd3-4d87-9a76-548b019c9457 */
    }

    item def SpecialDiceImageRequest {
        doc
        /* ID: b1c6fe29-3691-4fc5-8051-58aa1694d956 */
    }

    item def EnergyLevel {
        doc
        /* ID: 036db02e-b06c-4483-b185-f79cae6143a7 */
    }

    item def EnergyLevelBelowMargin {
        doc
        /* ID: 0457953b-5ea9-4ae9-b4ec-abfa77856f2e */
    }

    item def EnergyLevelAboveMargin {
        doc
        /* ID: 8227b958-a5ce-4649-b35b-5ac649fd2617 */
    }

    item def SpinRate {
        doc
        /* ID: ec854682-a535-498e-abdc-8b575109b919 */
    }

    item def SpinRateAboveCriticalLevel {
        doc
        /* ID: b5886b2e-fe07-4304-a903-5bbe58fab99d */
    }

    item def SpinRateBetweenOperationalMarginAndCriticalLevel {
        doc
        /* ID: 73764923-f57b-404d-a39f-4f618d7980a5 */
    }

    item def SpinRateBelowOperationalMargin {
        doc
        /* ID: 385e985d-7e22-440a-a9b0-843b75870f19 */
    }

    item def AttitudeInformation {
        doc
        /* ID: a07d68da-3efd-43f5-85ad-ce181d280a14 */
    }

    item def CommandADCSToRepositionTheSatellite {
        doc
        /* ID: eda1765b-e669-45ec-816b-5f6423d39840 */
    }

    item def RelayThatTheSatelliteIsInDesiredAttitude {
        doc
        /* ID: f19705f7-2710-4a52-8624-9bc953f7afa2 */
    }

    item def TemperatureLevel {
        doc
        /* ID: e6b2b52d-44ab-4e5f-9021-dc087763b220 */
    }

    item def TemperatureIsAtACriticalLevel {
        doc
        /* ID: 1e454e67-e4bf-4d18-b886-65d36280b24f */
    }

    item def TemperatureWithinOperationalMargin {
        doc
        /* ID: dcf27480-7900-432d-b5c4-0dd8852e8b52 */
    }

    item def TemperatureBetweenOperationalMarginAndCriticalLevel {
        doc
        /* ID: d82cf6d2-0319-44c6-bafd-195a3e397588 */
    }

    item def HousekeepingData {
        doc
        /* ID: 9ab28e92-96bc-47a9-8a28-564815c89cb2 */
    }

    item def CommandAntennaToDownlinkAllGeneratedData {
        doc
        /* ID: cedc58c1-7f5a-4edf-9b48-e9e52709d0c2 */
    }

    item def RelayEducationalData {
        doc
        /* ID: 6f11cc39-b5f7-4359-beab-b5a976b134bd */
    }

    port def RelayEducationalSpaceExperimentPlanningFuncOut {
        doc
        /* ID: 55b4c079-dd27-4830-887a-d64df0f45c5f */
        out item relayEducationalSpaceExperimentPlanning : RelayEducationalSpaceExperimentPlanning;
    }

    port def RelayEducationalSpaceExperimentPlanningFuncIn {
        doc
        /* ID: 32588cc0-9e5e-4a3f-8d5d-029cbdc9dd14 */
        in item relayEducationalSpaceExperimentPlanning : RelayEducationalSpaceExperimentPlanning;
    }

    port def AccessExperimentResultsFuncOut {
        doc
        /* ID: ed57f638-23af-4313-bff1-329a912301b2 */
        out item accessExperimentResults : AccessExperimentResults;
    }

    port def AccessExperimentResultsFuncIn {
        doc
        /* ID: 0b41b6bd-aa8f-4bd4-9eea-68ca6e5adb67 */
        in item accessExperimentResults : AccessExperimentResults;
    }

    port def TeachLessonUsingExperimentFuncOut {
        doc
        /* ID: a7dbca42-a331-4156-b9de-05d7486107a9 */
        out item teachLessonUsingExperiment : TeachLessonUsingExperiment;
    }

    port def TeachLessonUsingExperimentFuncIn {
        doc
        /* ID: 36fce599-37e7-4b07-9ccc-c813e7813764 */
        in item teachLessonUsingExperiment : TeachLessonUsingExperiment;
    }

    port def ObserveSpaceExperimentResultsFuncOut {
        doc
        /* ID: 4ed3d8f2-4418-4e9f-93e7-2a96e45d3112 */
        out item observeSpaceExperimentResults : ObserveSpaceExperimentResults;
    }

    port def ObserveSpaceExperimentResultsFuncIn {
        doc
        /* ID: 47964388-c46b-40fa-a72c-8f37c3f0dae8 */
        in item observeSpaceExperimentResults : ObserveSpaceExperimentResults;
    }

    port def RelayImageForSpaceRadiationExperimentFuncOut {
        doc
        /* ID: eee102b1-2757-4a42-8248-20653dcf68a3 */
        out item relayImageForSpaceRadiationExperiment : RelayImageForSpaceRadiationExperiment;
    }

    port def RelayImageForSpaceRadiationExperimentFuncIn {
        doc
        /* ID: f993410e-66a5-4b7b-a129-dfa22006cb2b */
        in item relayImageForSpaceRadiationExperiment : RelayImageForSpaceRadiationExperiment;
    }

    port def AccessSpaceRadiationExperimentResultsFuncOut {
        doc
        /* ID: ab8e2376-9b89-46fb-b329-16e8458c8524 */
        out item accessSpaceRadiationExperimentResults : AccessSpaceRadiationExperimentResults;
    }

    port def AccessSpaceRadiationExperimentResultsFuncIn {
        doc
        /* ID: 99713955-b3d3-4aa2-90a3-84b24ae158fd */
        in item accessSpaceRadiationExperimentResults : AccessSpaceRadiationExperimentResults;
    }

    port def TeachSpaceRadiationLessonFuncOut {
        doc
        /* ID: c8313cf4-2f46-4962-b277-bf9da2c0081f */
        out item teachSpaceRadiationLesson : TeachSpaceRadiationLesson;
    }

    port def TeachSpaceRadiationLessonFuncIn {
        doc
        /* ID: 330f21fd-acdf-414f-ade8-85638cfd1157 */
        in item teachSpaceRadiationLesson : TeachSpaceRadiationLesson;
    }

    port def AnalyseTheEffectOfSpaceRadiationFuncOut {
        doc
        /* ID: 13156a70-eb47-4884-a754-81a849b66a5e */
        out item analyseTheEffectOfSpaceRadiation : AnalyseTheEffectOfSpaceRadiation;
    }

    port def AnalyseTheEffectOfSpaceRadiationFuncIn {
        doc
        /* ID: 6923ac1d-740b-4a22-9676-df8f15a83c3b */
        in item analyseTheEffectOfSpaceRadiation : AnalyseTheEffectOfSpaceRadiation;
    }

    port def RelayDataCollectionScheduleWithGroundStationFuncOut {
        doc
        /* ID: 89e997b1-2b18-4723-ad70-cc2b2e7704a0 */
        out item relayDataCollectionScheduleWithGroundStation : RelayDataCollectionScheduleWithGroundStation;
    }

    port def RelayDataCollectionScheduleWithGroundStationFuncIn {
        doc
        /* ID: afbd7be9-f140-4bce-8c2c-ffe4ba8ba0d1 */
        in item relayDataCollectionScheduleWithGroundStation : RelayDataCollectionScheduleWithGroundStation;
    }

    port def RelayMissionOperationsWithGroundStationFuncOut {
        doc
        /* ID: 34b48ab5-2fff-4378-9a36-cd3c0596c9bf */
        out item relayMissionOperationsWithGroundStation : RelayMissionOperationsWithGroundStation;
    }

    port def RelayMissionOperationsWithGroundStationFuncIn {
        doc
        /* ID: c90a03c5-8718-4785-b615-b7bf9ab5d83c */
        in item relayMissionOperationsWithGroundStation : RelayMissionOperationsWithGroundStation;
    }

    port def UplinkMissionOperationsFuncOut {
        doc
        /* ID: 43637000-1aa2-4869-91cb-28308a6e5912 */
        out item uplinkMissionOperations : UplinkMissionOperations;
    }

    port def UplinkMissionOperationsFuncIn {
        doc
        /* ID: 1fa4f798-0f65-4629-b532-da1236a283bd */
        in item uplinkMissionOperations : UplinkMissionOperations;
    }

    port def RelayMissionOperationalStatusWithDVSTeamFuncOut {
        doc
        /* ID: ac6c49e5-7f99-4242-b608-f2836992f055 */
        out item relayMissionOperationalStatusWithDVSTeam : RelayMissionOperationalStatusWithDVSTeam;
    }

    port def RelayMissionOperationalStatusWithDVSTeamFuncIn {
        doc
        /* ID: 562f17e3-e8d0-4f5b-9ab1-7a80185fee7e */
        in item relayMissionOperationalStatusWithDVSTeam : RelayMissionOperationalStatusWithDVSTeam;
    }

    port def UplinkDataCollectionCommandFuncOut {
        doc
        /* ID: 197486c6-8760-422b-b600-11b038dfb45a */
        out item uplinkDataCollectionCommand : UplinkDataCollectionCommand;
    }

    port def UplinkDataCollectionCommandFuncIn {
        doc
        /* ID: c421f6cb-8b8e-4e23-bdcf-1e7fc9585970 */
        in item uplinkDataCollectionCommand : UplinkDataCollectionCommand;
    }

    port def RelayEducationalDataWithDVSTeamFuncOut {
        doc
        /* ID: cb6b4e42-9bcb-4943-b47e-d06be7abc5c9 */
        out item relayEducationalDataWithDVSTeam : RelayEducationalDataWithDVSTeam;
    }

    port def RelayEducationalDataWithDVSTeamFuncIn {
        doc
        /* ID: 08074d8e-57b4-4053-b2cc-770f37a04761 */
        in item relayEducationalDataWithDVSTeam : RelayEducationalDataWithDVSTeam;
    }

    port def UploadTheDataOfTheEducationalModulesFuncOut {
        doc
        /* ID: 0eef0e06-0438-43af-a745-cfcd47263df1 */
        out item uploadTheDataOfTheEducationalModules : UploadTheDataOfTheEducationalModules;
    }

    port def UploadTheDataOfTheEducationalModulesFuncIn {
        doc
        /* ID: 1de5740a-0c12-4e9b-b31e-5d775299544a */
        in item uploadTheDataOfTheEducationalModules : UploadTheDataOfTheEducationalModules;
    }

    port def GiveImageToTheTeacherFuncOut {
        doc
        /* ID: 0efba4a0-e826-4eff-8242-d633ff474fb9 */
        out item giveImageToTheTeacher : GiveImageToTheTeacher;
    }

    port def GiveImageToTheTeacherFuncIn {
        doc
        /* ID: fb07c5c7-06f2-48d7-8ad2-71a38c315040 */
        in item giveImageToTheTeacher : GiveImageToTheTeacher;
    }

    port def UploadImageToTheWebsiteFuncOut {
        doc
        /* ID: deed147c-677c-4447-acc3-494849cb533c */
        out item uploadImageToTheWebsite : UploadImageToTheWebsite;
    }

    port def UploadImageToTheWebsiteFuncIn {
        doc
        /* ID: 94a79c8b-c5d1-41d0-b169-a8e7daa80e48 */
        in item uploadImageToTheWebsite : UploadImageToTheWebsite;
    }

    port def SelectTheLatestImageFuncOut {
        doc
        /* ID: 5d06af15-bcdd-4e96-8a0b-ca5d9adf3ada */
        out item selectTheLatestImage : SelectTheLatestImage;
    }

    port def SelectTheLatestImageFuncIn {
        doc
        /* ID: b2154075-a4de-44d5-a1f7-6623ffc5b462 */
        in item selectTheLatestImage : SelectTheLatestImage;
    }

    port def UplinkImageDataFuncOut {
        doc
        /* ID: 04b21a2c-75b8-4295-8bd0-9076a011f830 */
        out item uplinkImageData : UplinkImageData;
    }

    port def UplinkImageDataFuncIn {
        doc
        /* ID: daf11ef1-a7b6-4310-a0a5-414ad33599cb */
        in item uplinkImageData : UplinkImageData;
    }

    port def RelaySpaceRadiationExperimentResultsFuncOut {
        doc
        /* ID: 18e7fb76-dbae-463b-89fa-10db3c53124d */
        out item relaySpaceRadiationExperimentResults : RelaySpaceRadiationExperimentResults;
    }

    port def RelaySpaceRadiationExperimentResultsFuncIn {
        doc
        /* ID: a9b71b61-e328-4ec7-82ca-593d67f710e6 */
        in item relaySpaceRadiationExperimentResults : RelaySpaceRadiationExperimentResults;
    }

    port def UploadSpaceRadiationResultsToTheWebsiteFuncOut {
        doc
        /* ID: 97da8fdd-5d75-4d6f-acb8-f64b3f4e3e19 */
        out item uploadSpaceRadiationResultsToTheWebsite : UploadSpaceRadiationResultsToTheWebsite;
    }

    port def UploadSpaceRadiationResultsToTheWebsiteFuncIn {
        doc
        /* ID: d2e28ba1-73ed-4cb6-bc83-61f228df00ad */
        in item uploadSpaceRadiationResultsToTheWebsite : UploadSpaceRadiationResultsToTheWebsite;
    }

    port def UplinkEducationalSpaceExperimentPlanningFuncOut {
        doc
        /* ID: 8d19a9ce-8403-4205-b724-d20941e1cd07 */
        out item uplinkEducationalSpaceExperimentPlanning : UplinkEducationalSpaceExperimentPlanning;
    }

    port def UplinkEducationalSpaceExperimentPlanningFuncIn {
        doc
        /* ID: 41fbe79c-4035-4f85-8ba5-52ca28551fe5 */
        in item uplinkEducationalSpaceExperimentPlanning : UplinkEducationalSpaceExperimentPlanning;
    }

    port def RelayEducationalSpaceExperimentResultsFuncOut {
        doc
        /* ID: 18b260ea-f1be-468f-8a74-2143f689f0f2 */
        out item relayEducationalSpaceExperimentResults : RelayEducationalSpaceExperimentResults;
    }

    port def RelayEducationalSpaceExperimentResultsFuncIn {
        doc
        /* ID: 53898fef-7cba-4a83-974e-be0ffed0ebc2 */
        in item relayEducationalSpaceExperimentResults : RelayEducationalSpaceExperimentResults;
    }

    port def UploadEducationalSpaceExperimentResultsFuncOut {
        doc
        /* ID: 661780d2-d4ce-46db-b3de-741875cc94b2 */
        out item uploadEducationalSpaceExperimentResults : UploadEducationalSpaceExperimentResults;
    }

    port def UploadEducationalSpaceExperimentResultsFuncIn {
        doc
        /* ID: ccdd075d-3fc6-4198-9fdc-b95e16bab33d */
        in item uploadEducationalSpaceExperimentResults : UploadEducationalSpaceExperimentResults;
    }

    port def GiveCommandToPerformEducationalSpaceExperimentFuncOut {
        doc
        /* ID: 4441ecd7-5b99-4823-9f99-30829aa72b7a */
        out item giveCommandToPerformEducationalSpaceExperiment : GiveCommandToPerformEducationalSpaceExperiment;
    }

    port def GiveCommandToPerformEducationalSpaceExperimentFuncIn {
        doc
        /* ID: be1afb54-5c32-47d2-984e-e78a21d7b6f9 */
        in item giveCommandToPerformEducationalSpaceExperiment : GiveCommandToPerformEducationalSpaceExperiment;
    }

    port def RelayDicePlanningToOBCFuncOut {
        doc
        /* ID: 7f0ec13a-f118-498b-becb-babd62ec3c1c */
        out item relayDicePlanningToOBC : RelayDicePlanningToOBC;
    }

    port def RelayDicePlanningToOBCFuncIn {
        doc
        /* ID: 10fa20bb-e854-4ae5-a202-1feaefe084c3 */
        in item relayDicePlanningToOBC : RelayDicePlanningToOBC;
    }

    port def RelayMissionOperationsToOBCFuncOut {
        doc
        /* ID: bd697a4e-5f7b-4f4a-a2ac-489020e12cbc */
        out item relayMissionOperationsToOBC : RelayMissionOperationsToOBC;
    }

    port def RelayMissionOperationsToOBCFuncIn {
        doc
        /* ID: e7465e1f-ee81-405c-b4fb-777a4a21cc9d */
        in item relayMissionOperationsToOBC : RelayMissionOperationsToOBC;
    }

    port def MoveImageDataToCorrectLocationFuncOut {
        doc
        /* ID: 9e0dcbda-a50d-4d91-aa51-19ec3143b79a */
        out item moveImageDataToCorrectLocation : MoveImageDataToCorrectLocation;
    }

    port def MoveImageDataToCorrectLocationFuncIn {
        doc
        /* ID: 50d64594-af88-49ab-8b64-440af614fb45 */
        in item moveImageDataToCorrectLocation : MoveImageDataToCorrectLocation;
    }

    port def RelayBitflipImageDataToOBCFuncOut {
        doc
        /* ID: 36a3a60a-0599-49f7-b4be-4df68c4c54d2 */
        out item relayBitflipImageDataToOBC : RelayBitflipImageDataToOBC;
    }

    port def RelayBitflipImageDataToOBCFuncIn {
        doc
        /* ID: add42680-1060-48c7-b490-59a312290a45 */
        in item relayBitflipImageDataToOBC : RelayBitflipImageDataToOBC;
    }

    port def GiveCommandForDataCollectionFuncOut {
        doc
        /* ID: a48603d2-d825-4878-b1dd-a976f1338205 */
        out item giveCommandForDataCollection : GiveCommandForDataCollection;
    }

    port def GiveCommandForDataCollectionFuncIn {
        doc
        /* ID: 5bf4bbb8-a366-4771-8a4a-2cd12e9cf7d0 */
        in item giveCommandForDataCollection : GiveCommandForDataCollection;
    }

    port def RelayCommandForDataCollectionFuncOut {
        doc
        /* ID: d1bf2d17-f1dc-4dbe-9454-6d3bf289aef5 */
        out item relayCommandForDataCollection : RelayCommandForDataCollection;
    }

    port def RelayCommandForDataCollectionFuncIn {
        doc
        /* ID: 9eac541e-6644-467d-8feb-4eca694b1180 */
        in item relayCommandForDataCollection : RelayCommandForDataCollection;
    }

    port def MoveResultsOfTheEducationalSpaceExperimentToTheCorrectLocationFuncOut {
        doc
        /* ID: 482a6a98-6bc5-49d6-a439-73f964b143c8 */
        out item moveResultsOfTheEducationalSpaceExperimentToTheCorrectLocation : MoveResultsOfTheEducationalSpaceExperimentToTheCorrectLocation;
    }

    port def MoveResultsOfTheEducationalSpaceExperimentToTheCorrectLocationFuncIn {
        doc
        /* ID: bb7f9d03-1b67-4814-9058-4497130a060a */
        in item moveResultsOfTheEducationalSpaceExperimentToTheCorrectLocation : MoveResultsOfTheEducationalSpaceExperimentToTheCorrectLocation;
    }

    port def MoveSpaceRadiationExperimentResultsToCorrectLocationFuncOut {
        doc
        /* ID: 034be360-feef-424e-a8d6-3fc5836c5221 */
        out item moveSpaceRadiationExperimentResultsToCorrectLocation : MoveSpaceRadiationExperimentResultsToCorrectLocation;
    }

    port def MoveSpaceRadiationExperimentResultsToCorrectLocationFuncIn {
        doc
        /* ID: 35fc22ac-080b-4847-ae70-c9a4f12f6a84 */
        in item moveSpaceRadiationExperimentResultsToCorrectLocation : MoveSpaceRadiationExperimentResultsToCorrectLocation;
    }

    port def DownlinkSpaceRadiationExperimentResultsFuncOut {
        doc
        /* ID: 0783474b-8cc5-42ca-8bd8-23eca21e4941 */
        out item downlinkSpaceRadiationExperimentResults : DownlinkSpaceRadiationExperimentResults;
    }

    port def DownlinkSpaceRadiationExperimentResultsFuncIn {
        doc
        /* ID: 948ddf2d-c74e-4cf8-ba59-bf2165a5c1c3 */
        in item downlinkSpaceRadiationExperimentResults : DownlinkSpaceRadiationExperimentResults;
    }

    port def DownlinkEducationalDataFuncOut {
        doc
        /* ID: 4373a64e-d6be-42f1-8f01-470bd9183aa4 */
        out item downlinkEducationalData : DownlinkEducationalData;
    }

    port def DownlinkEducationalDataFuncIn {
        doc
        /* ID: 83f6b283-2d3d-4457-92d1-4486089da048 */
        in item downlinkEducationalData : DownlinkEducationalData;
    }

    port def DownlinkMissionStatusFuncOut {
        doc
        /* ID: bdb43da9-7eee-435b-bca9-bfad4424495b */
        out item downlinkMissionStatus : DownlinkMissionStatus;
    }

    port def DownlinkMissionStatusFuncIn {
        doc
        /* ID: 24b33abf-8a92-48aa-8b5b-79d9f1a530f3 */
        in item downlinkMissionStatus : DownlinkMissionStatus;
    }

    port def DownlinkEducationalSpaceExperimentResultsFuncOut {
        doc
        /* ID: 79b7c503-dd93-4abf-b4c1-c05f4b880c3f */
        out item downlinkEducationalSpaceExperimentResults : DownlinkEducationalSpaceExperimentResults;
    }

    port def DownlinkEducationalSpaceExperimentResultsFuncIn {
        doc
        /* ID: a0755060-bec2-4665-855d-3bc2d7d8c4a5 */
        in item downlinkEducationalSpaceExperimentResults : DownlinkEducationalSpaceExperimentResults;
    }

    port def GiveCommandToStartDiceToPMFuncOut {
        doc
        /* ID: 1a9fe0bc-1d53-40d8-8796-28794c27b0cf */
        out item giveCommandToStartDiceToPM : GiveCommandToStartDiceToPM;
    }

    port def GiveCommandToStartDiceToPMFuncIn {
        doc
        /* ID: f2a3e905-2ce5-472e-80f7-f7e3cb87eeb7 */
        in item giveCommandToStartDiceToPM : GiveCommandToStartDiceToPM;
    }

    port def RelayCommandToTheDicePayloadFuncOut {
        doc
        /* ID: c765bb21-d09c-4777-a8a7-ed9e9e15ce65 */
        out item relayCommandToTheDicePayload : RelayCommandToTheDicePayload;
    }

    port def RelayCommandToTheDicePayloadFuncIn {
        doc
        /* ID: ba241815-0299-492b-ae2c-8d8150c46ba0 */
        in item relayCommandToTheDicePayload : RelayCommandToTheDicePayload;
    }

    port def DiceAreClampedFuncOut {
        doc
        /* ID: d6b7d89b-c473-4d91-9057-94d9f62ac2c7 */
        out item diceAreClamped : DiceAreClamped;
    }

    port def DiceAreClampedFuncIn {
        doc
        /* ID: 77b92e4e-2796-4396-a962-2e152b47afe3 */
        in item diceAreClamped : DiceAreClamped;
    }

    port def LEDsAreTurnedOnFuncOut {
        doc
        /* ID: 4ccd1adb-776e-4dfc-bf40-3a47408c94cb */
        out item leDsAreTurnedOn : LEDsAreTurnedOn;
    }

    port def LEDsAreTurnedOnFuncIn {
        doc
        /* ID: 54a8f72a-24a8-43af-a533-ee98ae8c327d */
        in item leDsAreTurnedOn : LEDsAreTurnedOn;
    }

    port def ImageIsTakenFuncOut {
        doc
        /* ID: c112369c-b0db-44eb-833b-43dd144b40e7 */
        out item imageIsTaken : ImageIsTaken;
    }

    port def ImageIsTakenFuncIn {
        doc
        /* ID: 673357d4-6032-450d-813a-227cbee32ff0 */
        in item imageIsTaken : ImageIsTaken;
    }

    port def LEDsAreTurnedOffFuncOut {
        doc
        /* ID: b26dba9b-e723-4bef-9628-4c29ad5d7a4c */
        out item leDsAreTurnedOff : LEDsAreTurnedOff;
    }

    port def LEDsAreTurnedOffFuncIn {
        doc
        /* ID: d1a45005-fbe2-45d7-8cd6-8554c1263263 */
        in item leDsAreTurnedOff : LEDsAreTurnedOff;
    }

    port def DiceAreUnclampedFuncOut {
        doc
        /* ID: fb97de0c-48b0-458e-98a1-4107a0699fe4 */
        out item diceAreUnclamped : DiceAreUnclamped;
    }

    port def DiceAreUnclampedFuncIn {
        doc
        /* ID: d6910992-206d-402c-a6b8-c75fea98aadb */
        in item diceAreUnclamped : DiceAreUnclamped;
    }

    port def ShareDiceImageResultsFuncOut {
        doc
        /* ID: 848b8012-9c74-4a65-ac2c-d0b9ec01dedf */
        out item shareDiceImageResults : ShareDiceImageResults;
    }

    port def ShareDiceImageResultsFuncIn {
        doc
        /* ID: a61b335e-bd75-4e6a-a236-59064d3a5936 */
        in item shareDiceImageResults : ShareDiceImageResults;
    }

    port def CommandAntennaToDownlinkDiceImageResultsFuncOut {
        doc
        /* ID: 18ab64ce-d12a-4b9d-bf22-223c136827b6 */
        out item commandAntennaToDownlinkDiceImageResults : CommandAntennaToDownlinkDiceImageResults;
    }

    port def CommandAntennaToDownlinkDiceImageResultsFuncIn {
        doc
        /* ID: 212821df-5c4c-4e5b-9026-d5f393c7fdd3 */
        in item commandAntennaToDownlinkDiceImageResults : CommandAntennaToDownlinkDiceImageResults;
    }

    port def DiceDataFuncOut {
        doc
        /* ID: ac1f1a1b-13c8-446f-b59a-22be1591bc07 */
        out item diceData : DiceData;
    }

    port def DiceDataFuncIn {
        doc
        /* ID: 03db543d-5285-42be-ab20-3d1c96bc0684 */
        in item diceData : DiceData;
    }

    port def RelayBitflipImageDataToPMFuncOut {
        doc
        /* ID: be8775ff-dbf9-4b7f-b872-3cc01c4b019f */
        out item relayBitflipImageDataToPM : RelayBitflipImageDataToPM;
    }

    port def RelayBitflipImageDataToPMFuncIn {
        doc
        /* ID: 16f14672-a530-4ddc-b679-ab2566e46e58 */
        in item relayBitflipImageDataToPM : RelayBitflipImageDataToPM;
    }

    port def ShareTheInitialImageDataFuncOut {
        doc
        /* ID: 59de9ceb-43eb-463a-ac02-afb907cb65fc */
        out item shareTheInitialImageData : ShareTheInitialImageData;
    }

    port def ShareTheInitialImageDataFuncIn {
        doc
        /* ID: b440d4c7-09d2-4652-be0c-7fb8d906cf7e */
        in item shareTheInitialImageData : ShareTheInitialImageData;
    }

    port def TimePassesFuncOut {
        doc
        /* ID: 21f3cb8e-7152-469d-9392-fd5e27e050f0 */
        out item timePasses : TimePasses;
    }

    port def TimePassesFuncIn {
        doc
        /* ID: 31dec1b3-b806-42c8-a598-442ec8431000 */
        in item timePasses : TimePasses;
    }

    port def NumberOfBitflipsFuncOut {
        doc
        /* ID: 212e4a51-0584-4812-a69a-270b82451632 */
        out item numberOfBitflips : NumberOfBitflips;
    }

    port def NumberOfBitflipsFuncIn {
        doc
        /* ID: e3e4c039-3e9b-4e3d-91ef-cd1a23dc33d5 */
        in item numberOfBitflips : NumberOfBitflips;
    }

    port def NotEnoughBitflipsHaveOccuredFuncOut {
        doc
        /* ID: bf606c4a-cbfb-4d53-bd59-5f41c9aa3e53 */
        out item notEnoughBitflipsHaveOccured : NotEnoughBitflipsHaveOccured;
    }

    port def NotEnoughBitflipsHaveOccuredFuncIn {
        doc
        /* ID: 3a81152c-c9f0-4a31-8ee8-e9e743122cf5 */
        in item notEnoughBitflipsHaveOccured : NotEnoughBitflipsHaveOccured;
    }

    port def EnoughBitflipsHaveOccuredFuncOut {
        doc
        /* ID: c072391d-2879-4599-b2a8-55b5ce056ddd */
        out item enoughBitflipsHaveOccured : EnoughBitflipsHaveOccured;
    }

    port def EnoughBitflipsHaveOccuredFuncIn {
        doc
        /* ID: 13b57757-6805-4388-bd9a-212865a7a480 */
        in item enoughBitflipsHaveOccured : EnoughBitflipsHaveOccured;
    }

    port def ShareBitflipLocationsFuncOut {
        doc
        /* ID: 1f6bcf03-4d8a-4d77-9d4c-e71d82977157 */
        out item shareBitflipLocations : ShareBitflipLocations;
    }

    port def ShareBitflipLocationsFuncIn {
        doc
        /* ID: 19f4d284-cd39-4c74-82a1-b48e517013ef */
        in item shareBitflipLocations : ShareBitflipLocations;
    }

    port def CommandAntennaToDownlinkSpaceRadiationExperimentResultsFuncOut {
        doc
        /* ID: 7c966aa0-3d22-4f57-a2d1-fef420d5be19 */
        out item commandAntennaToDownlinkSpaceRadiationExperimentResults : CommandAntennaToDownlinkSpaceRadiationExperimentResults;
    }

    port def CommandAntennaToDownlinkSpaceRadiationExperimentResultsFuncIn {
        doc
        /* ID: ba9c4e80-4417-4dce-81fd-1f1486e918d7 */
        in item commandAntennaToDownlinkSpaceRadiationExperimentResults : CommandAntennaToDownlinkSpaceRadiationExperimentResults;
    }

    port def BitflipDataFuncOut {
        doc
        /* ID: 344e1dfc-e8b1-42d5-8eef-7cd95a8c5bcd */
        out item bitflipData : BitflipData;
    }

    port def BitflipDataFuncIn {
        doc
        /* ID: ee05ea31-5516-4700-b1cd-4845376a9410 */
        in item bitflipData : BitflipData;
    }

    port def RelayScheduleForTheDicePayloadFuncOut {
        doc
        /* ID: 4cce368a-c41b-4163-8c3d-e130cb2bea27 */
        out item relayScheduleForTheDicePayload : RelayScheduleForTheDicePayload;
    }

    port def RelayScheduleForTheDicePayloadFuncIn {
        doc
        /* ID: a98d0a90-ea91-43aa-b3c7-b662d0661957 */
        in item relayScheduleForTheDicePayload : RelayScheduleForTheDicePayload;
    }

    port def RelayScheduleForTheBitflipPayloadFuncOut {
        doc
        /* ID: e3193125-f8c0-462d-b47b-5c626d29a468 */
        out item relayScheduleForTheBitflipPayload : RelayScheduleForTheBitflipPayload;
    }

    port def RelayScheduleForTheBitflipPayloadFuncIn {
        doc
        /* ID: 5f18182a-c379-4670-9289-e2068fffe323 */
        in item relayScheduleForTheBitflipPayload : RelayScheduleForTheBitflipPayload;
    }

    port def CheckEnergyLevelsFuncOut {
        doc
        /* ID: 83166641-5792-4c54-90aa-7038e8c5eaa6 */
        out item checkEnergyLevels : CheckEnergyLevels;
    }

    port def CheckEnergyLevelsFuncIn {
        doc
        /* ID: e1d31c0c-fc94-49fb-8d80-a8c99d22267d */
        in item checkEnergyLevels : CheckEnergyLevels;
    }

    port def CheckSpinRateFuncOut {
        doc
        /* ID: 57596c4a-ff7c-44d3-8995-1149287b7280 */
        out item checkSpinRate : CheckSpinRate;
    }

    port def CheckSpinRateFuncIn {
        doc
        /* ID: a1aaedd8-b86a-4b70-8d49-5e0b1395f9cf */
        in item checkSpinRate : CheckSpinRate;
    }

    port def CheckTemperaturesFuncOut {
        doc
        /* ID: edce464a-af8e-4e74-b01c-619a30104d0c */
        out item checkTemperatures : CheckTemperatures;
    }

    port def CheckTemperaturesFuncIn {
        doc
        /* ID: 88f8a192-a1cf-405d-b1d6-f4fa1c4cd288 */
        in item checkTemperatures : CheckTemperatures;
    }

    port def SpecialDiceImageRequestFuncOut {
        doc
        /* ID: f1526904-8f7d-46ce-b61a-59529dea02ad */
        out item specialDiceImageRequest : SpecialDiceImageRequest;
    }

    port def SpecialDiceImageRequestFuncIn {
        doc
        /* ID: 1781ec48-8dd6-4b58-af0b-091ebe1bbd91 */
        in item specialDiceImageRequest : SpecialDiceImageRequest;
    }

    port def EnergyLevelFuncOut {
        doc
        /* ID: 6adfc420-d197-48db-91eb-46e1af523619 */
        out item energyLevel : EnergyLevel;
    }

    port def EnergyLevelFuncIn {
        doc
        /* ID: 0b3b6710-469c-4270-8dcc-0b2878125f94 */
        in item energyLevel : EnergyLevel;
    }

    port def EnergyLevelBelowMarginFuncOut {
        doc
        /* ID: 8adc0a7d-9d17-4488-ad18-c4c57d6eeccd */
        out item energyLevelBelowMargin : EnergyLevelBelowMargin;
    }

    port def EnergyLevelBelowMarginFuncIn {
        doc
        /* ID: 53138888-0fa1-4eb4-8f31-b075e0532ed0 */
        in item energyLevelBelowMargin : EnergyLevelBelowMargin;
    }

    port def EnergyLevelAboveMarginFuncOut {
        doc
        /* ID: 1beffea1-0f65-4a2a-8335-9f9c16904059 */
        out item energyLevelAboveMargin : EnergyLevelAboveMargin;
    }

    port def EnergyLevelAboveMarginFuncIn {
        doc
        /* ID: ba400aad-cc7d-4336-b11a-a646548116cb */
        in item energyLevelAboveMargin : EnergyLevelAboveMargin;
    }

    port def SpinRateFuncOut {
        doc
        /* ID: 381bcd6f-aee8-4d1c-b69f-dcfc7f67a27d */
        out item spinRate : SpinRate;
    }

    port def SpinRateFuncIn {
        doc
        /* ID: 06ffa2e1-e72e-4de3-bfd5-6e4b378e58f4 */
        in item spinRate : SpinRate;
    }

    port def SpinRateAboveCriticalLevelFuncOut {
        doc
        /* ID: d33fbad0-8798-4b67-870c-c5ae622c4564 */
        out item spinRateAboveCriticalLevel : SpinRateAboveCriticalLevel;
    }

    port def SpinRateAboveCriticalLevelFuncIn {
        doc
        /* ID: d8a5968d-6277-4edf-9b18-a67cae758ee2 */
        in item spinRateAboveCriticalLevel : SpinRateAboveCriticalLevel;
    }

    port def SpinRateBetweenOperationalMarginAndCriticalLevelFuncOut {
        doc
        /* ID: 8547f591-c87b-47d9-bb9f-e61a5785df3c */
        out item spinRateBetweenOperationalMarginAndCriticalLevel : SpinRateBetweenOperationalMarginAndCriticalLevel;
    }

    port def SpinRateBetweenOperationalMarginAndCriticalLevelFuncIn {
        doc
        /* ID: aa0f916e-c512-4c3e-a81c-e68ebe4a26cc */
        in item spinRateBetweenOperationalMarginAndCriticalLevel : SpinRateBetweenOperationalMarginAndCriticalLevel;
    }

    port def SpinRateBelowOperationalMarginFuncOut {
        doc
        /* ID: be7077c0-1b8f-4efe-936d-7d7e1743bbf8 */
        out item spinRateBelowOperationalMargin : SpinRateBelowOperationalMargin;
    }

    port def SpinRateBelowOperationalMarginFuncIn {
        doc
        /* ID: b07a7433-666f-4b61-9be9-8e6054c120fd */
        in item spinRateBelowOperationalMargin : SpinRateBelowOperationalMargin;
    }

    port def AttitudeInformationFuncOut {
        doc
        /* ID: bad0b0f4-a2af-4a7e-a884-64202d6760e0 */
        out item attitudeInformation : AttitudeInformation;
    }

    port def AttitudeInformationFuncIn {
        doc
        /* ID: d5bcbaf7-c1a8-4e05-a086-6034f228c67d */
        in item attitudeInformation : AttitudeInformation;
    }

    port def CommandADCSToRepositionTheSatelliteFuncOut {
        doc
        /* ID: 9abf5e3a-7303-43e6-87da-78dd61e44f1a */
        out item commandADCSToRepositionTheSatellite : CommandADCSToRepositionTheSatellite;
    }

    port def CommandADCSToRepositionTheSatelliteFuncIn {
        doc
        /* ID: 5399a4d5-c0a7-463d-88ef-c15966aa1300 */
        in item commandADCSToRepositionTheSatellite : CommandADCSToRepositionTheSatellite;
    }

    port def RelayThatTheSatelliteIsInDesiredAttitudeFuncOut {
        doc
        /* ID: 1b7b082a-3d28-4437-a676-594f4d2b115a */
        out item relayThatTheSatelliteIsInDesiredAttitude : RelayThatTheSatelliteIsInDesiredAttitude;
    }

    port def RelayThatTheSatelliteIsInDesiredAttitudeFuncIn {
        doc
        /* ID: 04f57b21-e82d-4d2c-91e4-3f2dc91de9f9 */
        in item relayThatTheSatelliteIsInDesiredAttitude : RelayThatTheSatelliteIsInDesiredAttitude;
    }

    port def TemperatureLevelFuncOut {
        doc
        /* ID: f5352e19-c85d-408a-8f96-9ddd162dafbd */
        out item temperatureLevel : TemperatureLevel;
    }

    port def TemperatureLevelFuncIn {
        doc
        /* ID: f8c877fc-ccf5-4c0c-90eb-f858bcadc5e0 */
        in item temperatureLevel : TemperatureLevel;
    }

    port def TemperatureIsAtACriticalLevelFuncOut {
        doc
        /* ID: 840966d9-efe1-4028-981e-0423123326d7 */
        out item temperatureIsAtACriticalLevel : TemperatureIsAtACriticalLevel;
    }

    port def TemperatureIsAtACriticalLevelFuncIn {
        doc
        /* ID: a07ae6c7-0237-4f17-831e-6d70043d8395 */
        in item temperatureIsAtACriticalLevel : TemperatureIsAtACriticalLevel;
    }

    port def TemperatureWithinOperationalMarginFuncOut {
        doc
        /* ID: 992c492b-ace7-49ba-99c7-127575550add */
        out item temperatureWithinOperationalMargin : TemperatureWithinOperationalMargin;
    }

    port def TemperatureWithinOperationalMarginFuncIn {
        doc
        /* ID: 9040237a-141c-4328-9358-a9ea1900bc1c */
        in item temperatureWithinOperationalMargin : TemperatureWithinOperationalMargin;
    }

    port def TemperatureBetweenOperationalMarginAndCriticalLevelFuncOut {
        doc
        /* ID: d87296ca-de00-45fc-9f98-1793388e8792 */
        out item temperatureBetweenOperationalMarginAndCriticalLevel : TemperatureBetweenOperationalMarginAndCriticalLevel;
    }

    port def TemperatureBetweenOperationalMarginAndCriticalLevelFuncIn {
        doc
        /* ID: 9d8841f5-5add-484a-b4ee-6a9bcd171a13 */
        in item temperatureBetweenOperationalMarginAndCriticalLevel : TemperatureBetweenOperationalMarginAndCriticalLevel;
    }

    port def HousekeepingDataFuncOut {
        doc
        /* ID: c168d502-7813-418a-bc51-9b4ba1d3ae4d */
        out item housekeepingData : HousekeepingData;
    }

    port def HousekeepingDataFuncIn {
        doc
        /* ID: 70c7d80d-1e4a-497b-ac70-cf924e29417c */
        in item housekeepingData : HousekeepingData;
    }

    port def CommandAntennaToDownlinkAllGeneratedDataFuncOut {
        doc
        /* ID: b29a3d39-199a-4369-b7c0-a0bd261480bf */
        out item commandAntennaToDownlinkAllGeneratedData : CommandAntennaToDownlinkAllGeneratedData;
    }

    port def CommandAntennaToDownlinkAllGeneratedDataFuncIn {
        doc
        /* ID: df09ee6b-edb5-4793-90e2-dee8f5b07757 */
        in item commandAntennaToDownlinkAllGeneratedData : CommandAntennaToDownlinkAllGeneratedData;
    }

    port def RelayEducationalDataFuncOut {
        doc
        /* ID: 26cb1a0a-c813-42c9-8d8a-9811b22c84e6 */
        out item relayEducationalData : RelayEducationalData;
    }

    port def RelayEducationalDataFuncIn {
        doc
        /* ID: 1ec856e2-0a12-48f4-a369-431e8d164b6c */
        in item relayEducationalData : RelayEducationalData;
    }

    interface def PrepareEducationalSpaceExperiment_83c0ToTransmitEducationalSpaceExperimentPlanning_eb64Interface {
        end port outPort : RelayEducationalSpaceExperimentPlanningFuncOut;
        end port inPort : RelayEducationalSpaceExperimentPlanningFuncIn;
        flow of RelayEducationalSpaceExperimentPlanning from outPort.relayEducationalSpaceExperimentPlanning to inPort.relayEducationalSpaceExperimentPlanning;
    }

    interface def ProvideExperimentResultToSchools_58a8ToPrepareSpaceLesson_368dInterface {
        end port outPort : AccessExperimentResultsFuncOut;
        end port inPort : AccessExperimentResultsFuncIn;
        flow of AccessExperimentResults from outPort.accessExperimentResults to inPort.accessExperimentResults;
    }

    interface def PrepareSpaceLesson_368dToParticipateInLesson_686aInterface {
        end port outPort : TeachLessonUsingExperimentFuncOut;
        end port inPort : TeachLessonUsingExperimentFuncIn;
        flow of TeachLessonUsingExperiment from outPort.teachLessonUsingExperiment to inPort.teachLessonUsingExperiment;
    }

    interface def ParticipateInLesson_686aToBecomeInspiredBySpaceMission_7b65Interface {
        end port outPort : ObserveSpaceExperimentResultsFuncOut;
        end port inPort : ObserveSpaceExperimentResultsFuncIn;
        flow of ObserveSpaceExperimentResults from outPort.observeSpaceExperimentResults to inPort.observeSpaceExperimentResults;
    }

    interface def PrepareSpaceRadiationExperiment_7ffbToTransmitImageData_78b4Interface {
        end port outPort : RelayImageForSpaceRadiationExperimentFuncOut;
        end port inPort : RelayImageForSpaceRadiationExperimentFuncIn;
        flow of RelayImageForSpaceRadiationExperiment from outPort.relayImageForSpaceRadiationExperiment to inPort.relayImageForSpaceRadiationExperiment;
    }

    interface def ProvideSpaceRadiationExperimentResultsToSchools_8138ToPrepareSpaceRadiationLesson_c0f4Interface {
        end port outPort : AccessSpaceRadiationExperimentResultsFuncOut;
        end port inPort : AccessSpaceRadiationExperimentResultsFuncIn;
        flow of AccessSpaceRadiationExperimentResults from outPort.accessSpaceRadiationExperimentResults to inPort.accessSpaceRadiationExperimentResults;
    }

    interface def PrepareSpaceRadiationLesson_c0f4ToParticipateInLesson_3e27Interface {
        end port outPort : TeachSpaceRadiationLessonFuncOut;
        end port inPort : TeachSpaceRadiationLessonFuncIn;
        flow of TeachSpaceRadiationLesson from outPort.teachSpaceRadiationLesson to inPort.teachSpaceRadiationLesson;
    }

    interface def ParticipateInLesson_3e27ToLearnAboutTheEffectOfSpaceRadiationAndMitigationTechniquesWithProgramming_96b4Interface {
        end port outPort : AnalyseTheEffectOfSpaceRadiationFuncOut;
        end port inPort : AnalyseTheEffectOfSpaceRadiationFuncIn;
        flow of AnalyseTheEffectOfSpaceRadiation from outPort.analyseTheEffectOfSpaceRadiation to inPort.analyseTheEffectOfSpaceRadiation;
    }

    interface def PlanAndScheduleDataCollection_22bbToTransmitCommandForDataCollection_47bcInterface {
        end port outPort : RelayDataCollectionScheduleWithGroundStationFuncOut;
        end port inPort : RelayDataCollectionScheduleWithGroundStationFuncIn;
        flow of RelayDataCollectionScheduleWithGroundStation from outPort.relayDataCollectionScheduleWithGroundStation to inPort.relayDataCollectionScheduleWithGroundStation;
    }

    interface def PlanMissionOperations_3b3aToTransmitMissionOperations_d957Interface {
        end port outPort : RelayMissionOperationsWithGroundStationFuncOut;
        end port inPort : RelayMissionOperationsWithGroundStationFuncIn;
        flow of RelayMissionOperationsWithGroundStation from outPort.relayMissionOperationsWithGroundStation to inPort.relayMissionOperationsWithGroundStation;
    }

    interface def TransmitMissionOperations_d957ToReceiveMissionOperations_3937Interface {
        end port outPort : UplinkMissionOperationsFuncOut;
        end port inPort : UplinkMissionOperationsFuncIn;
        flow of UplinkMissionOperations from outPort.uplinkMissionOperations to inPort.uplinkMissionOperations;
    }

    interface def ReceiveMissionStatus_1718ToMonitorMissionStatus_d739Interface {
        end port outPort : RelayMissionOperationalStatusWithDVSTeamFuncOut;
        end port inPort : RelayMissionOperationalStatusWithDVSTeamFuncIn;
        flow of RelayMissionOperationalStatusWithDVSTeam from outPort.relayMissionOperationalStatusWithDVSTeam to inPort.relayMissionOperationalStatusWithDVSTeam;
    }

    interface def TransmitCommandForDataCollection_47bcToReceiveDataCollectionCommand_d32aInterface {
        end port outPort : UplinkDataCollectionCommandFuncOut;
        end port inPort : UplinkDataCollectionCommandFuncIn;
        flow of UplinkDataCollectionCommand from outPort.uplinkDataCollectionCommand to inPort.uplinkDataCollectionCommand;
    }

    interface def RecieveEducationalData_d30cToSeparateEducationalModulesData_c249Interface {
        end port outPort : RelayEducationalDataWithDVSTeamFuncOut;
        end port inPort : RelayEducationalDataWithDVSTeamFuncIn;
        flow of RelayEducationalDataWithDVSTeam from outPort.relayEducationalDataWithDVSTeam to inPort.relayEducationalDataWithDVSTeam;
    }

    interface def SeparateEducationalModulesData_c249ToHostEducationalData_fc85Interface {
        end port outPort : UploadTheDataOfTheEducationalModulesFuncOut;
        end port inPort : UploadTheDataOfTheEducationalModulesFuncIn;
        flow of UploadTheDataOfTheEducationalModules from outPort.uploadTheDataOfTheEducationalModules to inPort.uploadTheDataOfTheEducationalModules;
    }

    interface def SelectImage_7b1bToCheckImage_3804Interface {
        end port outPort : GiveImageToTheTeacherFuncOut;
        end port inPort : GiveImageToTheTeacherFuncIn;
        flow of GiveImageToTheTeacher from outPort.giveImageToTheTeacher to inPort.giveImageToTheTeacher;
    }

    interface def CheckImage_3804ToStoreImages_f9a5Interface {
        end port outPort : UploadImageToTheWebsiteFuncOut;
        end port inPort : UploadImageToTheWebsiteFuncIn;
        flow of UploadImageToTheWebsite from outPort.uploadImageToTheWebsite to inPort.uploadImageToTheWebsite;
    }

    interface def StoreImages_f9a5ToPrepareSpaceRadiationExperiment_7ffbInterface {
        end port outPort : SelectTheLatestImageFuncOut;
        end port inPort : SelectTheLatestImageFuncIn;
        flow of SelectTheLatestImage from outPort.selectTheLatestImage to inPort.selectTheLatestImage;
    }

    interface def TransmitImageData_78b4ToReceiveImageData_1ebaInterface {
        end port outPort : UplinkImageDataFuncOut;
        end port inPort : UplinkImageDataFuncIn;
        flow of UplinkImageData from outPort.uplinkImageData to inPort.uplinkImageData;
    }

    interface def ReceiveSpaceRadiationExperimentResults_ae11ToCheckTheSpaceRadiationExperimentResults_459aInterface {
        end port outPort : RelaySpaceRadiationExperimentResultsFuncOut;
        end port inPort : RelaySpaceRadiationExperimentResultsFuncIn;
        flow of RelaySpaceRadiationExperimentResults from outPort.relaySpaceRadiationExperimentResults to inPort.relaySpaceRadiationExperimentResults;
    }

    interface def CheckTheSpaceRadiationExperimentResults_459aToProvideSpaceRadiationExperimentResultsToSchools_8138Interface {
        end port outPort : UploadSpaceRadiationResultsToTheWebsiteFuncOut;
        end port inPort : UploadSpaceRadiationResultsToTheWebsiteFuncIn;
        flow of UploadSpaceRadiationResultsToTheWebsite from outPort.uploadSpaceRadiationResultsToTheWebsite to inPort.uploadSpaceRadiationResultsToTheWebsite;
    }

    interface def TransmitEducationalSpaceExperimentPlanning_eb64ToReceiveEducationalSpaceExperimentPlanning_81e9Interface {
        end port outPort : UplinkEducationalSpaceExperimentPlanningFuncOut;
        end port inPort : UplinkEducationalSpaceExperimentPlanningFuncIn;
        flow of UplinkEducationalSpaceExperimentPlanning from outPort.uplinkEducationalSpaceExperimentPlanning to inPort.uplinkEducationalSpaceExperimentPlanning;
    }

    interface def ReceiveEducationalSpaceExperimentResults_1b82ToCheckEducationalSpaceExperimentResults_35a2Interface {
        end port outPort : RelayEducationalSpaceExperimentResultsFuncOut;
        end port inPort : RelayEducationalSpaceExperimentResultsFuncIn;
        flow of RelayEducationalSpaceExperimentResults from outPort.relayEducationalSpaceExperimentResults to inPort.relayEducationalSpaceExperimentResults;
    }

    interface def CheckEducationalSpaceExperimentResults_35a2ToProvideExperimentResultToSchools_58a8Interface {
        end port outPort : UploadEducationalSpaceExperimentResultsFuncOut;
        end port inPort : UploadEducationalSpaceExperimentResultsFuncIn;
        flow of UploadEducationalSpaceExperimentResults from outPort.uploadEducationalSpaceExperimentResults to inPort.uploadEducationalSpaceExperimentResults;
    }

    interface def ReceiveEducationalSpaceExperimentPlanning_81e9ToPerformEducationalSpaceExperiment_fb50Interface {
        end port outPort : GiveCommandToPerformEducationalSpaceExperimentFuncOut;
        end port inPort : GiveCommandToPerformEducationalSpaceExperimentFuncIn;
        flow of GiveCommandToPerformEducationalSpaceExperiment from outPort.giveCommandToPerformEducationalSpaceExperiment to inPort.giveCommandToPerformEducationalSpaceExperiment;
    }

    interface def ReceiveEducationalSpaceExperimentPlanning_81e9ToCommandPMToOperateTheDicePayload_b4e5Interface {
        end port outPort : RelayDicePlanningToOBCFuncOut;
        end port inPort : RelayDicePlanningToOBCFuncIn;
        flow of RelayDicePlanningToOBC from outPort.relayDicePlanningToOBC to inPort.relayDicePlanningToOBC;
    }

    interface def ReceiveMissionOperations_3937ToCommandAllSubsystemsToPerformTheirOperations_6fa8Interface {
        end port outPort : RelayMissionOperationsToOBCFuncOut;
        end port inPort : RelayMissionOperationsToOBCFuncIn;
        flow of RelayMissionOperationsToOBC from outPort.relayMissionOperationsToOBC to inPort.relayMissionOperationsToOBC;
    }

    interface def ReceiveImageData_1ebaToDoTheSpaceRadiationExperiment_752cInterface {
        end port outPort : MoveImageDataToCorrectLocationFuncOut;
        end port inPort : MoveImageDataToCorrectLocationFuncIn;
        flow of MoveImageDataToCorrectLocation from outPort.moveImageDataToCorrectLocation to inPort.moveImageDataToCorrectLocation;
    }

    interface def ReceiveImageData_1ebaToShareImageDataWithPM_ebaaInterface {
        end port outPort : RelayBitflipImageDataToOBCFuncOut;
        end port inPort : RelayBitflipImageDataToOBCFuncIn;
        flow of RelayBitflipImageDataToOBC from outPort.relayBitflipImageDataToOBC to inPort.relayBitflipImageDataToOBC;
    }

    interface def ReceiveDataCollectionCommand_d32aToTransmitSpaceRadiationExperimentResults_fdbcInterface {
        end port outPort : GiveCommandForDataCollectionFuncOut;
        end port inPort : GiveCommandForDataCollectionFuncIn;
        flow of GiveCommandForDataCollection from outPort.giveCommandForDataCollection to inPort.giveCommandForDataCollection;
    }

    interface def ReceiveDataCollectionCommand_d32aToTransmitEducationalSpaceExperimentResults_2a0bInterface {
        end port outPort : GiveCommandForDataCollectionFuncOut;
        end port inPort : GiveCommandForDataCollectionFuncIn;
        flow of GiveCommandForDataCollection from outPort.giveCommandForDataCollection to inPort.giveCommandForDataCollection;
    }

    interface def ReceiveDataCollectionCommand_d32aToCommandAllSubsystemsToPerformTheirOperations_6fa8Interface {
        end port outPort : RelayCommandForDataCollectionFuncOut;
        end port inPort : RelayCommandForDataCollectionFuncIn;
        flow of RelayCommandForDataCollection from outPort.relayCommandForDataCollection to inPort.relayCommandForDataCollection;
    }

    interface def PerformEducationalSpaceExperiment_fb50ToTransmitEducationalSpaceExperimentResults_2a0bInterface {
        end port outPort : MoveResultsOfTheEducationalSpaceExperimentToTheCorrectLocationFuncOut;
        end port inPort : MoveResultsOfTheEducationalSpaceExperimentToTheCorrectLocationFuncIn;
        flow of MoveResultsOfTheEducationalSpaceExperimentToTheCorrectLocation from outPort.moveResultsOfTheEducationalSpaceExperimentToTheCorrectLocation to inPort.moveResultsOfTheEducationalSpaceExperimentToTheCorrectLocation;
    }

    interface def DoTheSpaceRadiationExperiment_752cToTransmitSpaceRadiationExperimentResults_fdbcInterface {
        end port outPort : MoveSpaceRadiationExperimentResultsToCorrectLocationFuncOut;
        end port inPort : MoveSpaceRadiationExperimentResultsToCorrectLocationFuncIn;
        flow of MoveSpaceRadiationExperimentResultsToCorrectLocation from outPort.moveSpaceRadiationExperimentResultsToCorrectLocation to inPort.moveSpaceRadiationExperimentResultsToCorrectLocation;
    }

    interface def TransmitSpaceRadiationExperimentResults_fdbcToReceiveSpaceRadiationExperimentResults_ae11Interface {
        end port outPort : DownlinkSpaceRadiationExperimentResultsFuncOut;
        end port inPort : DownlinkSpaceRadiationExperimentResultsFuncIn;
        flow of DownlinkSpaceRadiationExperimentResults from outPort.downlinkSpaceRadiationExperimentResults to inPort.downlinkSpaceRadiationExperimentResults;
    }

    interface def TransmitSpaceRadiationExperimentResults_fdbcToRecieveEducationalData_d30cInterface {
        end port outPort : DownlinkEducationalDataFuncOut;
        end port inPort : DownlinkEducationalDataFuncIn;
        flow of DownlinkEducationalData from outPort.downlinkEducationalData to inPort.downlinkEducationalData;
    }

    interface def TransmitMissionStatus_857fToReceiveMissionStatus_1718Interface {
        end port outPort : DownlinkMissionStatusFuncOut;
        end port inPort : DownlinkMissionStatusFuncIn;
        flow of DownlinkMissionStatus from outPort.downlinkMissionStatus to inPort.downlinkMissionStatus;
    }

    interface def TransmitEducationalSpaceExperimentResults_2a0bToReceiveEducationalSpaceExperimentResults_1b82Interface {
        end port outPort : DownlinkEducationalSpaceExperimentResultsFuncOut;
        end port inPort : DownlinkEducationalSpaceExperimentResultsFuncIn;
        flow of DownlinkEducationalSpaceExperimentResults from outPort.downlinkEducationalSpaceExperimentResults to inPort.downlinkEducationalSpaceExperimentResults;
    }

    interface def TransmitEducationalSpaceExperimentResults_2a0bToRecieveEducationalData_d30cInterface {
        end port outPort : DownlinkEducationalDataFuncOut;
        end port inPort : DownlinkEducationalDataFuncIn;
        flow of DownlinkEducationalData from outPort.downlinkEducationalData to inPort.downlinkEducationalData;
    }

    interface def TransmitEducationalData_d69bToRecieveEducationalData_d30cInterface {
        end port outPort : DownlinkEducationalDataFuncOut;
        end port inPort : DownlinkEducationalDataFuncIn;
        flow of DownlinkEducationalData from outPort.downlinkEducationalData to inPort.downlinkEducationalData;
    }

    interface def CommandPMToOperateTheDicePayload_b4e5ToStartTheDiceSequence_d389Interface {
        end port outPort : GiveCommandToStartDiceToPMFuncOut;
        end port inPort : GiveCommandToStartDiceToPMFuncIn;
        flow of GiveCommandToStartDiceToPM from outPort.giveCommandToStartDiceToPM to inPort.giveCommandToStartDiceToPM;
    }

    interface def StartTheDiceSequence_d389ToClampDice_8f2dInterface {
        end port outPort : RelayCommandToTheDicePayloadFuncOut;
        end port inPort : RelayCommandToTheDicePayloadFuncIn;
        flow of RelayCommandToTheDicePayload from outPort.relayCommandToTheDicePayload to inPort.relayCommandToTheDicePayload;
    }

    interface def ClampDice_8f2dToTurnOnLEDs_5e6dInterface {
        end port outPort : DiceAreClampedFuncOut;
        end port inPort : DiceAreClampedFuncIn;
        flow of DiceAreClamped from outPort.diceAreClamped to inPort.diceAreClamped;
    }

    interface def TurnOnLEDs_5e6dToTakeImage_378cInterface {
        end port outPort : LEDsAreTurnedOnFuncOut;
        end port inPort : LEDsAreTurnedOnFuncIn;
        flow of LEDsAreTurnedOn from outPort.leDsAreTurnedOn to inPort.leDsAreTurnedOn;
    }

    interface def TakeImage_378cToTurnOffLEDs_7c06Interface {
        end port outPort : ImageIsTakenFuncOut;
        end port inPort : ImageIsTakenFuncIn;
        flow of ImageIsTaken from outPort.imageIsTaken to inPort.imageIsTaken;
    }

    interface def TurnOffLEDs_7c06ToUnclampDice_a4a8Interface {
        end port outPort : LEDsAreTurnedOffFuncOut;
        end port inPort : LEDsAreTurnedOffFuncIn;
        flow of LEDsAreTurnedOff from outPort.leDsAreTurnedOff to inPort.leDsAreTurnedOff;
    }

    interface def UnclampDice_a4a8ToStoreDiceImageResults_bb51Interface {
        end port outPort : DiceAreUnclampedFuncOut;
        end port inPort : DiceAreUnclampedFuncIn;
        flow of DiceAreUnclamped from outPort.diceAreUnclamped to inPort.diceAreUnclamped;
    }

    interface def StoreDiceImageResults_bb51ToRetrieveDiceImageResults_332dInterface {
        end port outPort : ShareDiceImageResultsFuncOut;
        end port inPort : ShareDiceImageResultsFuncIn;
        flow of ShareDiceImageResults from outPort.shareDiceImageResults to inPort.shareDiceImageResults;
    }

    interface def RetrieveDiceImageResults_332dToTransmitEducationalSpaceExperimentResults_2a0bInterface {
        end port outPort : CommandAntennaToDownlinkDiceImageResultsFuncOut;
        end port inPort : CommandAntennaToDownlinkDiceImageResultsFuncIn;
        flow of CommandAntennaToDownlinkDiceImageResults from outPort.commandAntennaToDownlinkDiceImageResults to inPort.commandAntennaToDownlinkDiceImageResults;
    }

    interface def RetrieveDiceImageResults_332dToCombineAllGeneratedData_5334Interface {
        end port outPort : DiceDataFuncOut;
        end port inPort : DiceDataFuncIn;
        flow of DiceData from outPort.diceData to inPort.diceData;
    }

    interface def ShareImageDataWithPM_ebaaToStoreImageDataInitialStateOnPM_ac59Interface {
        end port outPort : RelayBitflipImageDataToPMFuncOut;
        end port inPort : RelayBitflipImageDataToPMFuncIn;
        flow of RelayBitflipImageDataToPM from outPort.relayBitflipImageDataToPM to inPort.relayBitflipImageDataToPM;
    }

    interface def StoreImageDataInitialStateOnPM_ac59ToStoreTheInitialStateDataOnTheUnprotectedMemoryBoards_96deInterface {
        end port outPort : ShareTheInitialImageDataFuncOut;
        end port inPort : ShareTheInitialImageDataFuncIn;
        flow of ShareTheInitialImageData from outPort.shareTheInitialImageData to inPort.shareTheInitialImageData;
    }

    interface def StoreTheInitialStateDataOnTheUnprotectedMemoryBoards_96deToBitflipsOccur_ac1aInterface {
        end port outPort : TimePassesFuncOut;
        end port inPort : TimePassesFuncIn;
        flow of TimePasses from outPort.timePasses to inPort.timePasses;
    }

    interface def CheckForAmountOfBitflips_7d87ToNumberOfBitflips_92e9Interface {
        end port outPort : NumberOfBitflipsFuncOut;
        end port inPort : NumberOfBitflipsFuncIn;
        flow of NumberOfBitflips from outPort.numberOfBitflips to inPort.numberOfBitflips;
    }

    interface def NumberOfBitflips_92e9ToBitflipsOccur_ac1aInterface {
        end port outPort : NotEnoughBitflipsHaveOccuredFuncOut;
        end port inPort : NotEnoughBitflipsHaveOccuredFuncIn;
        flow of NotEnoughBitflipsHaveOccured from outPort.notEnoughBitflipsHaveOccured to inPort.notEnoughBitflipsHaveOccured;
    }

    interface def NumberOfBitflips_92e9ToDetermineTheLocationsOfTheBitflips_18b2Interface {
        end port outPort : EnoughBitflipsHaveOccuredFuncOut;
        end port inPort : EnoughBitflipsHaveOccuredFuncIn;
        flow of EnoughBitflipsHaveOccured from outPort.enoughBitflipsHaveOccured to inPort.enoughBitflipsHaveOccured;
    }

    interface def DetermineTheLocationsOfTheBitflips_18b2ToRetrieveBitflipLocations_4248Interface {
        end port outPort : ShareBitflipLocationsFuncOut;
        end port inPort : ShareBitflipLocationsFuncIn;
        flow of ShareBitflipLocations from outPort.shareBitflipLocations to inPort.shareBitflipLocations;
    }

    interface def BitflipsOccur_ac1aToCheckForAmountOfBitflips_7d87Interface {
        end port outPort : NumberOfBitflipsFuncOut;
        end port inPort : NumberOfBitflipsFuncIn;
        flow of NumberOfBitflips from outPort.numberOfBitflips to inPort.numberOfBitflips;
    }

    interface def RetrieveBitflipLocations_4248ToTransmitSpaceRadiationExperimentResults_fdbcInterface {
        end port outPort : CommandAntennaToDownlinkSpaceRadiationExperimentResultsFuncOut;
        end port inPort : CommandAntennaToDownlinkSpaceRadiationExperimentResultsFuncIn;
        flow of CommandAntennaToDownlinkSpaceRadiationExperimentResults from outPort.commandAntennaToDownlinkSpaceRadiationExperimentResults to inPort.commandAntennaToDownlinkSpaceRadiationExperimentResults;
    }

    interface def RetrieveBitflipLocations_4248ToCombineAllGeneratedData_5334Interface {
        end port outPort : BitflipDataFuncOut;
        end port inPort : BitflipDataFuncIn;
        flow of BitflipData from outPort.bitflipData to inPort.bitflipData;
    }

    interface def CommandAllSubsystemsToPerformTheirOperations_6fa8ToCommandPMToOperateTheDicePayload_b4e5Interface {
        end port outPort : RelayScheduleForTheDicePayloadFuncOut;
        end port inPort : RelayScheduleForTheDicePayloadFuncIn;
        flow of RelayScheduleForTheDicePayload from outPort.relayScheduleForTheDicePayload to inPort.relayScheduleForTheDicePayload;
    }

    interface def CommandAllSubsystemsToPerformTheirOperations_6fa8ToShareImageDataWithPM_ebaaInterface {
        end port outPort : RelayScheduleForTheBitflipPayloadFuncOut;
        end port inPort : RelayScheduleForTheBitflipPayloadFuncIn;
        flow of RelayScheduleForTheBitflipPayload from outPort.relayScheduleForTheBitflipPayload to inPort.relayScheduleForTheBitflipPayload;
    }

    interface def CommandAllSubsystemsToPerformTheirOperations_6fa8ToStoreEnergyInTheBatteries_baf4Interface {
        end port outPort : CheckEnergyLevelsFuncOut;
        end port inPort : CheckEnergyLevelsFuncIn;
        flow of CheckEnergyLevels from outPort.checkEnergyLevels to inPort.checkEnergyLevels;
    }

    interface def CommandAllSubsystemsToPerformTheirOperations_6fa8ToDetermineSpinRate_f542Interface {
        end port outPort : CheckSpinRateFuncOut;
        end port inPort : CheckSpinRateFuncIn;
        flow of CheckSpinRate from outPort.checkSpinRate to inPort.checkSpinRate;
    }

    interface def CommandAllSubsystemsToPerformTheirOperations_6fa8ToDetermineTemperatures_504eInterface {
        end port outPort : CheckTemperaturesFuncOut;
        end port inPort : CheckTemperaturesFuncIn;
        flow of CheckTemperatures from outPort.checkTemperatures to inPort.checkTemperatures;
    }

    interface def CommandAllSubsystemsToPerformTheirOperations_6fa8ToRequestSpecialDiceImageLocation_3b34Interface {
        end port outPort : SpecialDiceImageRequestFuncOut;
        end port inPort : SpecialDiceImageRequestFuncIn;
        flow of SpecialDiceImageRequest from outPort.specialDiceImageRequest to inPort.specialDiceImageRequest;
    }

    interface def StoreEnergyInTheBatteries_baf4ToHousekeeping_b6bdInterface {
        end port outPort : EnergyLevelFuncOut;
        end port inPort : EnergyLevelFuncIn;
        flow of EnergyLevel from outPort.energyLevel to inPort.energyLevel;
    }

    interface def BatteryChargeLevel_37e0ToPlaceSatelliteInSAFEMode_5654Interface {
        end port outPort : EnergyLevelBelowMarginFuncOut;
        end port inPort : EnergyLevelBelowMarginFuncIn;
        flow of EnergyLevelBelowMargin from outPort.energyLevelBelowMargin to inPort.energyLevelBelowMargin;
    }

    interface def BatteryChargeLevel_37e0ToPlaceKeepSatelliteInNOMINALMode_d510Interface {
        end port outPort : EnergyLevelAboveMarginFuncOut;
        end port inPort : EnergyLevelAboveMarginFuncIn;
        flow of EnergyLevelAboveMargin from outPort.energyLevelAboveMargin to inPort.energyLevelAboveMargin;
    }

    interface def DetermineSpinRate_f542ToHousekeeping_b6bdInterface {
        end port outPort : SpinRateFuncOut;
        end port inPort : SpinRateFuncIn;
        flow of SpinRate from outPort.spinRate to inPort.spinRate;
    }

    interface def SpinRate_eec7ToPlaceSatelliteInSAFEMode_5654Interface {
        end port outPort : SpinRateAboveCriticalLevelFuncOut;
        end port inPort : SpinRateAboveCriticalLevelFuncIn;
        flow of SpinRateAboveCriticalLevel from outPort.spinRateAboveCriticalLevel to inPort.spinRateAboveCriticalLevel;
    }

    interface def SpinRate_eec7ToControlSpinRate_abeeInterface {
        end port outPort : SpinRateBetweenOperationalMarginAndCriticalLevelFuncOut;
        end port inPort : SpinRateBetweenOperationalMarginAndCriticalLevelFuncIn;
        flow of SpinRateBetweenOperationalMarginAndCriticalLevel from outPort.spinRateBetweenOperationalMarginAndCriticalLevel to inPort.spinRateBetweenOperationalMarginAndCriticalLevel;
    }

    interface def SpinRate_eec7ToPlaceKeepSatelliteInNOMINALMode_d510Interface {
        end port outPort : SpinRateBelowOperationalMarginFuncOut;
        end port inPort : SpinRateBelowOperationalMarginFuncIn;
        flow of SpinRateBelowOperationalMargin from outPort.spinRateBelowOperationalMargin to inPort.spinRateBelowOperationalMargin;
    }

    interface def DetermineAttitude_2f97ToChangeAttitudeToDesiredAttitude_cc1bInterface {
        end port outPort : AttitudeInformationFuncOut;
        end port inPort : AttitudeInformationFuncIn;
        flow of AttitudeInformation from outPort.attitudeInformation to inPort.attitudeInformation;
    }

    interface def RequestSpecialDiceImageLocation_3b34ToDetermineAttitude_2f97Interface {
        end port outPort : CommandADCSToRepositionTheSatelliteFuncOut;
        end port inPort : CommandADCSToRepositionTheSatelliteFuncIn;
        flow of CommandADCSToRepositionTheSatellite from outPort.commandADCSToRepositionTheSatellite to inPort.commandADCSToRepositionTheSatellite;
    }

    interface def ChangeAttitudeToDesiredAttitude_cc1bToCommandPMToOperateTheDicePayload_b4e5Interface {
        end port outPort : RelayThatTheSatelliteIsInDesiredAttitudeFuncOut;
        end port inPort : RelayThatTheSatelliteIsInDesiredAttitudeFuncIn;
        flow of RelayThatTheSatelliteIsInDesiredAttitude from outPort.relayThatTheSatelliteIsInDesiredAttitude to inPort.relayThatTheSatelliteIsInDesiredAttitude;
    }

    interface def DetermineTemperatures_504eToHousekeeping_b6bdInterface {
        end port outPort : TemperatureLevelFuncOut;
        end port inPort : TemperatureLevelFuncIn;
        flow of TemperatureLevel from outPort.temperatureLevel to inPort.temperatureLevel;
    }

    interface def Temperature_235dToPlaceSatelliteInSAFEMode_5654Interface {
        end port outPort : TemperatureIsAtACriticalLevelFuncOut;
        end port inPort : TemperatureIsAtACriticalLevelFuncIn;
        flow of TemperatureIsAtACriticalLevel from outPort.temperatureIsAtACriticalLevel to inPort.temperatureIsAtACriticalLevel;
    }

    interface def Temperature_235dToPlaceKeepSatelliteInNOMINALMode_d510Interface {
        end port outPort : TemperatureWithinOperationalMarginFuncOut;
        end port inPort : TemperatureWithinOperationalMarginFuncIn;
        flow of TemperatureWithinOperationalMargin from outPort.temperatureWithinOperationalMargin to inPort.temperatureWithinOperationalMargin;
    }

    interface def Temperature_235dToTurnOffRequiredSubsystem_829fInterface {
        end port outPort : TemperatureBetweenOperationalMarginAndCriticalLevelFuncOut;
        end port inPort : TemperatureBetweenOperationalMarginAndCriticalLevelFuncIn;
        flow of TemperatureBetweenOperationalMarginAndCriticalLevel from outPort.temperatureBetweenOperationalMarginAndCriticalLevel to inPort.temperatureBetweenOperationalMarginAndCriticalLevel;
    }

    interface def Housekeeping_b6bdToBatteryChargeLevel_37e0Interface {
        end port outPort : EnergyLevelFuncOut;
        end port inPort : EnergyLevelFuncIn;
        flow of EnergyLevel from outPort.energyLevel to inPort.energyLevel;
    }

    interface def Housekeeping_b6bdToSpinRate_eec7Interface {
        end port outPort : SpinRateFuncOut;
        end port inPort : SpinRateFuncIn;
        flow of SpinRate from outPort.spinRate to inPort.spinRate;
    }

    interface def Housekeeping_b6bdToTemperature_235dInterface {
        end port outPort : TemperatureLevelFuncOut;
        end port inPort : TemperatureLevelFuncIn;
        flow of TemperatureLevel from outPort.temperatureLevel to inPort.temperatureLevel;
    }

    interface def Housekeeping_b6bdToCombineAllGeneratedData_5334Interface {
        end port outPort : HousekeepingDataFuncOut;
        end port inPort : HousekeepingDataFuncIn;
        flow of HousekeepingData from outPort.housekeepingData to inPort.housekeepingData;
    }

    interface def CombineAllGeneratedData_5334ToTransmitMissionStatus_857fInterface {
        end port outPort : CommandAntennaToDownlinkAllGeneratedDataFuncOut;
        end port inPort : CommandAntennaToDownlinkAllGeneratedDataFuncIn;
        flow of CommandAntennaToDownlinkAllGeneratedData from outPort.commandAntennaToDownlinkAllGeneratedData to inPort.commandAntennaToDownlinkAllGeneratedData;
    }

    interface def CombineAllGeneratedData_5334ToTransmitEducationalData_d69bInterface {
        end port outPort : RelayEducationalDataFuncOut;
        end port inPort : RelayEducationalDataFuncIn;
        flow of RelayEducationalData from outPort.relayEducationalData to inPort.relayEducationalData;
    }

    action prepareEducationalSpaceExperiment83c0 : PrepareEducationalSpaceExperiment_83c0;
    action transmitEducationalSpaceExperimentPlanningEb64 : TransmitEducationalSpaceExperimentPlanning_eb64;
    flow of RelayEducationalSpaceExperimentPlanning from prepareEducationalSpaceExperiment83c0.outPublishexperimentresults_55b4.relayEducationalSpaceExperimentPlanning to transmitEducationalSpaceExperimentPlanningEb64.FIP1_3258.relayEducationalSpaceExperimentPlanning;

    action provideExperimentResultToSchools58a8 : ProvideExperimentResultToSchools_58a8;
    action prepareSpaceLesson368d : PrepareSpaceLesson_368d;
    flow of AccessExperimentResults from provideExperimentResultToSchools58a8.outAccessexperimentresults_ed57.accessExperimentResults to prepareSpaceLesson368d.inAccessexperimentresults_0b41.accessExperimentResults;

    action participateInLesson686a : ParticipateInLesson_686a;
    flow of TeachLessonUsingExperiment from prepareSpaceLesson368d.outTeachlessonusingexperiment_a7db.teachLessonUsingExperiment to participateInLesson686a.inTeachlessonusingexperiment_36fc.teachLessonUsingExperiment;

    action becomeInspiredBySpaceMission7b65 : BecomeInspiredBySpaceMission_7b65;
    flow of ObserveSpaceExperimentResults from participateInLesson686a.outObservespaceexperimentresults_4ed3.observeSpaceExperimentResults to becomeInspiredBySpaceMission7b65.inObservespaceexperimentresults_4796.observeSpaceExperimentResults;

    action prepareSpaceRadiationExperiment7ffb : PrepareSpaceRadiationExperiment_7ffb;
    action transmitImageData78b4 : TransmitImageData_78b4;
    flow of RelayImageForSpaceRadiationExperiment from prepareSpaceRadiationExperiment7ffb.outPublishspaceradiationexperimentresults_eee1.relayImageForSpaceRadiationExperiment to transmitImageData78b4.FIP1_f993.relayImageForSpaceRadiationExperiment;

    action provideSpaceRadiationExperimentResultsToSchools8138 : ProvideSpaceRadiationExperimentResultsToSchools_8138;
    action prepareSpaceRadiationLessonC0f4 : PrepareSpaceRadiationLesson_c0f4;
    flow of AccessSpaceRadiationExperimentResults from provideSpaceRadiationExperimentResultsToSchools8138.outAccessspaceradiationexperimentresults_ab8e.accessSpaceRadiationExperimentResults to prepareSpaceRadiationLessonC0f4.inAccessspaceradiationexperimentresults_9971.accessSpaceRadiationExperimentResults;

    action participateInLesson3e27 : ParticipateInLesson_3e27;
    flow of TeachSpaceRadiationLesson from prepareSpaceRadiationLessonC0f4.outTeachspaceradiationlesson_c831.teachSpaceRadiationLesson to participateInLesson3e27.inTeachspaceradiationlesson_330f.teachSpaceRadiationLesson;

    action learnAboutTheEffectOfSpaceRadiationAndMitigationTechniquesWithProgramming96b4 : LearnAboutTheEffectOfSpaceRadiationAndMitigationTechniquesWithProgramming_96b4;
    flow of AnalyseTheEffectOfSpaceRadiation from participateInLesson3e27.outAnalysetheeffectofspaceradiation_1315.analyseTheEffectOfSpaceRadiation to learnAboutTheEffectOfSpaceRadiationAndMitigationTechniquesWithProgramming96b4.inAnalysetheeffectofspaceradiation_6923.analyseTheEffectOfSpaceRadiation;

    action planAndScheduleDataCollection22bb : PlanAndScheduleDataCollection_22bb;
    action transmitCommandForDataCollection47bc : TransmitCommandForDataCollection_47bc;
    flow of RelayDataCollectionScheduleWithGroundStation from planAndScheduleDataCollection22bb.outSharedatacollectionschedule_89e9.relayDataCollectionScheduleWithGroundStation to transmitCommandForDataCollection47bc.FIP1_afbd.relayDataCollectionScheduleWithGroundStation;

    action planMissionOperations3b3a : PlanMissionOperations_3b3a;
    action transmitMissionOperationsD957 : TransmitMissionOperations_d957;
    flow of RelayMissionOperationsWithGroundStation from planMissionOperations3b3a.outCommunicatemissionoperationplan_34b4.relayMissionOperationsWithGroundStation to transmitMissionOperationsD957.FIP1_c90a.relayMissionOperationsWithGroundStation;

    action receiveMissionOperations3937 : ReceiveMissionOperations_3937;
    flow of UplinkMissionOperations from transmitMissionOperationsD957.FOP1_4363.uplinkMissionOperations to receiveMissionOperations3937.FIP1_1fa4.uplinkMissionOperations;

    action receiveMissionStatus1718 : ReceiveMissionStatus_1718;
    action monitorMissionStatusD739 : MonitorMissionStatus_d739;
    flow of RelayMissionOperationalStatusWithDVSTeam from receiveMissionStatus1718.FOP1_ac6c.relayMissionOperationalStatusWithDVSTeam to monitorMissionStatusD739.inProvidemissiontelemetry_562f.relayMissionOperationalStatusWithDVSTeam;

    action receiveDataCollectionCommandD32a : ReceiveDataCollectionCommand_d32a;
    flow of UplinkDataCollectionCommand from transmitCommandForDataCollection47bc.FOP1_1974.uplinkDataCollectionCommand to receiveDataCollectionCommandD32a.FIP1_c421.uplinkDataCollectionCommand;

    action recieveEducationalDataD30c : RecieveEducationalData_d30c;
    action separateEducationalModulesDataC249 : SeparateEducationalModulesData_c249;
    flow of RelayEducationalDataWithDVSTeam from recieveEducationalDataD30c.FOP1_cb6b.relayEducationalDataWithDVSTeam to separateEducationalModulesDataC249.FIP1_0807.relayEducationalDataWithDVSTeam;

    action hostEducationalDataFc85 : HostEducationalData_fc85;
    flow of UploadTheDataOfTheEducationalModules from separateEducationalModulesDataC249.FOP1_0eef.uploadTheDataOfTheEducationalModules to hostEducationalDataFc85.inPublishmissiondata_1de5.uploadTheDataOfTheEducationalModules;

    action selectImage7b1b : SelectImage_7b1b;
    action checkImage3804 : CheckImage_3804;
    flow of GiveImageToTheTeacher from selectImage7b1b.FOP1_0efb.giveImageToTheTeacher to checkImage3804.FIP1_fb07.giveImageToTheTeacher;

    action storeImagesF9a5 : StoreImages_f9a5;
    flow of UploadImageToTheWebsite from checkImage3804.FOP1_deed.uploadImageToTheWebsite to storeImagesF9a5.FIP1_94a7.uploadImageToTheWebsite;

    flow of SelectTheLatestImage from storeImagesF9a5.FOP1_5d06.selectTheLatestImage to prepareSpaceRadiationExperiment7ffb.FIP1_b215.selectTheLatestImage;

    action receiveImageData1eba : ReceiveImageData_1eba;
    flow of UplinkImageData from transmitImageData78b4.FOP1_04b2.uplinkImageData to receiveImageData1eba.FIP1_daf1.uplinkImageData;

    action receiveSpaceRadiationExperimentResultsAe11 : ReceiveSpaceRadiationExperimentResults_ae11;
    action checkTheSpaceRadiationExperimentResults459a : CheckTheSpaceRadiationExperimentResults_459a;
    flow of RelaySpaceRadiationExperimentResults from receiveSpaceRadiationExperimentResultsAe11.FOP1_18e7.relaySpaceRadiationExperimentResults to checkTheSpaceRadiationExperimentResults459a.FIP1_a9b7.relaySpaceRadiationExperimentResults;

    flow of UploadSpaceRadiationResultsToTheWebsite from checkTheSpaceRadiationExperimentResults459a.FOP1_97da.uploadSpaceRadiationResultsToTheWebsite to provideSpaceRadiationExperimentResultsToSchools8138.inPublishspaceradiationexperimentresults_d2e2.uploadSpaceRadiationResultsToTheWebsite;

    action receiveEducationalSpaceExperimentPlanning81e9 : ReceiveEducationalSpaceExperimentPlanning_81e9;
    flow of UplinkEducationalSpaceExperimentPlanning from transmitEducationalSpaceExperimentPlanningEb64.FOP1_8d19.uplinkEducationalSpaceExperimentPlanning to receiveEducationalSpaceExperimentPlanning81e9.FIP1_41fb.uplinkEducationalSpaceExperimentPlanning;

    action receiveEducationalSpaceExperimentResults1b82 : ReceiveEducationalSpaceExperimentResults_1b82;
    action checkEducationalSpaceExperimentResults35a2 : CheckEducationalSpaceExperimentResults_35a2;
    flow of RelayEducationalSpaceExperimentResults from receiveEducationalSpaceExperimentResults1b82.FOP1_18b2.relayEducationalSpaceExperimentResults to checkEducationalSpaceExperimentResults35a2.FIP1_5389.relayEducationalSpaceExperimentResults;

    flow of UploadEducationalSpaceExperimentResults from checkEducationalSpaceExperimentResults35a2.FOP1_6617.uploadEducationalSpaceExperimentResults to provideExperimentResultToSchools58a8.inPublishexperimentresults_ccdd.uploadEducationalSpaceExperimentResults;

    action performEducationalSpaceExperimentFb50 : PerformEducationalSpaceExperiment_fb50;
    flow of GiveCommandToPerformEducationalSpaceExperiment from receiveEducationalSpaceExperimentPlanning81e9.FOP1_4441.giveCommandToPerformEducationalSpaceExperiment to performEducationalSpaceExperimentFb50.FIP1_be1a.giveCommandToPerformEducationalSpaceExperiment;

    action commandPMToOperateTheDicePayloadB4e5 : CommandPMToOperateTheDicePayload_b4e5;
    flow of RelayDicePlanningToOBC from receiveEducationalSpaceExperimentPlanning81e9.FOP2_7f0e.relayDicePlanningToOBC to commandPMToOperateTheDicePayloadB4e5.FIP1_10fa.relayDicePlanningToOBC;

    action commandAllSubsystemsToPerformTheirOperations6fa8 : CommandAllSubsystemsToPerformTheirOperations_6fa8;
    flow of RelayMissionOperationsToOBC from receiveMissionOperations3937.FOP2_bd69.relayMissionOperationsToOBC to commandAllSubsystemsToPerformTheirOperations6fa8.FIP1_e746.relayMissionOperationsToOBC;

    action doTheSpaceRadiationExperiment752c : DoTheSpaceRadiationExperiment_752c;
    flow of MoveImageDataToCorrectLocation from receiveImageData1eba.FOP1_9e0d.moveImageDataToCorrectLocation to doTheSpaceRadiationExperiment752c.FIP1_50d6.moveImageDataToCorrectLocation;

    action shareImageDataWithPMEbaa : ShareImageDataWithPM_ebaa;
    flow of RelayBitflipImageDataToOBC from receiveImageData1eba.FOP2_36a3.relayBitflipImageDataToOBC to shareImageDataWithPMEbaa.FIP1_add4.relayBitflipImageDataToOBC;

    action transmitSpaceRadiationExperimentResultsFdbc : TransmitSpaceRadiationExperimentResults_fdbc;
    flow of GiveCommandForDataCollection from receiveDataCollectionCommandD32a.FOP1_a486.giveCommandForDataCollection to transmitSpaceRadiationExperimentResultsFdbc.FIP2_5bf4.giveCommandForDataCollection;

    action transmitEducationalSpaceExperimentResults2a0b : TransmitEducationalSpaceExperimentResults_2a0b;
    flow of GiveCommandForDataCollection from receiveDataCollectionCommandD32a.FOP2_5d5b.giveCommandForDataCollection to transmitEducationalSpaceExperimentResults2a0b.FIP2_b54e.giveCommandForDataCollection;

    flow of RelayCommandForDataCollection from receiveDataCollectionCommandD32a.FOP3_d1bf.relayCommandForDataCollection to commandAllSubsystemsToPerformTheirOperations6fa8.FIP2_9eac.relayCommandForDataCollection;

    flow of MoveResultsOfTheEducationalSpaceExperimentToTheCorrectLocation from performEducationalSpaceExperimentFb50.FOP1_482a.moveResultsOfTheEducationalSpaceExperimentToTheCorrectLocation to transmitEducationalSpaceExperimentResults2a0b.FIP1_bb7f.moveResultsOfTheEducationalSpaceExperimentToTheCorrectLocation;

    flow of MoveSpaceRadiationExperimentResultsToCorrectLocation from doTheSpaceRadiationExperiment752c.FOP1_034b.moveSpaceRadiationExperimentResultsToCorrectLocation to transmitSpaceRadiationExperimentResultsFdbc.FIP1_35fc.moveSpaceRadiationExperimentResultsToCorrectLocation;

    flow of DownlinkSpaceRadiationExperimentResults from transmitSpaceRadiationExperimentResultsFdbc.FOP1_0783.downlinkSpaceRadiationExperimentResults to receiveSpaceRadiationExperimentResultsAe11.FIP1_948d.downlinkSpaceRadiationExperimentResults;

    flow of DownlinkEducationalData from transmitSpaceRadiationExperimentResultsFdbc.FOP2_4373.downlinkEducationalData to recieveEducationalDataD30c.FIP1_83f6.downlinkEducationalData;

    action transmitMissionStatus857f : TransmitMissionStatus_857f;
    flow of DownlinkMissionStatus from transmitMissionStatus857f.FOP1_bdb4.downlinkMissionStatus to receiveMissionStatus1718.FIP1_24b3.downlinkMissionStatus;

    flow of DownlinkEducationalSpaceExperimentResults from transmitEducationalSpaceExperimentResults2a0b.FOP1_79b7.downlinkEducationalSpaceExperimentResults to receiveEducationalSpaceExperimentResults1b82.FIP1_a075.downlinkEducationalSpaceExperimentResults;

    flow of DownlinkEducationalData from transmitEducationalSpaceExperimentResults2a0b.FOP2_4a86.downlinkEducationalData to recieveEducationalDataD30c.FIP2_6e09.downlinkEducationalData;

    action transmitEducationalDataD69b : TransmitEducationalData_d69b;
    flow of DownlinkEducationalData from transmitEducationalDataD69b.FOP1_70e5.downlinkEducationalData to recieveEducationalDataD30c.FIP3_d2ac.downlinkEducationalData;

    action startTheDiceSequenceD389 : StartTheDiceSequence_d389;
    flow of GiveCommandToStartDiceToPM from commandPMToOperateTheDicePayloadB4e5.FOP1_1a9f.giveCommandToStartDiceToPM to startTheDiceSequenceD389.FIP1_f2a3.giveCommandToStartDiceToPM;

    action clampDice8f2d : ClampDice_8f2d;
    flow of RelayCommandToTheDicePayload from startTheDiceSequenceD389.FOP1_c765.relayCommandToTheDicePayload to clampDice8f2d.FIP1_ba24.relayCommandToTheDicePayload;

    action turnOnLEDs5e6d : TurnOnLEDs_5e6d;
    flow of DiceAreClamped from clampDice8f2d.FOP1_d6b7.diceAreClamped to turnOnLEDs5e6d.FIP1_77b9.diceAreClamped;

    action takeImage378c : TakeImage_378c;
    flow of LEDsAreTurnedOn from turnOnLEDs5e6d.FOP1_4ccd.leDsAreTurnedOn to takeImage378c.FIP1_54a8.leDsAreTurnedOn;

    action turnOffLEDs7c06 : TurnOffLEDs_7c06;
    flow of ImageIsTaken from takeImage378c.FOP1_c112.imageIsTaken to turnOffLEDs7c06.FIP1_6733.imageIsTaken;

    action unclampDiceA4a8 : UnclampDice_a4a8;
    flow of LEDsAreTurnedOff from turnOffLEDs7c06.FOP1_b26d.leDsAreTurnedOff to unclampDiceA4a8.FIP1_d1a4.leDsAreTurnedOff;

    action storeDiceImageResultsBb51 : StoreDiceImageResults_bb51;
    flow of DiceAreUnclamped from unclampDiceA4a8.FOP1_fb97.diceAreUnclamped to storeDiceImageResultsBb51.FIP1_d691.diceAreUnclamped;

    action retrieveDiceImageResults332d : RetrieveDiceImageResults_332d;
    flow of ShareDiceImageResults from storeDiceImageResultsBb51.FOP1_848b.shareDiceImageResults to retrieveDiceImageResults332d.FIP1_a61b.shareDiceImageResults;

    flow of CommandAntennaToDownlinkDiceImageResults from retrieveDiceImageResults332d.FOP1_18ab.commandAntennaToDownlinkDiceImageResults to transmitEducationalSpaceExperimentResults2a0b.FIP3_2128.commandAntennaToDownlinkDiceImageResults;

    action combineAllGeneratedData5334 : CombineAllGeneratedData_5334;
    flow of DiceData from retrieveDiceImageResults332d.FOP2_ac1f.diceData to combineAllGeneratedData5334.FIP1_03db.diceData;

    action storeImageDataInitialStateOnPMAc59 : StoreImageDataInitialStateOnPM_ac59;
    flow of RelayBitflipImageDataToPM from shareImageDataWithPMEbaa.FOP1_be87.relayBitflipImageDataToPM to storeImageDataInitialStateOnPMAc59.FIP1_16f1.relayBitflipImageDataToPM;

    action storeTheInitialStateDataOnTheUnprotectedMemoryBoards96de : StoreTheInitialStateDataOnTheUnprotectedMemoryBoards_96de;
    flow of ShareTheInitialImageData from storeImageDataInitialStateOnPMAc59.FOP1_59de.shareTheInitialImageData to storeTheInitialStateDataOnTheUnprotectedMemoryBoards96de.FIP1_b440.shareTheInitialImageData;

    action bitflipsOccurAc1a : BitflipsOccur_ac1a;
    flow of TimePasses from storeTheInitialStateDataOnTheUnprotectedMemoryBoards96de.FOP1_21f3.timePasses to bitflipsOccurAc1a.FIP1_31de.timePasses;

    action checkForAmountOfBitflips7d87 : CheckForAmountOfBitflips_7d87;
    action numberOfBitflips92e9 : NumberOfBitflips_92e9;
    flow of NumberOfBitflips from checkForAmountOfBitflips7d87.FOP1_212e.numberOfBitflips to numberOfBitflips92e9.FIP1_e3e4.numberOfBitflips;

    flow of NotEnoughBitflipsHaveOccured from numberOfBitflips92e9.FOP1_bf60.notEnoughBitflipsHaveOccured to bitflipsOccurAc1a.FIP2_3a81.notEnoughBitflipsHaveOccured;

    action determineTheLocationsOfTheBitflips18b2 : DetermineTheLocationsOfTheBitflips_18b2;
    flow of EnoughBitflipsHaveOccured from numberOfBitflips92e9.FOP2_c072.enoughBitflipsHaveOccured to determineTheLocationsOfTheBitflips18b2.FIP1_13b5.enoughBitflipsHaveOccured;

    action retrieveBitflipLocations4248 : RetrieveBitflipLocations_4248;
    flow of ShareBitflipLocations from determineTheLocationsOfTheBitflips18b2.FOP1_1f6b.shareBitflipLocations to retrieveBitflipLocations4248.FIP1_19f4.shareBitflipLocations;

    flow of NumberOfBitflips from bitflipsOccurAc1a.FOP1_3b5c.numberOfBitflips to checkForAmountOfBitflips7d87.FIP1_a292.numberOfBitflips;

    flow of CommandAntennaToDownlinkSpaceRadiationExperimentResults from retrieveBitflipLocations4248.FOP1_7c96.commandAntennaToDownlinkSpaceRadiationExperimentResults to transmitSpaceRadiationExperimentResultsFdbc.FIP3_ba9c.commandAntennaToDownlinkSpaceRadiationExperimentResults;

    flow of BitflipData from retrieveBitflipLocations4248.FOP2_344e.bitflipData to combineAllGeneratedData5334.FIP3_ee05.bitflipData;

    flow of RelayScheduleForTheDicePayload from commandAllSubsystemsToPerformTheirOperations6fa8.FOP1_4cce.relayScheduleForTheDicePayload to commandPMToOperateTheDicePayloadB4e5.FIP2_a98d.relayScheduleForTheDicePayload;

    flow of RelayScheduleForTheBitflipPayload from commandAllSubsystemsToPerformTheirOperations6fa8.FOP2_e319.relayScheduleForTheBitflipPayload to shareImageDataWithPMEbaa.FIP2_5f18.relayScheduleForTheBitflipPayload;

    action storeEnergyInTheBatteriesBaf4 : StoreEnergyInTheBatteries_baf4;
    flow of CheckEnergyLevels from commandAllSubsystemsToPerformTheirOperations6fa8.FOP3_8316.checkEnergyLevels to storeEnergyInTheBatteriesBaf4.FIP1_e1d3.checkEnergyLevels;

    action determineSpinRateF542 : DetermineSpinRate_f542;
    flow of CheckSpinRate from commandAllSubsystemsToPerformTheirOperations6fa8.FOP4_5759.checkSpinRate to determineSpinRateF542.FIP1_a1aa.checkSpinRate;

    action determineTemperatures504e : DetermineTemperatures_504e;
    flow of CheckTemperatures from commandAllSubsystemsToPerformTheirOperations6fa8.FOP5_edce.checkTemperatures to determineTemperatures504e.FIP1_88f8.checkTemperatures;

    action requestSpecialDiceImageLocation3b34 : RequestSpecialDiceImageLocation_3b34;
    flow of SpecialDiceImageRequest from commandAllSubsystemsToPerformTheirOperations6fa8.FOP6_f152.specialDiceImageRequest to requestSpecialDiceImageLocation3b34.FIP1_1781.specialDiceImageRequest;

    action housekeepingB6bd : Housekeeping_b6bd;
    flow of EnergyLevel from storeEnergyInTheBatteriesBaf4.FOP1_6adf.energyLevel to housekeepingB6bd.FIP1_0b3b.energyLevel;

    action batteryChargeLevel37e0 : BatteryChargeLevel_37e0;
    action placeSatelliteInSAFEMode5654 : PlaceSatelliteInSAFEMode_5654;
    flow of EnergyLevelBelowMargin from batteryChargeLevel37e0.FOP1_8adc.energyLevelBelowMargin to placeSatelliteInSAFEMode5654.FIP1_5313.energyLevelBelowMargin;

    action placeKeepSatelliteInNOMINALModeD510 : PlaceKeepSatelliteInNOMINALMode_d510;
    flow of EnergyLevelAboveMargin from batteryChargeLevel37e0.FOP2_1bef.energyLevelAboveMargin to placeKeepSatelliteInNOMINALModeD510.FIP1_ba40.energyLevelAboveMargin;

    flow of SpinRate from determineSpinRateF542.FOP1_381b.spinRate to housekeepingB6bd.FIP1_06ff.spinRate;

    action spinRateEec7 : SpinRate_eec7;
    flow of SpinRateAboveCriticalLevel from spinRateEec7.FOP1_d33f.spinRateAboveCriticalLevel to placeSatelliteInSAFEMode5654.FIP2_d8a5.spinRateAboveCriticalLevel;

    action controlSpinRateAbee : ControlSpinRate_abee;
    flow of SpinRateBetweenOperationalMarginAndCriticalLevel from spinRateEec7.FOP2_8547.spinRateBetweenOperationalMarginAndCriticalLevel to controlSpinRateAbee.FIP1_aa0f.spinRateBetweenOperationalMarginAndCriticalLevel;

    flow of SpinRateBelowOperationalMargin from spinRateEec7.FOP3_be70.spinRateBelowOperationalMargin to placeKeepSatelliteInNOMINALModeD510.FIP2_b07a.spinRateBelowOperationalMargin;

    action determineAttitude2f97 : DetermineAttitude_2f97;
    action changeAttitudeToDesiredAttitudeCc1b : ChangeAttitudeToDesiredAttitude_cc1b;
    flow of AttitudeInformation from determineAttitude2f97.FOP1_bad0.attitudeInformation to changeAttitudeToDesiredAttitudeCc1b.FIP1_d5bc.attitudeInformation;

    flow of CommandADCSToRepositionTheSatellite from requestSpecialDiceImageLocation3b34.FOP1_9abf.commandADCSToRepositionTheSatellite to determineAttitude2f97.FIP1_5399.commandADCSToRepositionTheSatellite;

    flow of RelayThatTheSatelliteIsInDesiredAttitude from changeAttitudeToDesiredAttitudeCc1b.FOP1_1b7b.relayThatTheSatelliteIsInDesiredAttitude to commandPMToOperateTheDicePayloadB4e5.FIP3_04f5.relayThatTheSatelliteIsInDesiredAttitude;

    flow of TemperatureLevel from determineTemperatures504e.FOP1_f535.temperatureLevel to housekeepingB6bd.FIP1_f8c8.temperatureLevel;

    action temperature235d : Temperature_235d;
    flow of TemperatureIsAtACriticalLevel from temperature235d.FOP1_8409.temperatureIsAtACriticalLevel to placeSatelliteInSAFEMode5654.FIP3_a07a.temperatureIsAtACriticalLevel;

    flow of TemperatureWithinOperationalMargin from temperature235d.FOP2_992c.temperatureWithinOperationalMargin to placeKeepSatelliteInNOMINALModeD510.FIP3_9040.temperatureWithinOperationalMargin;

    action turnOffRequiredSubsystem829f : TurnOffRequiredSubsystem_829f;
    flow of TemperatureBetweenOperationalMarginAndCriticalLevel from temperature235d.FOP3_d872.temperatureBetweenOperationalMarginAndCriticalLevel to turnOffRequiredSubsystem829f.FIP1_9d88.temperatureBetweenOperationalMarginAndCriticalLevel;

    flow of EnergyLevel from housekeepingB6bd.FOP1_0cc9.energyLevel to batteryChargeLevel37e0.FIP1_71af.energyLevel;

    flow of SpinRate from housekeepingB6bd.FOP2_3dc1.spinRate to spinRateEec7.FIP1_b691.spinRate;

    flow of TemperatureLevel from housekeepingB6bd.FOP3_e306.temperatureLevel to temperature235d.FIP1_8cfb.temperatureLevel;

    flow of HousekeepingData from housekeepingB6bd.FOP4_c168.housekeepingData to combineAllGeneratedData5334.FIP2_70c7.housekeepingData;

    flow of CommandAntennaToDownlinkAllGeneratedData from combineAllGeneratedData5334.FOP1_b29a.commandAntennaToDownlinkAllGeneratedData to transmitMissionStatus857f.FIP2_df09.commandAntennaToDownlinkAllGeneratedData;

    flow of RelayEducationalData from combineAllGeneratedData5334.FOP2_26cb.relayEducationalData to transmitEducationalDataD69b.FIP1_1ec8.relayEducationalData;

    connection def PrepareEducationalSpaceExperiment_83c0ToTransmitEducationalSpaceExperimentPlanning_eb64Connection {
        doc
        /* ID: c0242900-dffb-4690-9fc8-c6dda430cb9c */
        end action relayEducationalSpaceExperimentPlanningOut : PrepareEducationalSpaceExperiment_83c0;
        end action relayEducationalSpaceExperimentPlanningIn : TransmitEducationalSpaceExperimentPlanning_eb64;
        interface : PrepareEducationalSpaceExperiment_83c0ToTransmitEducationalSpaceExperimentPlanning_eb64Interface connect relayEducationalSpaceExperimentPlanningIn.FIP1_3258 to relayEducationalSpaceExperimentPlanningOut.outPublishexperimentresults_55b4;
    }

    connection def ProvideExperimentResultToSchools_58a8ToPrepareSpaceLesson_368dConnection {
        doc
        /* ID: dfb44547-58f7-4dc2-9d65-01f9f207f0b2 */
        end action accessExperimentResultsOut : ProvideExperimentResultToSchools_58a8;
        end action accessExperimentResultsIn : PrepareSpaceLesson_368d;
        interface : ProvideExperimentResultToSchools_58a8ToPrepareSpaceLesson_368dInterface connect accessExperimentResultsIn.inAccessexperimentresults_0b41 to accessExperimentResultsOut.outAccessexperimentresults_ed57;
    }

    connection def PrepareSpaceLesson_368dToParticipateInLesson_686aConnection {
        doc
        /* ID: e0fc86bb-d1a4-48e0-b5d4-6c3e80fd8cab */
        end action teachLessonUsingExperimentOut : PrepareSpaceLesson_368d;
        end action teachLessonUsingExperimentIn : ParticipateInLesson_686a;
        interface : PrepareSpaceLesson_368dToParticipateInLesson_686aInterface connect teachLessonUsingExperimentIn.inTeachlessonusingexperiment_36fc to teachLessonUsingExperimentOut.outTeachlessonusingexperiment_a7db;
    }

    connection def ParticipateInLesson_686aToBecomeInspiredBySpaceMission_7b65Connection {
        doc
        /* ID: 579c4bd4-4c93-425d-9447-8f31bffbaa43 */
        end action observeSpaceExperimentResultsOut : ParticipateInLesson_686a;
        end action observeSpaceExperimentResultsIn : BecomeInspiredBySpaceMission_7b65;
        interface : ParticipateInLesson_686aToBecomeInspiredBySpaceMission_7b65Interface connect observeSpaceExperimentResultsIn.inObservespaceexperimentresults_4796 to observeSpaceExperimentResultsOut.outObservespaceexperimentresults_4ed3;
    }

    connection def PrepareSpaceRadiationExperiment_7ffbToTransmitImageData_78b4Connection {
        doc
        /* ID: 3a71fece-df36-465e-ad42-f51d80c9a83b */
        end action relayImageForSpaceRadiationExperimentOut : PrepareSpaceRadiationExperiment_7ffb;
        end action relayImageForSpaceRadiationExperimentIn : TransmitImageData_78b4;
        interface : PrepareSpaceRadiationExperiment_7ffbToTransmitImageData_78b4Interface connect relayImageForSpaceRadiationExperimentIn.FIP1_f993 to relayImageForSpaceRadiationExperimentOut.outPublishspaceradiationexperimentresults_eee1;
    }

    connection def ProvideSpaceRadiationExperimentResultsToSchools_8138ToPrepareSpaceRadiationLesson_c0f4Connection {
        doc
        /* ID: c8486300-81b7-43c7-bb83-863ae6adfe29 */
        end action accessSpaceRadiationExperimentResultsOut : ProvideSpaceRadiationExperimentResultsToSchools_8138;
        end action accessSpaceRadiationExperimentResultsIn : PrepareSpaceRadiationLesson_c0f4;
        interface : ProvideSpaceRadiationExperimentResultsToSchools_8138ToPrepareSpaceRadiationLesson_c0f4Interface connect accessSpaceRadiationExperimentResultsIn.inAccessspaceradiationexperimentresults_9971 to accessSpaceRadiationExperimentResultsOut.outAccessspaceradiationexperimentresults_ab8e;
    }

    connection def PrepareSpaceRadiationLesson_c0f4ToParticipateInLesson_3e27Connection {
        doc
        /* ID: 9e778685-fd50-4f3b-b0a7-1c7d7916e313 */
        end action teachSpaceRadiationLessonOut : PrepareSpaceRadiationLesson_c0f4;
        end action teachSpaceRadiationLessonIn : ParticipateInLesson_3e27;
        interface : PrepareSpaceRadiationLesson_c0f4ToParticipateInLesson_3e27Interface connect teachSpaceRadiationLessonIn.inTeachspaceradiationlesson_330f to teachSpaceRadiationLessonOut.outTeachspaceradiationlesson_c831;
    }

    connection def ParticipateInLesson_3e27ToLearnAboutTheEffectOfSpaceRadiationAndMitigationTechniquesWithProgramming_96b4Connection {
        doc
        /* ID: 685493ba-f694-42c4-b19a-d972453c900e */
        end action analyseTheEffectOfSpaceRadiationOut : ParticipateInLesson_3e27;
        end action analyseTheEffectOfSpaceRadiationIn : LearnAboutTheEffectOfSpaceRadiationAndMitigationTechniquesWithProgramming_96b4;
        interface : ParticipateInLesson_3e27ToLearnAboutTheEffectOfSpaceRadiationAndMitigationTechniquesWithProgramming_96b4Interface connect analyseTheEffectOfSpaceRadiationIn.inAnalysetheeffectofspaceradiation_6923 to analyseTheEffectOfSpaceRadiationOut.outAnalysetheeffectofspaceradiation_1315;
    }

    connection def PlanAndScheduleDataCollection_22bbToTransmitCommandForDataCollection_47bcConnection {
        doc
        /* ID: b78825bb-d722-42ff-8fa2-6a7a065b7cdf */
        end action relayDataCollectionScheduleWithGroundStationOut : PlanAndScheduleDataCollection_22bb;
        end action relayDataCollectionScheduleWithGroundStationIn : TransmitCommandForDataCollection_47bc;
        interface : PlanAndScheduleDataCollection_22bbToTransmitCommandForDataCollection_47bcInterface connect relayDataCollectionScheduleWithGroundStationIn.FIP1_afbd to relayDataCollectionScheduleWithGroundStationOut.outSharedatacollectionschedule_89e9;
    }

    connection def PlanMissionOperations_3b3aToTransmitMissionOperations_d957Connection {
        doc
        /* ID: 0c55bced-a5e2-4702-ae2b-0fc04a67216a */
        end action relayMissionOperationsWithGroundStationOut : PlanMissionOperations_3b3a;
        end action relayMissionOperationsWithGroundStationIn : TransmitMissionOperations_d957;
        interface : PlanMissionOperations_3b3aToTransmitMissionOperations_d957Interface connect relayMissionOperationsWithGroundStationIn.FIP1_c90a to relayMissionOperationsWithGroundStationOut.outCommunicatemissionoperationplan_34b4;
    }

    connection def TransmitMissionOperations_d957ToReceiveMissionOperations_3937Connection {
        doc
        /* ID: 01d5b94d-5de3-408f-bd3d-7ac418e357c5 */
        end action uplinkMissionOperationsOut : TransmitMissionOperations_d957;
        end action uplinkMissionOperationsIn : ReceiveMissionOperations_3937;
        interface : TransmitMissionOperations_d957ToReceiveMissionOperations_3937Interface connect uplinkMissionOperationsIn.FIP1_1fa4 to uplinkMissionOperationsOut.FOP1_4363;
    }

    connection def ReceiveMissionStatus_1718ToMonitorMissionStatus_d739Connection {
        doc
        /* ID: 06415cdc-b5f3-4993-ae0f-715655218d34 */
        end action relayMissionOperationalStatusWithDVSTeamOut : ReceiveMissionStatus_1718;
        end action relayMissionOperationalStatusWithDVSTeamIn : MonitorMissionStatus_d739;
        interface : ReceiveMissionStatus_1718ToMonitorMissionStatus_d739Interface connect relayMissionOperationalStatusWithDVSTeamIn.inProvidemissiontelemetry_562f to relayMissionOperationalStatusWithDVSTeamOut.FOP1_ac6c;
    }

    connection def TransmitCommandForDataCollection_47bcToReceiveDataCollectionCommand_d32aConnection {
        doc
        /* ID: 21f0e3c0-96f9-4bac-942c-588945c70586 */
        end action uplinkDataCollectionCommandOut : TransmitCommandForDataCollection_47bc;
        end action uplinkDataCollectionCommandIn : ReceiveDataCollectionCommand_d32a;
        interface : TransmitCommandForDataCollection_47bcToReceiveDataCollectionCommand_d32aInterface connect uplinkDataCollectionCommandIn.FIP1_c421 to uplinkDataCollectionCommandOut.FOP1_1974;
    }

    connection def RecieveEducationalData_d30cToSeparateEducationalModulesData_c249Connection {
        doc
        /* ID: 46613fbd-de81-4137-9a92-75d2ad7131e5 */
        end action relayEducationalDataWithDVSTeamOut : RecieveEducationalData_d30c;
        end action relayEducationalDataWithDVSTeamIn : SeparateEducationalModulesData_c249;
        interface : RecieveEducationalData_d30cToSeparateEducationalModulesData_c249Interface connect relayEducationalDataWithDVSTeamIn.FIP1_0807 to relayEducationalDataWithDVSTeamOut.FOP1_cb6b;
    }

    connection def SeparateEducationalModulesData_c249ToHostEducationalData_fc85Connection {
        doc
        /* ID: 1654e70b-4cca-4652-8ec7-97b67729b838 */
        end action uploadTheDataOfTheEducationalModulesOut : SeparateEducationalModulesData_c249;
        end action uploadTheDataOfTheEducationalModulesIn : HostEducationalData_fc85;
        interface : SeparateEducationalModulesData_c249ToHostEducationalData_fc85Interface connect uploadTheDataOfTheEducationalModulesIn.inPublishmissiondata_1de5 to uploadTheDataOfTheEducationalModulesOut.FOP1_0eef;
    }

    connection def SelectImage_7b1bToCheckImage_3804Connection {
        doc
        /* ID: 75c4de4c-ef8d-461e-a0be-48f9f752bf29 */
        end action giveImageToTheTeacherOut : SelectImage_7b1b;
        end action giveImageToTheTeacherIn : CheckImage_3804;
        interface : SelectImage_7b1bToCheckImage_3804Interface connect giveImageToTheTeacherIn.FIP1_fb07 to giveImageToTheTeacherOut.FOP1_0efb;
    }

    connection def CheckImage_3804ToStoreImages_f9a5Connection {
        doc
        /* ID: 7b62fac1-1875-4676-b10a-70bba4ffd0d1 */
        end action uploadImageToTheWebsiteOut : CheckImage_3804;
        end action uploadImageToTheWebsiteIn : StoreImages_f9a5;
        interface : CheckImage_3804ToStoreImages_f9a5Interface connect uploadImageToTheWebsiteIn.FIP1_94a7 to uploadImageToTheWebsiteOut.FOP1_deed;
    }

    connection def StoreImages_f9a5ToPrepareSpaceRadiationExperiment_7ffbConnection {
        doc
        /* ID: 4e08a00f-9951-4dd8-b931-b438a81f084a */
        end action selectTheLatestImageOut : StoreImages_f9a5;
        end action selectTheLatestImageIn : PrepareSpaceRadiationExperiment_7ffb;
        interface : StoreImages_f9a5ToPrepareSpaceRadiationExperiment_7ffbInterface connect selectTheLatestImageIn.FIP1_b215 to selectTheLatestImageOut.FOP1_5d06;
    }

    connection def TransmitImageData_78b4ToReceiveImageData_1ebaConnection {
        doc
        /* ID: 7951de38-a6fe-4aca-8369-a6971121ae31 */
        end action uplinkImageDataOut : TransmitImageData_78b4;
        end action uplinkImageDataIn : ReceiveImageData_1eba;
        interface : TransmitImageData_78b4ToReceiveImageData_1ebaInterface connect uplinkImageDataIn.FIP1_daf1 to uplinkImageDataOut.FOP1_04b2;
    }

    connection def ReceiveSpaceRadiationExperimentResults_ae11ToCheckTheSpaceRadiationExperimentResults_459aConnection {
        doc
        /* ID: d9af8525-7873-4e9a-9cf4-76899f45dd25 */
        end action relaySpaceRadiationExperimentResultsOut : ReceiveSpaceRadiationExperimentResults_ae11;
        end action relaySpaceRadiationExperimentResultsIn : CheckTheSpaceRadiationExperimentResults_459a;
        interface : ReceiveSpaceRadiationExperimentResults_ae11ToCheckTheSpaceRadiationExperimentResults_459aInterface connect relaySpaceRadiationExperimentResultsIn.FIP1_a9b7 to relaySpaceRadiationExperimentResultsOut.FOP1_18e7;
    }

    connection def CheckTheSpaceRadiationExperimentResults_459aToProvideSpaceRadiationExperimentResultsToSchools_8138Connection {
        doc
        /* ID: b665b142-43e3-4af1-8fde-c35aacf8c290 */
        end action uploadSpaceRadiationResultsToTheWebsiteOut : CheckTheSpaceRadiationExperimentResults_459a;
        end action uploadSpaceRadiationResultsToTheWebsiteIn : ProvideSpaceRadiationExperimentResultsToSchools_8138;
        interface : CheckTheSpaceRadiationExperimentResults_459aToProvideSpaceRadiationExperimentResultsToSchools_8138Interface connect uploadSpaceRadiationResultsToTheWebsiteIn.inPublishspaceradiationexperimentresults_d2e2 to uploadSpaceRadiationResultsToTheWebsiteOut.FOP1_97da;
    }

    connection def TransmitEducationalSpaceExperimentPlanning_eb64ToReceiveEducationalSpaceExperimentPlanning_81e9Connection {
        doc
        /* ID: 3f914662-8406-41f7-baa9-3a73db942063 */
        end action uplinkEducationalSpaceExperimentPlanningOut : TransmitEducationalSpaceExperimentPlanning_eb64;
        end action uplinkEducationalSpaceExperimentPlanningIn : ReceiveEducationalSpaceExperimentPlanning_81e9;
        interface : TransmitEducationalSpaceExperimentPlanning_eb64ToReceiveEducationalSpaceExperimentPlanning_81e9Interface connect uplinkEducationalSpaceExperimentPlanningIn.FIP1_41fb to uplinkEducationalSpaceExperimentPlanningOut.FOP1_8d19;
    }

    connection def ReceiveEducationalSpaceExperimentResults_1b82ToCheckEducationalSpaceExperimentResults_35a2Connection {
        doc
        /* ID: bdcf78f8-7f97-4255-be39-81ece5dffd11 */
        end action relayEducationalSpaceExperimentResultsOut : ReceiveEducationalSpaceExperimentResults_1b82;
        end action relayEducationalSpaceExperimentResultsIn : CheckEducationalSpaceExperimentResults_35a2;
        interface : ReceiveEducationalSpaceExperimentResults_1b82ToCheckEducationalSpaceExperimentResults_35a2Interface connect relayEducationalSpaceExperimentResultsIn.FIP1_5389 to relayEducationalSpaceExperimentResultsOut.FOP1_18b2;
    }

    connection def CheckEducationalSpaceExperimentResults_35a2ToProvideExperimentResultToSchools_58a8Connection {
        doc
        /* ID: 7eb1d7f1-6931-44f4-a036-72d87fa9bedb */
        end action uploadEducationalSpaceExperimentResultsOut : CheckEducationalSpaceExperimentResults_35a2;
        end action uploadEducationalSpaceExperimentResultsIn : ProvideExperimentResultToSchools_58a8;
        interface : CheckEducationalSpaceExperimentResults_35a2ToProvideExperimentResultToSchools_58a8Interface connect uploadEducationalSpaceExperimentResultsIn.inPublishexperimentresults_ccdd to uploadEducationalSpaceExperimentResultsOut.FOP1_6617;
    }

    connection def ReceiveEducationalSpaceExperimentPlanning_81e9ToPerformEducationalSpaceExperiment_fb50Connection {
        doc
        /* ID: 6041ea5d-dd39-4852-92b8-6aab97b6c1c3 */
        end action giveCommandToPerformEducationalSpaceExperimentOut : ReceiveEducationalSpaceExperimentPlanning_81e9;
        end action giveCommandToPerformEducationalSpaceExperimentIn : PerformEducationalSpaceExperiment_fb50;
        interface : ReceiveEducationalSpaceExperimentPlanning_81e9ToPerformEducationalSpaceExperiment_fb50Interface connect giveCommandToPerformEducationalSpaceExperimentIn.FIP1_be1a to giveCommandToPerformEducationalSpaceExperimentOut.FOP1_4441;
    }

    connection def ReceiveEducationalSpaceExperimentPlanning_81e9ToCommandPMToOperateTheDicePayload_b4e5Connection {
        doc
        /* ID: 58a1caac-d292-4fb3-afe7-ba75241bb309 */
        end action relayDicePlanningToOBCOut : ReceiveEducationalSpaceExperimentPlanning_81e9;
        end action relayDicePlanningToOBCIn : CommandPMToOperateTheDicePayload_b4e5;
        interface : ReceiveEducationalSpaceExperimentPlanning_81e9ToCommandPMToOperateTheDicePayload_b4e5Interface connect relayDicePlanningToOBCIn.FIP1_10fa to relayDicePlanningToOBCOut.FOP2_7f0e;
    }

    connection def ReceiveMissionOperations_3937ToCommandAllSubsystemsToPerformTheirOperations_6fa8Connection {
        doc
        /* ID: a1a1fe88-d235-4b7d-b4b4-99f76e06086d */
        end action relayMissionOperationsToOBCOut : ReceiveMissionOperations_3937;
        end action relayMissionOperationsToOBCIn : CommandAllSubsystemsToPerformTheirOperations_6fa8;
        interface : ReceiveMissionOperations_3937ToCommandAllSubsystemsToPerformTheirOperations_6fa8Interface connect relayMissionOperationsToOBCIn.FIP1_e746 to relayMissionOperationsToOBCOut.FOP2_bd69;
    }

    connection def ReceiveImageData_1ebaToDoTheSpaceRadiationExperiment_752cConnection {
        doc
        /* ID: 18d89755-2536-45f6-96b5-f5716133660a */
        end action moveImageDataToCorrectLocationOut : ReceiveImageData_1eba;
        end action moveImageDataToCorrectLocationIn : DoTheSpaceRadiationExperiment_752c;
        interface : ReceiveImageData_1ebaToDoTheSpaceRadiationExperiment_752cInterface connect moveImageDataToCorrectLocationIn.FIP1_50d6 to moveImageDataToCorrectLocationOut.FOP1_9e0d;
    }

    connection def ReceiveImageData_1ebaToShareImageDataWithPM_ebaaConnection {
        doc
        /* ID: 96b31011-f3da-4cd4-a533-b108d0865e8d */
        end action relayBitflipImageDataToOBCOut : ReceiveImageData_1eba;
        end action relayBitflipImageDataToOBCIn : ShareImageDataWithPM_ebaa;
        interface : ReceiveImageData_1ebaToShareImageDataWithPM_ebaaInterface connect relayBitflipImageDataToOBCIn.FIP1_add4 to relayBitflipImageDataToOBCOut.FOP2_36a3;
    }

    connection def ReceiveDataCollectionCommand_d32aToTransmitSpaceRadiationExperimentResults_fdbcConnection {
        doc
        /* ID: 995394c8-21a6-4bcc-a576-65166292ce51 */
        end action giveCommandForDataCollectionOut : ReceiveDataCollectionCommand_d32a;
        end action giveCommandForDataCollectionIn : TransmitSpaceRadiationExperimentResults_fdbc;
        interface : ReceiveDataCollectionCommand_d32aToTransmitSpaceRadiationExperimentResults_fdbcInterface connect giveCommandForDataCollectionIn.FIP2_5bf4 to giveCommandForDataCollectionOut.FOP1_a486;
    }

    connection def ReceiveDataCollectionCommand_d32aToTransmitEducationalSpaceExperimentResults_2a0bConnection {
        doc
        /* ID: f4c42a17-f73f-46bc-b4b6-28dae0d3eb0d */
        end action giveCommandForDataCollectionOut : ReceiveDataCollectionCommand_d32a;
        end action giveCommandForDataCollectionIn : TransmitEducationalSpaceExperimentResults_2a0b;
        interface : ReceiveDataCollectionCommand_d32aToTransmitEducationalSpaceExperimentResults_2a0bInterface connect giveCommandForDataCollectionIn.FIP2_b54e to giveCommandForDataCollectionOut.FOP2_5d5b;
    }

    connection def ReceiveDataCollectionCommand_d32aToCommandAllSubsystemsToPerformTheirOperations_6fa8Connection {
        doc
        /* ID: e981d2e0-df6d-4bb6-85bb-8fc95ac31dba */
        end action relayCommandForDataCollectionOut : ReceiveDataCollectionCommand_d32a;
        end action relayCommandForDataCollectionIn : CommandAllSubsystemsToPerformTheirOperations_6fa8;
        interface : ReceiveDataCollectionCommand_d32aToCommandAllSubsystemsToPerformTheirOperations_6fa8Interface connect relayCommandForDataCollectionIn.FIP2_9eac to relayCommandForDataCollectionOut.FOP3_d1bf;
    }

    connection def PerformEducationalSpaceExperiment_fb50ToTransmitEducationalSpaceExperimentResults_2a0bConnection {
        doc
        /* ID: ce91e96c-19bc-4170-8076-ae6b3f1a22f3 */
        end action moveResultsOfTheEducationalSpaceExperimentToTheCorrectLocationOut : PerformEducationalSpaceExperiment_fb50;
        end action moveResultsOfTheEducationalSpaceExperimentToTheCorrectLocationIn : TransmitEducationalSpaceExperimentResults_2a0b;
        interface : PerformEducationalSpaceExperiment_fb50ToTransmitEducationalSpaceExperimentResults_2a0bInterface connect moveResultsOfTheEducationalSpaceExperimentToTheCorrectLocationIn.FIP1_bb7f to moveResultsOfTheEducationalSpaceExperimentToTheCorrectLocationOut.FOP1_482a;
    }

    connection def DoTheSpaceRadiationExperiment_752cToTransmitSpaceRadiationExperimentResults_fdbcConnection {
        doc
        /* ID: 14d60886-3892-4271-95cf-d1a67a41321e */
        end action moveSpaceRadiationExperimentResultsToCorrectLocationOut : DoTheSpaceRadiationExperiment_752c;
        end action moveSpaceRadiationExperimentResultsToCorrectLocationIn : TransmitSpaceRadiationExperimentResults_fdbc;
        interface : DoTheSpaceRadiationExperiment_752cToTransmitSpaceRadiationExperimentResults_fdbcInterface connect moveSpaceRadiationExperimentResultsToCorrectLocationIn.FIP1_35fc to moveSpaceRadiationExperimentResultsToCorrectLocationOut.FOP1_034b;
    }

    connection def TransmitSpaceRadiationExperimentResults_fdbcToReceiveSpaceRadiationExperimentResults_ae11Connection {
        doc
        /* ID: fbfc07a6-f5f5-40ce-9564-c684733a368d */
        end action downlinkSpaceRadiationExperimentResultsOut : TransmitSpaceRadiationExperimentResults_fdbc;
        end action downlinkSpaceRadiationExperimentResultsIn : ReceiveSpaceRadiationExperimentResults_ae11;
        interface : TransmitSpaceRadiationExperimentResults_fdbcToReceiveSpaceRadiationExperimentResults_ae11Interface connect downlinkSpaceRadiationExperimentResultsIn.FIP1_948d to downlinkSpaceRadiationExperimentResultsOut.FOP1_0783;
    }

    connection def TransmitSpaceRadiationExperimentResults_fdbcToRecieveEducationalData_d30cConnection {
        doc
        /* ID: 89977dce-ba9b-46a6-a207-5182312156ce */
        end action downlinkEducationalDataOut : TransmitSpaceRadiationExperimentResults_fdbc;
        end action downlinkEducationalDataIn : RecieveEducationalData_d30c;
        interface : TransmitSpaceRadiationExperimentResults_fdbcToRecieveEducationalData_d30cInterface connect downlinkEducationalDataIn.FIP1_83f6 to downlinkEducationalDataOut.FOP2_4373;
    }

    connection def TransmitMissionStatus_857fToReceiveMissionStatus_1718Connection {
        doc
        /* ID: bc312760-2a85-430e-8dc3-f0eb8e7d971d */
        end action downlinkMissionStatusOut : TransmitMissionStatus_857f;
        end action downlinkMissionStatusIn : ReceiveMissionStatus_1718;
        interface : TransmitMissionStatus_857fToReceiveMissionStatus_1718Interface connect downlinkMissionStatusIn.FIP1_24b3 to downlinkMissionStatusOut.FOP1_bdb4;
    }

    connection def TransmitEducationalSpaceExperimentResults_2a0bToReceiveEducationalSpaceExperimentResults_1b82Connection {
        doc
        /* ID: d6959ab3-2b4e-400c-8fd5-3dea78d9a89c */
        end action downlinkEducationalSpaceExperimentResultsOut : TransmitEducationalSpaceExperimentResults_2a0b;
        end action downlinkEducationalSpaceExperimentResultsIn : ReceiveEducationalSpaceExperimentResults_1b82;
        interface : TransmitEducationalSpaceExperimentResults_2a0bToReceiveEducationalSpaceExperimentResults_1b82Interface connect downlinkEducationalSpaceExperimentResultsIn.FIP1_a075 to downlinkEducationalSpaceExperimentResultsOut.FOP1_79b7;
    }

    connection def TransmitEducationalSpaceExperimentResults_2a0bToRecieveEducationalData_d30cConnection {
        doc
        /* ID: 38e2a651-dffa-4634-90df-aadb3ae5d4ec */
        end action downlinkEducationalDataOut : TransmitEducationalSpaceExperimentResults_2a0b;
        end action downlinkEducationalDataIn : RecieveEducationalData_d30c;
        interface : TransmitEducationalSpaceExperimentResults_2a0bToRecieveEducationalData_d30cInterface connect downlinkEducationalDataIn.FIP2_6e09 to downlinkEducationalDataOut.FOP2_4a86;
    }

    connection def TransmitEducationalData_d69bToRecieveEducationalData_d30cConnection {
        doc
        /* ID: e205ce20-15ce-4e52-9918-40173b1f4fa5 */
        end action downlinkEducationalDataOut : TransmitEducationalData_d69b;
        end action downlinkEducationalDataIn : RecieveEducationalData_d30c;
        interface : TransmitEducationalData_d69bToRecieveEducationalData_d30cInterface connect downlinkEducationalDataIn.FIP3_d2ac to downlinkEducationalDataOut.FOP1_70e5;
    }

    connection def CommandPMToOperateTheDicePayload_b4e5ToStartTheDiceSequence_d389Connection {
        doc
        /* ID: 3c1f7ce1-0c61-4348-ba4a-9c9abc49b992 */
        end action giveCommandToStartDiceToPMOut : CommandPMToOperateTheDicePayload_b4e5;
        end action giveCommandToStartDiceToPMIn : StartTheDiceSequence_d389;
        interface : CommandPMToOperateTheDicePayload_b4e5ToStartTheDiceSequence_d389Interface connect giveCommandToStartDiceToPMIn.FIP1_f2a3 to giveCommandToStartDiceToPMOut.FOP1_1a9f;
    }

    connection def StartTheDiceSequence_d389ToClampDice_8f2dConnection {
        doc
        /* ID: 954e51a6-2335-408a-a90a-b67241669f14 */
        end action relayCommandToTheDicePayloadOut : StartTheDiceSequence_d389;
        end action relayCommandToTheDicePayloadIn : ClampDice_8f2d;
        interface : StartTheDiceSequence_d389ToClampDice_8f2dInterface connect relayCommandToTheDicePayloadIn.FIP1_ba24 to relayCommandToTheDicePayloadOut.FOP1_c765;
    }

    connection def ClampDice_8f2dToTurnOnLEDs_5e6dConnection {
        doc
        /* ID: 2f0bbda5-1312-49e2-a043-fa1b4b7669c0 */
        end action diceAreClampedOut : ClampDice_8f2d;
        end action diceAreClampedIn : TurnOnLEDs_5e6d;
        interface : ClampDice_8f2dToTurnOnLEDs_5e6dInterface connect diceAreClampedIn.FIP1_77b9 to diceAreClampedOut.FOP1_d6b7;
    }

    connection def TurnOnLEDs_5e6dToTakeImage_378cConnection {
        doc
        /* ID: 7b42c70c-6dff-4000-af44-7c2252337458 */
        end action leDsAreTurnedOnOut : TurnOnLEDs_5e6d;
        end action leDsAreTurnedOnIn : TakeImage_378c;
        interface : TurnOnLEDs_5e6dToTakeImage_378cInterface connect leDsAreTurnedOnIn.FIP1_54a8 to leDsAreTurnedOnOut.FOP1_4ccd;
    }

    connection def TakeImage_378cToTurnOffLEDs_7c06Connection {
        doc
        /* ID: 805932b2-4e92-4efc-abab-fa513cc237b2 */
        end action imageIsTakenOut : TakeImage_378c;
        end action imageIsTakenIn : TurnOffLEDs_7c06;
        interface : TakeImage_378cToTurnOffLEDs_7c06Interface connect imageIsTakenIn.FIP1_6733 to imageIsTakenOut.FOP1_c112;
    }

    connection def TurnOffLEDs_7c06ToUnclampDice_a4a8Connection {
        doc
        /* ID: e4df3efe-0497-4052-8b9e-933539d4417b */
        end action leDsAreTurnedOffOut : TurnOffLEDs_7c06;
        end action leDsAreTurnedOffIn : UnclampDice_a4a8;
        interface : TurnOffLEDs_7c06ToUnclampDice_a4a8Interface connect leDsAreTurnedOffIn.FIP1_d1a4 to leDsAreTurnedOffOut.FOP1_b26d;
    }

    connection def UnclampDice_a4a8ToStoreDiceImageResults_bb51Connection {
        doc
        /* ID: dd123c0a-64f0-4427-bc88-a345bbc6cb0a */
        end action diceAreUnclampedOut : UnclampDice_a4a8;
        end action diceAreUnclampedIn : StoreDiceImageResults_bb51;
        interface : UnclampDice_a4a8ToStoreDiceImageResults_bb51Interface connect diceAreUnclampedIn.FIP1_d691 to diceAreUnclampedOut.FOP1_fb97;
    }

    connection def StoreDiceImageResults_bb51ToRetrieveDiceImageResults_332dConnection {
        doc
        /* ID: 65764d5e-b0ba-4a98-8fc2-00875aef269b */
        end action shareDiceImageResultsOut : StoreDiceImageResults_bb51;
        end action shareDiceImageResultsIn : RetrieveDiceImageResults_332d;
        interface : StoreDiceImageResults_bb51ToRetrieveDiceImageResults_332dInterface connect shareDiceImageResultsIn.FIP1_a61b to shareDiceImageResultsOut.FOP1_848b;
    }

    connection def RetrieveDiceImageResults_332dToTransmitEducationalSpaceExperimentResults_2a0bConnection {
        doc
        /* ID: e90eeffd-8aa4-4f12-a12c-47aa03b13ff3 */
        end action commandAntennaToDownlinkDiceImageResultsOut : RetrieveDiceImageResults_332d;
        end action commandAntennaToDownlinkDiceImageResultsIn : TransmitEducationalSpaceExperimentResults_2a0b;
        interface : RetrieveDiceImageResults_332dToTransmitEducationalSpaceExperimentResults_2a0bInterface connect commandAntennaToDownlinkDiceImageResultsIn.FIP3_2128 to commandAntennaToDownlinkDiceImageResultsOut.FOP1_18ab;
    }

    connection def RetrieveDiceImageResults_332dToCombineAllGeneratedData_5334Connection {
        doc
        /* ID: f19560ab-f40d-4acd-a1e3-1c03c95395b6 */
        end action diceDataOut : RetrieveDiceImageResults_332d;
        end action diceDataIn : CombineAllGeneratedData_5334;
        interface : RetrieveDiceImageResults_332dToCombineAllGeneratedData_5334Interface connect diceDataIn.FIP1_03db to diceDataOut.FOP2_ac1f;
    }

    connection def ShareImageDataWithPM_ebaaToStoreImageDataInitialStateOnPM_ac59Connection {
        doc
        /* ID: ba5a7db2-6ac3-44c3-a3e6-52459a628456 */
        end action relayBitflipImageDataToPMOut : ShareImageDataWithPM_ebaa;
        end action relayBitflipImageDataToPMIn : StoreImageDataInitialStateOnPM_ac59;
        interface : ShareImageDataWithPM_ebaaToStoreImageDataInitialStateOnPM_ac59Interface connect relayBitflipImageDataToPMIn.FIP1_16f1 to relayBitflipImageDataToPMOut.FOP1_be87;
    }

    connection def StoreImageDataInitialStateOnPM_ac59ToStoreTheInitialStateDataOnTheUnprotectedMemoryBoards_96deConnection {
        doc
        /* ID: fe426bd7-2458-4ca2-a200-d4584353d25d */
        end action shareTheInitialImageDataOut : StoreImageDataInitialStateOnPM_ac59;
        end action shareTheInitialImageDataIn : StoreTheInitialStateDataOnTheUnprotectedMemoryBoards_96de;
        interface : StoreImageDataInitialStateOnPM_ac59ToStoreTheInitialStateDataOnTheUnprotectedMemoryBoards_96deInterface connect shareTheInitialImageDataIn.FIP1_b440 to shareTheInitialImageDataOut.FOP1_59de;
    }

    connection def StoreTheInitialStateDataOnTheUnprotectedMemoryBoards_96deToBitflipsOccur_ac1aConnection {
        doc
        /* ID: d6ef2c44-b055-4a8f-9bae-477bce95a53f */
        end action timePassesOut : StoreTheInitialStateDataOnTheUnprotectedMemoryBoards_96de;
        end action timePassesIn : BitflipsOccur_ac1a;
        interface : StoreTheInitialStateDataOnTheUnprotectedMemoryBoards_96deToBitflipsOccur_ac1aInterface connect timePassesIn.FIP1_31de to timePassesOut.FOP1_21f3;
    }

    connection def CheckForAmountOfBitflips_7d87ToNumberOfBitflips_92e9Connection {
        doc
        /* ID: 8111345d-ccf3-4867-901a-7a57a603b830 */
        end action numberOfBitflipsOut : CheckForAmountOfBitflips_7d87;
        end action numberOfBitflipsIn : NumberOfBitflips_92e9;
        interface : CheckForAmountOfBitflips_7d87ToNumberOfBitflips_92e9Interface connect numberOfBitflipsIn.FIP1_e3e4 to numberOfBitflipsOut.FOP1_212e;
    }

    connection def NumberOfBitflips_92e9ToBitflipsOccur_ac1aConnection {
        doc
        /* ID: 87857051-b129-497b-9098-e0720ea8e348 */
        end action notEnoughBitflipsHaveOccuredOut : NumberOfBitflips_92e9;
        end action notEnoughBitflipsHaveOccuredIn : BitflipsOccur_ac1a;
        interface : NumberOfBitflips_92e9ToBitflipsOccur_ac1aInterface connect notEnoughBitflipsHaveOccuredIn.FIP2_3a81 to notEnoughBitflipsHaveOccuredOut.FOP1_bf60;
    }

    connection def NumberOfBitflips_92e9ToDetermineTheLocationsOfTheBitflips_18b2Connection {
        doc
        /* ID: bd1dfff9-6be9-48d6-a793-5d2e4060c3a0 */
        end action enoughBitflipsHaveOccuredOut : NumberOfBitflips_92e9;
        end action enoughBitflipsHaveOccuredIn : DetermineTheLocationsOfTheBitflips_18b2;
        interface : NumberOfBitflips_92e9ToDetermineTheLocationsOfTheBitflips_18b2Interface connect enoughBitflipsHaveOccuredIn.FIP1_13b5 to enoughBitflipsHaveOccuredOut.FOP2_c072;
    }

    connection def DetermineTheLocationsOfTheBitflips_18b2ToRetrieveBitflipLocations_4248Connection {
        doc
        /* ID: 4d40ddcf-c1d2-4c02-8794-68d8365164d8 */
        end action shareBitflipLocationsOut : DetermineTheLocationsOfTheBitflips_18b2;
        end action shareBitflipLocationsIn : RetrieveBitflipLocations_4248;
        interface : DetermineTheLocationsOfTheBitflips_18b2ToRetrieveBitflipLocations_4248Interface connect shareBitflipLocationsIn.FIP1_19f4 to shareBitflipLocationsOut.FOP1_1f6b;
    }

    connection def BitflipsOccur_ac1aToCheckForAmountOfBitflips_7d87Connection {
        doc
        /* ID: 685fcc49-2bb8-4c47-811d-a1640eb3b8b4 */
        end action numberOfBitflipsOut : BitflipsOccur_ac1a;
        end action numberOfBitflipsIn : CheckForAmountOfBitflips_7d87;
        interface : BitflipsOccur_ac1aToCheckForAmountOfBitflips_7d87Interface connect numberOfBitflipsIn.FIP1_a292 to numberOfBitflipsOut.FOP1_3b5c;
    }

    connection def RetrieveBitflipLocations_4248ToTransmitSpaceRadiationExperimentResults_fdbcConnection {
        doc
        /* ID: 98822aed-51fb-40ed-a21d-3913cb562e7b */
        end action commandAntennaToDownlinkSpaceRadiationExperimentResultsOut : RetrieveBitflipLocations_4248;
        end action commandAntennaToDownlinkSpaceRadiationExperimentResultsIn : TransmitSpaceRadiationExperimentResults_fdbc;
        interface : RetrieveBitflipLocations_4248ToTransmitSpaceRadiationExperimentResults_fdbcInterface connect commandAntennaToDownlinkSpaceRadiationExperimentResultsIn.FIP3_ba9c to commandAntennaToDownlinkSpaceRadiationExperimentResultsOut.FOP1_7c96;
    }

    connection def RetrieveBitflipLocations_4248ToCombineAllGeneratedData_5334Connection {
        doc
        /* ID: 6d95def2-2976-4641-bb02-5f9bf362e66f */
        end action bitflipDataOut : RetrieveBitflipLocations_4248;
        end action bitflipDataIn : CombineAllGeneratedData_5334;
        interface : RetrieveBitflipLocations_4248ToCombineAllGeneratedData_5334Interface connect bitflipDataIn.FIP3_ee05 to bitflipDataOut.FOP2_344e;
    }

    connection def CommandAllSubsystemsToPerformTheirOperations_6fa8ToCommandPMToOperateTheDicePayload_b4e5Connection {
        doc
        /* ID: b11d9f7e-afbc-47f7-9e7b-8604d7fdaf1e */
        end action relayScheduleForTheDicePayloadOut : CommandAllSubsystemsToPerformTheirOperations_6fa8;
        end action relayScheduleForTheDicePayloadIn : CommandPMToOperateTheDicePayload_b4e5;
        interface : CommandAllSubsystemsToPerformTheirOperations_6fa8ToCommandPMToOperateTheDicePayload_b4e5Interface connect relayScheduleForTheDicePayloadIn.FIP2_a98d to relayScheduleForTheDicePayloadOut.FOP1_4cce;
    }

    connection def CommandAllSubsystemsToPerformTheirOperations_6fa8ToShareImageDataWithPM_ebaaConnection {
        doc
        /* ID: 5b4a3299-9d66-46dd-b7f1-3d13cf5f5d6a */
        end action relayScheduleForTheBitflipPayloadOut : CommandAllSubsystemsToPerformTheirOperations_6fa8;
        end action relayScheduleForTheBitflipPayloadIn : ShareImageDataWithPM_ebaa;
        interface : CommandAllSubsystemsToPerformTheirOperations_6fa8ToShareImageDataWithPM_ebaaInterface connect relayScheduleForTheBitflipPayloadIn.FIP2_5f18 to relayScheduleForTheBitflipPayloadOut.FOP2_e319;
    }

    connection def CommandAllSubsystemsToPerformTheirOperations_6fa8ToStoreEnergyInTheBatteries_baf4Connection {
        doc
        /* ID: da070108-0a92-4c69-b0a7-8e1f43b590c3 */
        end action checkEnergyLevelsOut : CommandAllSubsystemsToPerformTheirOperations_6fa8;
        end action checkEnergyLevelsIn : StoreEnergyInTheBatteries_baf4;
        interface : CommandAllSubsystemsToPerformTheirOperations_6fa8ToStoreEnergyInTheBatteries_baf4Interface connect checkEnergyLevelsIn.FIP1_e1d3 to checkEnergyLevelsOut.FOP3_8316;
    }

    connection def CommandAllSubsystemsToPerformTheirOperations_6fa8ToDetermineSpinRate_f542Connection {
        doc
        /* ID: 0a087fcc-a5ee-480c-adbc-a81bf78a3988 */
        end action checkSpinRateOut : CommandAllSubsystemsToPerformTheirOperations_6fa8;
        end action checkSpinRateIn : DetermineSpinRate_f542;
        interface : CommandAllSubsystemsToPerformTheirOperations_6fa8ToDetermineSpinRate_f542Interface connect checkSpinRateIn.FIP1_a1aa to checkSpinRateOut.FOP4_5759;
    }

    connection def CommandAllSubsystemsToPerformTheirOperations_6fa8ToDetermineTemperatures_504eConnection {
        doc
        /* ID: 5007671a-8dd3-4d87-9a76-548b019c9457 */
        end action checkTemperaturesOut : CommandAllSubsystemsToPerformTheirOperations_6fa8;
        end action checkTemperaturesIn : DetermineTemperatures_504e;
        interface : CommandAllSubsystemsToPerformTheirOperations_6fa8ToDetermineTemperatures_504eInterface connect checkTemperaturesIn.FIP1_88f8 to checkTemperaturesOut.FOP5_edce;
    }

    connection def CommandAllSubsystemsToPerformTheirOperations_6fa8ToRequestSpecialDiceImageLocation_3b34Connection {
        doc
        /* ID: b1c6fe29-3691-4fc5-8051-58aa1694d956 */
        end action specialDiceImageRequestOut : CommandAllSubsystemsToPerformTheirOperations_6fa8;
        end action specialDiceImageRequestIn : RequestSpecialDiceImageLocation_3b34;
        interface : CommandAllSubsystemsToPerformTheirOperations_6fa8ToRequestSpecialDiceImageLocation_3b34Interface connect specialDiceImageRequestIn.FIP1_1781 to specialDiceImageRequestOut.FOP6_f152;
    }

    connection def StoreEnergyInTheBatteries_baf4ToHousekeeping_b6bdConnection {
        doc
        /* ID: 036db02e-b06c-4483-b185-f79cae6143a7 */
        end action energyLevelOut : StoreEnergyInTheBatteries_baf4;
        end action energyLevelIn : Housekeeping_b6bd;
        interface : StoreEnergyInTheBatteries_baf4ToHousekeeping_b6bdInterface connect energyLevelIn.FIP1_0b3b to energyLevelOut.FOP1_6adf;
    }

    connection def BatteryChargeLevel_37e0ToPlaceSatelliteInSAFEMode_5654Connection {
        doc
        /* ID: 0457953b-5ea9-4ae9-b4ec-abfa77856f2e */
        end action energyLevelBelowMarginOut : BatteryChargeLevel_37e0;
        end action energyLevelBelowMarginIn : PlaceSatelliteInSAFEMode_5654;
        interface : BatteryChargeLevel_37e0ToPlaceSatelliteInSAFEMode_5654Interface connect energyLevelBelowMarginIn.FIP1_5313 to energyLevelBelowMarginOut.FOP1_8adc;
    }

    connection def BatteryChargeLevel_37e0ToPlaceKeepSatelliteInNOMINALMode_d510Connection {
        doc
        /* ID: 8227b958-a5ce-4649-b35b-5ac649fd2617 */
        end action energyLevelAboveMarginOut : BatteryChargeLevel_37e0;
        end action energyLevelAboveMarginIn : PlaceKeepSatelliteInNOMINALMode_d510;
        interface : BatteryChargeLevel_37e0ToPlaceKeepSatelliteInNOMINALMode_d510Interface connect energyLevelAboveMarginIn.FIP1_ba40 to energyLevelAboveMarginOut.FOP2_1bef;
    }

    connection def DetermineSpinRate_f542ToHousekeeping_b6bdConnection {
        doc
        /* ID: ec854682-a535-498e-abdc-8b575109b919 */
        end action spinRateOut : DetermineSpinRate_f542;
        end action spinRateIn : Housekeeping_b6bd;
        interface : DetermineSpinRate_f542ToHousekeeping_b6bdInterface connect spinRateIn.FIP1_06ff to spinRateOut.FOP1_381b;
    }

    connection def SpinRate_eec7ToPlaceSatelliteInSAFEMode_5654Connection {
        doc
        /* ID: b5886b2e-fe07-4304-a903-5bbe58fab99d */
        end action spinRateAboveCriticalLevelOut : SpinRate_eec7;
        end action spinRateAboveCriticalLevelIn : PlaceSatelliteInSAFEMode_5654;
        interface : SpinRate_eec7ToPlaceSatelliteInSAFEMode_5654Interface connect spinRateAboveCriticalLevelIn.FIP2_d8a5 to spinRateAboveCriticalLevelOut.FOP1_d33f;
    }

    connection def SpinRate_eec7ToControlSpinRate_abeeConnection {
        doc
        /* ID: 73764923-f57b-404d-a39f-4f618d7980a5 */
        end action spinRateBetweenOperationalMarginAndCriticalLevelOut : SpinRate_eec7;
        end action spinRateBetweenOperationalMarginAndCriticalLevelIn : ControlSpinRate_abee;
        interface : SpinRate_eec7ToControlSpinRate_abeeInterface connect spinRateBetweenOperationalMarginAndCriticalLevelIn.FIP1_aa0f to spinRateBetweenOperationalMarginAndCriticalLevelOut.FOP2_8547;
    }

    connection def SpinRate_eec7ToPlaceKeepSatelliteInNOMINALMode_d510Connection {
        doc
        /* ID: 385e985d-7e22-440a-a9b0-843b75870f19 */
        end action spinRateBelowOperationalMarginOut : SpinRate_eec7;
        end action spinRateBelowOperationalMarginIn : PlaceKeepSatelliteInNOMINALMode_d510;
        interface : SpinRate_eec7ToPlaceKeepSatelliteInNOMINALMode_d510Interface connect spinRateBelowOperationalMarginIn.FIP2_b07a to spinRateBelowOperationalMarginOut.FOP3_be70;
    }

    connection def DetermineAttitude_2f97ToChangeAttitudeToDesiredAttitude_cc1bConnection {
        doc
        /* ID: a07d68da-3efd-43f5-85ad-ce181d280a14 */
        end action attitudeInformationOut : DetermineAttitude_2f97;
        end action attitudeInformationIn : ChangeAttitudeToDesiredAttitude_cc1b;
        interface : DetermineAttitude_2f97ToChangeAttitudeToDesiredAttitude_cc1bInterface connect attitudeInformationIn.FIP1_d5bc to attitudeInformationOut.FOP1_bad0;
    }

    connection def RequestSpecialDiceImageLocation_3b34ToDetermineAttitude_2f97Connection {
        doc
        /* ID: eda1765b-e669-45ec-816b-5f6423d39840 */
        end action commandADCSToRepositionTheSatelliteOut : RequestSpecialDiceImageLocation_3b34;
        end action commandADCSToRepositionTheSatelliteIn : DetermineAttitude_2f97;
        interface : RequestSpecialDiceImageLocation_3b34ToDetermineAttitude_2f97Interface connect commandADCSToRepositionTheSatelliteIn.FIP1_5399 to commandADCSToRepositionTheSatelliteOut.FOP1_9abf;
    }

    connection def ChangeAttitudeToDesiredAttitude_cc1bToCommandPMToOperateTheDicePayload_b4e5Connection {
        doc
        /* ID: f19705f7-2710-4a52-8624-9bc953f7afa2 */
        end action relayThatTheSatelliteIsInDesiredAttitudeOut : ChangeAttitudeToDesiredAttitude_cc1b;
        end action relayThatTheSatelliteIsInDesiredAttitudeIn : CommandPMToOperateTheDicePayload_b4e5;
        interface : ChangeAttitudeToDesiredAttitude_cc1bToCommandPMToOperateTheDicePayload_b4e5Interface connect relayThatTheSatelliteIsInDesiredAttitudeIn.FIP3_04f5 to relayThatTheSatelliteIsInDesiredAttitudeOut.FOP1_1b7b;
    }

    connection def DetermineTemperatures_504eToHousekeeping_b6bdConnection {
        doc
        /* ID: e6b2b52d-44ab-4e5f-9021-dc087763b220 */
        end action temperatureLevelOut : DetermineTemperatures_504e;
        end action temperatureLevelIn : Housekeeping_b6bd;
        interface : DetermineTemperatures_504eToHousekeeping_b6bdInterface connect temperatureLevelIn.FIP1_f8c8 to temperatureLevelOut.FOP1_f535;
    }

    connection def Temperature_235dToPlaceSatelliteInSAFEMode_5654Connection {
        doc
        /* ID: 1e454e67-e4bf-4d18-b886-65d36280b24f */
        end action temperatureIsAtACriticalLevelOut : Temperature_235d;
        end action temperatureIsAtACriticalLevelIn : PlaceSatelliteInSAFEMode_5654;
        interface : Temperature_235dToPlaceSatelliteInSAFEMode_5654Interface connect temperatureIsAtACriticalLevelIn.FIP3_a07a to temperatureIsAtACriticalLevelOut.FOP1_8409;
    }

    connection def Temperature_235dToPlaceKeepSatelliteInNOMINALMode_d510Connection {
        doc
        /* ID: dcf27480-7900-432d-b5c4-0dd8852e8b52 */
        end action temperatureWithinOperationalMarginOut : Temperature_235d;
        end action temperatureWithinOperationalMarginIn : PlaceKeepSatelliteInNOMINALMode_d510;
        interface : Temperature_235dToPlaceKeepSatelliteInNOMINALMode_d510Interface connect temperatureWithinOperationalMarginIn.FIP3_9040 to temperatureWithinOperationalMarginOut.FOP2_992c;
    }

    connection def Temperature_235dToTurnOffRequiredSubsystem_829fConnection {
        doc
        /* ID: d82cf6d2-0319-44c6-bafd-195a3e397588 */
        end action temperatureBetweenOperationalMarginAndCriticalLevelOut : Temperature_235d;
        end action temperatureBetweenOperationalMarginAndCriticalLevelIn : TurnOffRequiredSubsystem_829f;
        interface : Temperature_235dToTurnOffRequiredSubsystem_829fInterface connect temperatureBetweenOperationalMarginAndCriticalLevelIn.FIP1_9d88 to temperatureBetweenOperationalMarginAndCriticalLevelOut.FOP3_d872;
    }

    connection def Housekeeping_b6bdToBatteryChargeLevel_37e0Connection {
        doc
        /* ID: c6251a22-80ef-45b0-b6c6-13c5548c749d */
        end action energyLevelOut : Housekeeping_b6bd;
        end action energyLevelIn : BatteryChargeLevel_37e0;
        interface : Housekeeping_b6bdToBatteryChargeLevel_37e0Interface connect energyLevelIn.FIP1_71af to energyLevelOut.FOP1_0cc9;
    }

    connection def Housekeeping_b6bdToSpinRate_eec7Connection {
        doc
        /* ID: ebf664bc-46ec-4fa3-baa6-3621eaf8da7b */
        end action spinRateOut : Housekeeping_b6bd;
        end action spinRateIn : SpinRate_eec7;
        interface : Housekeeping_b6bdToSpinRate_eec7Interface connect spinRateIn.FIP1_b691 to spinRateOut.FOP2_3dc1;
    }

    connection def Housekeeping_b6bdToTemperature_235dConnection {
        doc
        /* ID: 88eb19cf-ec25-40f2-9e69-3dbfbf268b21 */
        end action temperatureLevelOut : Housekeeping_b6bd;
        end action temperatureLevelIn : Temperature_235d;
        interface : Housekeeping_b6bdToTemperature_235dInterface connect temperatureLevelIn.FIP1_8cfb to temperatureLevelOut.FOP3_e306;
    }

    connection def Housekeeping_b6bdToCombineAllGeneratedData_5334Connection {
        doc
        /* ID: 9ab28e92-96bc-47a9-8a28-564815c89cb2 */
        end action housekeepingDataOut : Housekeeping_b6bd;
        end action housekeepingDataIn : CombineAllGeneratedData_5334;
        interface : Housekeeping_b6bdToCombineAllGeneratedData_5334Interface connect housekeepingDataIn.FIP2_70c7 to housekeepingDataOut.FOP4_c168;
    }

    connection def CombineAllGeneratedData_5334ToTransmitMissionStatus_857fConnection {
        doc
        /* ID: cedc58c1-7f5a-4edf-9b48-e9e52709d0c2 */
        end action commandAntennaToDownlinkAllGeneratedDataOut : CombineAllGeneratedData_5334;
        end action commandAntennaToDownlinkAllGeneratedDataIn : TransmitMissionStatus_857f;
        interface : CombineAllGeneratedData_5334ToTransmitMissionStatus_857fInterface connect commandAntennaToDownlinkAllGeneratedDataIn.FIP2_df09 to commandAntennaToDownlinkAllGeneratedDataOut.FOP1_b29a;
    }

    connection def CombineAllGeneratedData_5334ToTransmitEducationalData_d69bConnection {
        doc
        /* ID: 6f11cc39-b5f7-4359-beab-b5a976b134bd */
        end action relayEducationalDataOut : CombineAllGeneratedData_5334;
        end action relayEducationalDataIn : TransmitEducationalData_d69b;
        interface : CombineAllGeneratedData_5334ToTransmitEducationalData_d69bInterface connect relayEducationalDataIn.FIP1_1ec8 to relayEducationalDataOut.FOP2_26cb;
    }

    action def SpaceEducationalExperiment_a3be {
        doc
        /* ID: a3be2abd-b40b-408d-a585-5f58dae4197c */
        first start;
        then action prepareEducationalSpaceExperiment_83c0 : PrepareEducationalSpaceExperiment_83c0;
        then action transmitEducationalSpaceExperimentPlanning_eb64 : TransmitEducationalSpaceExperimentPlanning_eb64;
        then action receiveEducationalSpaceExperimentPlanning_81e9 : ReceiveEducationalSpaceExperimentPlanning_81e9;
        then action performEducationalSpaceExperiment_fb50 : PerformEducationalSpaceExperiment_fb50;
        then action transmitEducationalSpaceExperimentResults_2a0b : TransmitEducationalSpaceExperimentResults_2a0b;
        then action receiveEducationalSpaceExperimentResults_1b82 : ReceiveEducationalSpaceExperimentResults_1b82;
        then action checkEducationalSpaceExperimentResults_35a2 : CheckEducationalSpaceExperimentResults_35a2;
        then action provideExperimentResultToSchools_58a8 : ProvideExperimentResultToSchools_58a8;
        then action prepareSpaceLesson_368d : PrepareSpaceLesson_368d;
        then action participateInLesson_686a : ParticipateInLesson_686a;
        then action becomeInspiredBySpaceMission_7b65 : BecomeInspiredBySpaceMission_7b65;
    }

    action def DataCollectionSpaceEducationalExperiment_20fc {
        doc
        /* ID: 20fc7ea5-8c18-4ddb-9554-8d24fe289e38 */
        first start;
        then action planAndScheduleDataCollection_22bb : PlanAndScheduleDataCollection_22bb;
        then action transmitCommandForDataCollection_47bc : TransmitCommandForDataCollection_47bc;
        then action receiveDataCollectionCommand_d32a : ReceiveDataCollectionCommand_d32a;
        then action transmitEducationalSpaceExperimentResults_2a0b : TransmitEducationalSpaceExperimentResults_2a0b;
        then action recieveEducationalData_d30c : RecieveEducationalData_d30c;
        then action separateEducationalModulesData_c249 : SeparateEducationalModulesData_c249;
        then action hostEducationalData_fc85 : HostEducationalData_fc85;
    }

    action def DataCollectionSpaceRadiationExperiment_f8d5 {
        doc
        /* ID: f8d588ed-fd44-41dd-93f4-eb199620b5cf */
        first start;
        then action planAndScheduleDataCollection_22bb : PlanAndScheduleDataCollection_22bb;
        then action transmitCommandForDataCollection_47bc : TransmitCommandForDataCollection_47bc;
        then action receiveDataCollectionCommand_d32a : ReceiveDataCollectionCommand_d32a;
        then action transmitSpaceRadiationExperimentResults_fdbc : TransmitSpaceRadiationExperimentResults_fdbc;
        then action recieveEducationalData_d30c : RecieveEducationalData_d30c;
        then action separateEducationalModulesData_c249 : SeparateEducationalModulesData_c249;
        then action hostEducationalData_fc85 : HostEducationalData_fc85;
    }

    action def SpaceRadiationExperiment_7d44 {
        doc
        /* ID: 7d449232-41e9-4107-a68f-84ca12e536f8 */
        first start;
        then action selectImage_7b1b : SelectImage_7b1b;
        then action checkImage_3804 : CheckImage_3804;
        then action storeImages_f9a5 : StoreImages_f9a5;
        then action prepareSpaceRadiationExperiment_7ffb : PrepareSpaceRadiationExperiment_7ffb;
        then action transmitImageData_78b4 : TransmitImageData_78b4;
        then action receiveImageData_1eba : ReceiveImageData_1eba;
        then action doTheSpaceRadiationExperiment_752c : DoTheSpaceRadiationExperiment_752c;
        then action transmitSpaceRadiationExperimentResults_fdbc : TransmitSpaceRadiationExperimentResults_fdbc;
        then action receiveSpaceRadiationExperimentResults_ae11 : ReceiveSpaceRadiationExperimentResults_ae11;
        then action checkTheSpaceRadiationExperimentResults_459a : CheckTheSpaceRadiationExperimentResults_459a;
        then action provideSpaceRadiationExperimentResultsToSchools_8138 : ProvideSpaceRadiationExperimentResultsToSchools_8138;
        then action prepareSpaceRadiationLesson_c0f4 : PrepareSpaceRadiationLesson_c0f4;
        then action participateInLesson_3e27 : ParticipateInLesson_3e27;
        then action learnAboutTheEffectOfSpaceRadiationAndMitigationTechniquesWithProgramming_96b4 : LearnAboutTheEffectOfSpaceRadiationAndMitigationTechniquesWithProgramming_96b4;
    }

    action def OperatingSpaceMission_abaa {
        doc
        /* ID: abaa11aa-d3e4-429a-b32a-a4b008f8260e */
        first start;
        then action planMissionOperations_3b3a : PlanMissionOperations_3b3a;
        then action transmitMissionOperations_d957 : TransmitMissionOperations_d957;
        then action receiveMissionOperations_3937 : ReceiveMissionOperations_3937;
    }

    action def DicePayloadNominal_b3b8 {
        doc
        /* ID: b3b879e1-47ed-4751-94a9-84b095a303e2 */
        first start;
        then action commandAllSubsystemsToPerformTheirOperations_6fa8 : CommandAllSubsystemsToPerformTheirOperations_6fa8;
        then action commandPMToOperateTheDicePayload_b4e5 : CommandPMToOperateTheDicePayload_b4e5;
        then action startTheDiceSequence_d389 : StartTheDiceSequence_d389;
        then action clampDice_8f2d : ClampDice_8f2d;
        then action turnOnLEDs_5e6d : TurnOnLEDs_5e6d;
        then action takeImage_378c : TakeImage_378c;
        then action turnOffLEDs_7c06 : TurnOffLEDs_7c06;
        then action unclampDice_a4a8 : UnclampDice_a4a8;
        then action storeDiceImageResults_bb51 : StoreDiceImageResults_bb51;
        then action retrieveDiceImageResults_332d : RetrieveDiceImageResults_332d;
    }

    action def DicePayloadSpecialLocation_d62f {
        doc
        /* ID: d62f5f9c-e798-4551-a61d-cc02ff53c9cd */
        first start;
        then action commandAllSubsystemsToPerformTheirOperations_6fa8 : CommandAllSubsystemsToPerformTheirOperations_6fa8;
        then action requestSpecialDiceImageLocation_3b34 : RequestSpecialDiceImageLocation_3b34;
        then action determineAttitude_2f97 : DetermineAttitude_2f97;
        then action changeAttitudeToDesiredAttitude_cc1b : ChangeAttitudeToDesiredAttitude_cc1b;
        then action commandPMToOperateTheDicePayload_b4e5 : CommandPMToOperateTheDicePayload_b4e5;
        then action startTheDiceSequence_d389 : StartTheDiceSequence_d389;
        then action clampDice_8f2d : ClampDice_8f2d;
        then action turnOnLEDs_5e6d : TurnOnLEDs_5e6d;
        then action takeImage_378c : TakeImage_378c;
        then action turnOffLEDs_7c06 : TurnOffLEDs_7c06;
        then action unclampDice_a4a8 : UnclampDice_a4a8;
        then action storeDiceImageResults_bb51 : StoreDiceImageResults_bb51;
        then action retrieveDiceImageResults_332d : RetrieveDiceImageResults_332d;
    }

    action def Housekeeping_4847 {
        doc
        /* ID: 48478f2b-7d49-442f-809b-5c905b05bfad */
        first start;
        then action commandAllSubsystemsToPerformTheirOperations_6fa8 : CommandAllSubsystemsToPerformTheirOperations_6fa8;
        then action storeEnergyInTheBatteries_baf4 : StoreEnergyInTheBatteries_baf4;
        then action housekeeping_b6bd : Housekeeping_b6bd;
    }

    action def BitflipPayload_3656 {
        doc
        /* ID: 3656420e-aba5-4495-8a1c-c1a04c00d7e7 */
        first start;
        then action commandAllSubsystemsToPerformTheirOperations_6fa8 : CommandAllSubsystemsToPerformTheirOperations_6fa8;
        then action shareImageDataWithPM_ebaa : ShareImageDataWithPM_ebaa;
        then action storeImageDataInitialStateOnPM_ac59 : StoreImageDataInitialStateOnPM_ac59;
        then action storeTheInitialStateDataOnTheUnprotectedMemoryBoards_96de : StoreTheInitialStateDataOnTheUnprotectedMemoryBoards_96de;
        then action bitflipsOccur_ac1a : BitflipsOccur_ac1a;
        then action checkForAmountOfBitflips_7d87 : CheckForAmountOfBitflips_7d87;
        then action numberOfBitflips_92e9 : NumberOfBitflips_92e9;
        then action determineTheLocationsOfTheBitflips_18b2 : DetermineTheLocationsOfTheBitflips_18b2;
        then action retrieveBitflipLocations_4248 : RetrieveBitflipLocations_4248;
    }

}