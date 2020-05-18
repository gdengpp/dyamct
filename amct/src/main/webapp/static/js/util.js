function signleSelect($, id) {
    $('#'+id).next().find('.layui-table tr').click(function () {
        //操作   例如行变色
        //$(this).css('background', 'yellow');
        var checkCellT = $(this).parent().find("td div.laytable-cell-checkbox div.layui-form-checked I");
        for(var i = 0; i < checkCellT.length; i++) {
            checkCellT[i].click();
        }
        var checkCell = $(this).find("td div.laytable-cell-checkbox div.layui-form-checkbox I");
        if (checkCell.length > 0) {
            checkCell[0].click();
        }
    });
}

function openSelectTree() {
    $(".layui-form-select").not($('.downpanel .layui-select-title').parents(".layui-form-select")).removeClass("layui-form-selected");
    $('.downpanel .layui-select-title').parents(".downpanel").toggleClass("layui-form-selected");
}