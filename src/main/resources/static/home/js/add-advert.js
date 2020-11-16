Vue.use(VueFormWizard)

new Vue({
    el: '#add-advert',
    data: {
        /*Global Var*/
        errorMessage: '',
        subtitle: 'Kategori Seçimi',
        advert: {
            baslik: "",
            aciklama: "",
            toplamAdet: 0,
            toplamFiyat: 0,
            kimden: "",
            showcase: false,

        },
        /**Category Step */
        category: null,
        selectedCategory: null,
        selectedCategories: [],
        /**Kategori Step */
        /**Tip Step */
        tips: null,
        selectedTips: [],
        nonSelectedTips: [],
        isProcessSelectTipFinish: false,
        /**Tip Step */

    },

    methods: {
        onComplete: function () {
            alert('Yay. Done!');
        },
        beforeTabSwitchCategory: function () {
            if (this.selectedCategory == null) {
                this.errorMessage = "Bir Kategori Seçmelisiniz"
                setTimeout(() => this.errorMessage = '', 3000)
                return false;
            } else {
                this.tips = this.selectedCategory.tips;
                return true;
            }

        },
        beforeTabSwitchTip: function () {
            if (this.selectedTips == 0) {
                this.errorMessage = " * Seçtiğiniz kategoriye ait bir veya daha fazla tip seçmelisiniz"
                setTimeout(() => this.errorMessage = '', 3000)
                return false;
            } else {
                this.isProcessSelectTipFinish = true;
                return true;
            }

        },
        /*Tip Step */
        handleSelectTip(event, id) {
            let filteredTips = []
            if (event.target.className === "list-group-item list-group-item-action") {
                event.target.className = "list-group-item list-group-item-action active";
                this.tips.forEach(e => {
                    if (e.id == id) {
                        this.selectedTips.push(e);
                        return;
                    }
                });
            } else {
                event.target.className = "list-group-item list-group-item-action";
                this.selectedTips.forEach(e => {
                    if (e.id == id) {
                        return;
                    }
                    filteredTips.push(e);
                })
                this.selectedTips = filteredTips;
            }
            console.log(this.selectedTips);

        },
        changeTips() {
            this.selectedTips = [];
            this.nonSelectedTips = [];
            this.isProcessSelectTipFinish = false;
        },
        /*Tip Step */
        /*Category Step */
        handleSelectCategory(item) {
            if (item.subCategories.length > 0 || item.selectedCategories != null) {
                this.category = item.subCategories;
                this.selectedCategories.push(item);
            } else {
                this.selectedCategory = item;
                this.selectedCategories.push(item);
            }
        },
        changeCategory() {
            this.getParentCategories();
            this.selectedCategories = [];
            this.selectedCategory = null;
        },
        /*Category Step */
        /*Get Category */
        getParentCategories() {
            this.loading = true;
            axios.get('/h/data/category')
                .then(res => {
                    this.category = res.data;
                    this.loading = false;

                })
                .catch(err => {
                    console.log(err);
                });
        },
        /*Get Category */




    },
    computed: {


    },
    watch: {



    },
    created() {
        this.getParentCategories();
        this.errorMessage = '';
        console.log(this.selectedTips.length);
    },
    mounted() {


    },

});

Vue.component('toggle-button', {
    template: `
      <a href="#"
         role="checkbox"
         class="button toggle-button"
         :class="{'is-selected': isSelected}"
         @click="toggle($event)"
      >
          <i class="fa fa-check"></i>
          <span v-html="text"></span>
      </a>
    `,
    data() {
        return {
            isSelected: this.selected ? this.selected : false
        };
    },
    props: ['text', 'selected', 'value'],
    methods: {
        toggle($event) {

            this.isSelected = !this.isSelected;

            this.$emit('toggle', {
                selected: this.isSelected,
                value: this.value
            });

            $event.preventDefault();
        }
    },
    watch: {
        selected: function (newVal) {

            this.isSelected = newVal;
        }
    }
});

Vue.component('select-list', {
    template: `
  <div class="select-list-wrapper">
    <header class="select-list-actions is-clearfix">
        <p class="control" v-if="selectedOptions.length > 0"> 
          <a href="#" role="button" class="button is-link" @click="clear"> Clear selected </a>
        </p>
        <p class="control"> 
          <input class="input" v-model="filterText" type="text" placeholder="Filter list">
        </p>
    </header>
    <div class="select-list" v-if="filteredOptions.length > 0">
      <toggle-button
              v-for="option in filteredOptions"
              :text="option.label"
              :value="option.value"
              :selected="option.selected"
              class="select-item"
              @toggle="onToggle($event)"
              ></toggle-button>
    </div>
    <div v-else>No items to display</div>
  </div>
    `,
    data() {
        return {
            filterText: '',
            selectedOptions: this.selected
        }
    },
    props: ['options', 'selected'],
    methods: {
        onToggle(option) {

            if (option.selected) {

                this.selectedOptions.push(option.value);
            } else {

                this.selectedOptions.splice(this.selectedOptions.indexOf(option.value), 1);
            }

            this.$emit('change', {
                changed: option,
                selected: this.selectedOptions
            });
        },
        clear() {
            this.selectedOptions = [];
            this.$emit('change', {
                changed: null,
                selected: []
            });
        }
    },
    computed: {
        filteredOptions() {
            var visibleOptions = [],
                filterText = this.filterText.trim().length > 0 ? this.filterText.toLowerCase() : null;

            if (filterText) {

                visibleOptions = this.options.filter((option) => {
                    let optWords = option.split(' ');

                    return optWords.some((word) => {
                        return word.toLowerCase().indexOf(filterText) === 0;
                    });
                });

            } else {

                visibleOptions = this.options;
            }

            return visibleOptions.map((option) => {
                let label = '';

                if (filterText) {
                    let searchStartIndex = option.toLowerCase().indexOf(filterText),
                        filterPart = option.substring(searchStartIndex, searchStartIndex + filterText.length);

                    label = option.replace(filterPart, `<b>${filterPart}</b>`);
                } else {
                    label = option;
                }

                return {
                    value: option,
                    label,
                    selected: this.selectedOptions.includes(option)
                }
            });
        }
    }
});

