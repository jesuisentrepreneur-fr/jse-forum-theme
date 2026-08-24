/** 
 * Global tracking by CSS class for TagCo
 */

(function() {
  document.addEventListener("click", function(event) {
    // TagCo tracking for sidebar category links
    const link = event.target.closest(".sidebar-section-link");
    if (link && link.closest(".sidebar-section")) {
      const ctaLabel = link.querySelector(".sidebar-section-link-content-text")?.textContent.trim() || link.textContent.trim();
      window.tC?.event?.click_navigation?.({
        event_name: "click_navigation",
        click: "forum_category",
        cta_label: ctaLabel,
        page: link.href,
        pagechapter1: "Forum",
        environment: settings.tag_co_environment,
      });
      return;
    }

    // TagCo tracking for categories on the categories page
    const catItem = event.target.closest(".c-categories__item");
    if (catItem) {
      const h3 = catItem.querySelector("h3");
      const ctaLabel = h3 ? h3.innerText.trim() : "";
      window.tC?.event?.click_navigation?.({
        event_name: "click_navigation",
        click: "forum_category",
        cta_label: ctaLabel,
        page: catItem.querySelector("a")?.href || "",
        pagechapter1: "Forum",
        environment: settings.tag_co_environment,
      });
    }
  });
})();
