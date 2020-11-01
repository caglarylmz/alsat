//fetch('https://al-sat.herokuapp.com/api/category/parents')
/*var categories = fetch('assets/data/categories.json')
    .then(response => response.json()).then(json => console.log(json));
*/
/* SIDR SIDEBAR */
$(function () {
    $('#mm_buton').sidr({
        name: 'mm_panel',
        timing: 'ease-in-out',
        speed: 500,
        source: '#mm_panel',
        renaming: false,
    });
    $('#mmu_buton').sidr({
        name: 'mmu_panel',
        timing: 'ease-in-out',
        speed: 500,
        source: '#mmu_panel',
        side: 'right',
        renaming: false,
    });
});
/* SIDR SIDEBAR */

var vue = new Vue({
    el: '#app',
    components: {

    },
    data: {
        parentCategories: [],
        vitrinAdverts: [],
        photosOfAdverts: []
    },
    methods: {

    },
    computed: {

    },
    watch: {

    },
    async created() {
        let responseCategory = await fetch('https://al-sat.herokuapp.com/api/category/parents');
        if (responseCategory.ok) {
            let json = await responseCategory.json()
            this.parentCategories = json
        } else {
            alert("HTTP-Error: " + responseCategory.status);

        }
        let responseVitrin = await fetch('https://al-sat.herokuapp.com/api/adverts/vitrin');
        if (responseVitrin.ok) {
            let json = await responseVitrin.json()
            this.vitrinAdverts = json
            console.log(this.vitrinAdverts);
        } else {
            alert("HTTP-Error: " + responseVitrin.status);

        }       
    },
    mounted() {



    },
    beforeDestroy() {
        //console.log("Component Destroyed")
    },


});



