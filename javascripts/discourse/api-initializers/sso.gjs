/* temporaire, à variabiliser pour le sso */

import { apiInitializer } from "discourse/lib/api";

export default apiInitializer((api) => {
    console.log(api.getCurrentUser() ? "User Authenticated !" : "User NOT Authenticated.");
    console.log(document?.cookie?.includes(`isAuthenticated=true`) ? "is authenticated on BP !" : "is NOT authenticated on BP.");
    // Only if the user isn't authenticated
    if (!api.getCurrentUser() && document?.cookie?.includes(`isAuthenticated=true`)) {
        // Redirect to the SSO login initiation route
        console.log("Cookie found, redirecting...");
        window.location.href = `https://forum.propulsebyca.fr/session/sso?return_path=/`;
    }
    
    
  api.onPageChange(() => {
    
    // Modification du lien de gestion de compte
    if (document.querySelector(".c-user-trigger")) {
        document.querySelector(".c-user-trigger").onclick = function() {
            // const menuProfileHeader = document.querySelector(".c-user-menu__profile")
            // if (menuProfileHeader) {
            //     menuProfileHeader.href = settings.lien_gestion_compte;
            //     menuProfileHeader.onclick = function() {
            //         window.location = settings.lien_gestion_compte;
            //     }
            // }
            // const menuProfileHeaderTextCTA = document.querySelector(".c-user-menu__profile-cta");
            // if (menuProfileHeaderTextCTA) {
            //     menuProfileHeaderTextCTA.innerHTML = "Gestion de compte"
            // }

            // Modification du lien de profil
            const menuProfileHeader = document.querySelector(".c-user-menu__profile")
            if (menuProfileHeader) {
                const currentUser = api.getCurrentUser();
                if (currentUser) {
                    // créer une URL vers ses préférences
                    menuProfileHeader.href = `/u/${currentUser.username}/preferences/account`;
                    menuProfileHeader.onclick = function() {
                        window.location = `/u/${currentUser.username}/preferences/account`;
                    }
                }
            }

            // Modification du wording de profil
            const menuProfileHeaderTextCTA = document.querySelector(".c-user-menu__profile-cta")
            if (menuProfileHeaderTextCTA) {
                menuProfileHeaderTextCTA.innerHTML = "Mon profil"
            }
            
            // Enlever le lien "invitations" du dropdown
            const menuProfileInvitations = document.querySelector(".c-user-menu__links li:nth-child(3)")
            if (menuProfileInvitations) {
                menuProfileInvitations.style.display = "none"
            }

            // Modifier "préferences" en "Paramètres du compte"
            const menuProfilePreferences = document.querySelector(".c-user-menu__links li:nth-child(4) a")
            if (menuProfilePreferences) {
                // changer le texte
                const span = menuProfilePreferences.querySelector("span");
                if (span) {
                 span.textContent = "Paramètres du compte";
                }
                
                // changer le href
                menuProfilePreferences.href = "https://compte.propulsebyca.fr/account-details?source=FORUM";
                menuProfilePreferences.onclick = function() {
                    window.location = "https://compte.propulsebyca.fr/account-details?source=FORUM";
                }
            }

            // Enlever les liens "À propos" et "Politique de confidentialité" du dropdown
            const aboutUsLink = document.querySelector(".c-user-menu__footer li:nth-child(1)");
            const privacyLink = document.querySelector(".c-user-menu__footer li:nth-child(3)");
            if (aboutUsLink) {
                aboutUsLink.style.display = "none";
            }
            if (privacyLink) {
                privacyLink.style.display = "none";
            }
            
            const cguLink = document.querySelector(".c-user-menu__footer li:nth-child(2) a");
            if (cguLink) {
                cguLink.href = "https://propulsebyca.fr/cgu-services-entreprendre";
                cguLink.target = "_blank";
            }
        };
    }
    
  }); 
});