import BaseComponent from "sap/fe/core/AppComponent";

/**
 * @namespace maintainqualifications
 */
export default class Component extends BaseComponent {

	public static metadata = {
		manifest: "json"
	};

    /**
     * The component is initialized by UI5 automatically during the startup of the app and calls the init method once.
     * @public
     * @override
     */
	public init() : void {
        super.init();
        this.getRouter().navTo(
            "QualificationsHeaderObjectPage",
            {
                key: "ID=0,IsActiveEntity=true"
            }
        );
    }
}