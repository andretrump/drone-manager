import History from "sap/ui/core/routing/History";
import Controller from "sap/ui/core/mvc/Controller";
import UIComponent from "sap/ui/core/UIComponent";

/**
 * @namespace launchpad.controller
 */
export default class App extends Controller {
    public navToApp(route: string): void {
        const appComponent = this.getOwnerComponent() as UIComponent;
        const router = appComponent.getRouter();
        router.navTo(route);
    }

    public onBackButtonPressed(): void {
        const hashes = window.history.state.sap.history
        const hashBeforePrevious = hashes[hashes.length - 2];
        if (["EquipmentStatus", "FlightTypes", "Qualifications", "WeatherConditions"].includes(hashBeforePrevious)) {
            window.history.go(-2);
        } else {
            window.history.go(-1);
        }
    }
}