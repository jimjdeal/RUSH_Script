UI for VAUS

On trigger, you need a title tht will exist for the duration of the process

eg top left, one line, VA Unit Spawner

or should it be very obvious, in front of main view?

or bottom line .. the interface line?

central screen would work better for other displays
so use middle top third for title, all central

..

so trigger script, you get a title that remains for length of call

then also immediately you get your first question:
Confirm method of control: <br/>
Direct Command or High Command

VA Unit Spawner

Group: <br/> Camo: <br/> Command: <br/> Confirm: <br/>
<br/> <br/> <br/> <br/>
Platooon x 20 <br/> Altis <br/> Direct Command <br/> Create <br/>
Fire Team x 4 <br/> Desert <br/> High Command <br/> Cancel <br/>
Sniper Team x 2 <br/> Woodland <br/>
AT team x 3 <br/>
AA team x 3 <br/>
Engineering Team x 2 <br/>
Demolition Team x2<br/>
Medic team x 4 <br/>

When chosen, the list is replaced with the selection, so we need individual renders for each team
That is ok, as you can re-use the ID for this list

then next to the end of the selection line, a new list appears:

Confirm method of control: <br/>
Direct Command or High Command

Title and columns can be rendered on activation
Also on activation are the options for command
Once selected, command choices is replaed with selection, and group list is rendered
Once selected, group choices is replaced with selection and so on
Only diff - we want a line at the base of the display that activates when all choices made
confirm / cancel
we need a final message to manage feedback here
either "creating units" or "spawner cancelled"
