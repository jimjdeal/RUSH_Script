Hello, and welcome to VA-MP Voice Attack Mission Packs

Check out the wiki here in Github, probably the best chance of understanding what this weird project is all about ;)

VAMP – Voice Activated Mission Packs

Each pack enables a particular mission enhancement, and can be used in isolation, or combined with any other others:

VAUS – Unit Spawner
VAAS – Asset Spawner
VACF – Coord Finder
VAAS – Artillery
VAAR – Airborne Reinforcements
VAHC – High Command
VAOG – OPFOR Generator
VAOC – Objective Creator

Some packs are best used pre-mission, some are best used during the mission.

Pre-Mission

VAUS / Voice Activated Unit Spawner
· Create DC or HC Groups
· 8 different group options
· 2 different camos
· Classes can be reconfigured to user preference

VAAS / Voice Activated Asset Spawner
· Cars, Helis or Ammo spawned nearby (currently only cars)
· Vics can be crewed or empty
· Classes can be reconfigured to user preference

VAOG / Voice Activated OPFOR Generator - Coming Soon
· Creates enemy activity in your area
· Dictate specific behaviour, or randomise
· Can be reconfigured to user preference

VAOC / Voice Activated Objective Creator - Coming Soon
· Dynamic (and simple) objectives based on player location and terrain
· Will recognise items of interest within 5 KM, such as Mil-Bases, Towns etc

During-Mission

VACF / Voice Activated Coordinate Finder
· Rangefinder enhancement to assist long-range fire missions (effective to up to 5km)
· Assists in forming 10-grid position based on visual obersvations only (i.e. no need to use map)
· Elevation adjustment coming soon

VAAS / Voice Activated Artillery System
· Request fire missions using voice - HE, Surgical, Smoke, Flares (flares coming soon)
· Enables “repeat” and “adjust fire” orders - coming soon
· Can be timed so as to enable multiple events simultaneously - coming soon
· Adjustable kill-zones for surgical strikes - coming soon

VAAR / Voice Activated Airborne Reinforcements - Coming Soon
· Essentially the Unit Spawner, but more immersive
· Selected groups are para-dropped to a location
· You confirm location and timing by voice
· Troops can be dropped in at a designated time in the future
· RF can also be called off at the last minute
· Can be reconfigured to user preference

VAPS / Voice Activated Planning System
· Marker creation system designed to assist with movement and assault missions
· Enables Primary and Secondary objectives, as well as primary and secondary staging zones
· Currently HC units can be sent in to secure, or to approach objectives

VAHC / Voice Activated High Command
· Command up to 5 different elements using just voice
· Command 360 movement and distance
· Waypoints can be stacked (then vs how copy)
· Order attack, defend, search and stealth missions (coming soon)

VAMP uses on-screen indicators, to ensure that any voice translation issues are understood instantly by the user. It also uses some light-weight on-screen displays to manage information.

VAMP requires the user to have a paid-for version of Voice Attack, or any other voice activation system, that can recognise the 500+ commands involved here.

Numbers can be entered as single digits, doubles or trebles, to speed up data input. For example, to enter a 10-grid, you could say “197” “436” “33”, or “19” “74” “36” “33”, however you cannot say “1974” 3633” (at least not yet anyway).

User should be comfortable making high level changes to VA profiles, if they wish to edit the required trigger text. For example, the default VAP (Voice Attack Profile) that comes with the pack allows the user to say “Forward Observer Requesting Fire Mission” (after which, a certain key is pressed automatically). This can be easily changes to “Delta 1 Requesting Fire Mission”, for the exact same effect in-game.

Usage:
Option 1 – Basic Editor Usage
To use the script in SP, simply copy all relevant files into an empty editor mission to play. The mission should just have the mission file, and no other file in the folder to avoid conflicts.

Option 2 – Integration into existing mission
This could be a bit more tricky, and depends on what types of files are already in the mission. Most likely you’d need to modify your mission’s init and description.ext files, but really should only be copy and paste of key content into your content. Talk to me here or on discord and I can talk you through it.

Option 3 (specific) – Integration into KP Liberation
I have used VAMP in KP SP, and requires some minor changes to make work. I will document these steps in a video, but as before, reach out if you get stuck.

Option 4 – MP
This is currently untested!

It is recommended that you familiarise yourself with the VA Profile included in the files. This gives you a view of the conversational flows, which you will need to follow in order to get the results you want. I have tried to assist with some on-screen prompts, but looking at the docs might save you some frustration.

You activate the entire pack by pressing one key – this can be changed in the config. Once opened, the system relies on the numpad, and while these can also be remapped, it is recommended that you use the numpad. There may be CBA options down the line if this has any uptake, but for now we’re working with numpad.

Technically you do not need VA software, and could operate the menu system with key presses (that is basically what VA does, i.e. converts your wishes into key presses). Keyboard is much less immersive, but does work if you’re not able to holler down the mic while playing (i.e. those who play in ‘shared space’).

Roadmap (not in order) ---------------------------------------------------------------------------

- implement inheritance in classes to save space
- implement cancel buttons in each pack
- implement group selection in unit VAUS - refactor UI
- fix issue where groups are deleted
- understand paradrop rules
- implement ranger's classes
- fix 'secure obj' issue
- design and build mission gen
- design and build better HC HUD
- design and build 'battle plan pack' enabling things like bounding overwatch
- implement stop and return to obj or me HC order
- implement behaviours instruction for HC
- implement waypoints for HC
- UI feedback for VAAS
- Fix HC objective issue
- Add icons and text to VAPS Markers
- Split HC HUD / top line with dashboard stats is different from the dist/heading HUD
- Amend VAUS and VAAS so that camo (or mod-pack) is selected 'before' the actual unit

^^^ = version 1.0

- test in MP
- more HC battle plan design
- Make VAUS more user friendly to enable player config
- More HC elements
- Better GUI / UI for VAA and VAHC
- Build out concept of Mission Params
- Build a better HC Distance / Heading HUD
- Ass sounds

^^^ = version 2.0

Good Practice --------------------------------------------------------------------------------------

When adding new UI

- create new classes in display.hpp
- ensure IDCs are correct, and relevant to the thing you are building (good IDC structure saves headache)
- ensure that any UI is shut down at the right time, probably during clearKeyDowns exec
- think about your layering when rendering
- UI execs can sit in the keyDownMonitor if you want on-screen data updates as you talk
- UI execs can also sit later down the chain, if all you want is a visual confirm of, say, an order

Notes ------------------------------------------------------------------------------------------------

04 sept note:
i need to be able to turn off ui for each pack
i may want some ui for, say, hc, but not for vavs or vaus
without ui, say, vaus would be much slicker
also consider creation of a spawn base vic, where vaus only works when near

another consideration ... if i say 5 in a mission, it may trigger unwanted bahavoiur
so change inital activators to include a modifier, as security

09 september
drafted roadmap

unstructured / older notes ---------------------------------------------------------------------------

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
