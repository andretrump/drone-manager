using SettingsService as service from '../../srv/settings-service';

annotate service.WeatherConditionsHeader with @(
    UI.HeaderInfo: {
        TypeName      : 'WeatherCondition',
        TypeNamePlural: 'WeatherConditions',
        Title         : {
            $Type: 'UI.DataField',
            Value: '{@i18n>appTitle}',
        },
    },
    UI.Facets    : [{
        $Type : 'UI.ReferenceFacet',
        Label : '{@i18n>sectionTitle}',
        ID    : 'AvailableWeatherConditions',
        Target: 'weatherConditions/@UI.LineItem#AvailableWeatherConditions',
    }, ]
);

annotate service.WeatherConditions with @(UI.LineItem #AvailableWeatherConditions: [
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
