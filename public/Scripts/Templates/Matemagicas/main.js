$(document).ready(function() {


    "use strict";

    BackToTop();
    MenuLoad();
    MenuSideLoad();
    AppearIteam();
    Sliders();
    PageLoad();
    ContactForm();
    SearchLoad();
    PostClick();
    PostClose();
    PostHover();





});

function PostHover() {
    $('.post-hover').on('mouseover', function() {
        var post_hover = $(this).attr('hover-image');
        $('#hoverImage').css('background-image','url('+ post_hover + ')' );
    });
}



function PostClick() {
    $('.bg-image').on('click', function() {
        var bg_image = $(this).attr('bg-image');
        $('.hover-blog-image').css('background-image','url('+ bg_image + ')' );
        $('html, body').animate({scrollTop : 0},400);
        $('.hover-blog-content .entry-title,.hover-blog-content .entry-meta').fadeOut(0);
        $('.blog-post').fadeOut(100, function() {
            $('#postid').fadeIn();
            $('.entry-share-div').fadeIn();
        });
        return false;
    });

    $('.post-detail').on('click', function() {
        $('.blog-post').fadeOut(100, function() {
            $('#postid').fadeIn();
        });
        return false;
    });
}

function PostClose() {
    $('.close-single-blog').on('click', function() {

        $('.hover-blog-content .entry-title,.hover-blog-content .entry-meta').fadeIn(200);
        $('.blog-post').fadeIn(100, function() {
            $('#postid').fadeOut();
            $('.entry-share-div').fadeOut(0);
        });
        return false;
    });
}

function SearchLoad() {
    $('.search-icon').on('click', function() {
        $('.search-section').fadeIn();
        return false;
    });
    $('.close-search').on('click', function() {
        $('.search-section').fadeOut();
        return false;
    });
}


/*--------------------------------------------------
Function Back To Top
---------------------------------------------------*/

function BackToTop() {

    $('.back-top').on('click', function() {
        $('html, body').animate({scrollTop : 0},800);
        return false;
    });



}//End Back To Top


/*--------------------------------------------------
Function Slider
---------------------------------------------------*/

function Sliders() {

    $('.slider-5').owlCarousel({
        loop:true,
        margin:0,
        nav:true,
        autoplay:true,
        autoplayTimeout:9000,
        dots:false,
        navText:['<img src="images/arrow-left.png" alt="left-arrow" />','<img src="images/arrow.png" alt="right=arrow" />'],
        responsive:{
            320:{
                items:1
            },
            480:{
                items:2
            },
            1200:{
                items:3
            }
        }
    })

    $('.slider-1').owlCarousel({
        loop:true,
        margin:0,
        nav:true,
        autoplay:true,
        autoplayTimeout:9000,
        dots:false,
        navText:['<img src="images/arrow-left.png" alt="left-arrow" />','<img src="images/arrow.png" alt="right=arrow" />'],
        responsive:{
            0:{
                items:1
            },
            600:{
                items:2
            },
            1000:{
                items:3
            }
        }
    })

    $('.slider-4').owlCarousel({
        animateOut: 'fadeOut',
        loop:true,
        margin:0,
        nav:true,
        autoplay:false,
        autoplayTimeout:6000,
        dots:true,
        navText:['<img src="images/left-arrow-t.png" alt="left-arrow" />','<img src="images/right-arrow-t.png" alt="right=arrow" />'],
        responsive:{
            0:{
                items:1
            },
            600:{
                items:1
            },
            1000:{
                items:1
            }
        }
    })

    $('.slider-2').owlCarousel({
        loop:true,
        margin:0,
        nav:true,
        autoplay:true,
        autoplayTimeout:6000,
        dots:true,
        navText:['<img src="images/arrow-white-2.png" alt="left-arrow" />','<img src="images/arrow-white.png" alt="right=arrow" />'],
        responsive:{
            0:{
                items:1
            },
            600:{
                items:1
            },
            1000:{
                items:1
            }
        }
    })

    $('.slider-3').owlCarousel({
        loop:true,
        margin:0,
        nav:false,
        autoplay:true,
        autoplayTimeout:11000,
        dots:false,
        responsive:{
            0:{
                items:1
            },
            600:{
                items:2
            },
            1000:{
                items:3
            }
        }
    })

    $('.slider-6').owlCarousel({
        loop:true,
        margin:20,
        nav:true,
        autoplay:false,
        center: true,
        autoplayTimeout:6000,
        dots:true,
        navText:['<img src="images/arrow-white-2.png" alt="left-arrow" />','<img src="images/arrow-white.png" alt="right=arrow" />'],

        responsive:{
            0:{
                items:1
            },
            600:{
                items:1
            },
            1300:{
                items:2
            }
        },
        //remove class active
        afterAction: function(el){
            //remove class active
            this
                .$owlItems
                .removeClass('active')

            //add class active
            this
                .$owlItems //owl internal $ object containing items
                .eq(this.currentItem + 1)
                .addClass('current')
        }

    })



}


/*--------------------------------------------------
Function Appear Items
---------------------------------------------------*/
function AppearIteam() {

    setTimeout(function(){
        $('.has-animation').each(function() {
            $(this).appear(function() {
                $(this).delay($(this).attr('data-delay')).queue(function(next){
                    $(this).addClass('animate-in');
                    next();
                });
            });
        });
    } , 250 );

}//End AppearIteam

/*--------------------------------------------------
Function Menu Load
---------------------------------------------------*/

function MenuLoad() {
    // mobile menu
    $('.menu-click').on('click', function() {
        $(this).toggleClass('open');
        $('#main-menu').slideToggle();
        return false;
    });



    var $menu = $('#main-menu');

    // add classes
    $menu.find('li').each(function() {
        if($(this).children('ul').length) {
            $(this).addClass('has-submenu');
            $(this).find('>a').after('<span class="submenu-toggle"></span>');
        }
    });

    var $submenuTrigger = $('.has-submenu > .submenu-toggle');
    // submenu link click event
    $submenuTrigger.on( "click", function() {
        $(this).parent().toggleClass('active');
        $(this).siblings('ul').toggleClass('active');
    });


}

function MenuSideLoad() {
    $('#side-click').on('click', function() {
        $(this).toggleClass('open');
        $('.overlay-section').toggleClass('active');
        $('.menu-overlay').toggleClass('active');
        return false;
    });
}

/*--------------------------------------------------
Function Page Load
---------------------------------------------------*/

function PageLoad() {
    jQuery(window).load(function() {
        jQuery("body").addClass('loaded');
    });
}


/*--------------------------------------------------
Function Contact  Form
---------------------------------------------------*/

function ContactForm() {


    jQuery("body").on("click", 'input[type="submit"]', function() {

        $form = jQuery(this).parents('form');
        form_action = $form.attr('target');
        form_class = $form.attr('class');
        id = $form.attr('id');

        if (form_class == 'checkform') {

            var control = true;
            $form.find('label.req').each(function(index){

                var name = jQuery(this).attr('for');
                defaultvalue = jQuery(this).html();
                value = $form.find('.'+name).val();
                formtype = $form.find('.'+name).attr('type');


                if (formtype == 'radio' || formtype == 'checkbox') {
                    if (jQuery('.'+name+':checked').length == 0) { jQuery(this).siblings('div').find('.checkfalse').fadeIn(200); control = false;  }
                    else { jQuery(this).siblings('div').find('.checkfalse').fadeOut(200); }

                } else if(name == 'email') {
                    var re = /^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$/;
                    if (!value.match(re)) {
                        $form.find('.'+name).addClass('false'); $form.find('.'+name).parent('.form-row').addClass('false'); control = false;
                    } else {
                        $form.find('.'+name).removeClass('false'); $form.find('.'+name).parent('.form-row').removeClass('false');
                    }
                } else {
                    if (  value == '' ||
                        value == defaultvalue
                    )
                    {
                        $form.find('.'+name).addClass('false'); $form.find('.'+name).parent('.form-row').addClass('false'); control = false;

                    } else {
                        $form.find('.'+name).removeClass('false'); $form.find('.'+name).parent('.form-row').removeClass('false');
                    }
                }

            });


            if (!control) {
                jQuery("#form-note").fadeIn(200);
                return false;

            } else {
                jQuery("#form-note").fadeOut(200);

                if (form_action && form_action !== '') {
                    var str = $form.serialize();

                    jQuery.ajax({
                        type: "POST",
                        url: form_action,
                        data: str,
                        success: function(msg){
                            jQuery("#form-note").html(msg);
                            jQuery("#form-note").delay(200).fadeIn(200);
                        }
                    });
                    return false;
                } else {
                    return true;
                }

            } // END else {

        }
    });

}