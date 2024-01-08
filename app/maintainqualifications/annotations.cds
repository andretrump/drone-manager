using SettingsService as service from '../../srv/settings-service';

annotate service.QualificationsHeader with @(
    UI.HeaderInfo: {
        TypeName      : 'Qualification',
        TypeNamePlural: 'Qualifications',
        Title         : {
            $Type: 'UI.DataField',
            Value: '{@i18n>appTitle}',
        },
    },
    UI.Facets    : [{
        $Type : 'UI.ReferenceFacet',
        Label : '{@i18n>sectionTitle}',
        ID    : 'AvailableQualifications',
        Target: 'qualifications/@UI.LineItem#AvailableQualifications',
    }, ]
);

annotate service.Qualifications with @(UI.LineItem #AvailableQualifications: [
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
