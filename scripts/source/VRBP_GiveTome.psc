Scriptname VRBP_GiveTome extends Quest
{Start-game-enabled. Adds "Spell Tome: Summon Backpack" to the player once so the spell
 can be learned. Self-references the tome by FormID. ESP must stay named VR Backpack.esp.}

Bool Property bGiven = False Auto Hidden

Event OnInit()
    GiveOnce()
EndEvent

Function GiveOnce()
    If bGiven
        Return
    EndIf
    Form tome = Game.GetFormFromFile(0x000802, "VR Backpack.esp")
    If tome == None
        Return
    EndIf
    bGiven = True
    Game.GetPlayer().AddItem(tome, 1, False)
    Debug.Notification("Spell Tome: Summon Backpack added to your inventory.")
EndFunction
