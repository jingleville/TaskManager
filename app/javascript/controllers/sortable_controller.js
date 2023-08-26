import { Controller } from "@hotwired/stimulus"
import { patch } from "@rails/request.js"
import Sortable from "sortablejs";

// Connects to data-controller="sortable"
export default class extends Controller {
  connect() {
    this.sortable = new Sortable(this.element, {
      group: this.element.id,
      onEnd: async (e) => {
        try {
          console.log(e)
          const resp = await patch("/update_stage/"+e.item.id.split("project_")[1], {
            body: JSON.stringify({
              'old_stage': e.from.parentElement.id.split("stage_")[1],
              'new_stage': e.to.parentElement.id.split("stage_")[1]
            })
          })

          if (!resp.ok) {
            throw new Error('Can not reorder: ${resp.statusCode}')
          }

        } catch(e) {
          console.error(e)
        }
      }
    });
  }
}
