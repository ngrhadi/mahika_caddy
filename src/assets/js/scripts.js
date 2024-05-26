document.addEventListener("DOMContentLoaded", (event) => {
  gsap.registerPlugin(ScrollTrigger);

  /*-- ScrollTrigger 1: sections scroll and snap vertically ------*/
  let sections = gsap.utils.toArray('section');
  let snap = value => value; // a snapping function that we'll set later in a "refresh" event listener because we need all the ScrollTrigger positions to get calculated first

  // this ScrollTrigger covers the entire page and is just for snapping logic
  ScrollTrigger.create({
    start: 0,
    end: "max",
    snap: {
      snapTo: (value, self) => snap(value, self.direction),
      duration: { min: 0.2, max: 0.4 },
      delay: 0,
    }
  });

  /*---ScrollTrigger 2: horizontal scroll in section ".sample" --*/

  let panels = gsap.utils.toArray(".sample .panel");

  let panelTween = gsap.to(panels, {
    xPercent: -100 * (panels.length - 1),
    ease: "none",
    scrollTrigger: {
      trigger: ".sample",
      start: "top top",
      end: "+=" + (innerWidth * 3),
      // markers: true,
      pin: true,
      scrub: 0,
    },
  });

  // we create a ScrollTrigger for each section just so we can figure out where they're positioned (when their top hits the top of the viewport)
  let sectionTriggers = sections.map(section => ScrollTrigger.create({
    trigger: section,
    start: "top top",
    refreshPriority: -1 // just so they get calculated last
  }));

  // after ScrollTrigger refreshes, we create a snap function that's directional.
  ScrollTrigger.addEventListener("refresh", () => {
    let start = panelTween.scrollTrigger.start,
      end = panelTween.scrollTrigger.end,
      each = (end - start) / (panels.length - 1), // each panel takes up a certain distance
      max = ScrollTrigger.maxScroll(window),
      sectionPositions = sectionTriggers.map(trigger => trigger.start / max); // snapping values must be in ratios (between 0 and 1)
    panels.forEach((panel, i) => sectionPositions.push((start + i * each) / max)); // add the panel positions
    snap = ScrollTrigger.snapDirectional(sectionPositions); // a snapping function that we can just feed a scroll value to and a direction and it'll spit back the closest one (ratio/progress) in that direction
  });
});
