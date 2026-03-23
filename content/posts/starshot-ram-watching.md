+++
date = '2026-03-23T12:00:00-05:00'
draft = false
featuredImage = 'img/posts/starshot-ram-watching/featured-image.jpg'
subtitle = 'Using RAM watching to observe the impact of idle animations on speedrun strats'
title = 'Starshot RAM Watching'
+++

## Introduction

_Starshot: Space Circus Fever_ is a platformer game released by Infogrames in 1996 for both the Nintendo 64 and PC. Starshot was not considered a particularly good game, due mainly to its poor camera controls, low frame rate, and confusing level design. However, for me it is a fairly nostalgic game that my family owned when I was a kid. Back then, it felt like a pretty scary game, especially because the robots on the Earth level were three times your size and would chase you and fire missiles. Revisiting the game as an adult, it became my game of choice to speedrun. As of 2026, I hold the world record for every category in this extremely niche game, but not without the help of some incredible people in the speedrunning community. Together we have found countless glitches and tricks that have pushed the game down to under 40 minutes.

One particular glitch is the barrier re-entry on the level _Earth_. In this level, the entire map is surrounded by a tall red force field that will disintegrate you on touch. However, by carefully jumping off a robot to go out of the intended play area, we can walk around the entire level and reach the final objective, a house containing the last human alive. Then, through careful positioning and some pause buffering, we can "phase" right through the barrier to enter the last area and complete the level.

<div class="flex-stack">
  <figure style="flex: 1;">
    <img src="/img/posts/starshot-ram-watching/no-pause-buffering.gif" alt="Without pause buffering">
    <figcaption>One touch will result in instant death</figcaption>
  </figure>
  <figure style="flex: 1;">
    <img src="/img/posts/starshot-ram-watching/pause-buffering.gif" alt="With pause buffering">
    <figcaption>Via pause buffering, we can phase right through</figcaption>
  </figure>
</div>

This is a somewhat common glitch in video games that speedrunners often exploit to save respectable amounts of time or even skip right to the end of the game. It usually works because the barrier has a small enough thickness (or even no thickness at all) and the game will check the player's position in discrete steps (e.g., quarter-steps in Super Mario 64). Since the change in position is not continuous, oftentimes the player can skip right over the barrier with precise positioning or enough speed. Additionally, pause buffering is often used to either make the setup more exact or cause additional processing load. In these sorts of glitches, lag is your best friend. Some well-known examples of this type of exploit include:

- [Performing a backwards long jump (BLJ) on the infinite staircase (Super Mario 64)](https://youtu.be/IplE9J8KERk?si=HnWDbzRDPgYtBO_i&t=290)
- [Barrier Skip (The Legend of Zelda - The Wind Waker)](https://www.youtube.com/watch?v=yjrFQbzAlzU)

The barrier re-entry on the Earth level is a very punishing glitch to mess up, since there is obviously no checkpoint to tag while you're walking around the entire level. One small misalignment is an instant loss of almost two minutes on your speedrun. This led me to ask two questions:

- Where positionally can you successfully perform the trick?
- Does the idle animation of Starshot actually matter?

## Testing

To tackle the second question first, I was concerned that the initial speed and position of Starshot's steps might change due to having to exit the animation. I could test this by loading the game into an emulation, making a save state right before the animation starts, then performing attempts at different points during the animation. The result was that Starshot's animation appeared to have no effect on the success of the trick. However, I did notice something I had not paid attention to before. After about five seconds of idling, Starshot appeared to shift slightly backward. To explore deeper I needed some help from a RAM watcher.

The Bizhawk N64 emulator has some power tools such as TAS recording and Lua scripting. It also includes an interface to search and watch particular addresses in RAM for changes in value. I first had to search the RAM for where the position is tracked. The RAM search works by taking a snapshot and comparing it to later snapshots based on specified criteria. In my case, I first filtered for values that stayed the same while the game was paused. I then ran back and forth, filtering for values that increased and then decreased. I made the assumption that away from the level would be increasing and toward the level would be decreasing, which turned out to be true. Finally, I found a value that seemed to be the most accurate, up-to-date value for the axis position I was interested in.

<figure>
  <img src="/img/posts/starshot-ram-watching/testing-layout.png" alt="BizHawk emulator and RAM search/watch">
  <figcaption>BizHawk emulator and RAM tools</figcaption>
</figure>

I then allowed the idle animation to run and discovered that after about five seconds the position increased slightly, moving Starshot farther away from the barrier. Roughly every 28 seconds after that, another shift backwards would occur. And since there are positional bounds for whether the barrier re-entry trick would work, there is in fact a chance Starshot and your run could die if you let those initial 5 seconds elapse while preparing the setup for the trick.

_<small>
(These positional changes were not always predictable like this. Sometimes there would be multiple positive changes in a row. Other times, there would be a smaller negative change. It could be possible that using save states might have had some unintended consequences, but if anyone has thoughts on what could cause these positional changes, especially the inconsistent ones, please let me know.)</small>_

<figure>
  <img style="height: 384px;" src="/img/posts/starshot-ram-watching/position-changes.png" alt="Changes in position due to idle animation">
  <figcaption>Changes in position of <code style="font-size: 10px">1D5280</code> due to idle animation</figcaption>
</figure>

With the knowledge that idle animation shifts Starshot back slightly, I then had a simple setup to find the rough bounds for the exploit. I picked a position that was too close to the barrier, checked whether the trick could be performed, then let the idle animation continuously push me backwards, checking every time until the trick began to work, and later until it stopped working again. This resulted in the below table and GIFs showing the range of valid positions.

<figure>
  <img style="height: 192px;" src="/img/posts/starshot-ram-watching/position-bounds.png" alt="Positional bounds for barrier re-entry">
  <figcaption>Positional bounds for barrier re-entry</figcaption>
</figure>

<div class="flex-stack">
  <figure style="flex: 1;">
  <img src="/img/posts/starshot-ram-watching/closest.png" alt="Closest setup position">
  <figcaption>The closest position in which the glitch still works</figcaption>
</figure>

<figure style="flex: 1;">
  <img src="/img/posts/starshot-ram-watching/farthest.png" alt="Farthest setup position">
  <figcaption>The farthest position in which the glitch still works</figcaption>
</figure>
</div>

### Results

- Starshot's Idle animation causes a positional shift after about 5 seconds, and roughly every 28 seconds after.
- The barrier re-entry glitch works within a narrow positional window (as shown above)
- Allowing the idle animation to occur has a small chance of moving Starshot outside this window.

### Conclusion

By producing reference images for the setup and analyzing the idle animation, other speedrunners and I should hopefully have an easier time not losing a run to this particular trick. For speedrunners and glitch hunters in other games, I hope this encourages you to pull out a RAM watcher and explore your own games.
