hello, and welcome

Roadmap

Very loose list of things I want to work on

- GUI / UI for VAA and VAHC

- More HC elements

- Pre-built HC plans

- Make VAUS more user friendly to enable player config

- Test in MP

notes:

When adding new UI

- create new classes in display.hpp
- ensure IDCs are correct, and relevant to the thing you are building (good IDC structure saves headache)
- ensure that any UI is shut down at the right time, probably during clearKeyDowns exec
- think about your layering when rendering
- UI execs can sit in the keyDownMonitor if you want on-screen data updates as you talk
- UI execs can also sit later down the chain, if all you want is a visual confirm of, say, an order
