Vue.use(VueFormWizard);


var vue = new Vue({
    el: '#add-advert',
    components: {

    },
    data: {
        /*Global Var*/
        errorMessage: '',
        subtitle: 'Kategori Seçimi',
        contentEditor: '',
        advert: {
            baslik: "",
            aciklama: "",
            toplamAdet: "",
            toplamFiyat: "",
            kimden: "",
            showcase: false,
            photoFiles: [],
            advertAddress: [
                {
                    il: 0,
                    ilce: 0,
                    mahalle: 0
                }
            ],
            tips: [],

        },
        ve: {
            baslik: {
                elementName: 'baslik',
                className: '',
                empty: {
                    msg: "",
                    status: false,
                },
            },
            aciklama: {
                elementName: 'aciklama',
                className: '',
                empty: {
                    msg: "",
                    status: false,
                },
            },
            toplamAdet: {
                elementName: 'toplamAdet',
                className: '',
                noselect: {
                    msg: "",
                    status: false,
                },
            },
            toplamFiyat: {
                elementName: 'toplamFiyat',
                className: '',
                noselect: {
                    msg: "",
                    status: false,
                },
            },
            adress: {
                elementName: 'adress',
                className: '',
                noselect: {
                    msg: "",
                    status: false,
                },
            },
        },
        /*Photo */
        //photo componente variable
        isDragging: false,
        dragCount: 0,
        files: [],
        images: [],

        /**Address Data*/
        iller: null,
        ilceler: null,
        semtler: null,
        mahalleler: null,
        selectIl: 0,
        selectIlce: 0,
        selectSemt: 0,
        selectMahalle: 0,
        /**Address Data*/
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

        },
        /*Kaydet*/
        taslakKaydet() {
            this.advert.tips = this.selectedTips;
            this.advert.adress.il = this.selectIl;
            this.advert.adress.ilce = this.selectIlce;
            this.advert.adress.mahalle = this.selectMahalle;
            this.advert.filse = this.files;

            axios
                .post("/api/v1/roles", {
                    "id": this.role_id,
                    "name": this.role_name,
                })
                .then(savedRole => {
                    this.getRoles();
                    this.role_name = '';
                    this.role_id = '';
                })
        },

        /*Photo Ekle Step */
        beforeTabSwitchPhoto: function () {
            if (this.images.length == 0) {
                this.errorMessage = "* İlanınza resim eklemelisiniz!"
                setTimeout(() => this.errorMessage = '', 3000)
                return false;
            } else {
                return true;
            }


        },
        //SELECT PHOTO
        OnDragEnter(e) {
            e.preventDefault();

            this.dragCount++;
            this.isDragging = true;
            return false;
        },
        OnDragLeave(e) {
            e.preventDefault();
            this.dragCount--;
            if (this.dragCount <= 0)
                this.isDragging = false;
        },
        onInputChange(e) {
            const files = e.target.files;
            Array.from(files).forEach(file => this.addImage(file));
        },
        onDrop(e) {
            e.preventDefault();
            e.stopPropagation();
            this.isDragging = false;
            const files = e.dataTransfer.files;
            Array.from(files).forEach(file => this.addImage(file));
        },
        addImage(file) {

            this.files.push(file);
            const img = new Image(),
                reader = new FileReader();
            reader.onload = (e) => this.images.push(e.target.result);
            reader.readAsDataURL(file);

        },
        clarAllImage() {
            this.files = [];
            this.images = [];
        },
        getFileSize(size) {
            if (size > 900000)
                return (size / (1024 * 1024)).toFixed(1).toString() + ' MB';
            else
                return (size / (1024)).toFixed(1).toString() + ' KB';
        },
        upload() {
            const formData = new FormData();

            this.files.forEach(file => {
                formData.append('images[]', file, file.name);
            });
            localStorage.photos(formData);

        },

        /*Photo Ekle Step */
        /**Temel Bilgiler Step */
        beforeTabSwitchTemel: function () {
            let validBaslik = this.validateEmptyforBaslik();
            let validAciklama = this.validateEmptyforAciklama();
            let validToplamAdet = this.validateForToplamAdet();
            let validToplamFiyat = this.validateForToplamFiyat();
            let validAdress = this.validateForAdress();

            if (validBaslik && validAciklama && validToplamAdet && validToplamFiyat && validAdress) {
                return true;
            } else {
                return false;
            }

        },
        validateForAdress: function () {
            if (this.selectIl == 0 || this.selectIlce == 0 || this.selectSemt == 0 || this.selectMahalle == 0) {
                this.ve.adress.className = "uk-form-danger";
                this.ve.adress.noselect.status = true;
                this.ve.adress.noselect.msg = "İlanınız için adres bilgilerinizi seçiniz"
                this.errorMessage = " * Hatalı girilen alanlar var. Lütfen düzeltiniz"
                setTimeout(() => this.errorMessage = '', 3000)
                return false;
            } else {
                this.ve.adress.noselect.status = false;
                return true;
            }
        },
        /*toplamFiyat */
        validateForToplamFiyat: function () {
            if (this.advert.toplamFiyat === "" || this.advert.toplamFiyat == 0) {
                this.ve.toplamFiyat.className = "uk-form-danger";
                this.ve.toplamFiyat.noselect.status = true;
                this.ve.toplamFiyat.noselect.msg = "Toplam fiyat 0 ₺ olamaz"
                this.errorMessage = " * Hatalı girilen alanlar var. Lütfen düzeltiniz"
                setTimeout(() => this.errorMessage = '', 3000)
                return false;
            } else {
                this.ve.toplamFiyat.noselect.status = false;
                return true;
            }
        },
        checkSuccessOfKeyPressForToplamFiyat() {
            if (this.advert.toplamFiyat != 0 || this.advert.toplamFiyat !== "") {
                this.ve.toplamFiyat.className = "uk-form-success";
                this.ve.toplamFiyat.noselect.msg = "";

            } else {
                this.ve.toplamFiyat.className = "uk-form-danger";
            }
        },
        /*toplamAdet */
        validateForToplamAdet: function () {
            if (this.advert.toplamAdet == 0 || this.advert.toplamAdet === "") {
                this.ve.toplamAdet.className = "uk-form-danger";
                this.ve.toplamAdet.noselect.status = true;
                this.ve.toplamAdet.noselect.msg = "Toplam adet sayısı 0 olamaz"
                this.errorMessage = " * Hatalı girilen alanlar var. Lütfen düzeltiniz"
                setTimeout(() => this.errorMessage = '', 3000)
                return false;
            } else {
                this.ve.toplamAdet.noselect.status = false;
                return true;
            }
        },
        checkSuccessOfKeyPressForToplamAdet() {
            if (this.advert.toplamAdet != 0 || this.advert.toplamAdet !== "") {
                this.ve.toplamAdet.className = "uk-form-success";
                this.ve.toplamAdet.noselect.msg = "";

            } else {
                this.ve.toplamAdet.className = "uk-form-danger";
            }
        },
        //aciklama alanı validitation
        validateEmptyforAciklama: function () {
            if (this.advert.aciklama === "") {
                //status ile classBinding yapıyoruz. Status durumuna göre checkSuccessOfKeyPressForBaslik fonkisyonu aktif olur.
                this.ve.aciklama.className = "uk-form-danger";
                this.ve.aciklama.empty.status = true;
                this.ve.aciklama.empty.msg = "İlan açıklması girmelisiniz"
                this.errorMessage = " * Hatalı girilen alanlar var. Lütfen düzeltiniz"
                setTimeout(() => this.errorMessage = '', 3000)
                return false;
            } else {
                this.ve.aciklama.empty.status = false;
                return true;
            }
        },
        //baslik alanı valitation
        validateEmptyforBaslik: function () {
            var baslik = document.getElementById('baslik').value;
            if (baslik === "") {
                //status ile classBinding yapıyoruz. Status durumuna göre checkSuccessOfKeyPressForBaslik fonkisyonu aktif olur.
                this.ve.baslik.className = "uk-form-danger";
                this.ve.baslik.empty.status = true;
                this.ve.baslik.empty.msg = "İlan başlığı girmelisiniz"
                this.errorMessage = " * Hatalı girilen alanlar var. Lütfen düzeltiniz"
                setTimeout(() => this.errorMessage = '', 3000)
                return false;
            } else {
                this.ve.baslik.empty.status = false;
                return true;
            }

        },
        /**Başlık alanını data girildiğin yeşil, boşken kırmızı yapar */
        checkSuccessOfKeyPressForBaslik() {
            if (this.advert.baslik.length > 0) {
                this.ve.baslik.className = "uk-form-success";
                this.ve.baslik.empty.msg = "";

            } else {
                this.ve.baslik.className = "uk-form-danger";
            }
        },
        /**Tip Step */
        beforeTabSwitchTip: function () {
            if (this.selectedTips == 0) {
                this.errorMessage = "* Seçtiğiniz kategoriye ait bir veya daha fazla tip seçmelisiniz"
                setTimeout(() => this.errorMessage = '', 3000)
                return false;
            } else {
                this.isProcessSelectTipFinish = true;
                return true;
            }

        },
        //Tip seçimi
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

        },
        changeTips() {
            this.selectedTips = [];
            this.nonSelectedTips = [];
            this.isProcessSelectTipFinish = false;
        },
        /*Tip Step */
        /*Category Step */
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

        /**Adress Methods */
        getIlList() {
            this.loading = true;
            axios.get('/h/data/iller')
                .then(res => {
                    this.iller = res.data;
                })
                .catch(err => {
                    console.log(err);
                });

        },
        getIlceList(event) {
            if (this.selectIl == 0) {
                this.ilceler = null;
                this.ve.adress.className = "uk-form-danger";
            }
            else {
                console.log(event);
                this.ilceler = this.iller.find(i => i.id == event.target.value).ilceler;
                this.ve.adress.noselect.msg = "";
            }

            this.semtler = null;
            this.mahalleler = null;
            this.selectIlce = 0;
            this.selectSemt = 0;
            this.selectMahalle = 0;


        },
        getSemtList(event) {
            if (this.selectIlce == 0) {
                this.semtler = null;
                this.ilceler = null;
                this.ve.adress.className = "uk-form-danger";
            }
            else {
                this.ve.adress.noselect.msg = "";
                this.semtler = this.ilceler.find(ic => ic.id == event.target.value).semtler;
            }

            this.mahalleler = null;
            this.selectSemt = 0;
            this.selectMahalle = 0;


        },
        getMahalleList(event) {
            if (this.selectSemt == 0) {
                this.mahalleler = null;
                this.ve.adress.className = "uk-form-danger";

            } else {
                this.mahalleler = this.semtler.find(m => m.id == event.target.value).mahalleler;
                this.ve.adress.noselect.msg = "";
            }

            this.selectMahalle = 0;
        },
        selectAdress(event) {
            if (this.selectMahalle == 0) {
                this.ve.adress.className = "uk-form-danger";
            } else {
                this.ve.adress.className = "uk-form-success";
                this.ve.adress.noselect.msg = "";
            }
        }
        /**Adress Methods */
    },
    computed: {

    },
    watch: {
        contentEditor(val) {
            this.contentEditor = val
            this.advert.aciklama = this.contentEditor;
            if (this.advert.aciklama !== "") {
                this.ve.aciklama.empty.msg = "";
            }
        },

    },
    async created() {
        try {
            await this.getIlList();
        } catch (error) {
            console.log(error);
        }

        try {
            this.getParentCategories();
        } catch (error) {
            console.log(error);
        }

    },
    mounted() {
        this.errorMessage = '';
        this.ilceler = null;
        this.semtler = null;
        this.mahalleler = null;


    },

});

/*TinyMCE Editor */
tinymce.init({
    selector: '#editor',
    themes: 'silver',
    twoWay: true,
    height: 300,
    menubar: false,
    branding: false,
    statusbar: false,
    language: 'tr',
    /* */
    setup: function (editor) {
        // init tinymce
        // when typing keyup event
        editor.on('keyup', function () {
            // get new value
            var new_value = tinymce.get('editor').getContent(self.value);
            vue.$data.contentEditor = new_value;
        });
    },
    update: function (newVal, oldVal) {
        // set val and trigger event
        $(this.el).val(newVal).trigger('keyup');
    },

});

