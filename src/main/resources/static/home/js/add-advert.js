Vue.use(VueFormWizard)

new Vue({
    el: '#add-advert',
    data: {
        /*Step Form Variables */

        /*Step Form Variables */
        errorMessage: '',
        category: null,
        selectedCategory: null,
        selectedCategories: [],



    },

    methods: {
        onComplete: function () {
            alert('Yay. Done!');
        },
        beforeTabSwitch: function () {
            alert("This is called before switching tabs")
            return true;
        },
        /*Step Form Methods */
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
        /*Get Category */
        handleSelectItem(item) {
            if (item.subCategories.length > 0 || item.selectedCategories != null) {
                this.category = item.subCategories;
                this.selectedCategories.push(item);
                console.log(this.category)
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


    },
    computed: {


    },
    watch: {



    },
    created() {
        this.getParentCategories();
        this.errorMessage = '';
    },
    mounted() {


    },

});
