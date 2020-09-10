var catCrumb = '';
var s1 = "";
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
    s1 = '';
    catCrumb = '';
});



function selectCategoryButton(obj) {
    //alert($(obj).attr('class'));
    //alert($(obj).parent().attr('class'));
    let id = $(obj).parent().attr('class');
    console.log(id);
    let searchEles = document.getElementById("parentCatCont").children;
    console.log(searchEles);

    for (let i = 0; i < searchEles.length; i++) {
       searchEles[i].removeClass("active");
    }
    $(obj).addClass("active");


}
function selectCategory(id) {
    $.ajax({
        type: 'GET',
        url: '/api/category/' + id + '/subs',
        success: function (result) {
            var res = $.parseJSON(JSON.stringify(result));
            // alert(res[0].name) 
            //console.log(res);
            s1 += '<td>';
            s1 += '<div class="btn-group-vertical m-2 p-2 border">';
            for (var i = 0; i < res.length; i++) {
                s1 += '<a class="btn-info category-table-button"'
                s1 += 'onclick="selectCategory(' + "'" + res[i].id + "'" + '); selectCategoryButton(this);">' + res[i].name + '</a>'
            }
            s1 += '</div></td>'
            $('#sub1').css("display", "block");
            //Box size'ıdinamic veriyoruz
            //$('#sub1Cat').attr( "size", res.length);
            $('#category-table-tr').append(s1);
            s1 = '';
        },
        error: function (msg) {
            console.log("failed");
        },
        complete: function () {

        }

    });

}

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
    //console.log(catId)
    s1 = '';
    catCrumb = $('#parentCat option').filter(':selected').text();
    $("#cat-crumb").html(catCrumb);
    //alert(catId)
    $.ajax({
        type: 'GET',
        url: '/api/category/' + catId + '/subs',
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