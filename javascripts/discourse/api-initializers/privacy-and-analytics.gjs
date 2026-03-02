import { apiInitializer } from "discourse/lib/api";
import "discourse/tracking";

export default apiInitializer("1.0", () => {
/**
* Didomi consent banner initializer
*/
  const key = settings.didomi_key;
  if (!key) return;

  const r = document.createElement("link");
  r.rel = "preconnect"; r.as = "script";
  const t = document.createElement("link");
  t.rel = "dns-prefetch"; t.as = "script";
  r.href = "https://sdk.privacy-center.org/";
  t.href = "https://sdk.privacy-center.org/";
  document.head.appendChild(r);
  document.head.appendChild(t);

  const n = document.createElement("script");
  n.id = "spcloader";
  n.type = "text/javascript";
  n.async = true;
  n.charset = "utf-8";
  n.src = `https://sdk.privacy-center.org/${key}/loader.js?target=${document.location.hostname}`;
  document.head.appendChild(n);

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