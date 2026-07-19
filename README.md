# Mage VR Reborn — VR Backpack (Chapter 1)

A *Walking Dead: Saints & Sinners*-style **physical** inventory for Skyrim VR. Reach over your shoulder,
pull your backpack into your hand, and browse your **real inventory** on a fully 3D, in-world interface —
no flat menus, no SteamVR overlays. Point at an item, grab it, pull, and it's **physically in your hand**.

The same in-world interface also powers **looting containers**, a **5×5 personal storage** upgrade, and a
full **VR pickpocketing** system — all diegetic, all in your hands.

> **Version 1.0.** Chapter 1 of the *Mage VR Reborn* project. Logs are written to `SKSE/VRBackpack.log`.

---

## Features

### The backpack
- **Wear a "Big Leather Backpack", get the system.** The mod detects the Big Leather Backpack family — Wet &
  Cold's big leather backpack (any color, including the tanning-rack craft) and Legacy of the Dragonborn's
  backpack. Wearing one adds the **Backpack Token**; taking it off removes it. Smaller backpacks are ignored
  on purpose.
- **Draw it like a weapon.** The token holsters on your body via VRIK. Draw it and the full inventory UI
  unfolds on your hand — real geometry, readable in the dark, occludable by the world.
- **Never lose your token.** Re-equipping your backpack re-grants the token; removing the backpack removes it.

### Browsing
- **11 category tabs** mirroring the SkyUI inventory (Favorites, Weapons, Armor, Potions, Scrolls, Food,
  Ingredients, Books, Keys, Misc + the Character Sheet), with paging for large inventories.
- **Faithful per-item icons.** The icon resolver reproduces SkyUI / Inventory Injector (I4) rules — the icon
  you see in the backpack is the icon you see in your menus, icon-pack art included. Without I4, icons fall
  back to the standard SkyUI set automatically.
- **Item inspection.** Select any item to see its name, class, type, damage/armor, weight, and value — plus a
  **3D miniature of the actual item** rendered on the plate.
- **Your arrangement persists.** Sort order and slot layout are saved with your game and survive restarts.

### Physical item handling (HIGGS)
- **Grab items out.** Grip an item in the grid and pull — it spawns in your hand, physically held. Bring food
  to your mouth to eat it. Release it to drop it, or release at the backpack to store it back.
- **Whole stacks.** Double-grip pulls the entire stack as one pile; dropping a pile back stores all of it.

### Inventory management
- **Rearrange** by grabbing an item and dropping it on another slot — works across pages.
- **Merge** same items by dropping one onto the other; **split** stacks with a draggable slider.
- **Sort** by name / type / weight / value; **equip** to left hand / right hand / body; **favorite** toggle;
  **delete** with a confirmation popup.

### Looting & containers
- **Physical container looting.** Open any container and the same in-world panel appears floating over it —
  grab items straight out into your hand instead of a flat menu. **TAKE EVERYTHING** empties it in one press.
- **Deposit into containers.** Drop a held item onto the panel to store it in that container.
- **5×5 Base Loot storage.** Use the **Base Loot coin** on any container to upgrade it into a personal
  **25-slot** storage chest — a proper stash for a player home. (Configurable in the MCM.)
- **Bag of Hoarding.** A bottomless hoard bag whose contents can be poured straight into a Base Loot chest.

### Pickpocketing
- **Sneak up and pickpocket by hand.** Sneak + reach into an NPC's pockets and the pickpocket panel appears —
  their pocketed items float in front of you.
- **Peek & reveal.** Pocket contents start masked (a **"?"**); point at the **Reveal** banner and pull the
  trigger to identify an item. Your reveal chance scales with your **Pickpocket skill**.
- **Steal by grabbing.** Each item shows a live **SUCCESS RATE** (your real pickpocket odds vs the target).
  Grab it to take it — succeed and it's yours, get caught and it's still in your hand but the target reacts.
- **Plant items.** Drop an item into their pocket. With the right perk, a planted **poison** is applied to them.
- **Real skill & perk integration.** Steal chance, skill XP, and perk effects all run through Skyrim's own
  pickpocket system, so **vanilla *and* Adamant** perks work — including equipped-item theft with Perfect
  Touch. Sleeping and unconscious targets are handled with the right odds.
- **Bullet-time.** Time slows while you work, so a real-world hand reach feels deliberate, not frantic.

### Character Sheet
- **18 skill bars** with live levels and real XP progress (warrior / mage / thief color-coded, crafting gray).
- **Player stats**: level, experience, experience to next level, dragon souls, unspent perk points.
- **Equipment display**: your worn gear laid out around your character — select any piece for its stats + 3D
  preview.
- **The wooden doll**: a small mannequin of your character, dressed in every piece of gear you're wearing
  (weapons, shields and the backpack itself excluded).

---

## Requirements

**Hard requirements — the mod will not work without these:**

| Mod | Why |
|---|---|
| [SKSE VR](http://skse.silverlock.org/) | the plugin is an SKSE VR plugin |
| [VR Address Library for SKSEVR](https://www.nexusmods.com/skyrimspecialedition/mods/58101) | version-independent function resolution |
| [Skyrim VR ESL Support](https://www.nexusmods.com/skyrimspecialedition/mods/106712) | both plugins are ESL-flagged and need VR ESL loading |
| **[VRIK Player Avatar](https://www.nexusmods.com/skyrimspecialedition/mods/23416)** | **your body + the shoulder holster the backpack draws from — mandatory** |
| **[HIGGS VR](https://www.nexusmods.com/skyrimspecialedition/mods/43930)** | **physical grab / hold / release of every item — mandatory** |
| [SkyUI VR](https://github.com/Odie/skyui-vr/releases) | the base icon set + the MCM framework |
| [MCM Helper VR](https://www.nexusmods.com/skyrimspecialedition/mods/53000) | the in-game settings menu |
| [ElSopa HD – Big Backpack](https://www.nexusmods.com/skyrimspecialedition/mods/36445) | textures for the backpack model |

**Optional — highly recommended:**

| Mod | Why |
|---|---|
| [Inventory Injector (I4)](https://www.nexusmods.com/skyrimspecialedition/mods/85702) | per-item icon rules — your menu icons and backpack icons stay identical |
| [B.O.O.B.I.E.S.](https://www.nexusmods.com/skyrimspecialedition/mods/89241) / / [O.C.F.](https://www.nexusmods.com/skyrimspecialedition/mods/81469) / [A.S.S.](https://www.nexusmods.com/skyrimspecialedition/mods/89823) / [T.H.I.C.C.](https://www.nexusmods.com/skyrimspecialedition/mods/90508) / [P.E.N.I.S.](https://www.nexusmods.com/skyrimspecialedition/mods/90526) / [S.E.X.Y.](https://www.nexusmods.com/skyrimspecialedition/mods/105731) icon packs | the extended icon art the I4 rules point at |
| Legacy of the Dragonborn | its backpack is part of the Big Leather Backpack family and works too |

> **No I4? No problem.** With Inventory Injector the backpack reproduces your exact I4 icon-pack icons;
> without it, every item falls back to the standard SkyUI icons — the same ones your inventory menu shows.

---

## Installation

1. Install the requirements above 
2. Install this mod with your mod manager (MO2 recommended) via the FOMOD.
3. In game: **wear a Big Leather Backpack** (craft one at a tanning rack via Campfire / Wet & Cold). The
   Backpack Token appears in your inventory automatically.
4. Equip the token, then holster it on your body with VRIK and draw it to open the backpack.
   **Note:** the token counts as a knife, so to holster it on your shoulder you must allow knife shoulder
   holstering in the VRIK menu.

---

## Controls

| Action | Input |
|---|---|
| Select tab / item / button | point with the off hand, **trigger** |
| Change page | trigger on the page arrows |
| Grab an item (move / pull out) | **grab** over a slot |
| Pull item into your hand | grip + pull away from the panel |
| Store item into backpack / deposit into a container | release a held item on the panel |
| Whole stack | **double-grip**, then pull |
| Rearrange / merge / split | grip an item, release over another slot |
| Take everything (loot) | trigger the **TAKE EVERYTHING** banner |
| Pickpocket | **sneak**, then reach into the NPC |
| Reveal a pocketed item | trigger the **Reveal** banner; grab to steal |

---

## Known limitations

- **Skyrim VR only** (this is a VR interaction mod at its core).
- Item names render A–Z, 0–9 and basic punctuation (accented characters display as blanks).

---

## MageVR project and timeline
Completed
- **VR Backpack** Initial release.
- **VR Backpack** Looting system

In progress
- **VR Backpack** Adding different backpack layout and type
- **VR Spellbook** Initial release
- **VR Spellbook** Glyph Casting
- **VR QuestLog** Initial release
- **VR Questlog** VR Map integration
---

## Credits

- **AWildMuken** — original creator of MageVR and source of inspiration.
- **prog / FlyingParticle** and the **HIGGS / VRIK** teams — the VR foundations this mod stands on.
- **ElSopa** — the HD backpack textures this mod is built around.
- **The B.O.O.B.I.E.S. / Inventory Injector icon community** — the icon language this mod mirrors.
- **CommonLibVR / SKSE VR** maintainers.

> Icon and texture assets derived from third-party mods are used to match *your* installed setup.



