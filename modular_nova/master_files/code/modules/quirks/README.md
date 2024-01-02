# Quirk Overrides Module

This module is the receptacle for overrides of pre-existing TG Quirks.

If you want to override a stock TG quirk or one of it's vars/procs/behaviors, this is the module to use.

If you're trying to add a new Quirk, or want to learn more about Nova Sector's Quirks, see the [Quirk Additions Module](/modular_nova/modules/quirks/README.md)

### TG Proc/File Changes:

- code/modules/client/preferences.dm - Sanitizing preferences
- /datum/quirk/foreigner - Hides the quirk
- /datum/quirk/all_nighter - Changes the icon
- /datum/quirk/blooddeficiency, add_to_holder() - Quirk subtypes for slimes & synths
- /datum/brain_trauma/severe/monophobia/proc/stress_reaction() - Remove heartattack from Monophobia
