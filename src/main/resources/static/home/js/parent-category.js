$(function () {
    $("#tumu-tab").click(function () {
        $("#tumuFiltre").removeClass('pasif').addClass("aktif");
        $("#sahibindenFiltre").removeClass("aktif").addClass("pasif");
        $("#firmadanFiltre").removeClass("aktif").addClass("pasif");

    })
    $("#sahibinden-tab").click(function () {
        $("#tumuFiltre").removeClass("aktif").addClass("pasif");
        $("#sahibindenFiltre").removeClass('pasif').addClass("aktif");
        $("#firmadanFiltre").removeClass("aktif").addClass("pasif");

    })
    $("#firmadan-tab").click(function () {
        $("#tumuFiltre").removeClass("aktif").addClass("pasif");
        $("#sahibindenFiltre").removeClass("aktif").addClass("pasif");
        $("#firmadanFiltre").removeClass('pasif').addClass("aktif");

    })


});