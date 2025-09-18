/* temporaire, à variabiliser pour le sso */

import { apiInitializer } from "discourse/lib/api";

export default apiInitializer((api) => {
    console.log(api.getCurrentUser() ? "User Authenticated !" : "User NOT Authenticated.");
    console.log(document?.cookie?.includes(`isAuthenticated=true`) ? "is authenticated on BP !" : "is NOT authenticated on BP.");
    // Only if the user isn't authenticated
    // if (!api.getCurrentUser() && document?.cookie?.includes(`isAuthenticated=true`)) {
    //     // Redirect to the SSO login initiation route
    //     console.log("Cookie found, redirecting...");
    //     window.location.href = `https://staging-forum.propulsebyca.fr/session/sso?return_path=/`;
    // }
    
    
  api.onPageChange(() => {
    
    // Modification du lien de gestion de compte
    if (document.querySelector(".c-user-trigger")) {
        document.querySelector(".c-user-trigger").onclick = function() {
            const menuProfileHeader = document.querySelector(".c-user-menu__profile")
            if (menuProfileHeader) {
                menuProfileHeader.href = settings.lien_gestion_compte;
                menuProfileHeader.onclick = function() {
                    window.location = settings.lien_gestion_compte;
                }
            }
            const menuProfileHeaderTextCTA = document.querySelector(".c-user-menu__profile-cta");
            if (menuProfileHeaderTextCTA) {
                menuProfileHeaderTextCTA.innerHTML = "Gestion de compte"
            }
        };
    }
    
  }); 
});