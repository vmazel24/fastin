using Toybox.Background as Background;
using Toybox.System      as System;

(:background)                               // ← annotation obligatoire
module Svc {

    class FastinService extends System.ServiceDelegate {

        function onTemporalEvent() {
            Background.requestApplicationWake("Fin de jeûne !");
            Background.exit(null);
        }
    }
}
