/* temporaire, à variabiliser pour le sso */

import { apiInitializer } from "discourse/lib/api";

export default apiInitializer((api) => {
    console.log(api.getCurrentUser() ? "User Authenticated !" : "User NOT Authenticated.");
    console.log(document?.cookie?.includes(`isAuthenticated=true`) ? "is authenticated on BP !" : "is NOT authenticated on BP.");
    // Only if the user isn't authenticated
    if (!api.getCurrentUser() && document?.cookie?.includes(`isAuthenticated=true`)) {
        // Redirect to the SSO login initiation route
        console.log("Cookie found, redirecting...");
        window.location.href = `https://staging-forum.propulsebyca.fr/session/sso?return_path=/`;
    }
    
    
  api.onPageChange(() => {
    
    // Change to account management link
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

            // Change profile link
            const menuProfileHeader = document.querySelector(".c-user-menu__profile")
            if (menuProfileHeader) {
                const currentUser = api.getCurrentUser();
                if (currentUser) {
                    // create a URL to their preferences
                    menuProfileHeader.href = `/u/${currentUser.username}/preferences/account`;
                    menuProfileHeader.onclick = function() {
                        window.location = `/u/${currentUser.username}/preferences/account`;
                    }
                }
            }

            // Change profile wording
            const menuProfileHeaderTextCTA = document.querySelector(".c-user-menu__profile-cta")
            if (menuProfileHeaderTextCTA) {
                menuProfileHeaderTextCTA.innerHTML = "Mon profil"
            }
            
            // Remove the "invitations" link from the dropdown
            const menuProfileInvitations = document.querySelector(".c-user-menu__links li:nth-child(3)")
            if (menuProfileInvitations) {
                menuProfileInvitations.style.display = "none"
            }

            // Change "preferences" to "Account Settings"
            const menuProfilePreferences = document.querySelector(".c-user-menu__links li:nth-child(4) a")
            if (menuProfilePreferences) {
                // change the text
                const span = menuProfilePreferences.querySelector("span");
                if (span) {
                 span.textContent = "Paramètres du compte";
                }
                
                // change href
                menuProfilePreferences.href = settings.account_management_link;
                menuProfilePreferences.onclick = function() {
                    window.location = settings.account_management_link;
                }
            }

            // Remove the "About Us" and "Privacy Policy" links from the dropdown
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