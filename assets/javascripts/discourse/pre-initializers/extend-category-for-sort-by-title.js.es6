import { withPluginApi } from "discourse/lib/plugin-api";

export default {
  name: "extend-category-for-sort-by-title",

  before: "inject-discourse-objects",

  initialize(container) {
    withPluginApi("0.8.30", api => { 
      api.addCategorySortCriteria("title");
    });
  }
};
