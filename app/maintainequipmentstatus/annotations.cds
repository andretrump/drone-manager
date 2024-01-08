using SettingsService as service from '../../srv/settings-service';

annotate service.EquipmentStatusHeader with @(
    UI.HeaderInfo: {
        TypeName      : 'Equipment Status',
        TypeNamePlural: 'Equipment Status',
        Title         : {
            $Type: 'UI.DataField',
            Value: '{@i18n>appTitle}',
        },
    },
    UI.Facets    : [{
        $Type : 'UI.ReferenceFacet',
        Label : '{@i18n>sectionTitle}',
        ID    : 'AvailableEquipmentStatus',
        Target: 'equipmentStaus/@UI.LineItem#AvailableEquipmentStatus',
    }, ]
);


annotate service.EquipmentStatus with @(UI.LineItem #AvailableEquipmentStatus: [
    {
        $Type: 'UI.DataField',
        Value: code,
        Label: '{@i18n>code}',
    },
    {
        $Type: 'UI.DataField',
        Value: name,
        Label: '{@i18n>name}'
    },
]) {
    @UI.Hidden
    ID;

    @UI.Hidden
    header_ID;
};
