component {
    this.name = "learncfinaweek";
    this.datasource = "learncfinaweek";
    this.applicationTimeout = CreateTimeSpan(10, 0, 0, 0);
    this.sessionManagement = true;
    this.sessionTimeout = CreateTimeSpan(0, 0, 30, 0);
    this.ormEnabled = true;
    this.ormSettings = {
        logsql = true, 
        dbcreate = "update", 
        cfclocation = "com/entities"
        };
    this.invokeImplicitAccessor = true;

    function onApplicationStart() {
        application.myName = "Aaron";
        application.myPosition = "A Great Developer";
        application.utilities = CreateObject("cfc.utilities");
        return true;
    }

    function onRequestStart(string targetPage) {
        if(structKeyExists(url, "reload")) {
            onApplicationStart();
            ormReload();
        }
    }
}