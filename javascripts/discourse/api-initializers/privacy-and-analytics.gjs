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
});
