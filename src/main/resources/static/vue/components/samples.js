Vue.component("vue-editor", {
    template: "<textarea class='form-control' :name='name'></textarea>",
    props: {
        model: {
            required: true,
            twoWay: true
        },
        language: {
            type: String,
            required: false,
            default: "en-US"
        },
        height: {
            type: Number,
            required: false,
            default: 160
        },
        minHeight: {
            type: Number,
            required: false,
            default: 160
        },
        maxHeight: {
            type: Number,
            required: false,
            default: 800
        },
        name: {
            type: String,
            required: false,
            default: "vue-editor"
        },
        toolbar: {
            type: Array,
            required: false,
            default: function () {
                return [
                    ["font", ["bold", "italic", "underline", "clear"]],
                    ["fontsize", ["fontsize"]],
                    ["para", ["ul", "ol", "paragraph"]],
                    ["color", ["color"]],
                    ["insert", ["link", "picture", "hr"]]
                ];
            }
        }
    },
    beforeCompile: function () {
        this.isChanging = false;
        this.control = null;
    },
    ready: function () {
        //  initialize the summernote
        if (this.minHeight > this.height) {
            this.minHeight = this.height;
        }
        if (this.maxHeight < this.height) {
            this.maxHeight = this.height;
        }
        var me = this;
        this.control = $(this.$el);
        this.control.summernote({
            lang: this.language,
            height: this.height,
            minHeight: this.minHeight,
            maxHeight: this.maxHeight,
            toolbar: this.toolbar,
            callbacks: {
                onInit: function () {
                    me.control.summernote("code", me.model);
                }
            }
        }).on("summernote.change", function () {
            // Note that we do not use the "onChange" options of the summernote
            // constructor. Instead, we use a event handler of "summernote.change"
            // event because that I don't know how to trigger the "onChange" event
            // handler after changing the code of summernote via ".summernote('code')" function.
            if (!me.isChanging) {
                me.isChanging = true;
                var code = me.control.summernote("code");
                me.model = (code === null || code.length === 0 ? null : code);
                me.$nextTick(function () {
                    me.isChanging = false;
                });
            }
        });
    },
    watch: {
        "model": function (val, oldVal) {
            if (!this.isChanging) {
                this.isChanging = true;
                var code = (val === null ? "" : val);
                this.control.summernote("code", code);
                this.isChanging = false;
            }
        }
    }
}, { name: "vue-editor" });

Vue.component('categoeries-box', {
    props: ['item', 'index'],
    data: function () {
        return {
            category,
            selected,
        }
    },
    methods: {
        shout(v) {
            this.$emit('selectCategory', { value: this.selected });
        }
    },
    template: '<li v-on:click="shout(index)" v-bind:class="item.color">{{index+1}}. {{item.name}}</li>'
});

Vue.component('image-uploader', {
    name: 'image-uploader',
    data: () => ({
        isDragging: false,
        dragCount: 0,
        files: [],
        images: []
    }),
    methods: {
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

        }
    },
    watch: {
        files: function () {
            const formData = new FormData();
            if (this.files.length > 0) {
                this.files.forEach(file => {
                    formData.append('images[]', file, file.name);
                });
                localStorage.photos(formData);
            }

        }
    },
    template:
        `
    <div class="uploader"
        @dragenter="OnDragEnter"
        @dragleave="OnDragLeave"
        @dragover.prevent
        @drop="onDrop"
        :class="{ dragging: isDragging }">     

        <div class="upload-control" v-show="images.length">
            <label class="iuLabel" for="file">Fotoğraf Ekle</label>
        </div>
        
        <div v-show="!images.length">
            <i class="fa fa-cloud-upload"></i>
            <p>Fotoğraflarınızı bu alana taşıyın</p>
            <div>YA DA</div>
            <div class="file-input">
                <label class="iuLabel" for="file">Fotoğrafları seçin</label>
                <input class="pickfile" type="file" id="file" @change="onInputChange" accept=".jpg, .jpeg, .png" multiple>
            </div>
        </div>

        <div class="images-preview" v-show="images.length">
            <div class="img-wrapper" v-for="(image, index) in images" :key="index">
                <img :src="image">
                <div class="details">
                    <span class="name" v-text="files[index].name"></span>
                    <span class="size" v-text="getFileSize(files[index].size)"></span>
                </div>
            </div>
        </div>
    </div>  
    `
});