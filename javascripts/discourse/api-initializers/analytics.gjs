/**
 * Google Tag Manager initializer
 */

import { apiInitializer } from "discourse/lib/api";

export default apiInitializer("1.0", () => {
  const gtmId = settings.gtm_id;
  if (!gtmId) return;

  window.dataLayer = window.dataLayer || [];
  window.dataLayer.push({ "gtm.start": new Date().getTime(), event: "gtm.js" });

  const script = document.createElement("script");
  script.async = true;
  script.src = `https://www.googletagmanager.com/gtm.js?id=${gtmId}`;
  document.head.appendChild(script);
});