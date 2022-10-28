var NEWSLETTERGWS_ENDPOINT = "/DesktopModules/AirAstana/AirAstana.Dnn.Components/NewsletterWs.asmx";

conditionizr.polyfill('/Portal/_default/Skins/AirAstana7/js/html5shiv.js', ['ie6', 'ie7', 'ie8']);

if (typeof String.prototype.startsWith != 'function') {
    String.prototype.startsWith = function (str) {
        return this.slice(0, str.length) == str;
    };
}

Selectize.define('selectable_placeholderDest', function (options) {
    var self = this;

    options = $.extend({
        placeholder: self.settings.placeholder,
        html: function (data) {
            return (
                '<div class="selectize-dropdown-content placeholder-container">' +
                '<div data-selectable class="option">' + data.placeholder + '</div>' +
                '</div>');
        }
    }, options);

    self.setup = (function () {
        var original = self.setup;
        return function () {
            original.apply(this, arguments);
            self.$placeholder_container = $(options.html(options));
            self.$dropdown.prepend(self.$placeholder_container);
            self.$dropdown.on('click', '.placeholder-container', function () {
                self.setValue('NON');
                self.close();
                self.blur();
            });
        };
    })();
});


$.validator.prototype.subset = function (container) {
    var partValid = true;
    var self = this;
    $(container).find(':input').each(function () {
        if (!self.element($(this))) partValid = false;
    });
    return partValid;
}

$.validator.setDefaults({
    errorElement: "span",
    errorClass: "help-block",
    highlight: function (element, errorClass, validClass) {
        if ($(element).prop('type') === 'checkbox') {
            $(element).closest('div').addClass('has-error-check');
        } else {
            var formGroup = $(element).closest('.form-group');
            if (formGroup.length > 0) {
                $(element).closest('.form-group').addClass('has-error');
            } else {
                $(element).closest('div').addClass('has-error');
            }
        }
    },
    unhighlight: function (element, errorClass, validClass) {
        if ($(element).prop('type') === 'checkbox') {
            $(element).closest('div').removeClass('has-error-check');
        } else {
            var formGroup = $(element).closest('.form-group');
            if (formGroup.length > 0) {
                $(element).closest('.form-group').removeClass('has-error');
            } else {
                $(element).closest('div').removeClass('has-error');
            }
        }
    },
    errorPlacement: function (error, element) {
        if ($(element).is('select')) {
            var actualSelect = $(element).closest('div').find('.bootstrap-select');
            if (actualSelect.length > 0) {
                error.insertAfter(actualSelect);
            }
        } else {
            if ($(element).parent('.input-group').length || $(element).prop('type') === 'checkbox' || $(element).prop('type') === 'radio') {
                error.addClass('has-error-check');
                error.insertAfter($(element));
            } else {
                error.insertAfter($(element));
            }
        }
    }
});

//IE8 specific code
function isIE(version, comparison) {
    var cc = 'IE',
	    b = document.createElement('B'),
	    docElem = document.documentElement,
	    isIE;

    if (version) {
        cc += ' ' + version;
        if (comparison) { cc = comparison + ' ' + cc; }
    }

    b.innerHTML = '<!--[if ' + cc + ']><b id="iecctest"></b><![endif]-->';
    docElem.appendChild(b);
    isIE = !!document.getElementById('iecctest');
    docElem.removeChild(b);

    return isIE;
}

$(document).on('click', '.yamm .dropdown-menu', function (e) {
    e.stopPropagation()
});

function executeSearchHelper(query) {
    var CUR_SEARCH_PAGE = 'search';
    var CUR_LANG = AA_PORTAL_LANG.toLowerCase();

    if (CUR_LANG == 'ru-ru') {
        CUR_SEARCH_PAGE = 'Search-Results-ru-RU';
    }
    if (CUR_LANG == 'de-de') {
        CUR_SEARCH_PAGE = 'Search-Results-de-DE';
    }
    if (CUR_LANG == 'fr-fr') {
        CUR_SEARCH_PAGE = 'Search-Results-fr-FR';
    }
    if (CUR_LANG == 'tr-tr') {
        CUR_SEARCH_PAGE = 'Search-Results-tr-TR';
    }
    if (CUR_LANG == 'kk-kz') {
        CUR_SEARCH_PAGE = 'Search-Results-kk-KZ';
    }

    window.location = AA_PORTAL_ROOT + CUR_SEARCH_PAGE + '?query=' + query;
}

function showActiveLanguageList() {
    try{$('.active-languages').html($('ul[data-languages="' + $('.portal-list > li.active > a').attr('href').substring(1) + '"]').html());}catch(e){}
}

function positionLanguageMenu() {
    try{
		var position = $('ul.portal-list > li.active').offset().top - $('.toplevel-portals').offset().top - $('.active-languages').height() / 2 + 3;

		if (position < 0) {
			position = 0;
		} else if (position + $('.active-languages').height() > $('.toplevel-portals').height()) {
			position = $('.toplevel-portals').height() - $('.active-languages').height();
		}

		$('.active-languages').css('top', position);
	}catch(e){}
}

$(document).ready(function () {
    showActiveLanguageList();
    positionLanguageMenu();

    $('ul.portal-list > li > a').click(function (e) {
        e.preventDefault();
        $('.portal-list > li.active').removeClass('active');
        $(this).parent().addClass('active');
        showActiveLanguageList();
        positionLanguageMenu();
    });

    $('a[data-toggle="portal-popup"]').click(function (e) {
        e.preventDefault();
        $('.portal-popup').removeClass('hidden');
        positionLanguageMenu();
    });

    $('.portal-popup').click(function (event) {
        $(this).addClass('hidden');
    });

    $('.toplevel-portals').click(function (event) {
        event.stopPropagation();
    });

    $("#searchQuery").keypress(function (e) {
        if (e.which == 13) {
            executeSearchHelper($('#searchQuery').val());
            e.preventDefault();
        }
    });

    $("#searchQuerySmall").keypress(function (e) {
        if (e.which == 13) {
            executeSearchHelper($('#searchQuerySmall').val());
            e.preventDefault();
        }
    });

    $('.selectpicker').selectpicker({
        style: 'btn btn-default btn-lg',
        dropupAuto: false
    });


    $("#executeSearch").click(function (e) {
        e.preventDefault();
        if ($('#searchQuerySmall').css('display') == 'none') {
            if ($('.search-overlay-div').css('display') == 'none') {
                $('.search-overlay-div').show();
                $('.searchQuery').focus();
            } else {
                $('.search-overlay-div').hide();
            }
        } else {
            executeSearchHelper($('#searchQuerySmall').val());
        }
    });

    $("#executeSearchCollapsed").click(function (e) {
        e.preventDefault();
        if ($('.search-overlay-div').css('display') == 'none') {
            $('.search-overlay-div').show();
            $('.searchQuery').focus();
        } else {
            $('.search-overlay-div').hide();
        }
    });

    $("#executeSearchOverlay").click(function (e) {
        e.preventDefault();
        executeSearchHelper($('#searchQuery').val());
    });

    if ($('#password').length > 0) {
        $("#password").keypress(function (e) {
            if (e.which == 13) {
                $('#nomadSignIn').click();
                e.preventDefault();
            }
        });
    }

    $('#EmailSubscribeButton').click(function (e) {
        e.preventDefault();
        $.ajax({
            type: "POST",
            url: NEWSLETTERGWS_ENDPOINT + "/Subscribe",
            data: "{" +
                    "p_email:'" + $("#EmailSubscribe").val() + "'" +
                "}",
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (data) {
                var obj = data.d;
                if (obj == 'OK') {
                    $('#EmailSubscribe').attr("class", "form-control input-lg alert-success");
                    $('#EmailSubscribe').attr("readonly", "readonly");
                    $('#EmailSubscribeButton').hide();
                } else {
                    $('#EmailSubscribe').attr("class", "form-control input-lg alert-danger");
                }
            },
            error: function (err) {
                $('#EmailSubscribe').attr("class", "form-control input-lg alert-danger");
            }
        });
    });

    if (isIE(8) && $('.checkbox').length > 0) {
        $('.checkbox').each(function () { $(this).attr('class', 'checkbox-inline') });
        $('.main-booking-form .booking-form').attr('style', 'width:590px !important;')
    }



    $.extend($.validator.messages, {
        required: validationMessages["required"],
        notEqual: validationMessages["notEqual"],
        targetlength: validationMessages["charExact"],
        lettersonly: validationMessages["lettersOnly"],
        cardDigits: validationMessages["numberOfDigits"],
        digits: validationMessages["numbersOnly"],
        requiredDDL: validationMessages["required"],
        dateAABooking: validationMessages["dateWithinYear"],
        dateGreaterThan: validationMessages["arrivlaDate"],
        maxPax9: validationMessages["maxPax"],
        passwordAA: validationMessages["passwordAA"],
        termsAA: validationMessages["tcRequired"],
        minlength: validationMessages["charLimits"],
        dateAABirthday: validationMessages["dateBirtday"],
        dateAABeforeToday: validationMessages["invalidDate"],
        dateAAAfterIncludingToday: validationMessages["invalidDate"],
        email: validationMessages["email"],
		equalTo: validationMessages["equalTo"]
    });
    
});

(function (factory) {
    if (typeof define === 'function' && define.amd) {
        define(['jquery'], factory);
    } else if (typeof exports === 'object') {
        module.exports = factory(require('jquery'));
    } else {
        factory(jQuery);
    }
}(function ($) {

    var pluses = /\+/g;

    function encode(s) {
        return config.raw ? s : encodeURIComponent(s);
    }

    function decode(s) {
        return config.raw ? s : decodeURIComponent(s);
    }

    function stringifyCookieValue(value) {
        return encode(config.json ? JSON.stringify(value) : String(value));
    }

    function parseCookieValue(s) {
        if (s.indexOf('"') === 0) {
            s = s.slice(1, -1).replace(/\\"/g, '"').replace(/\\\\/g, '\\');
        }

        try {
            s = decodeURIComponent(s.replace(pluses, ' '));
            return config.json ? JSON.parse(s) : s;
        } catch (e) { }
    }

    function read(s, converter) {
        var value = config.raw ? s : parseCookieValue(s);
        return $.isFunction(converter) ? converter(value) : value;
    }

    var config = $.cookie = function (key, value, options) {
        if (!key.startsWith("aa_cc_")) {
            key = "aa_cc_" + key;
        }

        if (arguments.length > 1 && !$.isFunction(value)) {
            options = $.extend({}, config.defaults, options);

            if (typeof options.expires !== 'number') {
                options.expires = 14;
            }
            var days = options.expires, t = options.expires = new Date();
            t.setMilliseconds(t.getMilliseconds() + days * 864e+5);

            if (typeof options.secure === 'undefined') {
                if (window.location.protocol === "https:") {
                    options.secure = true;
                }
            }

            return (document.cookie = [
				encode(key), '=', stringifyCookieValue(value),
				options.expires ? '; expires=' + options.expires.toUTCString() : '',
				options.path ? '; path=' + options.path : '',
				options.domain ? '; domain=' + options.domain : '',
				options.secure ? '; secure' : ''
            ].join(''));
        }

        var result = key ? undefined : {},
			cookies = document.cookie ? document.cookie.split('; ') : [],
			i = 0,
			l = cookies.length;

        for (; i < l; i++) {
            var parts = cookies[i].split('='),
				name = decode(parts.shift()),
				cookie = parts.join('=');

            if (key === name) {
                result = read(cookie, value);
                break;
            }

            if (!key && (cookie = read(cookie)) !== undefined) {
                result[name] = cookie;
            }
        }

        return result;
    };

    config.defaults = {};

    $.removeCookie = function (key, options) {
        if (!key.startsWith("aa_cc_")) {
            key = "aa_cc_" + key;
        }

        $.cookie(key, '', $.extend({}, options, { expires: -1 }));
        return !$.cookie(key);
    };
}));

$(document).ready(function(){
            
    $('#btn-find-flight').click(function(){
        if (typeof ga !== 'undefined') ga('send', 'event', 'Flight Booking', 'Flight Search');
    });
            
});