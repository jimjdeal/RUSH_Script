next phase:
build a way to control your two blu markers, and then control movement to said markers
I want to have this eventually done using voice attack
So the goal here is to be able to configure using keyDowns

// stage 1
test how to control marker creation based on existing location
if marker is directly to your west, then you should be able to config the marker to be 100 south of their position
"team 1, reposition 100m south"
or
"team 1, fall back on my position"
So, what commands would we use?

    you'll want to be able to commannd by compass points - so 8 commands here N S E W NE SE SW NW
    you'll also want to designate distance, 50m 100m 150m 200m 250m

    given the exponential numbers here, this would need to be a two-stage event

    "team 1"
    "move south west"
    "200m"
    "move out"

    each command would unlock a new keyDown combo

    We will base our work on the numPad - yes this causes clashes, but this is just for fun. If this becomes useful, maybe CBA can help?

    So, you trigger listening

        "listen up"
        keyDown (KD) 0 = incomingOrders = true
        sysChat "waiting for orders"
        Waiting for confirmation of which team
            team 1 / team 2 / team 1 and 2 / all units
            for now, just team 1 or team 2
        if KD 0 then incomingOrders = true

        "team 1" (eg)
        if incomingOrders = true then:
            switch 1 = team 1   = team1Ready
            switch 2 = team 2   = team2Ready
            switch 0 = abort    = abort = true
        sysChat "team 1 receiving"

        Once team has been selected, next question is direction
        If team1Ready or if team2Ready then incomingOrders = false and incomingDirection = true

        If incomingDirection = true then:
        "Move north east"
            switch 8 = N        = parse 0   && incomingDistance = true
            switch 9 = NE       = parse 45  && incomingDistance = true
            switch 6 = E        = parse 90  && incomingDistance = true
            switch 3 = SE       = parse     && incomingDistance = true
            switch 2 = S        = parse 180 && incomingDistance = true
            switch 1 = SW       = parse     && incomingDistance = true
            switch 4 = W        = parse 270 && incomingDistance = true
            switch 7 = NW       = parse     && incomingDistance = true
            switch 0 = abort    = abort = true
        sysChat "north east confirmed"

        if incomingDistance = true then:
        "150m"
            switch 1 = 50m      = parse 50  && finalConfirm = true
            switch 2 = 100m     = parse 100  && finalConfirm = true
            switch 3 = 150m     = parse 150  && finalConfirm = true
            switch 4 = 200m     = parse 200  && finalConfirm = true
            switch 5 = 250m     = parse 250  && finalConfirm = true
            switch 0 = abort    = abort = true
        sysChat "150m confirmed"

        if finalConfirm = true then:
        sysChat "Team 1 moving north east 150m, confirm"
        "confirm"
        sysChat "copy that, we are OM"
            switch 1 = confirm
            switch 0 = abort    = abort = true

    each of the above steps require sysChat details, however later we can use OGG files to make this pure audio

    We also need a way for the teams to "hold position"

    //

    use this to find out key codes:
    moduleName_keyDownEHId = (findDisplay 46) displayAddEventHandler ["KeyDown", "hint str _this;"];

text on screen

i want to have a vis marker on screen when a system is running
so on activation, the curText should show instantly
then, run a 3 second loop, and if the input bool for that module is false, set it to clear.

monday 19th August
I am now thinking, we should have a module for player controlled assest, and a different one for HC assets
so, once you have chosen player control or HC, you can then run through unit types and if vics state if they should be crewed.
if you create an HC vic, they are always crewed
if you create a PC vic you need to state if crewed
on second thoughts, we'll have a module for units, and a module for vics / assets

......

In the config you can enable systemChat feedback for even more help, if needed.

keydowns

0 = 82
1 = 79
2 = 80
3 = 81
4 = 75
5 - 76
6 - 77
7 - 71
8 - 72
9 - 31
/ - 181

- - 55

when directing HC units, you should also specify area of known opfor
this may be known, if so, a commander would share this info.

if it is not known, this should also be shared

move orders are what they are
sitreps are what they are

we need a 'be advised' command
"all groups be advised..."
"we have confirmed opfor to the south"
"we have confirmed opfor at grid 123 456"
"we have no confirmed opfor locations, stay frosty"

we could also consider orders to change behaviour.
"fire only when fired upon"
"fire at will"
"only engage hard targets with kaunchers, before small-arms"

another idea - when doing movement, de-group everyone so that there is no formation
but if any opfor is knownAbout, re-group all units into a cohesive unit
so could you get all unit numbers, push them into an array, on creation?
Then you have an array of units, that can be grouped/ungrouped automatically as situation dictates

what are options for auto-building searches?

// key = "numpad 1 = 79"
RGG_VAUS_Activate

// key = "numpad 2"
rgg_vahco_Activate

// key = "numpad 3"
rgg_vacf_Activate

// key = "4"
rgg_Activate vaa

should be:

vacf 1
vaas 2
vahc 3
vaar 4

vaus 5
vavs 6
vaos 7
vamg 8

04 sept note:
i need to be able to turn off ui for each pack
i may want some ui for, say, hc, but not for vavs or vaus
without ui, say, vaus would be much slicker
also consider creation of a spawn base vic, where vaus only works when near

another consideration ... if i say 5 in a mission, it may trigger unwanted bahavoiur
so change inital activators to include a modifier, as security

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
