$(document).ready(
    function () {
        //Initialize Select2 Elements
        $('.tips').select2()

        /*Step-1 - Kategori Seçimi*/
        var s1 = '';
        $.ajax({
            type: 'GET',
            url: '/api/category/parents',
            success: function (result) {
                let res = $.parseJSON(JSON.stringify(result));
                // alert(res[0].name) console.log(res);
                for (let i = 0; i < res.length; i++) {
                    //console.log(res[i]);
                    s1 += '<option value="' + res[i].id + '" >' + res[i].name + '</option>';
                }

                $('#sparent').css("display", "block");
                //Box size'ıdinamic veriyoruz
                //$('#sub1Cat').attr( "size", res.length);
                $('#parentCat').html(s1);
            },
            error: function (msg) {
                console.log("failed");
            }
        });

        /*
         * /* category select 	 */

        var catCrumb = '';
        $('#resetSelectedCat').click(function () {
            $('#parent').css("display", "block");
            $('#sub1').css("display", "none");
            $('#sub2').css("display", "none");
            $('#sub3').css("display", "none");
            $('#sub4').css("display", "none");
            $('#sub5').css("display", "none");
            $('#category').css("display", "none");
            //for validation
            $('#category-error').html('');
            s1 = '';
            catCrumb = '';
        });
        $('#parentCat').on('change', function () {
            let catId = $('#parentCat option:selected').val();
            $('#sub1').css("display", "none");
            $('#sub2').css("display", "none");
            $('#sub3').css("display", "none");
            $('#sub4').css("display", "none");
            $('#sub5').css("display", "none");
            $('#category').css("display", "none");
            //for validation
            $('#category-error').html('');
            //console.log(catId)
            s1 = '';
            catCrumb = $('#parentCat option').filter(':selected').text();
            $("#cat-crumb").html(catCrumb);
            //alert(catId)
            $.ajax({
                type: 'GET',
                url: '/api/category/' + catId + '/subs',
                success: function (result) {
                    let res = $.parseJSON(JSON.stringify(result));
                    // alert(res[0].name) console.log(res);
                    for (let i = 0; i < res.length; i++) {
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
            let catId = $('#sub1 option:selected').val();
            $('#sub2').css("display", "none");
            $('#sub3').css("display", "none");
            $('#sub4').css("display", "none");
            $('#sub5').css("display", "none");
            $('#category').css("display", "none");
            //for validation
            $('#category-error').html('');
            s1 = '';

            catCrumb += ' > '
            catCrumb += $('#sub1 option').filter(':selected').text();
            $("#cat-crumb").html(catCrumb);

            $.ajax({
                type: 'GET',
                url: '/api/category/' + catId + '/subs',
                success: function (result) {
                    let res = $.parseJSON(JSON.stringify(result));
                    //console.log(res);
                    s1 = '';
                    if (res.length == 0) {
                        let selectedCatId = $('#sub1 option').filter(':selected').val();
                        let selectedCatText = $('#sub1 option').filter(':selected').text();


                        s1 = '<option value="' + selectedCatId + '" >' + selectedCatText + '</option>';
                        //alert(s1);
                        $('#category').css("display", "block");
                        $('#parent').css("display", "none");
                        $('#sub1').css("display", "none");
                        $('#sub2').css("display", "none");
                        $('#sub3').css("display", "none");
                        $('#sub4').css("display", "none");
                        $('#sub5').css("display", "none");

                        $('#categoryCat').html(s1);
                    } else {
                        for (let i = 0; i < res.length; i++) {
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
            let catId = $('#sub2 option:selected').val();
            $('#sub3').css("display", "none");
            $('#sub4').css("display", "none");
            $('#sub5').css("display", "none");
            $('#category').css("display", "none");
            //for validation
            $('#category-error').html('');
            s1 = '';

            catCrumb += ' > '
            catCrumb += $('#sub2 option').filter(':selected').text();
            $("#cat-crumb").html(catCrumb);

            $.ajax({
                type: 'GET',
                url: '/api/category/' + catId + '/subs',
                success: function (result) {
                    let res = $.parseJSON(JSON.stringify(result));
                    //console.log(res);
                    s1 = '';
                    if (res.length == 0) {
                        let selectedCatId = $('#sub2 option').filter(':selected').val();
                        let selectedCatText = $('#sub2 option').filter(':selected').text();

                        s1 = '<option value="' + selectedCatId + '" >' + selectedCatText + '</option>';
                        //alert(s1);
                        $('#category').css("display", "block");
                        $('#parent').css("display", "none");
                        $('#sub1').css("display", "none");
                        $('#sub2').css("display", "none");
                        $('#sub3').css("display", "none");
                        $('#sub4').css("display", "none");
                        $('#sub5').css("display", "none");

                        $('#categoryCat').html(s1);
                    } else {
                        for (let i = 0; i < res.length; i++) {
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
            let catId = $('#sub3 option:selected').val();
            $('#sub4').css("display", "none");
            $('#sub5').css("display", "none");
            $('#category').css("display", "none");
            //for validation
            $('#category-error').html('');
            s1 = '';

            catCrumb += ' > ';
            catCrumb += $('#sub3 option').filter(':selected').text();
            $("#cat-crumb").html(catCrumb);

            $.ajax({
                type: 'GET',
                url: '/api/category/' + catId + '/subs',
                success: function (result) {
                    let res = $.parseJSON(JSON.stringify(result));
                    //console.log(res);
                    s1 = '';
                    if (res.length == 0) {
                        let selectedCatId = $('#sub3 option').filter(':selected').val();
                        let selectedCatText = $('#sub3 option').filter(':selected').text();

                        s1 = '<option value="' + selectedCatId + '" >' + selectedCatText + '</option>';
                        //alert(s1);
                        $('#category').css("display", "block");
                        $('#parent').css("display", "none");
                        $('#sub1').css("display", "none");
                        $('#sub2').css("display", "none");
                        $('#sub3').css("display", "none");
                        $('#sub4').css("display", "none");
                        $('#sub5').css("display", "none");

                        $('#categoryCat').html(s1);
                    } else {
                        for (let i = 0; i < res.length; i++) {
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
            let catId = $('#sub4 option:selected').val();
            $('#sub5').css("display", "none");
            $('#category').css("display", "none");
            //for validation
            $('#category-error').html('');
            s1 = '';

            catCrumb += ' > ';
            catCrumb += $('#sub4 option').filter(':selected').text();
            $("#cat-crumb").html(catCrumb);

            $.ajax({
                type: 'GET',
                url: '/api/category/' + catId + '/subs',
                success: function (result) {
                    let res = $.parseJSON(JSON.stringify(result));
                    //console.log(res);
                    s1 = '';
                    if (res.length == 0) {
                        let selectedCatId = $('#sub4 option').filter(':selected').val();
                        let selectedCatText = $('#sub4 option').filter(':selected').text();

                        s1 = '<option value="' + selectedCatId + '" >' + selectedCatText + '</option>';
                        //alert(s1);
                        $('#category').css("display", "block");
                        $('#parent').css("display", "none");
                        $('#sub1').css("display", "none");
                        $('#sub2').css("display", "none");
                        $('#sub3').css("display", "none");
                        $('#sub4').css("display", "none");
                        $('#sub5').css("display", "none");

                        $('#categoryCat').html(s1);
                    } else {
                        for (let i = 0; i < res.length; i++) {
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
            let catId = $('#sub5 option:selected').val();
            $('#category').css("display", "none");
            //for validation
            $('#category-error').html('');
            s1 = '';

            catCrumb += ' > ';
            catCrumb += $('#sub5 option').filter(':selected').text();
            $("#cat-crumb").html(catCrumb);

            $.ajax({
                type: 'GET',
                url: '/api/category/' + catId + '/subs',
                success: function (result) {
                    let res = $.parseJSON(JSON.stringify(result));
                    //console.log(res);
                    s1 = '';
                    if (res.length == 0) {
                        let selectedCatId = $('#sub5 option').filter(':selected').val();
                        let selectedCatText = $('#sub5 option').filter(':selected').text();

                        s1 = '<option value="' + selectedCatId + '" >' + selectedCatText + '</option>';
                        //alert(s1);
                        $('#category').css("display", "block");
                        $('#parent').css("display", "none");
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
                    console.log("msg");
                }
            });
        });
        /*Step-2 - İlan Temel Bilgilere git*/
        $('#next-2').click(function (e) {
           // e.preventDefault();
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
                url: '/admin/advert/details/' + selectedCat,
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


        /* category select
        */
        /*Step-1 - Kategori Seçimi*/
    });