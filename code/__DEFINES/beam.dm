// What beams can reuse instead of remaking. A beam only uses a flag that both /datum/beam/var/allowed_reuse_flags and its segment type's /obj/effect/ebeam/var/allowed_reuse_flags have

/// Segments share one emissive overlay per emissive setup (icon, icon state, alpha, emissive settings and plane offset) instead of each building their own. The same call makes the shared emissive and a segment's own emissive, so the two are identical.
/// Does nothing for a beam that isn't emissive
#define BEAM_REUSE_SHARED_EMISSIVES (1<<0)
/// On a redraw, the beam reuses an old segment when a new one lands on its turf, instead of deleting it and making another. Reused segments don't run Initialize() again, don't move, and can lose overlays they added themselves.
/// Leave it out if your segments do something when they're made or placed. /obj/effect/ebeam/launchpad leaves it out because each segment fades out from Initialize(), and a reused segment skips Initialize()
#define BEAM_REUSE_OLD_SEGMENTS (1<<1)
/// A finished beam's visuals (the effect every segment shows through vis_contents) go to the next beam with the same visuals setup (segment type, icon, icon state, color, emissive and layer) instead of being deleted. Visuals that were changed, or that anything still holds a reference to, get deleted as usual.
/// Leave it out if something keeps track of your visuals in a way a reference count can't see, like by REF() text. /obj/effect/ebeam/reacting leaves it out because connect_loc holds on to its visuals, so they never become spares anyway
#define BEAM_REUSE_SPARE_VISUALS (1<<2)
/// All of the above
#define BEAM_REUSE_ALL (BEAM_REUSE_SHARED_EMISSIVES | BEAM_REUSE_OLD_SEGMENTS | BEAM_REUSE_SPARE_VISUALS)
