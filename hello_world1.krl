ruleset hello_world1 {
  meta {
    name "Hello World1"
    description <<
A first ruleset for the Quickstart
>>
    author "Phil Windley"
    logging on
    shares hello, __testing
  }
   
  global {
    __testing = { "queries": [ { "name": "hello", "args": [ "obj" ] },
                           { "name": "__testing" } ],
              "events": [ { "domain": "echo", "type": "hello" } ]
            }
    hello = function(obj) {
      msg = "Hello " + obj;
      msg
    }
  }
   
  rule hello_world {
    select when echo hello
    send_directive("say", {"something": "Hello World"})
  }
  
  rule monkey {
    select when echo monkey
    pre{
      name = event:attr("name").defaultsTo("Monkey").klog("Name used is: ")
    }
    send_directive("say", {"something": "Hello " + name})
  }
  
  rule monkeyTwo {
    select when echo monkeytwo
    pre{
      n = event:attr("name");
      name = n == null => "Monkey" | n .klog("Name used is: ")
    }
    send_directive("say", {"something": "Hello " + name})
  }
   
}

