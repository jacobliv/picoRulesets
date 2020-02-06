ruleset wovyn_base {
    meta {
        name "Wovyn Base"
        description << Catch Wovyn Heartbeat >>
        author "Jacob Livingston"
    }

    rule hearbeat {
        select when wovyn heartbeat
        pre {
            genericThing = event:attr("genericThing","data","temperature").klog("Data: ")
        }
    }
}