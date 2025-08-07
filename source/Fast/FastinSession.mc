module Fast {
    using Toybox.Time as Time;
    using Toybox.Lang;
    class FastinSession {
        var _start as Lang.Number;
        var _stop as Lang.Number;
        function initialize() {
            _start = Time.now().value();
            _stop = null;
        }
        function isActive() as Lang.Boolean { return _stop == null; }
        function stopSession() as Void { _stop = Time.now().value(); }
        function duration() as Lang.Number {
            var end = (_stop == null) ? Time.now().value() : _stop;
            return end - _start;
        }
    }
}
