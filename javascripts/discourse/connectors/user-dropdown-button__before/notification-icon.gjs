/**
 * Adds a bell icon to the header for notifications (placed next to the user's avatar).
 */
import Component from "@ember/component";
import { tagName } from "@ember-decorators/component";
import icon from "discourse/helpers/d-icon";

@tagName("")
export default class NotificationIcon extends Component {
  <template>{{icon "bell"}}</template>
}
