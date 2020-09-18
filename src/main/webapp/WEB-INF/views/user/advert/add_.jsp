<div id="app">
    <v-app>
        <v-main>
            <v-container>{{messagex}}</v-container>
            <v-alert dismissible type="success" elevation="15"><i class="fas fa-home mr-2"></i>{{message}} </v-alert>
            <p>
            <ul v-for="(item, index) in list">
                <span-component v-bind:item="item" v-bind:index="index" v-on:shout="log"></span-component>
            </ul>
            </p>
        </v-main>
    </v-app>
    <input v-model="message">

    <div class="row">
        <div class="col-md-12 text-center">
            <h3>Pick List Example</h3>
        </div>
        <div class="col-sm-4 col-sm-offset-1">
            <div class="list-group" id="list1">
                <a href="#" class="list-group-item active">List 1 <input title="toggle all" type="checkbox"
                        class="all pull-right"></a>
                <a href="#" class="list-group-item">Second item <input type="checkbox" class="pull-right"></a>
                <a href="#" class="list-group-item">Third item <input type="checkbox" class="pull-right"></a>
                <a href="#" class="list-group-item">More item <input type="checkbox" class="pull-right"></a>
                <a href="#" class="list-group-item">Another <input type="checkbox" class="pull-right"></a>
            </div>
        </div>
        <div class="col-md-2 v-center">
            <button title="Send to list 2" class="btn btn-default center-block add"><i
                    class="glyphicon glyphicon-chevron-right"></i></button>
            <button title="Send to list 1" class="btn btn-default center-block remove"><i
                    class="glyphicon glyphicon-chevron-left"></i></button>
        </div>
        <div class="col-sm-4">
            <div class="list-group" id="list2">
                <a href="#" class="list-group-item active">List 2 <input title="toggle all" type="checkbox"
                        class="all pull-right"></a>
                <a href="#" class="list-group-item">Alpha <input type="checkbox" class="pull-right"></a>
                <a href="#" class="list-group-item">Charlie <input type="checkbox" class="pull-right"></a>
                <a href="#" class="list-group-item">Bravo <input type="checkbox" class="pull-right"></a>
            </div>
        </div>
    </div>


</div>


<script>  

    Vue.component('span-component', {
        props: ['item', 'index'],
        data: function () {
            return {

            }
        },
        methods: {
            shout(v) {
                this.$emit('shout', { value: v });
            }
        },
        template: '<li v-on:click="shout(index)" v-bind:class="item.color">{{index+1}}. {{item.name}}</li>'
    })

    new Vue({
        el: '#app',
        data: {
            message: 'You loaded this page on ',
            list: [
                { name: "Caglar", color: "green" },
                { name: "Umut", color: "red" }

            ]
        },
        created() {
            console.log("Component Created");
        },
        mounted() {
            console.log("Component Mounted");
        },
        beforeDestroy() {
            console.log("Component Destroyed")
        },
        methods: {
            log(v) {
                var { value } = v;
                console.log(v.value);
            }

        },
        computed: {
            messagex: function () {
                return this.message + new Date().toLocaleString();
            }
        },
        watch: {

        }

    });


</script>

<style>
    .text-red {
        color: red;
    }

    .text-green {
        color: green;
    }
    .v-center {
  min-height:200px;
  display: flex;
  justify-content:center;
  flex-flow: column wrap;
}
</style>