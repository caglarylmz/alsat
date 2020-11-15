Vue.use(VueQuillEditor)

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
        selectedCategories: [],
        message: 'Hi from Vue.',
        content: '<h2>I\'m vue-quill-editor example</h2>',
        editorOption: {
            theme: 'snow'
        }


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
            } else if (this.active1) {
                this.isActive1 = false;
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
            if (this.isSuccess0) {
                this.isSuccess0 = false;
                this.isActive0 = true;
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

        },
        onEditorBlur(quill) {
            console.log('editor blur!', quill)
        },
        onEditorFocus(quill) {
            console.log('editor focus!', quill)
        },
        onEditorReady(quill) {
            console.log('editor ready!', quill)
        }


    },
    computed: {
        showBackButton() {
            if (!this.isActive0 && this.isSuccess0) {
                return true;
            } else {
                return false;
            }
        },
        editor() {
            return this.$refs.quillEditor.quill
        }
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
