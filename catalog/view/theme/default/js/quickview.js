$(document).ready(function () {
    $(".quickview").colorbox({
        iframe: true,
        width: 900,
        maxWidth: "96%",
        height: 705,
        maxHeight: "96%",
        onOpen: function () {
            $("#colorbox").addClass("quickview");
        },
        onClosed: function () {
            headCart();
        }
    });




    $( '.custom_block img' ).attr( 'src', 'https://meblaks.com.ua/image/catalog/what/red_logo4.png' ).attr("alt", "Images");
    $('.what li:nth-child(1) img ').attr('src', 'https://meblaks.com.ua/image/catalog/what/43c54ca5bcfdb1c66afb27f27e1999ef.png').attr("alt", "Images");
    $('.what li:nth-child(2) img ').attr('src', 'https://meblaks.com.ua/image/catalog/what/nf.png').attr("alt", "Images");
    $('.what li:nth-child(3) img ').attr('src', 'https://meblaks.com.ua/image/catalog/what/673fcfa4d167916f4cacbd73f83d3ab4.png').attr("alt", "Images");
    $('.what li:nth-child(4) img ').attr('src', 'https://meblaks.com.ua/image/catalog/what/698f0c13d122cb944fdf92150318b0b5.png').attr("alt", "Images");
    $('.what li:nth-child(5) img ').attr('src', 'https://meblaks.com.ua/image/catalog/what/73465e4bedf5dca8a773225aa8a23419.png').attr("alt", "Images");
    $('.what li:nth-child(6) img ').attr('src', 'https://meblaks.com.ua/image/catalog/what/43c54ca5bcfdb1c66afb27f27e1999ef.png').attr("alt", "Images");
});
function headCart() {
    $('#cart').load('index.php?route=common/cart/info #cart > *');
    $('#wishlist-total').html(json['total']);
}
