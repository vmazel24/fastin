module Fast {
    class FastinManager {
        var _sessions as [FastinSession];
        function initialize() {
            _sessions = [];
        }
        function getSessions() as [FastinSession] { return _sessions; }
        function startFast(offset as Lang.Number) {
            _sessions.add(new FastinSession());
        }
        function stopFast() {
            if (_sessions.size() > 0) {
                var idx = _sessions.size() - 1;
                var s as FastinSession = _sessions.get(idx);
                if (s.isActive()) { s.stopSession(); }
            }
        }
    }
}
