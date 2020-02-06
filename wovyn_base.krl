ruleset wovyn_base {
    meta {
        name "Wovyn Base"
        description << Catch Wovyn Heartbeat >>
        author "Jacob Livingston"
    }

    rule hearbeat {
        select when wovyn heartbeat
        pre {
            genericThing = event:attr("genericThing").get("data","temperature")[0].klog("Data: ")
        }
    }
}