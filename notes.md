next phase:
 build a way to control your two blu markers, anid then control movement to said markers
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

    



            


