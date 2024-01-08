import Controller from "sap/ui/core/mvc/Controller";
import UIComponent from "sap/ui/core/UIComponent";

/**
 * @namespace launchpad.controller
 */
export default class Home extends Controller {
    public navToApp(route: string): void {
        const appComponent = this.getOwnerComponent() as UIComponent;
        const router = appComponent.getRouter();
        router.navTo(route);
    }
}