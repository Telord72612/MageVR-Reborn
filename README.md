# Mage VR Reborn

**In-world VR interfaces for Skyrim VR** — real geometry you hold in your hands, not flat menus and not
SteamVR overlays. Two chapters ship in one FOMOD; install either, or both.

| Chapter | What it is |
|---|---|
| **VR Backpack** | A *Walking Dead: Saints & Sinners*-style physical inventory. Reach over your shoulder, pull the bag into your hand, and browse your real inventory in 3D. Also powers container looting, a 5×5 personal storage upgrade, and full VR pickpocketing. |
| **VR SpellBook** | A holsterable spellbook, and a way to cast without ever opening a menu — draw a glyph in the air to fire the spell bound to it. Plus dual casting, a two-handed shout gesture, summon portals, and a living stat page. |

> **Version 2.1.** Both chapters share one MCM. Logs go to `SKSE/VRBackpack.log` and `SKSE/VRSBSpike.log`.

---

# Chapter 1 — VR Backpack

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

# Chapter 2 — VR SpellBook

A spellbook you wear and pull off a VRIK holster. Its real job is that you stop opening the magic menu:
you bind a spell to a glyph once, then **draw that glyph in the air** to cast it.

## Features

### Glyph casting
- **Draw to cast.** Hold the casting button and the void tears open in front of you. Trace a stroke with the
  draw button, release, and the glyph snaps clean. Release the casting button to recognise it and fire.
- **Compound glyphs.** The first stroke is the main glyph; up to **four more** strokes add secondary glyphs,
  so one shape family covers a whole school.
- **Spells *and* scrolls.** Scrolls bind to glyphs like spells and are consumed on cast.
- **Cast or equip.** A glyph can fire the spell outright or just put it in your hand — your choice per binding.
- **The runes are alive.** Composing runes glow faintly as you draw; on a successful cast the finished glyph
  pulses from 80% to full brightness, shimmers, and dissolves.

### Dual casting
- **Both hands, at the same time.** Draw with both hands to dual cast. It is genuinely simultaneous — if one
  hand adds a secondary glyph the other does not match, **that side's glyph disappears** so you can see
  exactly which hand broke the pair.
- **Or keep them independent**, so you can hold a spell in one hand and draw with the other.

### Shouts
- **A two-handed gesture, not a button.** Reach out, pull the Voice in, then push forward and release.
- **Aimed by your arm.** The shout travels the direction you pushed — no headset targeting.
- **The real dragon voice** speaks the words as they fire, and the normal shout cooldown is respected.

### Summons
- **Portals with an arrival wait** that scales with the spell's tier — a master summon takes longer to land
  than an apprentice one.
- **The duration starts when the summon actually arrives**, not when you cast.
- **One at a time**, and a refused cast **never costs magicka**.

### The book itself
- **Per-school pages** with favourites, powers and scrolls, paged like the backpack.
- **A living stat page**, plus an **Arcane Insight** scan spell that reads the effects on whatever you look at.
- **Per-item icons** that light up, and **hide/unhide per tab** so a page only shows what you care about.
- **Delete spells and powers** you never use — they leave the normal magic menu too. Shouts are never
  deletable, and racial powers keep their once-a-day rule; this is not a cheat menu.

### The token
The **Spellbook Token** is granted automatically, once per character. Lost it? The MCM has an
**"Add Spellbook Token"** button.

---

# Both chapters

## Requirements

**Hard requirements — the mod will not work without these:**

| Mod | Why |
|---|---|
| [SKSE VR](http://skse.silverlock.org/) | the plugin is an SKSE VR plugin |
| [VR Address Library for SKSEVR](https://www.nexusmods.com/skyrimspecialedition/mods/58101) | version-independent function resolution |
| [Skyrim VR ESL Support](https://www.nexusmods.com/skyrimspecialedition/mods/106712) | all three plugins are ESL-flagged and need VR ESL loading |
| **[VRIK Player Avatar](https://www.nexusmods.com/skyrimspecialedition/mods/23416)** | **your body + the shoulder holster the backpack and spellbook draw from — mandatory** |
| **[HIGGS VR](https://www.nexusmods.com/skyrimspecialedition/mods/43930)** | **physical grab / hold / release of every item — mandatory** |
| [SkyUI VR](https://github.com/Odie/skyui-vr/releases) | the base icon set + the MCM framework |
| [MCM Helper](https://www.nexusmods.com/skyrimspecialedition/mods/53000) **1.3+, VR main file** | the in-game settings menu |
| [ElSopa HD – Big Backpack](https://www.nexusmods.com/skyrimspecialedition/mods/36445) | textures for the backpack model (Chapter 1 only) |

**Optional — highly recommended:**

| Mod | Why |
|---|---|
| [Inventory Injector (I4)](https://www.nexusmods.com/skyrimspecialedition/mods/85702) | per-item icon rules — your menu icons and backpack icons stay identical |
| [B.O.O.B.I.E.S.](https://www.nexusmods.com/skyrimspecialedition/mods/89241) / / [O.C.F.](https://www.nexusmods.com/skyrimspecialedition/mods/81469) / [A.S.S.](https://www.nexusmods.com/skyrimspecialedition/mods/89823) / [T.H.I.C.C.](https://www.nexusmods.com/skyrimspecialedition/mods/90508) / [P.E.N.I.S.](https://www.nexusmods.com/skyrimspecialedition/mods/90526) / [S.E.X.Y.](https://www.nexusmods.com/skyrimspecialedition/mods/105731) icon packs | the extended icon art the I4 rules point at |
| Legacy of the Dragonborn | its backpack is part of the Big Leather Backpack family and works too |

> **No I4? No problem.** With Inventory Injector the backpack reproduces your exact I4 icon-pack icons;
> without it, every item falls back to the standard SkyUI icons — the same ones your inventory menu shows.

> **MCM missing or blank?** Three things, in order: (1) install MCM Helper's **VR** main file, not the SE
> one; (2) let **MCM Helper win over SkyUI VR** in your mod manager's priority — both ship a loose
> `SKI_ConfigMenu.pex`, and SkyUI VR has no BSA to lose to; (3) keep `MageVR Reborn.esp` **enabled and
> unrenamed** — MCM Helper matches the menu to a plugin of that exact name.
> `Documents/My Games/Skyrim VR/SKSE/MCMHelper.log` names the failure directly.

---

## Installation

1. Install the requirements above.
2. Install with your mod manager (MO2 recommended) via the FOMOD. **Core is required** — it carries the
   shared MCM — then tick **VR Backpack**, **VR SpellBook**, or both.
3. **Chapter 1:** in game, **wear a Big Leather Backpack** (craft one at a tanning rack via Campfire /
   Wet & Cold). The Backpack Token appears in your inventory automatically.
4. **Chapter 2:** the Spellbook Token is granted automatically, once per character. No crafting needed.
5. Equip a token, holster it on your body with VRIK, and draw it to open that interface.
   **Note:** the tokens count as knives, so to holster one on your shoulder you must allow knife shoulder
   holstering in the VRIK menu.

Upgrading from V1.x is safe — overwrite and keep playing.

---

## Controls

### VR Backpack

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

### VR SpellBook

| Action | Input |
|---|---|
| Enter casting mode | **hold** the casting button (default **A / X**) |
| Trace a glyph stroke | hold the **draw** button (default trigger) and move your hand |
| Next stroke (secondary glyph) | release and press the draw button again — up to 4 more |
| Cast the finished glyph | **release** the casting button |
| Dual cast | draw with **both hands at once** |
| Shout | reach out, pull the Voice in, then **push forward and release** — the push aims it |
| Open the book | holster the Spellbook Token with VRIK and draw it |

Every button above is remappable in the MCM, and both hands can be configured independently.

> **Casting mode is a hold, not a press.** A short press passes straight through to the game, so the button
> keeps its normal function. This matters under **OpenComposite / OCU**, where ACTIVATE is bound to **A** —
> the same button casting mode defaults to. Tune the hold length with `castholdms` in
> `SKSE/Plugins/vrsb_spike.txt` (milliseconds; reloads live, no restart), or pick a different casting button.

---

## Known limitations

- **Skyrim VR only** (this is a VR interaction mod at its core).
- Text renders from a baked character atlas covering **A–Z, 0–9 and basic punctuation**. Accented and
  non-Latin characters draw as blanks, so localized item and spell names will show gaps. Wider character
  support is on the list.

---

## MageVR project and timeline

Completed
- **VR Backpack** Initial release
- **VR Backpack** Looting system
- **VR SpellBook** Initial release
- **VR SpellBook** Glyph casting, dual casting, shout gesture, summon portals, stat page

In progress
- **VR Backpack** Adding different backpack layout and type
- **VR QuestLog** Initial release
- **VR QuestLog** VR Map integration
---

## Credits

- **AWildMuken** — original creator of MageVR and source of inspiration.
- **prog / FlyingParticle** and the **HIGGS / VRIK** teams — the VR foundations this mod stands on.
- **ElSopa** — the HD backpack textures this mod is built around.
- **The B.O.O.B.I.E.S. / Inventory Injector icon community** — the icon language this mod mirrors.
- **CommonLibVR / SKSE VR** maintainers.

> Icon and texture assets derived from third-party mods are used to match *your* installed setup.



