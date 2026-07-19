Scriptname VRBP_GestureTelemetry extends Quest
{DISABLED 2026-07-12. Was a throwaway reach-over-LEFT-shoulder gesture-tuning prototype that
 printed dZ/dXY on-screen notifications on every raised-hand LEFT grip. Neutered for shipping:
 no notifications, no update loop. Left as an inert Quest so the attached ESP record still resolves.}

Event OnInit()
    ; telemetry removed -- no Debug.Notification, no RegisterForSingleUpdate.
EndEvent

Event OnUpdate()
    ; inert: a RegisterForSingleUpdate still pending from an OLD save fires here exactly once,
    ; then stops for good because we do NOT re-register.
EndEvent
