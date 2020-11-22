new Vue({
    el: '#category',
    data: {
        loading: false,
        iller: null,
        ilceler: null,
        semtler: null,
        mahalleler: null,
        selectIl: 0,
        selectIlce: 0,
        selectSemt: 0,
        selectMahalle: 0,


    },

    methods: {
        getIlList() {
            this.loading = true;
            axios.get('/h/data/iller')
                .then(res => {
                    this.iller = res.data;
                    this.loading = false;
                })
                .catch(err => {
                    console.log(err);
                });
        },
        getIlceList(event) {
            if (this.selectIl == 0) {
                this.ilceler = null;
            }
            else
                this.ilceler = this.iller.find(i => i.id == event.target.value).ilceler;

            this.semtler = null;
            this.mahalleler = null;
            this.selectIlce = 0;
            this.selectSemt = 0;
            this.selectMahalle = 0;



        },
        getSemtList(event) {
            if (this.selectIlce == 0)
                this.semtler = null;
            else
                this.semtler = this.ilceler.find(ic => ic.id == event.target.value).semtler;

            this.mahalleler = null;
            this.selectSemt = 0;
            this.selectMahalle = 0;


        },
        getMahalleList(event) {
            if (this.selectSemt == 0) {
                this.mahalleler = null;
            }
            if (this.selectSemt != 0)
                this.mahalleler = this.semtler.find(m => m.id == event.target.value).mahalleler;

            console.log(this.mahalleler)

            this.selectMahalle = 0;
        }


    },
    computed: {


    },
    watch: {

    },
    async created() {
        try {
            await this.getIlList();
        } catch (error) {
            console.log(error);
        }
    },
    mounted() {
        this.ilceler = null;
        this.semtler = null;
        this.mahalleler = null;
    },

});
