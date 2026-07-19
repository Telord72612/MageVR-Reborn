Scriptname VRBP_SummonFX extends ActiveMagicEffect
{Aimed summon: drop a real, wearable backpack at the projectile's hit reference, or in
 front of the player if it hit open ground. Spawns Wet & Cold's "Heavy Leather Backpack"
 (0D5D56, slot 47, the ElSopa-retextured base our held mesh comes from) so it can be
 picked up and worn -- NOT the old non-pickable Static (0x000804).}

Event OnEffectStart(Actor akTarget, Actor akCaster)
    Form bag = Game.GetFormFromFile(0x0D5D56, "WetandCold.esp")
    If bag == None
        Return
    EndIf
    Actor pl = Game.GetPlayer()
    ObjectReference obj = pl.PlaceAtMe(bag, 1, False, False)
    If akTarget && akTarget != pl
        obj.MoveTo(akTarget)
    Else
        Float ang = pl.GetAngleZ()
        obj.SetPosition(pl.GetPositionX() + Math.Sin(ang) * 150.0, pl.GetPositionY() + Math.Cos(ang) * 150.0, pl.GetPositionZ())
        obj.SetAngle(0.0, 0.0, ang)
    EndIf
    Debug.Notification("Backpack summoned")
EndEvent
