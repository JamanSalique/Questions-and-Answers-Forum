$(document).ready(function() {
    $('div.test').fadeIn(500);
});

function buttonClick() {    
    $('div.t').animate({bottom: '-10px'});
    $('div.test').animate({bottom: '-10px'});
    $('div.t').animate({bottom: '500px'});
    $('div.test').animate({bottom: '500px'}, function() {
        window.location.href = "home.html";
    });
 
//    $('div.all').animate({bottom: '500px'});
//    $('div.all').fadeOut(500);
//    window.location.href = "home.html";
}
