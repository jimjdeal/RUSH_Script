concept is to enable the user to go into the map, and designate primary and secondary targets
Also, can set 1 or numerous waypoints for units to follow

There are two obj settings - primary and secondary

When set, these can be used as location instructions
Move to Obj Secondary
Attack Obj Primary
etc

Waypoints can be set in the map, but must be executed in display 46

I would like to have some order when units arrive at a staging zone

to do this, you need to send the lead unit away, and then into the center, then set the formation auto to line

---

9 sept:
how would waypoints work?

enter 'waypointDesignation' state ('createRoute')?

while true, every time you click, a point is creeated and stored in an array, in sequence. Markers are also created.

a collection of waypoints, in an array, constitutes a 'route'.

Once a route is created, you can assign HC units to follow.

create a route, assign bravo 1, then, send bravo 1 to first waypoint in the array.

routes are designated as colours, and not specific to any HC group - multi-HCs can follow the same route

so ..

within map
"create route green"
(now it expects one or more points)
every mouseClick (or "here") sends that coord to an array
each point is a (green) circle
"confirm route" locks the waypoints
process should close here, as a use may want to designate a route without having to designate an HC group at the same time
so, here you can either exit or repeat...
"create route blue"
confirm route

within game
"bravo 1 you are assigned to route green"
checks that route green exists - if not, exit politely
"bravo 2 you are assigned to route blue"

"bravo 1 move out" - bravo1 is moved to first point in greenRouteHC array
"bravo 2 move out" - bravo1 is moved to first point in greenRouteHC array
or
"all units move out" --- how?

after moveOut order is given, set up a waitUntil, checking when leader of xGroup is <=20m of first point
at this time, delete marker and array element, and then send them to array pos 0 (as this is not the next point)
