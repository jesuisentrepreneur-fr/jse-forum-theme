import { apiInitializer } from "discourse/lib/api";
import "discourse/tracking";

export default apiInitializer("1.0", () => {
/**
*  TagCommander consent banner initializer
*/
  if (document.getElementById("tagcommander-script")) {
    return;
  }

  const preconnectLink = document.createElement("link");
  preconnectLink.rel = "preconnect";
  preconnectLink.as = "script";
  preconnectLink.href = "https://cdn.trustcommander.net";
  document.head.appendChild(preconnectLink);

  const dnsPrefetchLink = document.createElement("link");
  dnsPrefetchLink.rel = "dns-prefetch";
  dnsPrefetchLink.as = "script";
  dnsPrefetchLink.href = "https://cdn.trustcommander.net";
  document.head.appendChild(dnsPrefetchLink);

  const loaderScript = document.createElement("script");
  loaderScript.id = "tagcommander-script";
  loaderScript.type = "text/javascript";
  loaderScript.async = true;
  loaderScript.charset = "utf-8";
  loaderScript.src = "https://cdn.trustcommander.net/privacy/7797/privacy_v2_1.js";
  document.head.appendChild(loaderScript);

/**
* Google Tag Manager initializer
*/
  const gtmId = settings.gtm_id;
  if (!gtmId) return;

  window.dataLayer = window.dataLayer || [];
  window.dataLayer.push({ "gtm.start": new Date().getTime(), event: "gtm.js" });

  const script = document.createElement("script");
  script.async = true;
  script.src = `https://www.googletagmanager.com/gtm.js?id=${gtmId}`;
  document.head.appendChild(script);
});