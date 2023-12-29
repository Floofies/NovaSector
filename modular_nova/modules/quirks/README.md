# Quirk Additions Module

This module is the receptacle for adding new Quirks (and their dependencies) which don't directly override the pre-existing TG Quirks.

If you want to override a stock TG quirk or one of it's vars/procs/behaviors, see the [Quirk Overrides Module](/modular_nova/master_files/code/modules/quirks/README.md)

### Policy Guidelines

**To Be Determined**

## Guide to Adding Quirks on Nova Sector

This module should contain any additional Quirks, and their unique dependencies such as new icons and components, which are completely seperate from TG quirks.

Your added Quirk should NOT distribute it's added dependencies across the folders of other modules or exist anywhere in `master_files`. Please implement your changes inside this module as much as possible. If some stock TG behavior/implementation is to be overridden, please use the [Quirk Overrides Module](/modular_nova/master_files/code/modules/quirks/README.md)

### Quirk Balancing

Nova Sector has a unique combat and roleplaying environment, and it can be influenced by Quirks. Quirks *may* give any degree of mechanical disadvantage to the Quirk holder. Quirks can also provide minor mechanical advantages to the Quirk holder. On Nova Sector, Quirks can easily be used to construct more unique characters, but may also sometimes cause a substantial balance-shift to the game. To limit balance-related issues, some Quirks are incompatible with each other, and are also blacklisted from certain jobs.

### Quirk Incompatability

The Quirk incompatability list is located within the file `code/controllers/subsystem/processing/quirks.dm`

The `quirk_blacklist` list associates Quirks which are incompatible with one another. Any Quirks listed adjacently to each other in the same list will conflict, and become un-selectable by the player if they attempt to add incompatible quirks. For example, the Quirks "No Guns", "Chunky Fingers", and "Stormtrooper Aim" are listed as incompatible with each other; selecting any Quirk in the list (such as "Chunky Fingers") will cause the rest of the Quirks in the list to become un-selectable by the player.

### Job Blacklisting & Exceptions

If your added Quirk provides a significant mechanical disadvantage to the player, you should blacklist it from Security/Command jobs which that player would not be able to perform at an ample proficiency.

The defines for the Quirk-Job blacklist are located within the file `code/DEFINES/~skyrat_defines/jobs.dm`

The `RESTRICTED_QUIRKS_EXCEPTIONS` list associates a blacklisted Quirk with another Quirk, which allows them to bypass the blacklist. For instance the Mute Quirk may be blacklisted from a job, and the Signer Quirk will whitelist the Mute Quirk for that job anyways, making it possible to play the game as a Captain who is mute but also proficient at sign-language.
