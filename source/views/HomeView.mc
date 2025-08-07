module Views {

    using Toybox.WatchUi  as Ui;
    using Toybox.Graphics as G;
    using Fast;

    class HomeView extends Ui.View {

        var mgr;
        function initialize(m) { mgr = m; }

        function onUpdate(dc as G.Dc) {
            dc.clear();
            var s = mgr.getSessions().size() > 0 ? mgr.getSessions()[-1] : null;
            if (s != null && s.isActive()) {
                dc.drawText(dc.getWidth()/2, dc.getHeight()/2, G.FONT_LARGE, prettyDur(s.duration()));
            } else {
                dc.drawText(dc.getWidth()/2, dc.getHeight()/2, G.FONT_LARGE, "Prêt");
            }
        }

        function onKey(evt) {
            if (evt.getKey() == Ui.KEY_ENTER) {
                var s = mgr.getSessions().size() > 0 ? mgr.getSessions()[-1] : null;
                if (s != null && s.isActive()) {
                    mgr.stopFast();
                } else {
                    mgr.startFast(0);
                }
                Ui.requestUpdate();
            }
            return true;
        }
    }
}
