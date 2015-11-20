$(function () {
    var $container = $('#registered_users');
    $container.imagesLoaded(function() {
        $container.wookmark({
            offset: 5,
            itemWidth: '150',
            autoResize: true,
            flexibleWidth: true
        });
        setTimeout(function(){
            $('.invisible').removeClass('invisible');
        }, 0)
    });
});
