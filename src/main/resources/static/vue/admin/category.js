
window.addEventListener('load', () => {
	new Vue({
		el: '#app',
		data: {
			loading: false,
			isHasSubCat: false,
			parentCats: [],
			subCats1: [],
			subCats2: [],
			subCats3: [],
			subCats4: [],
			subCats5: [],
			selectedParent: 0,
			selectedsub1: 0,
			selectedsub2: 0,
			selectedsub3: 0,
			selectedsub4: 0,
			selectedsub5: 0,
			selected: 0,


		},
		created() {
			this.clearData();
		},
		mounted() {
			this.getParentCategories();

		},
		methods: {
			getParentCategories() {
				this.loading = true;
				axios.get('/api/category/parents')
					.then(res => {
						console.log(res);
						this.parentCats = res.data;
					})
					.catch(err => {
						console.log(err);
					})
					.then(() => {
						this.loading = false;
						if (this.parentCats > 0) {
							this.isHasSubCat = true;
						}


					});
			},
			getSubCategories1() {
				this.loading = true;
				this.isHasSubCat = false;
				axios.get('/api/category/' + this.selectedParent + '/subs')
					.then(res => {
						console.log(res);
						this.subCats1 = res.data;

					})
					.catch(err => {
						console.log(err);

					})
					.then(() => {
						this.loading = false;
						if (this.subCats1 > 0) {
							this.isHasSubCat = true;
						}

					});
			},
			getSubCategories2() {
				this.loading = true;
				this.isHasSubCat = false;
				axios.get('/api/category/' + this.selectedsub1 + '/subs')
					.then(res => {
						console.log(res);
						this.subCats2 = res.data;

					})
					.catch(err => {
						console.log(err);

					})
					.then(() => {
						this.loading = false;
						if (this.subCats1 > 0) {
							this.isHasSubCat = true;
						}

					});
			},
			getSubCategories3() {
				this.loading = true;
				this.isHasSubCat = false;
				axios.get('/api/category/' + this.selectedsub2 + '/subs')
					.then(res => {
						console.log(res);
						this.subCats3 = res.data;

					})
					.catch(err => {
						console.log(err);

					})
					.then(() => {
						this.loading = false;
						if (this.subCats1 > 0) {
							this.isHasSubCat = true;
						}
					});
			},
			getSubCategories4() {
				this.loading = true;
				this.isHasSubCat = false;
				axios.get('/api/category/' + this.selectedsub3 + '/subs')
					.then(res => {
						console.log(res);
						this.subCats4 = res.data;

					})
					.catch(err => {
						console.log(err);

					})
					.then(() => {
						this.loading = false;
						if (this.subCats1 > 0) {
							this.isHasSubCat = true;
						}
					});
			},
			getSubCategories5() {
				this.isHasSubCat = false;
				this.loading = true;
				axios.get('/api/category/' + this.selectedsub4 + '/subs')
					.then(res => {
						console.log(res);
						this.subCats5 = res.data;

					})
					.catch(err => {
						console.log(err);

					})
					.then(() => {
						this.loading = false;
						if (this.subCats1 > 0) {
							this.isHasSubCat = true;
						}
					});
			},
			clearData() {
				this.loading = false;
				this.isHasSubCat = false;
				this.parentCats = [];
				this.subCats1 = [];
				this.subCats2 = [];
				this.subCats3 = [];
				this.subCats4 = [];
				this.subCats5 = [];
				this.selectedParent = 0;
				this.selectedsub1 = 0;
				this.selectedsub2 = 0;
				this.selectedsub3 = 0;
				this.selectedsub4 = 0;
				this.selectedsub5 = 0;
				this.selected = 0;
			}

		},
		watch: {
			selectedParent(val) {
				this.selectedParent = val;
				this.selectedsub1 = 0;
				this.selectedsub2 = 0;
				this.selectedsub3 = 0;
				this.selectedsub4 = 0;
				this.subCats1 = [];
				this.subCats2 = [];
				this.subCats3 = [];
				this.subCats4 = [];
				this.subCats5 = [];
			},
			selectedsub1(val) {
				this.selectedsub1 = val;
				this.selectedsub2 = 0;
				this.selectedsub3 = 0;
				this.selectedsub4 = 0;
				this.subCats2 = [];
				this.subCats3 = [];
				this.subCats4 = [];
				this.subCats5 = [];
			},
			selectedsub2(val) {
				this.selectedsub2 = val;
				this.selectedsub3 = 0;
				this.selectedsub4 = 0;
				this.subCats3 = [];
				this.subCats4 = [];
				this.subCats5 = [];
			},
			selectedsub3(val) {
				this.selectedsub3 = val;
				this.selectedsub4 = 0;
				this.subCats4 = [];
				this.subCats5 = [];
			},
			selectedsub4(val) {
				this.selectedsub4 = val;
				this.selectedsub5 = 0;
				this.subCats5 = [];
			},
		},
		computed: {

		},

	});
});
