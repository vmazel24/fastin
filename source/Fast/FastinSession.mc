module Fast {
    using Toybox.Time as Time;
    class FastinSession {
        var _start as Number;
        var _stop as Number;
        function initialize() {
            _start = Time.now().value();
            _stop = null;
        }
        function isActive() as Boolean { return _stop == null; }
        function stopSession() as Void { _stop = Time.now().value(); }
        function duration() as Number {
            var end = (_stop == null) ? Time.now().value() : _stop;
            return end - _start;
        }
    }
}
