/** 
 * Global tracking by CSS class for GTM
 */

(function() {
    console.log("Tracking initialized");
  document.addEventListener("click", function(event) {        
    // Category click tracking
    console.log("Click event detected", event.target);
      const link = event.target.closest(".sidebar-section-link");
    if (target) {
      if (window.dataLayer) {
        window.dataLayer.push({
          event: "click.navigation",
          click: "forum_category",
            cta_label: link.title,
            page: link.href,
        });
      }
    }
  });
})();
