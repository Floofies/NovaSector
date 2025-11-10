# TBMC Events Base

This module is a fork of the [/tg/station Events Base](https://github.com/tgstation/event-base), which provides modular presets for events.

The events base is modular, meaning you should avoid editing code in the code folder itself.

## How Add Modules

Modules should be individual features/edits, packed into one.

`modular_event` houses two folders: one called `base`, and the other named whatever the event is called.

`base` should hold anything that makes sense and/or is likely to reused in other events. For example, multiple events want to limit jobs to only assistant and cyborg. Thus, the `limit_jobs` module exists in base.
