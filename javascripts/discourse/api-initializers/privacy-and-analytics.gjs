import { apiInitializer } from "discourse/lib/api";
import "discourse/tracking";

export default apiInitializer("1.0", () => {

/**
* TagCommander tracking container initializer
*/
  const tagCoTrackingScript = document.createElement("script");
  tagCoTrackingScript.id = "tagcommander-tracking-script";
  tagCoTrackingScript.type = "text/javascript";
  tagCoTrackingScript.async = true;
  tagCoTrackingScript.src = "https://cdn.tagcommander.com/7797/tc_Propulsebyca_20.js";
  document.head.appendChild(tagCoTrackingScript);

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

});
