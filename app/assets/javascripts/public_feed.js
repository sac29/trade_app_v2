(function() {
    function change_page_size(event)
    {
        var url = window.location.href;
        var url_array = url.split('?');
        var base_url = url_array[0];
        window.location.href = base_url+"?from=0&limit="+event.target.value;
    }

    var page_url = new URL(window.location.href);
    var size = page_url.searchParams.get("limit");
    if(size!=null)
    {
        document.getElementById("page_size").value = parseInt(size);
    }

    document.addEventListener('DOMContentLoaded', function () {
        $('.js-tf-page-size').on("change", function(event) {
            change_page_size(event);
        });
    });
})();


