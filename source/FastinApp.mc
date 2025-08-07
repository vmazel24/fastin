import Toybox.Application;
import Toybox.Lang;
import Toybox.WatchUi;
using Fast.FastinManager;

class FastinApp extends Application.AppBase {
    var mgr;
    function initialize(){ AppBase.initialize(); mgr=new FastinManager(); }
    function getInitialView(){ return new Views.HomeView(mgr); }
    function getServiceDelegate(){ return new Svc.FastinService(); }
}

function getApp() as FastinApp {
    return Application.getApp() as FastinApp;
}