$(function () {
    // Initialize the language selector dropdown
    initLanguageSelector();

    if ($(".sfPageEditor").length) {
        ResponsiveFrameworkFix();
    }
});

function initLanguageSelector() {
    if ($('#top .language-selector ul li').length) {
        $('#top .language-selector').hoverIntent({
            over : showNav,
            out: hideNav,
            interval: 0
        });
    }
    function hideNav() {
        $(this).removeClass('active');
    }
    function showNav() {
        $(this).addClass('active');
    }
}

function ResponsiveFrameworkFix() {
    // If the layout is a responsive layout, clear the width styles on the element
    $(".sfLayoutPropsContainer .sfLinkBtn.sfSave").click(function () {
        var editor = $find("LayoutEditor1");
        if (editor._layoutRoot.classList.contains("row")) {

            $(".sfLayoutPropsContainer #columnList .sfTxt").each(function () {
                $(this).val('');
            });


            var columns = editor._widthEditor._outerColumns;
            var colCount = editor._widthEditor._outerColumns.length;

            for (var i = 0; i < colCount; i++) {
                if (editor._widthEditor._outerColumns[i].style.width != "") {
                    editor._widthEditor._outerColumns[i].style.width = "";
                }
            }
        }

    });
}