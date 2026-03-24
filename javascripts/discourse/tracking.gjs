/** 
 * Global tracking by CSS class for GTM
 */

(function() {
  document.addEventListener("click", function(event) {
    // GTM tracking for sidebar category links
    const link = event.target.closest(".sidebar-section-link");
    if (link && link.closest(".sidebar-section")) {
      const ctaLabel = link.querySelector(".sidebar-section-link-content-text")?.textContent.trim() || link.textContent.trim();
      window.dataLayer?.push({
        event: "click.navigation",
        click: "forum_category",
        cta_label: ctaLabel,
        page: link.href,
      });
      return;
    }

    // GTM tracking for categories on the categories page
    const catItem = event.target.closest(".c-categories__item");
    if (catItem) {
      const h3 = catItem.querySelector("h3");
      const ctaLabel = h3 ? h3.innerText.trim() : "";
      window.dataLayer?.push({
        event: "click.navigation",
        click: "forum_category",
        cta_label: ctaLabel,
        page: catItem.querySelector("a")?.href || "",
      });
    }
  });
})();
