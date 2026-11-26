/**
 * Heading levels on discovery pages (SEO).
 * Discourse core renders a visually hidden <h1 id="topic-list-heading"> describing the
 * active filter ("Tous les sujets les plus récents"...). Our page H1 is the forum title
 * rendered by connectors/below-site-header/welcome-banner.gjs, so when it is present,
 * the core heading is swapped for a <div> with the same id and class: screen readers
 * still get it (the topic list is aria-labelledby it), but it is no longer a heading.
 *
 * Core offers no outlet or transformer around this heading, hence the DOM swap.
 * The original <h1> is put back before every transition, so Ember only ever updates or
 * removes the nodes it rendered. To remove if core adds an extension point.
 */
import { apiInitializer } from "discourse/lib/api";

const CORE_HEADING_SELECTOR = "h1#topic-list-heading";
const PAGE_TITLE_SELECTOR = "h1.c-welcome-banner__title";

// replacement <div> => original core <h1>
const swappedHeadings = new Map();

function demoteCoreHeading() {
  if (!document.querySelector(PAGE_TITLE_SELECTOR)) {
    return;
  }

  document.querySelectorAll(CORE_HEADING_SELECTOR).forEach((heading) => {
    const replacement = document.createElement("div");
    replacement.id = heading.id;
    replacement.className = heading.className;
    // Move (not copy) the children: Glimmer keeps updating its text node
    replacement.append(...heading.childNodes);
    heading.replaceWith(replacement);
    swappedHeadings.set(replacement, heading);
  });
}

function restoreCoreHeading() {
  swappedHeadings.forEach((heading, replacement) => {
    heading.append(...replacement.childNodes);
    replacement.replaceWith(heading);
  });
  swappedHeadings.clear();
}

export default apiInitializer((api) => {
  const router = api.container.lookup("service:router");

  // page:changed is triggered once the new route has rendered
  api.onPageChange(demoteCoreHeading);
  router.on("routeWillChange", restoreCoreHeading);
});
