# Mage VR Reborn

**In-world VR interfaces for Skyrim VR** — real geometry you hold in your hands, not flat menus and not
SteamVR overlays. Three chapters ship in one installer; install any of them, or all three.

| Chapter | What it is |
|---|---|
| **1 — VR Backpack** | A *Walking Dead: Saints & Sinners*-style physical inventory. Reach over your shoulder, pull the bag into either hand, and browse your real inventory in 3D. Also powers container looting, a 5×5 personal storage upgrade, and full VR pickpocketing. |
| **2 — VR SpellBook** | A holsterable spellbook, and a way to cast without ever opening a menu — draw a glyph in the air to fire the spell bound to it. Plus dual casting, a two-handed shout gesture, summon portals, and a living stat page. |
| **3 — VR Lockpick** *(new)* | Locked chests wear a real lock. Take a lockpick in your hand, put its tip in the keyhole, and push the lock's teeth down in the right order. No lockpicking screen. |

> **Version 3.0.** The three chapters share one settings menu (MCM) and write ONE log:
> `Documents/My Games/Skyrim VR/SKSE/Mage VR Reborn.log` (lines tagged `[BP]`, `[SB]`, `[LP]` per chapter;
> the previous session is kept beside it as `Mage VR Reborn.log0`). A missing config file restores itself
> from a copy built into the plugins.

---

# What is new in V3.0

Everything below is new since V2.1.x.

### The backpack works in the right hand
- The bag opens in **whichever hand draws it**. The pointer, the buttons and the grab all move to your
  free hand by themselves.
- Pulling an item out and putting one back work with the bag in the right hand too — before, a pulled
  item fell to the ground and nothing could be stored.
- The **loot panel** now appears just above the hand that opened the container, wherever you stand, and
  **either hand** can point at it, take from it and drop into it.

### The open bag rides your controller, not the weapon node
- While the bag is open, its panels are attached to the **controller itself** instead of the hand's
  weapon bone. On some setups two systems were moving that bone every frame, and the whole layout shook.
  On the controller it is rock steady.
- Also gone: the layout sitting beside the bag instead of on it, and a second, ghost copy of the bag
  with a figure in the middle that swallowed your clicks.
- Equipping the Backpack Token **from a menu** now gives you the small closed bag (so you can put it in a
  holster) and tells you so on screen; drawing it from the holster opens it. If you never holster it,
  set `menumini=0` in `SKSE/Plugins/vrbp_opt.txt` and a menu equip opens the bag at once.

### A better highlight
- Pointing at something and selecting it no longer look the same. What your hand points at turns
  **light grey**; **white** is kept for what is selected or switched on.
- This is one look for the whole family: the SpellBook's tabs, spell cards, glyph box and favourites,
  and the Backpack's tabs, item slots, side menu, page arrows and the loot panel.
- Favourite spells in the book now glow at all times, so you can read them in the dark at a glance.
- The grey can be made lighter or darker: `hovgray` in `vrbp_opt.txt` (Backpack) and in
  `vrsb_spike.txt` (SpellBook), from 0.1 to 1.0.

### More glyph looks, and glyphs that stay bound
- **Three looks** for a cast glyph, chosen in the MCM under *Glyph appearance*: **Themed art** (the
  painted runes, as before), **Clean line** (a black rune with a thin rim in the spell's own colour),
  and **Lightning rune** (your stroke redrawn as a chain of lightning bolts that lights the room; the
  most demanding of the three).
- **Your glyphs now survive a change of load order.** Earlier versions remembered a spell by a number
  that contained its mod's position in the load order, so the glyphs of mod-added spells were lost
  whenever a plugin was added, removed or re-sorted in front of that mod. They are now remembered by
  mod file and spell. Your existing glyphs, hidden spells and favourite scrolls are taken over
  automatically the first time you start the game; nothing has to be bound again that still worked.
- Turning a page in the book clears the selection, so a button can no longer act on a spell of a page
  you have left.

### And specially: the lockpick (chapter 3)
A whole new chapter. See [Chapter 3 — VR Lockpick](#chapter-3--vr-lockpick) below.

### Also fixed
- **Skill experience.** Pickpocketing by hand gave several times the experience it should have, in
  every earlier release (the skill's own multiplier was applied twice). It now gives what the vanilla
  game gives. The same mistake in the pre-release builds of the lockpick is fixed as well: a lock picked
  by hand, and a broken pick, pay exactly what the game's own lock screen pays. Skill already gained is
  not taken back.
- A crash when opening a backpack tab that held something you made yourself — a potion you brewed, an
  item you enchanted.
- The plugins no longer fail to start when the game folder, the mod folder or your Windows user name
  contains letters outside the Western alphabet (Cyrillic, Japanese, accented letters).
- Much quieter log, and the config files are only read again when you change them.

---

# Chapter 1 — VR Backpack

## Features

### The backpack
- **Wear a backpack, get the system.** The mod detects the **Big Leather Backpack family** — the original
  standalone mod, Wet & Cold's big leather backpack (any color, including the tanning-rack craft), Legacy of
  the Dragonborn's backpack — **and every Campfire craftable backpack** (fur, with or without shrine
  amulets). Wearing one adds the **Backpack Token**; taking it off removes it. The *Small* Leather Backpack
  variants are not yet supported.
- **Draw it like a weapon.** The token holsters on your body via VRIK. Draw it with either hand and the
  full inventory UI unfolds — real geometry, readable in the dark, occludable by the world.
- **Never lose your token.** Re-equipping your backpack re-grants the token; removing the backpack removes it.

### Browsing
- **11 category tabs** mirroring the SkyUI inventory (Favorites, Weapons, Armor, Potions, Scrolls, Food,
  Ingredients, Books, Keys, Misc + the Character Sheet), with paging for large inventories.
- **Faithful per-item icons.** The icon resolver reproduces SkyUI / Inventory Injector (I4) rules — the icon
  you see in the backpack is the icon you see in your menus. The icon art ships with the mod.
- **Item inspection.** Select any item to see its name, class, type, damage/armor, weight, and value — plus a
  **3D miniature of the actual item** rendered on the plate.
- **Your arrangement persists.** Sort order and slot layout are saved with your game and survive restarts.

### Physical item handling (HIGGS)
- **Grab items out.** Grip an item in the grid and pull — it spawns in your free hand, physically held. Bring
  food to your mouth to eat it. Release it to drop it, or release at the backpack to store it back.
- **Whole stacks.** Double-grip pulls the entire stack as one pile; dropping a pile back stores all of it.

### Inventory management
- **Rearrange** by grabbing an item and dropping it on another slot — works across pages.
- **Merge** same items by dropping one onto the other; **split** stacks with a draggable slider.
- **Sort** by name / type / weight / value; **equip** to left hand / right hand / body; **favorite** toggle;
  **delete** with a confirmation popup.

### Looting & containers
- **Physical container looting.** Open any container and an in-world panel appears above the hand that
  opened it — grab items straight out into your hand instead of a flat menu. **TAKE EVERYTHING** empties it
  in one press. Either hand can use the panel.
- **Deposit into containers.** Drop a held item onto the panel to store it in that container.
- **5×5 Base Loot storage.** Use the **Base Loot coin** on any container to upgrade it into a personal
  **25-slot** storage chest — a proper stash for a player home.
- **Bag of Hoarding.** A bottomless hoard bag whose contents can be poured straight into a Base Loot chest.

### Pickpocketing
- **Sneak up and pickpocket by hand.** Sneak + reach into an NPC's pockets and the pickpocket panel appears —
  their pocketed items float in front of you.
- **Peek & reveal.** Pocket contents start masked (a **"?"**); point at the **Reveal** banner and pull the
  trigger to identify an item. Your reveal chance scales with your **Pickpocket skill**.
- **Steal by grabbing.** Each item shows a live **SUCCESS RATE** (your real pickpocket odds vs the target).
  Grab it to take it — succeed and it's yours, get caught and it's still in your hand but the target reacts.
- **Plant items.** Drop an item into their pocket. With the right perk, a planted **poison** is applied to them.
- **Real skill & perk integration.** Steal chance, skill experience and perk effects all run through Skyrim's
  own pickpocket system, so **vanilla *and* Adamant** perks work — including equipped-item theft with Perfect
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
- **Three looks** for the finished glyph: themed art, clean line, lightning rune (MCM, *Glyph appearance*).

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
  Hunger, thirst, sleep, cold and dirtiness rows appear only when the mod that supplies them is installed
  (iNeed, Frostfall, Bathing in Skyrim).
- **Per-item icons** that follow your Inventory Injector (I4) icon rules when you have them, and
  **hide/unhide per tab** so a page only shows what you care about.
- **Favourites** are for grab-and-pull: take one off the page and it is in your hand.
- **Delete spells and powers** you never use — they leave the normal magic menu too. Shouts are never
  deletable, and racial powers keep their once-a-day rule; this is not a cheat menu.

### The token
The **Spellbook Token** is granted automatically, once per character. Lost it? The MCM has an
**"Add Spellbook Token"** button.

---

# Chapter 3 — VR Lockpick

Locked containers wear a **real lock**, fixed to the chest itself. You open it with your hands and an
ordinary lockpick from your inventory. The game's lockpicking screen does not open on these locks.

## How to pick a lock

1. **Take a lockpick in your hand.** It is the normal Lockpick item. Drop one from your inventory and pick
   it up with HIGGS, or — with chapter 1 installed — pull one straight out of the backpack. Hold it like a
   small tool; the thin end is the tip.
2. **Walk up to the lock.** From far away a lock is a flat picture of itself. A few steps away it becomes the
   real thing: a round drum with a keyhole in the middle, a ring of **teeth** around the hole, and small
   **covers** above it — one for each latch still closed.
3. **Find the raised teeth.** Some of the teeth stand out into the keyhole. They have to go down **in one
   particular order**, which the lock keeps secret.
4. **Push a tooth down with the tip of the pick.**
   - **The right tooth** sinks all the way, clicks, and stays down.
   - **A wrong tooth** stops halfway with a scrape and springs back up when you let go. That is one
     **wrong push**, and the pick remembers it.
5. **Finish the latch.** When every raised tooth is down, the drum turns one step, a cover comes off, and
   a new set of teeth rises. The last latch turns the drum home and takes every cover off:
   **the lock is open.** The container is now unlocked — open it the usual way.

## What you need to know

- **Lock level decides the size of the puzzle.** A given chest always has the same number of latches
  and teeth.

  | Lock | Latches | Teeth per latch |
  |---|---|---|
  | Novice | 1–2 | 3–4 |
  | Apprentice | 2–4 | 3–5 |
  | Adept | 3–5 | 4–6 |
  | Expert | 4–7 | 4–7 |
  | Master | 6–7 | 6–7 |

- **Picks snap.** Each lockpick takes only so many wrong pushes. When it snaps, the tip drops, you are left
  holding the broken handle, and the latch you were on starts again (the order stays the same). The pick is
  gone; take a fresh one. The broken pieces disappear when you leave the area.
- **Skill does not make the lock smaller — it makes you better.**

  | Lock skill | The pick snaps on wrong push number | Teeth lit for you |
  |---|---|---|
  | up to 25 | 2 | none |
  | 26–50 | 3 | none |
  | 51–75 | 4 | the first tooth of each latch |
  | 76–99 | 5 | the first tooth of each latch |
  | 100 | 6 | the first two (the brighter one comes first) |

- **Perks count.** Perks that widen the lockpicking sweet spot make the "click" more forgiving, whatever
  perk overhaul you use. With the **Skeleton Key** (or a perk that makes picks unbreakable) picks never
  snap. The **Wax Key** perk gives you the copy of the key, as in the vanilla game.
- **It is still Skyrim.** A picked lock gives the same skill experience as the game's own screen, counts
  in your *Locks Picked* statistic, and picking a lock that belongs to someone while you are being watched
  is a crime.
- **A picked lock stays picked** — through saving, loading and restarting. Only the game itself locks a
  chest again, when a dungeon respawns, and then it wears its lock again.
- **Dwemer chests and the lockable trap triggers** carry locks of their own design. The idea is the same:
  find the teeth, push them in the right order.

## What is not covered

- **Doors.** Locked doors keep the game's own lock screen.
- **Locks that need a key.** They cannot be picked, so they get no lock at all.
- **A lock you cannot reach.** The lock is placed on the front of the container and moves to another side
  when the front is blocked; a container added by another mod is placed by its size alone. If a lock still
  ends up against a wall or out of reach, turn on **Vanilla lock menu** in the MCM (see below), pick that
  one with the game's own screen, and turn it off again.

## The "Vanilla lock menu" switch

MCM → *MageVR Reborn* → **VR Lockpick → Vanilla lock menu**.

- **Off** (default): activating a container that wears a lock opens nothing — you pick it by hand. A line
  on screen reminds you.
- **On**: the game's own lockpicking screen opens as well.

Anything that wears no lock of this mod (doors, key-only locks) always uses the game's own screen,
whatever the switch says. Without MCM Helper, the same switch is the line `vanillamenu=` in
`SKSE/Plugins/vrlp_anchors.txt` (0 = off, 1 = on; it is read while the game runs).

## If you use Hand to Hand - An Adamant Addon

That mod turns the Lockpicking skill into the unarmed skill and makes Pickpocket the **Security** skill
for locks and pockets. VR Lockpick follows it by itself: your **Security** skill decides how sturdy your
picks are and how many teeth are lit, and picking locks **trains Security**. (To force one or the other:
`skillav=lockpicking` or `skillav=pickpocket` in `vrlp_anchors.txt`.)

---

# All chapters

## Requirements

**Needed — the mod does not work without these:**

| Mod | Why |
|---|---|
| **Skyrim VR 1.4.15** | the current and final Skyrim VR. The lockpick plugin refuses to load on any other version. |
| [SKSE VR](http://skse.silverlock.org/) | the three plugins are SKSE VR plugins |
| [VR Address Library for SKSEVR](https://www.nexusmods.com/skyrimspecialedition/mods/58101) | the plugins find the game's functions through it |
| [Skyrim VR ESL Support](https://www.nexusmods.com/skyrimspecialedition/mods/106712) | all **four** plugin files of this mod (`MageVR Reborn.esp`, `VR Backpack.esp`, `VR SpellBook.esp`, `VR Lockpick.esp`) are ESL-flagged, and Skyrim VR cannot load ESL-flagged plugins by itself |
| **[HIGGS VR](https://www.nexusmods.com/skyrimspecialedition/mods/43930)** | every item you hold in your hand is held by HIGGS. See the note below for what each chapter does without it. **Minimum version: 1.10.4.** With an older HIGGS the lockpick chapter stands down (locks use the game's own screen, and a line on screen says so) and the backpack falls back to HIGGS's default grab distance. |
| **[VRIK Player Avatar](https://www.nexusmods.com/skyrimspecialedition/mods/23416)** | chapters 1 and 2: the body holsters the backpack and the spellbook are drawn from. Chapter 3 does not use it. |
| [Microsoft Visual C++ 2015-2022 Redistributable (x64)](https://learn.microsoft.com/en-us/cpp/windows/latest-supported-vc-redist) | a current one. Without it, or with a very old one, the plugins fail to load when the game starts. |
| A supported backpack to wear *(chapter 1 only)* | a Big Leather Backpack (the standalone mod, Wet & Cold, or Legacy of the Dragonborn) or any Campfire craftable backpack. Its textures are not needed: the bag model in your hand brings its own. |

**Optional:**

| Mod | Why | Without it |
|---|---|---|
| [MCM Helper](https://www.nexusmods.com/skyrimspecialedition/mods/53000) **1.3+, VR main file**, with [SkyUI VR](https://github.com/Odie/skyui-vr/releases) | the in-game settings page | Everything works on its defaults; there is just no settings page, and no "Add Spellbook Token" button. You can still change a setting by hand — see *Settings without the MCM* below. |
| [Inventory Injector (I4)](https://www.nexusmods.com/skyrimspecialedition/mods/85702) and its icon packs ([B.O.O.B.I.E.S.](https://www.nexusmods.com/skyrimspecialedition/mods/89241), [O.C.F.](https://www.nexusmods.com/skyrimspecialedition/mods/81469), [A.S.S.](https://www.nexusmods.com/skyrimspecialedition/mods/89823), [T.H.I.C.C.](https://www.nexusmods.com/skyrimspecialedition/mods/90508), [P.E.N.I.S.](https://www.nexusmods.com/skyrimspecialedition/mods/90526), [S.E.X.Y.](https://www.nexusmods.com/skyrimspecialedition/mods/105731)) | your menu icons and the icons in the bag and the book stay identical | Items and spells show the standard SkyUI-style icons. |
| iNeed, Frostfall, Bathing in Skyrim | the needs rows of the SpellBook's stat page | Those rows are simply not drawn. |
| Hand to Hand - An Adamant Addon | see chapter 3 | The Lockpicking skill is the lock skill, as in the vanilla game. |

> **Without HIGGS VR.** *VR Lockpick* switches itself off: no locks appear, every lock uses the game's own
> screen, and one line on screen says so. *VR Backpack* still opens, but an item you pull out drops to the
> ground instead of staying in your hand, and nothing can be put back by hand. *VR SpellBook* works; it
> only asks HIGGS to keep the book in your hand from knocking things about.

> **Without VRIK.** The plugins themselves do not need VRIK to load. But the tokens are meant to live in a
> VRIK holster; without one you would have to equip a token from a menu each time and sheathe and draw it
> to open it. This way of playing is not supported.

> **MCM missing or blank?** Three things, in order: (1) install MCM Helper's **VR** main file, not the SE
> one; (2) let **MCM Helper win over SkyUI VR** in your mod manager's priority — both ship a loose
> `SKI_ConfigMenu.pex`, and SkyUI VR has no BSA to lose to; (3) keep `MageVR Reborn.esp` **enabled and
> unrenamed** — MCM Helper matches the menu to a plugin of that exact name.
> `Documents/My Games/Skyrim VR/SKSE/MCMHelper.log` names the failure directly.

---

## Installation

1. Install the requirements above.
2. Install with your mod manager (MO2 recommended) through the installer. **Core is always installed** — it
   carries the shared settings menu — then tick **VR Backpack**, **VR SpellBook**, **VR Lockpick**, or any
   combination. No chapter needs another one.
3. Keep the plugin files enabled and do not rename them.
4. **Chapter 1:** in game, **wear a supported backpack**. The Backpack Token appears in your inventory
   automatically.
5. **Chapter 2:** the Spellbook Token is granted automatically, once per character. No crafting needed.
6. Equip a token, holster it on your body with VRIK, and draw it to open that interface.
   **Note:** the tokens count as knives, so to holster one on your shoulder you must allow knife shoulder
   holstering in the VRIK menu.
7. **Chapter 3:** nothing to do. Carry lockpicks and find a locked chest.

## Updating from V2.x

- Install V3.0 **in place of** the old version (in MO2: *Replace*) and keep playing. Your save, your bag
  arrangement, your glyphs, hidden spells and favourite scrolls are kept.
- **MO2 users, once after updating:** look in MO2's `overwrite` folder. If you find any of these there,
  **delete them**:
  `SKSE/Plugins/vrbp_*.txt`, `SKSE/Plugins/vrsb_spike.txt`, `SKSE/Plugins/vrsb_glyphs.txt`,
  `SKSE/Plugins/vrsb_glyphnorm.txt`, `SKSE/Plugins/vrlp_anchors.txt`,
  `MCM/Config/MageVR Reborn/settings.ini`.
  They are config files an older version restored for you because they were missing from the install.
  `overwrite` wins over every mod, so such a copy would hide the new version's settings.
- **Do not delete** `vrsb_binds*.txt`, `vrsb_hidden*.txt`, `vrsb_favscrolls*.txt`,
  `vrsb_glyphs_recorded.txt` or `MCM/Settings/MageVR Reborn.ini`. Those are yours: your glyphs, your
  hidden spells, your favourite scrolls and your MCM choices.
- Going back to V2.x after playing V3.0 loses the glyphs you bound under V3.0.

## PBR / ParallaxGen (PG Patcher) users

The book, the broken lockpick pieces and one of the locks use vanilla texture names, so a PBR patcher
makes its own patched copies of those models — and its copies win over this mod's files.
**Run your patcher again after installing or updating Mage VR Reborn.** Until you do, the patcher's
older copies are shown in place of the new models (or, on a first install, those models are not PBR
like the things around them).

---

## Controls

### VR Backpack

| Action | Input |
|---|---|
| Select tab / item / button | point with the free hand, **trigger** |
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

### VR Lockpick

| Action | Input |
|---|---|
| Hold a lockpick | grab it with HIGGS, like any object |
| Push a tooth | bring the tip of the pick into the keyhole and press the tooth down |
| Open the unlocked container | activate it, as usual |

The Backpack and SpellBook buttons can be changed in the MCM, and both hands can be set independently.

> **Casting mode is a hold, not a press.** A short press passes straight through to the game, so the button
> keeps its normal function. This matters under **OpenComposite / OCU**, where ACTIVATE is bound to **A** —
> the same button casting mode defaults to. Tune the hold length with `castholdms` in
> `SKSE/Plugins/vrsb_spike.txt` (milliseconds; read while the game runs), or pick a different casting button.

## The settings menu (MCM → MageVR Reborn)

| Setting | What it does |
|---|---|
| Pickpocket overlay / Loot overlay | Disabled (the vanilla screen), only while the backpack is drawn, or always on |
| Select button / Grab button | the buttons of the bag and the loot panel |
| Vanilla lock menu | see chapter 3 |
| Casting button hand, Casting mode button (per hand), Draw button | the buttons of glyph casting |
| Glyph appearance | Themed art / Clean line / Lightning rune |
| Add Spellbook Token | gives you a new token if you lost yours |

### Settings without the MCM

The plugins read the settings files themselves. To change a setting without MCM Helper, copy
`MCM/Config/MageVR Reborn/settings.ini` to `MCM/Settings/MageVR Reborn.ini` (in MO2: into `overwrite`
or into a mod of your own) and edit the copy. Do not edit the original — an update replaces it.

---

## Known limitations

- **Skyrim VR 1.4.15 only.**
- Text renders from a baked character atlas covering **A–Z, 0–9 and basic punctuation**. Accented and
  non-Latin characters draw as blanks, so localized item and spell names will show gaps.
- The *Small* Leather Backpack variants do not grant the Backpack Token yet.
- VR Lockpick: doors are not covered; the Dwemer lock and the trap lock have no far-away picture yet, so
  they appear when you are close; Falmer chests wear the plain steel lock.

---

## MageVR project and timeline

Completed
- **VR Backpack** Initial release
- **VR Backpack** Looting system
- **VR SpellBook** Initial release
- **VR SpellBook** Glyph casting, dual casting, shout gesture, summon portals, stat page
- **VR Backpack** Either hand
- **VR SpellBook** Three glyph looks
- **VR Lockpick** Initial release

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
