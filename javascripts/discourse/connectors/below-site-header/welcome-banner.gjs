/**
 * Welcome banner, shown below the header on discovery pages (homepage, categories...).
 * Replaces the "Welcome Link Banner" theme component (to disable in the admin) so that
 * the forum title is the page <h1> (SEO), the page title (Accueil, category...) being
 * the <h2> rendered by discovery-breadcrumbs.
 * Once dismissed, the title stays as a visually hidden <h1>, so that every discovery
 * page keeps exactly one H1 (see api-initializers/seo-headings.gjs).
 */
import Component from "@glimmer/component";
import { tracked } from "@glimmer/tracking";
import { action } from "@ember/object";
import { service } from "@ember/service";
import { htmlSafe } from "@ember/template";
import DButton from "discourse/components/d-button";
import I18n, { i18n } from "discourse-i18n";

// keyValueStore prefixes keys with "discourse_": this is the localStorage key of the
// former "Welcome Link Banner" component, so people who already dismissed it won't
// see it again. The store also copes with a disabled/blocked localStorage.
const DISMISSED_KEY = "dismissedWelcomeLinkBanner";

export default class WelcomeBanner extends Component {
  @service keyValueStore;
  @service router;

  @tracked dismissed = !!this.keyValueStore.getItem(DISMISSED_KEY);

  get isDiscoveryRoute() {
    return this.router.currentRouteName?.includes("discovery");
  }

  // Optional and decorative: lookup returns undefined (not a "missing translation"
  // placeholder) when the key is absent
  get emoji() {
    return I18n.lookup(themePrefix("welcome_banner.title_emoji"));
  }

  @action
  dismiss() {
    this.dismissed = true;
    this.keyValueStore.setItem(DISMISSED_KEY, true);
  }

  <template>
    {{#if this.isDiscoveryRoute}}
      {{#if this.dismissed}}
        <h1 class="c-welcome-banner__title sr-only">
          {{i18n (themePrefix "welcome_banner.title")}}
        </h1>
      {{else}}
        <div class="c-welcome-banner">
          <div class="wrap c-welcome-banner__inner">
            <div class="c-welcome-banner__box">
              <div class="c-welcome-banner__content">
                <div class="c-welcome-banner__heading">
                  <h1 class="c-welcome-banner__title">
                    {{i18n (themePrefix "welcome_banner.title")}}
                  </h1>
                  {{#if this.emoji}}
                    <span class="c-welcome-banner__emoji" aria-hidden="true">
                      {{this.emoji}}
                    </span>
                  {{/if}}
                </div>
                <div class="c-welcome-banner__subtitle">
                  {{htmlSafe (i18n (themePrefix "welcome_banner.subtitle"))}}
                </div>
              </div>

              <DButton
                @icon="xmark"
                @title="close"
                @ariaLabel="close"
                @action={{this.dismiss}}
                class="btn-flat c-welcome-banner__close"
              />
            </div>
          </div>
        </div>
      {{/if}}
    {{/if}}
  </template>
}
