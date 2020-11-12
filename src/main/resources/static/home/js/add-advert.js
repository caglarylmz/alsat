new Vue({
    el: '#add-advert',
    data: {
        activeClass: 'active',
        disabledClass: 'disabled',
        completedClass: 'completed',
        isActive0: true,
        isActive1: true,
        isActive2: false,
        isActive3: false,
        isActive4: false,
        isSuccess0: false,
        isSuccess1: false,
        isSuccess2: false,
        isSuccess3: false,
        isSuccess4: true,
        parentCategories: null,
        data: [
            {
                id: 0,
                name: "name",
                subCategories: [],
            }

        ],
        defaultProps: {
            id: 0,
            name: 'name',
            subCategories: [],
        }

    },

    methods: {
        getParentCategories() {
            this.loading = true;
            axios.get('/h/data/category')
                .then(res => {
                    this.parentCategories = res.data;
                    this.loading = false;

                    console.log(this.data);


                })
                .catch(err => {
                    console.log(err);
                });
        },
        readyData() {

        },
        next() {
            if (this.active <= 2) this.active++;
        },
        back() {
            if (this.active >= 1) this.active--;
        },
        handleNodeClick(data) {
            console.log(data);
        },



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
