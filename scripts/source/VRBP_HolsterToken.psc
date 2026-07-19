Scriptname VRBP_HolsterToken extends Quest
{EQUIP build: the token IS the backpack (a weapon mesh with valid layer-5 collision),
 so drawing it from any VRIK holster shows the backpack in-hand - engine-attached and
 smooth like any weapon, no spawn / no pin / no plugin in the display path. This script
 GATES the token: added while a backpack is worn (slot 47), removed when it comes off.
 SAFEGUARD: while the VRBP is DRAWN (the token is equipped / pulled out of the holster),
 taking the worn backpack off does NOT yank the token mid-use - removal is DEFERRED until
 the player HOLSTERS the VRBP (unequips the token), so the UI can never vanish in-hand.
 Logs to Logs\Script\User\VRBackpack.log.}

Weapon Token
Actor PlayerRef
Bool bWornLast = false
Bool bPendingRemove = false   ; backpack came off while the VRBP was drawn -> remove the token once holstered

Event OnInit()
    Debug.OpenUserLog("VRBackpack")
    PlayerRef = Game.GetPlayer()
    Token = Game.GetFormFromFile(0x000808, "VR Backpack.esp") as Weapon
    Log("=== OnInit (equip build, deferred-removal safeguard) === token=" + (Token != None))
    RegisterForSingleUpdate(0.5)
EndEvent

Event OnUpdate()
    ; GATE (user rule): ONLY the Big Leather Backpack family counts -- the ElSopa-textured meshes
    ; (Wet & Cold big leather incl. crafted/color variants, LotD lbackpack). Other slot-47 backpacks
    ; must NOT grant the token. The check lives in the plugin: VRBP_Native.IsBigBackpack.
    Bool wornNow = VRBP_Native.IsBigBackpack(PlayerRef.GetWornForm(0x00020000))

    If wornNow && !bWornLast
        ; --- backpack put ON ---
        If PlayerRef.GetItemCount(Token) < 1
            PlayerRef.AddItem(Token, 1, true)
        EndIf
        bPendingRemove = false   ; backpack back on -> cancel any pending removal
        Debug.Notification("Backpack on - the Backpack Token is in your inventory; holster + draw it")
        Log("GATE: backpack equipped -> token added")

    ElseIf !wornNow && bWornLast
        ; --- backpack just came OFF ---
        If PlayerRef.IsEquipped(Token)
            ; the VRBP is DRAWN (pulled out) -> do NOT remove it mid-use; wait until it's holstered
            bPendingRemove = true
            Log("GATE: backpack removed while VRBP DRAWN -> token removal DEFERRED until holstered")
        Else
            RemoveTokenNow()
        EndIf
    EndIf

    ; deferred removal: backpack is OFF and the VRBP is now HOLSTERED (token unequipped) -> remove it now
    If bPendingRemove && !wornNow && !PlayerRef.IsEquipped(Token)
        RemoveTokenNow()
        bPendingRemove = false
        Log("GATE: VRBP holstered after backpack-off -> deferred token removal completed")
    EndIf

    bWornLast = wornNow
    RegisterForSingleUpdate(0.5)
EndEvent

Function RemoveTokenNow()
    If PlayerRef.IsEquipped(Token)
        PlayerRef.UnequipItem(Token, false, true)
    EndIf
    PlayerRef.RemoveItem(Token, PlayerRef.GetItemCount(Token), true)
    Debug.Notification("Backpack off - token removed")
    Log("GATE: token removed")
EndFunction

Function Log(String msg)
    Debug.TraceUser("VRBackpack", "[VRBP] " + msg)
EndFunction
