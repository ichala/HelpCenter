import { Controller } from "@hotwired/stimulus";
import _ from "lodash";
export default class extends Controller {
  static targets = ["inputsearch","form"];

  connect() {
    const input = this.inputsearchTarget;
    const form = this.formTarget;
    const loading = document.querySelector(".loading");
    input.addEventListener("keyup",_.debounce(function(){
      if (input.value.length > 2) {
        form.requestSubmit()
        loading.classList.add("hidden");
      }
    }, 1000,{
      leading: false,
      trailing: true
    }));

  }

  showLoading() {
    const loading = document.querySelector(".loading");
    loading.classList.remove("hidden");
  }


}
