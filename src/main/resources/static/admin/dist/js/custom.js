$(document).ready(function () {
    // dismiss 3 seconds alert
    var $alert = $('.alert');
    if ($alert.length) {
        setTimeout(function () {
            $alert.alert('close');
        }, 5000);
    }
    /*SWAL*/
    const Toast = Swal.mixin({
        toast: true,
        position: 'top-end',
        showConfirmButton: false,
        timer: 3000
    });
    $('#add-tip').click(function () {
        Toast.fire({
            type: 'success',
            title: 'Lorem ipsum dolor sit amet, consetetur sadipscing elitr.'
        });
    });

    //Add Category Success
    $('#addCategori').click(function () {
        Toast.fire({
            type: 'success',
            title: 'Kategori başarıyla eklendi'
        })
    });

    // açılan modal kapatılınca sıfırlamak için
    $(".modal").on("hidden.bs.modal", function () {
        $(this).find('form').trigger('reset');
    });
    // datatables
    $("#table").DataTable({
        "language": {
            "lengthMenu": "Her sayfada _MENU_ kayıt göster",
            "zeroRecords": "Kayıt bulunamadı",
            "search": "Ara:",
            "info": "_PAGES_ sayfanın  _PAGE_. sayfası",
            "infoEmpty": "Gösterilecek kayıt yok",
            "infoFiltered": "(Filtrelenen toplam kayıt sayısı _MAX_)",
            "paginate": {
                "first": "İlk",
                "last": "Son",
                "next": "Sonraki",
                "previous": "Önceki"
            },
        },
    });
    // Modal clear
    $(".modal").on("hidden.bs.modal", function () {
        $(".modal-body1").html("");
    });

    /*Profile photo upload and validitation*/
    //$('#newPassword').prop( "disabled", true );
    $("#password").css("background-color", "#f8f9fa");
    $("#newPassword").css("background-color", "#f8f9fa");
    $("#newPassword").val("");

    $('#password').keyup(function (event) {
        var pass = this.value;
        if (pass == "") {
            //$('#newPassword').prop( "disabled", true );
            $("#password").css("background-color", "#f8f9fa");
            $("#newPassword").css("background-color", "#f8f9fa");
            $("#newPassword").val("");
        } else if (pass.length > 5) {
            $("#password").css("background-color", "#28a745");
        } else if ($("#newPassword").val() == pass) {
            $('#newPassword').css("background-color", "#28a745");

        } else {
            $('#newPassword').css("background-color", "#dc3545");
        }
    });
    $('#newPassword').keyup(function (event) {
        var confirm = this.value;

        if ($("#password").val() != confirm) {
            $('#newPassword').css("background-color", "#dc3545");
        } else {
            $('#newPassword').css("background-color", "#28a745");
            $("#password").css("background-color", "#28a745");
        }

    });


    /*ADD ADVERT*/

    // Summernote
    $('#aciklama').summernote({
        tabsize: 2,
        height: 300,

    });

    //fileinputs for multi image advert
    $("#input-fotos").fileinput({
        theme: "fas",
        language: "tr",
        showUpload: false,
        multiple: true,
        maxFileCount: 5,
        validateInitialCount: true,
        overwriteInitial: false,
        previewFileType: "image",
        initialPreview: [],
        initialPreviewConfig: [],
        allowedFileExtensions: ["jpg", "png", "gif"]
    });
    $('#input-fotos').on('filebatchselected', function (event, files) {
        //console.log(files);
    });


    //Initialize Select2 Elements
    $('.tips').select2()

    /*Step-1 - Kategori Seçimi*/

    /*
     * /* category select 	 */

    var catCrumb = '';
    $('#resetSelectedCat').click(function () {
        $('#parentCat').css("display", "block");
        $('#sub1').css("display", "none");
        $('#sub2').css("display", "none");
        $('#sub3').css("display", "none");
        $('#sub4').css("display", "none");
        $('#sub5').css("display", "none");
        $('#category').css("display", "none");
        //for validation
        $('#category-error').html('');
        var s1 = '';
        this.catCrumb = '';
    });
    $('#parentCat').on('change', function () {
        var catId = $('#parentCat option:selected').val();
        $('#sub1').css("display", "none");
        $('#sub2').css("display", "none");
        $('#sub3').css("display", "none");
        $('#sub4').css("display", "none");
        $('#sub5').css("display", "none");
        $('#category').css("display", "none");
        //for validation
        $('#category-error').html('');
        var s1 = '';
        catCrumb = $('#parentCat option').filter(':selected').text();
        $("#cat-crumb").html(catCrumb);
        // alert(catId)
        $.ajax({
            type: 'GET',
            url: '/alsat/api/category/' + catId + '/subs',
            success: function (result) {
                var res = $.parseJSON(JSON.stringify(result));
                // alert(res[0].name) console.log(res);
                for (var i = 0; i < res.length; i++) {
                    //console.log(res[i]);
                    s1 += '<option value="' + res[i].id + '" >' + res[i].name + '</option>';
                }

                $('#sub1').css("display", "block");
                //Box size'ıdinamic veriyoruz
                //$('#sub1Cat').attr( "size", res.length);
                $('#sub1Cat').html(s1);
            },
            error: function (msg) {
                console.log("failed");
            }
        });
    });
    $('#sub1').on('change', function () {
        var catId = $('#sub1 option:selected').val();
        $('#sub2').css("display", "none");
        $('#sub3').css("display", "none");
        $('#sub4').css("display", "none");
        $('#sub5').css("display", "none");
        $('#category').css("display", "none");
        //for validation
        $('#category-error').html('');
        var s1 = '';

        catCrumb += ' > '
        catCrumb += $('#sub1 option').filter(':selected').text();
        $("#cat-crumb").html(catCrumb);

        $.ajax({
            type: 'GET',
            url: '/alsat/api/category/' + catId + '/subs',
            success: function (result) {
                var res = $.parseJSON(JSON.stringify(result));
                //console.log(res);
                var s1 = '';
                if (res.length == 0) {
                    var selectedCatId = $('#sub1 option').filter(':selected').val();
                    var selectedCatText = $('#sub1 option').filter(':selected').text();


                    s1 = '<option value="' + selectedCatId + '" >' + selectedCatText + '</option>';
                    //alert(s1);
                    $('#category').css("display", "block");
                    $('#parentCat').css("display", "none");
                    $('#sub1').css("display", "none");
                    $('#sub2').css("display", "none");
                    $('#sub3').css("display", "none");
                    $('#sub4').css("display", "none");
                    $('#sub5').css("display", "none");

                    $('#categoryCat').html(s1);
                } else {
                    for (var i = 0; i < res.length; i++) {
                        //console.log(res[i]);
                        s1 += '<option value="' + res[i].id + '" >' + res[i].name + '</option>';
                    }
                    $('#sub2').css("display", "block");
                    $('#sub2Cat').html(s1);
                }
            },
            error: function (msg) {
                console.log("failed");
            }
        });
    });
    $('#sub2').on('change', function () {
        var catId = $('#sub2 option:selected').val();
        $('#sub3').css("display", "none");
        $('#sub4').css("display", "none");
        $('#sub5').css("display", "none");
        $('#category').css("display", "none");
        //for validation
        $('#category-error').html('');
        var s1 = '';

        catCrumb += ' > '
        catCrumb += $('#sub2 option').filter(':selected').text();
        $("#cat-crumb").html(catCrumb);

        $.ajax({
            type: 'GET',
            url: '/alsat/api/category/' + catId + '/subs',
            success: function (result) {
                var res = $.parseJSON(JSON.stringify(result));
                //console.log(res);
                var s1 = '';
                if (res.length == 0) {
                    var selectedCatId = $('#sub2 option').filter(':selected').val();
                    var selectedCatText = $('#sub2 option').filter(':selected').text();

                    s1 = '<option value="' + selectedCatId + '" >' + selectedCatText + '</option>';
                    //alert(s1);
                    $('#category').css("display", "block");
                    $('#parentCat').css("display", "none");
                    $('#sub1').css("display", "none");
                    $('#sub2').css("display", "none");
                    $('#sub3').css("display", "none");
                    $('#sub4').css("display", "none");
                    $('#sub5').css("display", "none");

                    $('#categoryCat').html(s1);
                } else {
                    for (var i = 0; i < res.length; i++) {
                        //console.log(res[i]);
                        s1 += '<option value="' + res[i].id + '" >' + res[i].name + '</option>';
                    }
                    $('#sub3').css("display", "block");
                    $('#sub3Cat').html(s1);
                }
            },
            error: function (msg) {
                console.log("failed");
            }
        });

    });
    $('#sub3').on('change', function () {
        var catId = $('#sub3 option:selected').val();
        $('#sub4').css("display", "none");
        $('#sub5').css("display", "none");
        $('#category').css("display", "none");
        //for validation
        $('#category-error').html('');
        var s1 = '';

        catCrumb += ' > ';
        catCrumb += $('#sub3 option').filter(':selected').text();
        $("#cat-crumb").html(catCrumb);

        $.ajax({
            type: 'GET',
            url: '/alsat/api/category/' + catId + '/subs',
            success: function (result) {
                var res = $.parseJSON(JSON.stringify(result));
                //console.log(res);
                var s1 = '';
                if (res.length == 0) {
                    var selectedCatId = $('#sub3 option').filter(':selected').val();
                    var selectedCatText = $('#sub3 option').filter(':selected').text();

                    s1 = '<option value="' + selectedCatId + '" >' + selectedCatText + '</option>';
                    //alert(s1);
                    $('#category').css("display", "block");
                    $('#parentCat').css("display", "none");
                    $('#sub1').css("display", "none");
                    $('#sub2').css("display", "none");
                    $('#sub3').css("display", "none");
                    $('#sub4').css("display", "none");
                    $('#sub5').css("display", "none");

                    $('#categoryCat').html(s1);
                } else {
                    for (var i = 0; i < res.length; i++) {
                        //console.log(res[i]);
                        s1 += '<option value="' + res[i].id + '" >' + res[i].name + '</option>';
                    }
                    $('#sub4').css("display", "block");
                    $('#sub4Cat').html(s1);
                }
            },
            error: function (msg) {
                console.log("failed");
            }
        });
    });
    $('#sub4').on('change', function () {
        var catId = $('#sub4 option:selected').val();
        $('#sub5').css("display", "none");
        $('#category').css("display", "none");
        //for validation
        $('#category-error').html('');
        var s1 = '';

        catCrumb += ' > ';
        catCrumb += $('#sub4 option').filter(':selected').text();
        $("#cat-crumb").html(catCrumb);

        $.ajax({
            type: 'GET',
            url: '/alsat/api/category/' + catId + '/subs',
            success: function (result) {
                var res = $.parseJSON(JSON.stringify(result));
                //console.log(res);
                var s1 = '';
                if (res.length == 0) {
                    var selectedCatId = $('#sub4 option').filter(':selected').val();
                    var selectedCatText = $('#sub4 option').filter(':selected').text();

                    s1 = '<option value="' + selectedCatId + '" >' + selectedCatText + '</option>';
                    //alert(s1);
                    $('#category').css("display", "block");
                    $('#parentCat').css("display", "none");
                    $('#sub1').css("display", "none");
                    $('#sub2').css("display", "none");
                    $('#sub3').css("display", "none");
                    $('#sub4').css("display", "none");
                    $('#sub5').css("display", "none");

                    $('#categoryCat').html(s1);
                } else {
                    for (var i = 0; i < res.length; i++) {
                        //console.log(res[i]);
                        s1 += '<option value="' + res[i].id + '" >' + res[i].name + '</option>';
                    }
                    $('#sub5').css("display", "block");
                    $('#sub5Cat').html(s1);
                }
            },
            error: function (msg) {
                console.log("failed");
            }
        });
    });
    $('#sub5').on('change', function () {
        var catId = $('#sub5 option:selected').val();
        $('#category').css("display", "none");
        //for validation
        $('#category-error').html('');
        var s1 = '';

        catCrumb += ' > ';
        catCrumb += $('#sub5 option').filter(':selected').text();
        $("#cat-crumb").html(catCrumb);

        $.ajax({
            type: 'GET',
            url: '/alsat/api/category/' + catId + '/subs',
            success: function (result) {
                var res = $.parseJSON(JSON.stringify(result));
                //console.log(res);
                var s1 = '';
                if (res.length == 0) {
                    var selectedCatId = $('#sub5 option').filter(':selected').val();
                    var selectedCatText = $('#sub5 option').filter(':selected').text();

                    s1 = '<option value="' + selectedCatId + '" >' + selectedCatText + '</option>';
                    //alert(s1);
                    $('#category').css("display", "block");
                    $('#parentCat').css("display", "none");
                    $('#sub1').css("display", "none");
                    $('#sub2').css("display", "none");
                    $('#sub3').css("display", "none");
                    $('#sub4').css("display", "none");
                    $('#sub5').css("display", "none");

                    $('#categoryCat').html(s1);
                    s1 = '';
                }
            },
            error: function (msg) {
                console.log("failed");
            }
        });
    });

    /* category select
    */
    /*Step-1 - Kategori Seçimi*/

    /*Step-2 - İlan Temel Bilgilere git*/
    $('#next-2').click(function (e) {
        e.preventDefault();
        //for validation
        if ($('#categoryCat').val() == null) {
            $('#category-error').html('* Kategori seçimi zorunudur. Lütfen bir kategori seçiniz!')
            return false;
        } else {
            $('#step-1').hide();
            $('#step-2').show();
            $('#progressbar').css('width', '40%');
            $('#progressText').html('Temel Bilgiler');
        }
        var selectedCat = $('#categoryCat option').filter(':selected').val();
        var detay = '';
        $.ajax({
            type: 'GET',
            url: '/alsat/admin/advert/details/' + selectedCat,
            success: function (result) {
                var res = $.parseJSON(JSON.stringify(result));
                var tips = res[0];
                var yass = res[1];
                for (var i = 0; i < tips.length; i++) {
                    detay += '<option value="' + tips[i].id + '">' + tips[i].name + '</option>';
                }
                $('#tips').append(detay);
                detay = '';

            },
            error: function (msg) {
                console.log("failed");
            }
        });
        ///geri dönüşlerde formu temizlemeliyiz.
    });
    /*Step-1'e dön*/
    $('#back-1').click(function () {
        $('#step-2').hide();
        $('#step-1').show();
        $('#progressbar').css('width', '20%');
        $('#progressText').html('Kategori Seçimi');
        $('#addAdvertForm').trigger("reset");
        $('#categoryCat').empty();

        $('#parentCat').css("display", "block");
        $('#sub1').css("display", "none");
        $('#sub2').css("display", "none");
        $('#sub3').css("display", "none");
        $('#sub4').css("display", "none");
        $('#sub5').css("display", "none");
        $('#category').css("display", "none");
        //for validation
        $('#category-error').html('');
        var s1 = '';
        this.catCrumb = '';

        $('#tips').empty();
        $('#tips-info').html("Seçilen Tip sayısı:");
        $('#tips-error').html('')
        $('#baslik-error').html('');
        $('#toplamAdet-error').html('');
        $('#toplamFiyat-error').html('');

    });


    $('#baslik').change(function () {
        $('#baslik-error').html('');
    });

    var toplamAdet;
    $('#toplamAdet').change(function () {
        toplamAdet = this.value;
        $('#toplamAdet-error').html('');
    });

    var toplamFiyat;
    $('#toplamFiyat').change(function () {
        toplamFiyat = this.value;
        $('#toplamFiyat-error').html('');
    });

    var tips;
    $('#tips').on('change', function (e) {
        tips = $(e.currentTarget).val();
        $('#tips-error').html('');
        $('#tips-info').html("Seçilen Tip sayısı:" + tips.length);

    });

    //Advert Detail Adet Fiyat hesaplama

    /*Step-3 İlan Detayı'na git*/
    $('#next-3').click(function (e) {
        e.preventDefault();
        //for validation
        if ($('#baslik').val() == '') {
            $('#baslik-error').html('* Lütfen ilanınınız için başlık giriniz');
            return false;
        }
        if ($('#toplamAdet').val() == 0) {
            $('#toplamAdet-error').html('* Lütfen ilan vereceğinizi toplam hayvan sayısını giriniz');
            return false;
        }

        if ($('#toplamFiyat').val() == 0) {
            $('#toplamFiyat-error').html('* Lütfen ilanınız için bir tutar giriniz');
            return false;
        }

        if ($('#tips').val().length == 0) {
            $('#tips-error').html('* Lütfen hayvanlarınız için tip seçimi yapınız');
            return false;
        }
        var selections = $.parseJSON(JSON.stringify($('#tips').select2('data')));
        var toplamAdet = $('#toplamAdet').val();
        var toplamFiyat = $('#toplamFiyat').val();

        $('#step-2').hide();
        $('#step-3').show();
        $('#progressbar').css('width', '60%');
        $('#progressText').html('Tip Bilgileri');
        var detay = '';

        for (var i = 0; i < selections.length; i++) {
            detay += '<div class="row" >';
            detay += '<div class="col">';
            detay += '<select name="advertDetails[' + i + '].tip" class="form-control"  required="required">';
            detay += '<option value="' + selections[i].id + '" selected="selected">' + selections[i].text + '</option></select>';
            detay += '</div> <div class="col">';
            detay += '<input name="advertDetails[' + i + '].adet" id="adet-' + i + '" class="form-control" type="number" placeholder="' + selections[i].text + ' sayısı" required="required"/>';
            detay += '</div> <div class="col">';
            detay += '<input name="advertDetails[' + i + '].fiyat" id="fiyat-' + i + '" class="form-control" type="number"  placeholder=" 1 ' + selections[i].text + ' fiyatı" required="required"/>';
            detay += '</div></div>';
        }
        detay += '<div class="row""><div class="col"><label></label></div>';
        detay += '<div class="col"><label class="form-right">Girilen Toplam Adet<span class="text-primary ml-5" id="gtAdet">' + toplamAdet + '</span></label></div>';
        detay += '<div class="col"><label class="form-right">Girilen Toplam Fiyat<span class="text-primary ml-5" id="gtFiyat">' + toplamFiyat + '</span></label></div></div>';
        detay += '<div class="row"><div class="col"><label></label></div>';
        detay += '<div class="col"><label class="form-right">Girilen Gereken Toplam Adet<span class="text-primary ml-5" id="toplam">' + toplamAdet + '</span></label></div>';
        detay += '<div class="col"><label class="form-right">Girilmesi Gereken Toplam Fiyat<span class="text-primary ml-5" id="toplam">' + toplamFiyat + '</span></label></div></div>';

        $('#advert-detail').html(detay);
        detay = '';


    });
    /*Step-2 - İlan Temel Bilgilere dön*/
    $('#back-2').click(function () {
        $('#advert-detail').html('');
        $('#step-3').hide();
        $('#step-2').show();
        $('#progressbar').css('width', '40%');
        $('#progressText').html('Temel Bilgiler');

    });


    $('#next-4').click(function (e) {
        e.preventDefault();

        $('#step-3').hide();
        $('#step-4').show();
        $('#progressbar').css('width', '80%');
        $('#progressText').html('İlan Detayları');
    });
    /*Step-3 - İlan Temel Bilgilere dön*/
    $('#back-3').click(function () {
        $('#step-4').hide();
        $('#step-3').show();
        $('#progressbar').css('width', '60%');
        $('#progressText').html('Tip Bilgileri');

    });
    //step-5'e git
    $('#next-5').click(function (e) {
        e.preventDefault();
        if ($('#aciklama').val() == '') {
            $('#aciklama-error').html('* Lütfen ilanınınız için açıklma giriniz');
            return false;
        }

        $('#step-4').hide();
        $('#step-5').show();
        $('#progressbar').css('width', '100%');
        $('#progressText').html('İlan Önizle');
        var detay = '';
    });
    $('#aciklama').change(function () {
        $('#aciklama-error').html('');
    });

    /*Step-4 - İlan Temel Bilgilere dön*/
    $('#back-4').click(function () {
        $('#step-5').hide();
        $('#step-4').show();
        $('#progressbar').css('width', '80%');
        $('#progressText').html('İlan Tipi');

    });

});


/*Step Form	  



	 
$('#next-3').click(function(e){
	 e.preventDefault();
		//for validation
		 if($('#baslik').val()==''){
			 $('#baslik-error').html('* Lütfen ilanınınız için bir başlık giriniz');
			 return false;
		 }
		 if($('#aciklama').summernote('isEmpty')){
			 $('#aciklama-error').html('* Lütfen ilanınınız için açıklma giriniz');
			 return false;
		 }
		$('#step-2').hide(); 
		$('#step-3').show(); 
		$('#progressbar').css('width','75%'); 
		$('#progressText').html('İlan Tipi');			 
});
$('#back-2').click(function(){
		$('#step-3').hide(); 
		$('#step-2').show(); 
		$('#progressbar').css('width','50%'); 
		$('#progressText').html('Açıklamalar'); 
});

//for baslik validation
$('#baslik').on('keypress',function(){
	 $('#baslik-error').html('');
});	


$('#next-4').click(function(e){
	 if($('#toplamAdet').val()==0){
		 $('#toplamAdet-error').html('* Lütfen ilanınızda ki toplam hayvan sayısını giriniz');
		 return false;
	 }
	 if($('#toplamFiyat').val()==0){
		 $('#toplamFiyat-error').html('* Lütfen ilanınız için bir fiyat giriniz');
		 return false;
	 }		 	
	
});

 $('#back-3').click(function(){
		$('#step-4').hide(); 
		$('#step-3').show(); 
		$('#progressbar').css('width','75%'); 
		$('#progressText').html('İlan Tipi'); 
}); 
 //for validate
$('#toplamAdet').change(function(){
	 $('#toplamAdet-error').html('');
});
//for validate
$('#toplamFiyat').change(function(){
	 $('#toplamAdet-error').html('');
});
 
//fileinputs for multi image advert 
$("#input-fcount-1").fileinput({
	 theme:"fas",
	 language:"tr",
	 showUpload:false,
	 multiple:true,
	 maxFileCount: 4,
	 validateInitialCount: true,
	 overwriteInitial: false,
	 initialPreview: [ 
	 ],
	 initialPreviewConfig: [		       
	 ],
	 allowedFileExtensions: ["jpg", "png", "gif"]
});
*/