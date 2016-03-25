
$(document).ready(function() {
    resize_window();
    $(window).bind('resize', resize_window);
    
    setup_keyboard();
    
    $('#keyboard a.key').each(function(){
        $(this).on( "click", submit_form);
    });
});

function resize_window() {
    var height = $(window).height();
    var div_height = parseInt(height) - (200 + 65); /* footer + header height */
    $("div.container").css('height', div_height + 'px');
};

function setup_keyboard() {
    var wrong_guesses = $('#div-guesses span.w-guesses').text();
    var guesses = $('#div-guesses span.guesses').text();
    
    var letters = (wrong_guesses + guesses).split('');
    $(letters).each(function() {
        $('#' + this).addClass('keydown');
    });
};

function submit_form() {
    var letter = $(this).attr("id");
    $('#guess').val(letter);
    $('#frm-guess').submit();
};