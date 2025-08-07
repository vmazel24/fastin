module Fast {
    using Toybox.Lang as Lang;
    using Toybox.Time as Time;
    class FastinManager {
        var _sessions as Lang.Array;
        function initialize() {
            _sessions = [];
        }
        function getSessions() { return _sessions; }
        function startFast(offset as Lang.Number) {
            _sessions.add(new FastinSession());
        }
        function stopFast() {
            if (_sessions.size() > 0) {
                var s = _sessions[-1];
                if (s.isActive()) { s.stopSession(); }
            }
        }
    }
}
