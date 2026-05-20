package Example {
    private import ScalarValues::*;

    part def Satellite {
        port satelliteDelegationPort : SatelliteDelegationPort;
    }
    part def OBC {
        port obcPort : OBCPort;
    }
    part def Payload {
        port payloadPort : PayloadPort;
    }
    part def Antenna {
        port antennaPort : AntennaUplinkPort;
    }

    item def GroundStation {
        port groundStationPort : GroundStationPort;
    }

    item groundStation : GroundStation;

    port def GroundStationPort;
    port def AntennaUplinkPort;
    port def OBCPort {
        in item data : PayloadData;
    }
    port def PayloadPort {
        out item data : PayloadData;
    }
    port def SatelliteDelegationPort;

    interface def Uplink {
        end port sourcePort : GroundStationPort;
        end port targetPort : SatelliteDelegationPort;
    }

    connection def UplinkUHF {
        end item groundStation : GroundStation;
        end part satellite : Satellite;
    }

    interface def UplinkInternal {
        end port sourcePort : SatelliteDelegationPort;
        end port targetPort : AntennaUplinkPort;
    }

    connection def UplinkUHFInternal {
        end part satellite : Satellite;
        end part antenna : Antenna;
    }

    interface def PayloadOBC {
        end port sourcePort : PayloadPort;
        end port targetPort : OBCPort;

        flow of PayloadData from sourcePort.data to targetPort.data;
    }

    connection def PayloadOBCConnection {
        end part payload : Payload;
        end part obc : OBC;
    }

    part satellite : Satellite {
        part obc : OBC {
            perform action PackagePayloadData;
        }

        part payload : Payload {
            perform action GatherPayloadData;
        }

        part antenna : Antenna;

        interface : UplinkInternal connect satellite.satelliteDelegationPort to antenna.antennaPort;
        interface : PayloadOBC connect payload.payloadPort to obc.obcPort;
    }

    interface : Uplink connect groundStation.groundStationPort to satellite.satelliteDelegationPort;

    action def GatherPayloadData {
        port outdata : gatherpayloadOut;
    }

    port def gatherpayloadOut {
        out item data : PayloadData;
    }

    action def PackagePayloadData {
        port indata : packagepayloadIn;
    }

    port def packagepayloadIn {
        in item data : PayloadData;
    }

    item def PayloadData;

    interface def payloadData {
        end port outPort : gatherpayloadOut;
        end port inPort : packagepayloadIn;

        flow of PayloadData from outPort.data to inPort.data;
    }

    connection def ConnectionPayloadData {
        end action sourceAction : GatherPayloadData;
        end action targetAction : PackagePayloadData;

        interface : payloadData connect sourceAction.outdata to targetAction.indata;
    }

    action gatherPayloadData : GatherPayloadData;
    action packagePayloadData : PackagePayloadData;

    flow of PayloadData from gatherPayloadData.outdata.data to packagePayloadData.indata.data;

    attribute def StatusPayloadData {
        attribute isPackegedCorrectly : Boolean;
    }

    action def DownlinkPayloadData;
    action def ReattemptPackaging;

    action def FC {
        in attribute statusPayloadData : StatusPayloadData;

        first start;
        then action gatherPayloadData : GatherPayloadData;
        then action packagePayloadData : PackagePayloadData;

        then if statusPayloadData.isPackegedCorrectly {
            then action downlinkPayloadData : DownlinkPayloadData;
        } else {
            then action reattemptPackaging : ReattemptPackaging;
        }
    }

    use case def ProcessPayloadData {
        subject satelliteUseCase :> satellite;
        objective {
            doc
            /* Process payload data from gathering to downlink, including conditional packaging reattempts */
        }

        actor groundStation : GroundStation;

        action fc : FC;

        action gatherPayloadData : GatherPayloadData;
        action packagePayloadData : PackagePayloadData;
        action downlinkPayloadData : DownlinkPayloadData;
        action reattemptPackaging : ReattemptPackaging;
        
        attribute statusPayloadData : StatusPayloadData;
    }
} // package Example
