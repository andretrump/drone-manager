using {
    cuid,
    sap.common.CodeList
} from '@sap/cds/common';

namespace com.at.dronemanager;

context logging {
    entity Flights {
        key serialNumber             : Integer;
            date                     : Date                           @mandatory;
            task                     : String                         @mandatory;
            costBearer               : String                         @mandatory;
            place                    : String                         @mandatory;
            personResponsible        : String                         @mandatory;
            pilot                    : Association to one hr.Persons  @assert: {
                                           target   : true,
                                           integrity: true
                                       };
            operator                 : Association to one hr.Persons  @assert: {
                                           target   : true,
                                           integrity: true
                                       };
            flightObserver           : Association to one hr.Persons  @assert: {
                                           target   : true,
                                           integrity: true
                                       };
            type                     : Association to one FlightTypes @assert: {
                                           target   : true,
                                           integrity: true
                                       };
            weatherMappings          : Composition of many WeatherMappings
                                           on weatherMappings.flight = $self;
            nightFlight              : Boolean                        @mandatory;
            airTraficControlInformed : Boolean                        @mandatory;
            timeFrom                 : Time                           @mandatory;
            timeTo                   : Time                           @mandatory;
            flightDuration           : Time                           @mandatory;
            droneAssignments         : Composition of many Drone2FlightAssignments
                                           on droneAssignments.flight = $self;
            materialAssignments      : Composition of many Material2FlightAssignments
                                           on materialAssignments.flight = $self;
    }

    entity FlightTypes : CodeList {
        key code : String;
    }

    entity WeatherMappings {
        key flight           : Association to one Flights           @assert: {
                                   target   : true,
                                   integrity: true
                               };
        key weatherCondition : Association to one WeatherConditions @assert: {
                                   target   : true,
                                   integrity: true
                               };
    }

    entity WeatherConditions : CodeList {
        key code            : String;
            weatherMappings : Association to many WeatherMappings
                                  on weatherMappings.weatherCondition = $self;
    }

    entity Drone2FlightAssignments {
        key drone  : Association to one equipment.Drones @assert: {
                         target   : true,
                         integrity: true
                     };
        key flight : Association to one Flights          @assert: {
                         target   : true,
                         integrity: true
                     };
    }

    entity Material2FlightAssignments {
        key material : Association to one equipment.Materials @assert: {
                           target   : true,
                           integrity: true
                       };
        key flight   : Association to one Flights             @assert: {
                           target   : true,
                           integrity: true
                       };
    }
}

context hr {
    entity Persons : cuid {
        name                     : String @mandatory;
        qualificationAssignments : Composition of many QualificationAssignments
                                       on qualificationAssignments.person = $self;
    }

    entity QualificationAssignments {
        key person        : Association to one Persons        @assert: {
                                target   : true,
                                integrity: true
                            };
        key qualification : Association to one Qualifications @assert: {
                                target   : true,
                                integrity: true
                            };
    }

    entity Qualifications : cuid {
        name                    : String @mandatory;
        descr                   : String;
        qualifiactionAssigments : Composition of many QualificationAssignments
                                      on qualifiactionAssigments.qualification = $self;
    }
}

context equipment {
    entity Drones : cuid {
        name              : String                            @mandatory;
        manufacturer      : String                            @mandatory;
        model             : String                            @mandatory;
        purchaseDate      : Date;
        notes             : String;
        status            : Association to one EquimentStatus @assert: {
                                target   : true,
                                integrity: true
                            };
        droneAssignments  : Composition of many Drone2GroupAssignments
                                on droneAssignments.drone = $self;
        flightAssignments : Composition of many logging.Drone2FlightAssignments
                                on flightAssignments.drone = $self;
    }

    entity EquimentStatus : CodeList {
        key code : String;
    }

    entity Materials : cuid {
        name              : String                            @mandatory;
        description       : Date;
        notes             : String;
        status            : Association to one EquimentStatus @assert: {
                                target   : true,
                                integrity: true
                            };
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
        key drone          : Association to one Drones          @assert: {
                                 target   : true,
                                 integrity: true
                             };
        key equipmentGroup : Association to one EquipmentGroups @assert: {
                                 target   : true,
                                 integrity: true
                             };
    }

    entity Material2GroupAssignments {
        key material       : Association to one Materials       @assert: {
                                 target   : true,
                                 integrity: true
                             };
        key equipmentGroup : Association to one EquipmentGroups @assert: {
                                 target   : true,
                                 integrity: true
                             };
    }
}
