$(document).ready(function () {


    new Vue({
        el: '#add-advert',
        data: {
            /*Step Form Variables */
            active: 0,
            errorMessage: "",
            activeClass: 'active',
            disabledClass: 'disabled',
            completedClass: 'completed',
            isActive0: true,
            isActive1: false,
            isActive2: false,
            isActive3: false,
            isActive4: false,
            isSuccess0: false,
            isSuccess1: false,
            isSuccess2: false,
            isSuccess3: false,
            isSuccess4: false,
            btnBack: "Geri",
            /*Step Form Variables */
            category: null,
            selectedCategory: null,
            selectedCategories: []


        },

        methods: {
            /*Step Form Methods */
            next() {
                if (this.isActive0) {
                    if (this.selectedCategory != null) {
                        this.isActive0 = false;
                        this.isActive1 = true;
                        console.log("ok")
                    } else {
                        this.errorMessage = "* Bir kategori seçmelisiniz."
                        setTimeout(() => this.errorMessage = '', 3000)
                    }
                } else if (!this.isActive0 && this.isActive1) {
                    this.isActive1 = false;
                    this.isSuccess1 = true;
                    this.isActive2 = true;
                } else if (!this.isActive0 && !this.isActive1 && this.isActive2) {
                    this.isActive2 = false;
                    this.isSuccess2 = true;
                    this.isActive3 = true;
                } else if (!this.isActive0 && !this.isActive1 && !this.isActive2 && this.isActive3) {
                    this.isActive3 = false;
                    this.isSuccess3 = true;
                    this.isActive4 = true;
                } else if (!this.isActive0 && !this.isActive1 && !this.isActive2 && !this.isActive3 && this.isActive4) {
                    this.isActive4 = false;
                    this.isSuccess4 = true;
                } else if (this.isSuccess4) {
                    console.log("İlan Öznizle");
                }

            },
            back() {
                if (this.isSuccess4) {
                    this.isSuccess4 = false;
                    this.isActive4 = true;
                }
                else if (this.isSuccess3 && !this.isSuccess4) {
                    this.isSuccess3 = false;
                    this.isActive3 = true;
                    this.isActive4 = false;
                }
                else if (this.isSuccess2 && !this.isSuccess3 && !this.isSuccess4) {
                    this.isSuccess2 = false;
                    this.isActive2 = true;
                    this.isActive3 = false;
                }
                else if (this.isSuccess1 && !this.isSuccess2 && !this.isSuccess3 && !this.isSuccess4) {
                    this.isSuccess1 = false;
                    this.isActive1 = true;
                    this.isActive2 = false;
                }
                else if (this.isSuccess0 && !this.isSuccess1 && !this.isSuccess2 && !this.isSuccess3 && !this.isSuccess4) {
                    this.isSuccess0 = false;
                    this.isActive0 = true;
                    this.isActive1 = false;
                }
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
            handleSelectItem(item) {
                if (item.subCategories.length > 0 || item.selectedCategories != null) {
                    this.category = item.subCategories;
                    this.selectedCategories.push(item);
                } else {
                    this.selectedCategory = item;
                    this.isSuccess0 = true;
                    this.selectedCategories.push(item);
                }
            },
            changeCategory() {
                this.getParentCategories();
                this.selectedCategories = [];
                this.selectedCategory = null;
                this.isActive0 = true;
                this.isSuccess0 = false;

            }


        },
        computed: {


        },
        watch: {

        },
        created() {
            this.getParentCategories();
        },
        mounted() {


        },

    });

});