import Component from "@glimmer/component";
import { service } from "@ember/service";
import { on } from "@ember/modifier";         
import dIcon from "discourse-common/helpers/d-icon";

export default class HeaderSidebarToggleMobile extends Component {
  @service sidebar;

  toggle = () => this.sidebar?.toggle?.();

  <template>
    <button
      type="button"
      class="btn btn-flat header-sidebar-toggle"
      {{on "click" this.toggle}}
      aria-label="Toggle sidebar"
    >
      {{d-icon "bars"}}
    </button>
  </template>
}