# MageVR-Reborn
This is a reboot of MageVR. AWildMuken made an amazing mod that still today I'm using, but with SteamVR dropping support for older OVRlay, incompatibility with OCU and newer and more advanced mod technic and support, MageVR is showing it's age. It's a complete remade and an homage to an amazing mod that made SkyrimVR amazing for years

The intention for this mod is a full interactif backpack, spellbook and questlog, each being their own specific object that can be pulled out of VRIK holster to interact with in real time.

For functionality and how each of those work, please refer to the tutorial videos as each is a complex system with multiple function.

Tutorial book will be provided in game with the first time a token appear, you can refer to those for information.

## MageVR project and timeline
Completed
- **VR Backpack** Initial release.

In progress
- **VR Backpack** Looting system
- **VR Backpack** Adding different backpack layout and type
- **VR Spellbook** Initial release
- **VR Spellbook** Glyph Casting
- **VR QuestLog** Initial release
- **VR Questlog** VR Map integration



# VR Backpack — a physical inventory for Skyrim VR

A *Walking Dead: Saints & Sinners*-style *physical* backpack for Skyrim VR. Reach over your shoulder,
pull your backpack into your hand, and browse your **real inventory** on a fully 3D, in-world interface —
no flat menus, no SteamVR overlays. Point at an item, grab it, pull and it's **physically in your hand**.

> **Beta** — actively developed and tested on a large VR mod list. Feedback and logs welcome
> (in `SKSE/VRBackpack.log`).

---

## Features

### The backpack
- **Wear a "Big Leather Backpack" from crafting, LotD or Wet & Cold, get the system.** The mod detects
  the Big Leather Backpack family — Wet & Cold's big leather backpack (any color, including the
  tanning-rack craft) and Legacy of the Dragonborn's backpack. Wearing one adds the "Backpack Token";
  taking it off removes it. Other, smaller backpacks are ignored on purpose.
- **Draw it like a weapon.** The backpack token holsters in any (VRIK). Draw it and the full
  inventory UI unfolds on your hand — real geometry, readable in the dark, occludable by the world.
- **Lost your token? Re-equip your backpack give your token back. Removing it remove the token.

### Browsing
- **11 category tabs** mirroring the SkyUI inventory (Favorites, Weapons, Armor, Potions, Scrolls, Food,
  Ingredients, Books, Keys, Misc + the Character Sheet), with paging for large inventories.
- **Faithful per-item icons.** The icon resolver reproduces SkyUI / Inventory Injector (I4) rules —
  the icon you see in the backpack is the icon you see in your menus, including icon-pack art.
  Without I4 installed, icons automatically fall back to the standard SkyUI set.
- **Item inspection.** Select any item: name, class, type, damage/armor, weight, and value on the
  information panel — plus a **3D miniature of the actual item** rendered on the plate.

### Physical item handling (HIGGS)
- **Grab items out.** Grip an item in the grid, pull — it spawns in your hand, physically held.
  Bring food to your mouth to eat it. Release it to drop it. Release at the backpack to store it back.
- **Whole stacks.** Double-grab pulls the entire stack as one pile; dropping a pile back stores all of it.

### Inventory management
- **Rearrange** by grabbing an item and dropping it on another slot — works across pages.
- **Merge** same items by dropping one onto the other; **split** stacks with a draggable slider;
- **Sort** by name / type / weight / value; equip to left hand / right hand / body; favorite toggle;
  **delete** with a confirmation popup. Your arrangement is preserved while you play.

### Character Sheet
- **18 skill bars** with live levels and real XP progress (warrior / mage / thief color-coded,
  crafting skills in gray).
- **Player stats**: level, experience, experience to next level, dragon souls, unspent perk points.
- **Equipment display**: your worn gear laid out around your character — select any piece to see its
  stats and 3D preview on the information panel.
- **The wooden doll**: a small mannequin of your character stands at the center of the sheet, dressed
  in every piece of gear you're actually wearing (weapons, shields and the backpack itself excluded).

---

## Requirements

**Hard requirements** — the mod will not work without these:

| Mod | Why |
|---|---|
| [SKSE VR](http://skse.silverlock.org/) | the plugin is an SKSE VR plugin |
| [VR Address Library for SKSEVR](https://www.nexusmods.com/skyrimspecialedition/mods/58101) | version-independent function resolution |
| [HIGGS VR](https://www.nexusmods.com/skyrimspecialedition/mods/43930) | physical grab / hold / release of pulled items |
| [VRIK Player Avatar](https://www.nexusmods.com/skyrimspecialedition/mods/23416) | the shoulder holster the backpack draws from |
| [ElSopa HD – Big Backpack](https://www.nexusmods.com/skyrimspecialedition/mods/) | textures for the backpack model |
| [SkyUI VR](https://github.com/Odie/skyui-vr/releases) | the base icon set — every item icon falls back to SkyUI's icon language |

**Optional — highly recommended:**

| Mod | Why |
|---|---|
| [Inventory Injector (I4)](https://www.nexusmods.com/skyrimspecialedition/mods/85702) | per-item icon rules — your menu icons and backpack icons stay identical |
| B.O.O.B.I.E.S. / A.S.S. / P.E.N.I.S. / S.E.X.Y. icon packs | the extended icon art the I4 rules point at |
| Legacy of the Dragonborn | its backpack is part of the Big Leather Backpack family and works too |

> **No I4? No problem.** The backpack detects whether Inventory Injector is installed. With it, the
> backpack reproduces your exact I4 icon-pack icons. Without it, every item automatically falls back
> to the standard SkyUI icons — the same ones your inventory menu shows.

---

## Installation

1. Install the requirements above.
2. Install this mod with your mod manager (MO2 recommended). Enable `VR Backpack Test.esp` (ESL-flagged).
3. In game: **wear a Big Leather Backpack** (craft one at a tanning rack via Campfire / Wet & Cold). The backpack token appears in your inventory automatically.
4. Equip the token to a hand, then use VRIK holsters as usual — holster it on your shoulder, draw it
   to open the backpack. IMPORTANT: the token is considered a knife, so if you want the token on your shoulder, you got to authorize knife holstering over your shoulder in VRIK menu.

## Controls

| Action | Input |
|---|---|
| Select tab / item / button | point with the off hand, **trigger** |
| Change page | trigger on the page arrows |
| Grab an item (move / pull out) | **grab** over a slot |
| Pull item into your hand | grip + pull away from the backpack |
| Store item into backpack | release item in the backpack |
| Whole stack | **double-grip**, then pull |
| Rearrange / merge / split | grip an item, release over another slot |
| Store an item | release a held item at the backpack |

## Known limitations

- **ONLY WORK WITH THE LEFT HAND**  Right hand support will come eventualy. Everything need to be done from ground up as it's not just "mirror".
- **Skyrim VR only** (this is a VR interaction mod at its core).
- Item names render A–Z, 0–9 and basic punctuation (accented characters display as blanks).
- Slot arrangement currently resets on game restart (persistent arrangement is planned).

## Credits

- **AWildMuken** — original creator of MageVR and source of inspiration.
- **atom0s & the HIGGS/VRIK teams** (FlyingParticle, prog) — the VR foundations this mod stands on.
- **ElSopa** — the HD backpack textures this mod is built around.
- **The B.O.O.B.I.E.S. / Inventory Injector icon community** — the icon language this mod mirrors.

> Icon and texture assets derived from third-party mods are used with the goal of matching *your*
> installed setup. Redistribution permissions are being confirmed before public release — if you are
> an author of one of the referenced works and have concerns, please open an issue.

## License

Plugin source code: MIT (see `LICENSE`). Game assets remain under their original authors' terms.
