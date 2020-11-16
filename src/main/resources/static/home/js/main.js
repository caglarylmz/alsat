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

tinymce.init({
    selector: 'textarea#editor',
    height: 500,
    menubar: false,
    branding: false,
    language: 'tr',
    plugins: [
        'advlist autolink lists link image charmap print preview anchor',
        'searchreplace visualblocks code fullscreen',
        'insertdatetime media table paste code help wordcount'
    ],
    toolbar: 'undo redo | formatselect | ' +
        'bold italic backcolor | alignleft aligncenter ' +
        'alignright alignjustify | bullist numlist outdent indent | ' +
        'removeformat | help',
    content_style: 'body { font-family:Helvetica,Arial,sans-serif; font-size:14px }'
});