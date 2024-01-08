using {
    cuid,
    sap.common.CodeList
} from '@sap/cds/common';

namespace com.at.dronemanager;

context logging {
    entity Flights {
        key serialNumber             : Integer;
            date                     : Date    @mandatory;
            task                     : String  @mandatory;
            costBearer               : String  @mandatory;
            place                    : String  @mandatory;
            personResponsible        : String  @mandatory;
            pilot                    : Association to one hr.Persons   @assert.target  @assert.integrity;
            operator                 : Association to one hr.Persons   @assert.target  @assert.integrity;
            flightObserver           : Association to one hr.Persons   @assert.target  @assert.integrity;
            type                     : Association to one FlightTypes  @assert.target  @assert.integrity;
            weatherMappings          : Composition of many WeatherMappings
                                           on weatherMappings.flight = $self;
            nightFlight              : Boolean @mandatory;
            airTraficControlInformed : Boolean @mandatory;
            timeFrom                 : Time    @mandatory;
            timeTo                   : Time    @mandatory;
            flightDuration           : Time    @mandatory;
            droneAssignments         : Composition of many Drone2FlightAssignments
                                           on droneAssignments.flight = $self;
            materialAssignments      : Composition of many Material2FlightAssignments
                                           on materialAssignments.flight = $self;
    }

    @Capabilities: {
        Insertable: false,
        Deletable: false
    }
    entity FlightTypesHeader {
        key ID          : Integer;
            flightTypes : Composition of many FlightTypes
                              on flightTypes.header = $self;
    }

    entity FlightTypes : CodeList {
        key code      : String;
            header    : Association to one FlightTypesHeader
                            on header.ID = header_ID;
            header_ID : Integer @readonly @cds.on.insert: 0;

    }

    entity WeatherMappings {
        key flight           : Association to one Flights            @assert.target  @assert.integrity;
        key weatherCondition : Association to one WeatherConditions  @assert.target  @assert.integrity;
    }

    @Capabilities: {
        Insertable: false,
        Deletable: false
    }
    entity WeatherConditionsHeader {
        key ID                : Integer;
            weatherConditions : Composition of many WeatherConditions
                                    on weatherConditions.header = $self;
    }

    entity WeatherConditions : CodeList {
        key code            : String;
            weatherMappings : Association to many WeatherMappings
                                  on weatherMappings.weatherCondition = $self;
            header          : Association to one WeatherConditionsHeader
                                  on header.ID = header_ID;
            header_ID       : Integer @readonly @cds.on.insert: 0;
    }

    entity Drone2FlightAssignments {
        key drone  : Association to one equipment.Drones  @assert.target  @assert.integrity;
        key flight : Association to one Flights           @assert.target  @assert.integrity;
    }

    entity Material2FlightAssignments {
        key material : Association to one equipment.Materials  @assert.target  @assert.integrity;
        key flight   : Association to one Flights              @assert.target  @assert.integrity;
    }
}

context hr {
    entity Persons : cuid {
        name                     : String @mandatory;
        qualificationAssignments : Composition of many QualificationAssignments
                                       on qualificationAssignments.person = $self;
    }

    entity QualificationAssignments {
        key person        : Association to one Persons         @assert.target  @assert.integrity;
        key qualification : Association to one Qualifications  @assert.target  @assert.integrity;
    }

    @Capabilities: {
        Insertable: false,
        Deletable: false
    }
    entity QualificationsHeader {
        key ID             : Integer;
            qualifications : Composition of many Qualifications
                                 on qualifications.header = $self;
    }

    entity Qualifications : CodeList {
        key code                    : String;
            qualifiactionAssigments : Composition of many QualificationAssignments
                                          on qualifiactionAssigments.qualification = $self;
            header                  : Association to one QualificationsHeader
                                          on header.ID = header_ID;
            header_ID               : Integer @readonly @cds.on.insert: 0;
    }
}

context equipment {
    entity Drones : cuid {
        name              : String @mandatory;
        manufacturer      : String @mandatory;
        model             : String @mandatory;
        purchaseDate      : Date;
        notes             : String;
        status            : Association to one EquipmentStatus  @assert.target  @assert.integrity;
        droneAssignments  : Composition of many Drone2GroupAssignments
                                on droneAssignments.drone = $self;
        flightAssignments : Composition of many logging.Drone2FlightAssignments
                                on flightAssignments.drone = $self;
    }

    @Capabilities: {
        Insertable: false,
        Deletable: false
    }
    entity EquipmentStatusHeader {
        key ID             : Integer;
            equipmentStaus : Composition of many EquipmentStatus
                                 on equipmentStaus.header = $self;
    }

    entity EquipmentStatus : CodeList {
        key code      : String;
            header    : Association to one EquipmentStatusHeader
                            on header.ID = header_ID;
            header_ID : Integer @readonly @cds.on.insert: 0;
    }

    entity Materials : cuid {
        name              : String @mandatory;
        description       : Date;
        notes             : String;
        status            : Association to one EquipmentStatus  @assert.target  @assert.integrity;
        groupAssignments  : Composition of many Material2GroupAssignments
                                on groupAssignments.material = $self;
        flightAssignments : Composition of many logging.Material2FlightAssignments
                                on flightAssignments.material = $self;
    }

    entity EquipmentGroups : cuid {
        name             : String;
        droneAssignments : Composition of many Drone2GroupAssignments
                               on droneAssignments.equipmentGroup = $self;
        groupAssignments : Composition of many Material2GroupAssignments
                               on groupAssignments.equipmentGroup = $self;
    }

    entity Drone2GroupAssignments {
        key drone          : Association to one Drones           @assert.target  @assert.integrity;
        key equipmentGroup : Association to one EquipmentGroups  @assert.target  @assert.integrity;
    }

    entity Material2GroupAssignments {
        key material       : Association to one Materials        @assert.target  @assert.integrity;
        key equipmentGroup : Association to one EquipmentGroups  @assert.target  @assert.integrity;
    }
}
