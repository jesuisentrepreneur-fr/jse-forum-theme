/** 
 * Global tracking by CSS class for GTM
 */

(function() {
    console.log("Tracking initialized");
  document.addEventListener("click", function(event) {        
    // Category click tracking
    console.log("Click event detected", event.target);
    let node = event.target;
    while (node) {
      console.log("Node:", node, "Classes:", node.className, "Tag:", node.tagName);
      if (node.classList && node.classList.contains("sidebar-section-link")) {
        console.log("FOUND LINK:", node);
        break;
      }
      node = node.parentElement;
    }
    const link = event.target.closest(".sidebar-section-link");
    if (link && link.closest(".sidebar-section")) {
      const lastSpan = link.querySelector("span span") || link.querySelector("span") || link;
      const ctaLabel = lastSpan.textContent.trim();
      if (window.dataLayer) {
        window.dataLayer.push({
          event: "click.navigation",
          click: "forum_category",
          cta_label: ctaLabel,
          page: link.href,
        });
      }
    }
  });
})();
