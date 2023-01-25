import { Controller } from "@hotwired/stimulus";
import _ from "lodash";
export default class extends Controller {
  static targets = ["inputsearch","form"];

  connect() {
    const input = this.inputsearchTarget;
    const form = this.formTarget;
    input.addEventListener("keyup",_.debounce(function(){
      if (input.value.length > 2) {
        form.requestSubmit()
        console.log('azaz')
      }
    }, 1000,{
      leading: false,
      trailing: true
    }));
  }
}
