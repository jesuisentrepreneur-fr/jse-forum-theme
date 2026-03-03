import { apiInitializer } from "discourse/lib/api";
import "discourse/tracking";

export default apiInitializer("1.0", () => {
/**
* Didomi consent banner initializer
*/
  const key = settings.didomi_key;
  if (!key) return;

  const preconnectLink = document.createElement("link");
  preconnectLink.rel = "preconnect";
  preconnectLink.as = "script";
  preconnectLink.href = "https://sdk.privacy-center.org/";
  document.head.appendChild(preconnectLink);

  const dnsPrefetchLink = document.createElement("link");
  dnsPrefetchLink.rel = "dns-prefetch";
  dnsPrefetchLink.as = "script";
  dnsPrefetchLink.href = "https://sdk.privacy-center.org/";
  document.head.appendChild(dnsPrefetchLink);

  const loaderScript = document.createElement("script");
  loaderScript.id = "spcloader";
  loaderScript.type = "text/javascript";
  loaderScript.async = true;
  loaderScript.charset = "utf-8";
  loaderScript.src = `https://sdk.privacy-center.org/${key}/loader.js?target=${document.location.hostname}`;
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