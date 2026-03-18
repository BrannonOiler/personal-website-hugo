+++
date = '2026-03-19T14:18:09-05:00'
draft = true
featuredImage = 'img/posts/starshot-ram-watching/featured-image.jpg'
subtitle = 'Using RAM watching to observe the impact of idle animations on speedrun strats'
title = 'Starshot RAM Watching'
+++

## Introduction

_Starshot: Space Circus Fever_ is a platformer game released by Infogrames in 1996 for both the Nintendo 64 and PC. It is a fairly nostalgic game for me personally that my family owned when I was a kid. Back then, it was a confusing and often scary game (looking at you Earth robots), but later on became my game of choice to speedrun. As of 2026, I hold the world record for every category in this extremely niche game, but not without the help of some incredible people in the speedrunning community. Together we've found countless glitches and tricks to push this game down to under 40 minutes of game time.

One particular glitch is the barrier re-entry on the Earth level. By initially jumping off a robot to go out of the intended play area, we can walk around the entire level to get to the house at the end. Then, through a careful setup and some pause spamming, we can "phase" right through the barrier to enter the last area and complete the level.

<figure>
  <img src="your-gif-url.gif" alt="Description of the GIF">
  <figcaption>This is the caption for the GIF.</figcaption>
</figure>

### Changes in value of `1D5280`

| **ID**      | **Position** | **Delta**   |
| ----------- | ------------ | ----------- |
| 1           | 3260887841   |             |
| 2           | 3260894201   | 6360        |
| 3           | 3260899542   | 5341        |
| 4           | 3260906307   | 6765        |
| 5           | 3260910652   | 4345        |
| 6           | 3260917302   | 6650        |
| 7           | 3260923715   | 6413        |
| 8           | 3260930051   | 6336        |
| 9           | 3260935135   | 5084        |
| 10          | 3260941888   | 6753        |
| 11          | 3260948527   | 6639        |
| 12          | 3260954869   | 6342        |
| 13          | 3260961295   | 6426        |
| 14          | 3260968005   | 6710        |
| 15          | 3260974742   | 6737        |
| **Average** |              | **6207.21** |

- Changes position once after ~5 seconds and every ~28 seconds after that.
- Change of position is _away_ from the barrier
- Sometimes it's a smaller negative change
- Sometimes it's multiple changes in a row

### Starting Positions that worked (Values of `1D5280`)

| **Position Range**      | **Successful** |
| ----------------------- | -------------- |
| < 3260870868            | No             |
| 3260870868 - 3260879219 | Maybe          |
| 3260879219 - 3260916062 | Yes            |
| 3260916062 - 3260918837 | Maybe          |
| > 3260918837            | No             |

#### Closest Position

![Closest setup position](/img/posts/starshot-ram-watching/closest.png)

<small>_The closest position in which the glitch still works_</small>

#### Farthest Position

![Farthest setup position](/img/posts/starshot-ram-watching/farthest.png)

<small>_The farthest position in which the glitch still works_</small>

#### Pause Buffering

![Pause buffering](/img/posts/starshot-ram-watching/pause-buffering.gif)

<small>_Pause buffering_</small>

#### No Pause Buffering

![No pause buffering](/img/posts/starshot-ram-watching/no-pause-buffering.gif)

<small>_No pause buffering_</small>
