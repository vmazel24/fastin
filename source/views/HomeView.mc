module Views {

    using Toybox.WatchUi  as Ui;
    using Toybox.Graphics as G;
    using Toybox.Lang as Lang;
    using Fast;

    class HomeView extends Ui.View {

        var mgr;
        function initialize(m) {
            View.initialize();
            mgr = m;
        }

        function prettyDur(dur as Number) as String {
            var hours = (dur / 3600).toNumber();
            var minutes = ((dur % 3600) / 60).toNumber();
            var seconds = (dur % 60).toNumber();
            return Lang.format("%02d:%02d:%02d", [hours, minutes, seconds]);
        }

        function onUpdate(dc as G.Dc) {
            dc.clear();
            var s = mgr.getSessions().size() > 0 ? mgr.getSessions()[-1] : null;
            if (s != null && s.isActive()) {
                dc.drawText(dc.getWidth()/2, dc.getHeight()/2, G.FONT_LARGE, prettyDur(s.duration()), G.TEXT_JUSTIFY_CENTER);
            } else {
                dc.drawText(dc.getWidth()/2, dc.getHeight()/2, G.FONT_LARGE, "Prêt", G.TEXT_JUSTIFY_CENTER);
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
