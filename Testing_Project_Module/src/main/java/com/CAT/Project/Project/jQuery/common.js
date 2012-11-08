var F = {};

// colorbox の透明度 (0-1)
$.fn.colorbox.settings.opacity = 0.1;

// セレクトボックスによる更新 -
//   <select data-base='_test?x=1'> のように、select に data-base 属性を付けること -
F.reload_by_select = function( src ) {
    var sel_obj = $( src );
    sel_obj.change( function() {
        var s_obj = $( this );
        var base = s_obj.data( 'base' );
        var glue = base.indexOf( '?' ) === -1 ? '?' : '&';
        document.location = base + glue + s_obj.attr( 'name' ) + '=' + s_obj.find( 'option:selected' ).val();
        return false;
    } );
}

// colorbox メッセージダイアログ -
F.alert = function( str, params, win ) {
    if ( !win ) {
        win = self;
    }
    if ( F.running ) { // Enter での再押下対策 -
        return false;
    }
    F.running = true;
    var clone_obj = $( '#u-alert' ).clone( true );
    if ( params && params.width ) {
        clone_obj.width( params.width );
    }
    $( 'body' ).append( clone_obj );
    clone_obj.find( '.u-str' ).html( str );
    clone_obj.find( '.u-ok' ).click( function() {
        if ( params && params.on_ok ) {
            clone_obj.remove();
            params.on_ok();
        }
        else {
            clone_obj.remove();
            win.$.fn.colorbox.close();
        }
        F.running = false;
        return false;
    } );
    win.$.fn.colorbox( {
        inline    : true,
        href      : clone_obj,
        onCleanup : function() {
            F.running = false;
            clone_obj.remove();
        }
    } );
};

// colorbox 確認ダイアログ -
F.confirm = function( str, params ) {
    if ( F.running ) { // Enter での再押下対策 -
        return false;
    }
    F.running = true;
    var clone_obj = $( '#u-conf' ).clone( true );
    if ( params && params.width ) {
        clone_obj.width( params.width );
    }
    $( 'body' ).append( clone_obj );
    clone_obj.find( '.u-str' ).html( str );
    clone_obj.find( '.u-ok' ).click( function() {
        params.on_ok();
        clone_obj.remove();
        F.running = false;
        return false;
    } );
    clone_obj.find( '.u-cancel' ).click( function() {
        if ( params && params.on_cancel ) {
            clone_obj.remove();
            params.on_cancel();
        }
        else {
            clone_obj.remove();
            $.fn.colorbox.close();
        }
        F.running = false;
        return false;
    } );
    $.fn.colorbox( {
        inline    : true,
        href      : clone_obj,
        onCleanup : function() {
            F.running = false;
            clone_obj.remove();
        }
    } );
};

// タイムスタンプを取得 -
F.time = function() {
    return Math.round( new Date().getTime() / 1000 );
};

// ローディング画像に置き換える -
F.loading = function( obj ) {
    obj.after( '<img src="/img/common/loading.gif" alt="" style="vertical-align:middle;" />' ).hide();
};

// ローディング画像を元に戻す -
F.loaded = function( obj ) {
    obj.show().next().remove();
};

// iframe 内のコンテンツをリロード -
F.reload_iframe = function( obj ) {
    obj.attr( 'src', obj[0].contentWindow.document.location.href );
};

// input[type=text]、textarea 内の末尾にカーソルをセット -
F.set_to_last = function( obj ) {
    var is_msie = /*@cc_on!@*/false;
    if ( is_msie ) {
        var range = obj.createTextRange();
        range.collapse( false );
        range.select();
    }
    else {
        obj.focus();
        var val = obj.val();
        obj.val( '' );
        obj.val( val );
        obj.scrollTop( obj[0].scrollHeight );
    }
};

// 全角含め、空かどうかを判別 -
F.exist = function( str ) {
    var temp = str.replace( /\s|　/g, '' );
    return temp == '' ? false : true;
}

// スクロールバーの幅を取得 -
F.scrollbar_width = function( win ) {
    var div = $( '<div style="width:50px;height:50px;overflow:hidden;position:absolute;top:-200px;left:-200px;"><div style="height:100px;"></div>' );
    win.$( 'body' ).append( div );
    var w1 = $( 'div', div ).innerWidth();
    div.css( 'overflow-y', 'scroll' );
    var w2 = $( 'div', div ).innerWidth();
    $( div ).remove();
    return ( w1 - w2 );
}

// スクロールをロック -
F.lock_scroll = function( win ) {
    var scroll_position = [
        win.pageXOffset || win.document.documentElement.scrollLeft || win.document.body.scrollLeft,
        win.pageYOffset || win.document.documentElement.scrollTop  || win.document.body.scrollTop
    ];
    var html = win.$( 'html' );
    html.data( 'scroll_position', scroll_position );
    html.data( 'pre_overflow', html.css( 'overflow' ) );
    var before_body_width = win.$( 'body' ).outerWidth();
    html.css( 'overflow', 'hidden' );
    var after_body_width = win.$( 'body' ).outerWidth();
    if ( before_body_width < after_body_width ) {
        html.css( 'padding-right', F.scrollbar_width( win ) + 'px' );
    }
    win.scrollTo( scroll_position[0], scroll_position[1] );
    html.blur();
}

// スクロールを解除 -
F.unlock_scroll = function( win ) {
    var html = win.$( 'html' );
    if ( html.data( 'pre_overflow' ) ) {
        html.css( 'padding-right', 0 );
        html.css( 'overflow', html.data( 'pre_overflow' ) );
        var scroll_position = html.data( 'scroll_position' );
        win.scrollTo( scroll_position[0], scroll_position[1] );
    }
}

// スクロールバーを考慮しない、画面横幅を取得 -
F.no_scrollbar_body_width = function( win ) {
    F.lock_scroll( win );
    var width = win.$( 'body' ).outerWidth();
    F.unlock_scroll( win );
    return width;
}

// ファイルアップロード -
F.upload = function( conf ) {
    var input = conf.obj.next();
    input.unbind( 'change' ).one( 'change', function() {
        if ( conf && conf.on_submit ) {
            conf.on_submit();
        }
        input.upload( conf.url, conf.params, function( data ) {
            if ( conf && conf.on_complete ) {
                conf.on_complete( data );
            }
        }, 'json' );
    } ).click();
};

// YYYY-MM-DD を取得 -
F.get_date_string = function( day ) {
    var y = day.getFullYear();
    var m = day.getMonth() + 1;
    var d = day.getDate();
    m = m < 10 ? '0' + m : m;
    d = d < 10 ? '0' + d : d;
    return y + '-' + m + '-' + d;
}

$( document ).ready( function() {

    // 改行の数によって textarea の高さを動的に調整 -
    $( '.js-textarea' ).keydown( function( e ) {
        var that = $( this );
        if ( e.keyCode == '13' ) { // [ENTER]
            that.attr( 'rows', that.val().split( "\n" ).length + 1 );
        }
        return true;
    } );
    $( '.js-textarea' ).keyup( function( e ) {
        var that = $( this );
        if ( e.keyCode == '8' || e.keyCode == '46' ) { // [DEL] [BackSpace]
            that.attr( 'rows', that.val().split( "\n" ).length );
        }
        return true;
    } );

    // .link -
    $( 'th.link, td.link' ).hover( function() {
        $( 'th.link, td.link' ).removeClass( 'hover' );
        $( this ).addClass( 'hover' );
    }, function() {
        $( this ).removeClass( 'hover' );
    } );
    $( 'tr.link' ).hover( function() {
        $( 'tr.link td' ).removeClass( 'hover' );
        $( this ).find( 'td' ).addClass( 'hover' );
    }, function() {
        $( this ).find( 'td' ).removeClass( 'hover' );
    } );
    $( 'a.link, th.link, td.link, tr.link' ).click( function() {
        var that = $( this );
        var href = that.data( 'href' )
        if ( href ) {
            location.href = href;
        }
        return false;
    } );

    // .date -
    $( '.date' ).datepicker( {
        showOn          : 'both',
        buttonImage     : '/img/common/cal.png',
        buttonImageOnly : true,
        speed           : 'fast'
    } );

    // .stripe -
    $( 'table.stripe' ).each( function() {
        var that = $( this );
        var i = 1;
        that.find( 'tr:first' ).siblings().andSelf().each( function() {
            var that2 = $( this );
            if ( that2.is( ':visible' ) ) {
              if ( i % 2 == 0 ) {
                  that2.addClass( 'dark' );
              }
              i++;
            }
        } );
    } );
    $( 'table.stripe2' ).each( function() {
        var that = $( this );
        var i = 1;
        that.find( 'tr:first' ).siblings().andSelf().each( function() {
            var that2 = $( this );
            if ( that2.is( ':visible' ) ) {
              if ( i % 2 == 1 ) {
                  that2.addClass( 'dark' );
              }
              i++;
          }
        } );
    } );

    // ツリー -
    if ( $( '#tree' ).length > 0 ) {

        // ツリーを取得 -
        F.build_tree = function() {
            var dropdown = $( 'dl.dropdown' );
            F.loading( dropdown );
            var params = { x:F.time() };
            params.depth   = $( '#tree' ).data( 'depth'   );
            params.proj_id = $( '#tree' ).data( 'proj_id' );
            params.part_id = $( '#tree' ).data( 'part_id' );
            params.q       = $( '#tree input.search' ).val();
            $.getJSON( '_tree', params, function( data ) {
                dropdown.empty();
                $( '#p-tree-tmpl' ).tmpl( data ).appendTo( 'dl.dropdown' );
                if ( $( '.dropdown dd ul li a.selected' ).html() ) {
                    $( '.dropdown dt a span' ).html( $( '.dropdown dd ul li a.selected' ).html() );
                }

                // 変更イベント -
                $( '.dropdown dd ul li a' ).click( function() {
                    var that = $( this );
                    var proj_id;
                    var part_id;
                    var pairs;
                    var params_str;
                    $( '.dropdown dt a span' ).html( that.html() );

                    // プロジェクト選択時 -
                    if ( that.hasClass( 'proj' ) ) {
                        proj_id = that.find( 'span.value' ).text();
                        pairs   = location.search.replace( '?', '' ).split( '&' );
                        params  = [];
                        $.each( pairs, function() {
                            var pair = this;
                            var list = pair.split( '=' );
                            if ( list[0] == 'i' && proj_id ) {
                                list[1] = proj_id;
                            }
                            params.push( list[0] + '=' + list[1] );
                        } );
                    }

                    // テスト区分選択時 -
                    else if ( that.hasClass( 'part' ) ) {
                        part_id = that.find( 'span.value' ).text();
                        pairs = location.search.replace( '?', '' ).split( '&' );
                        params = [ 'j=' + part_id ];
                        $.each( pairs, function() {
                            var pair = this;
                            var list = pair.split( '=' );
                            if ( !( list[0] == 'j' && part_id ) ) {
                                params.push( list[0] + '=' + list[1] );
                            }
                        } );
                    }
                    params_str = params.join( '&' );
                    location.href = location.pathname + '?' + params_str;
                    $( '.dropdown dd ul' ).hide();
                    return false;
                } );

                // 開閉 -
                $( '.dropdown dt a' ).click( function() {
                    $( '.dropdown dd ul' ).toggle();
                    return false;
                } );
                $( document ).bind( 'click', function( e ) {
                    var $clicked = $( e.target );
                    if ( !$clicked.parents().hasClass( 'dropdown' ) ) {
                        $( '.dropdown dd ul' ).hide();
                    }
                    return true;
                } );

                F.loaded( dropdown );
            } );
        };

        // 初回表示時 -
        F.build_tree();

        // submit -
        $( '#tree' ).submit( function() {
            var that = $( this );
            F.build_tree();
            return false;
        } );

        // 検索リセット -
        $( '#tree a:first' ).click( function() {
            var that = $( this );
            $( '#tree' ).find( 'input.search' ).val( '' );
            $( '#tree' ).submit();
            return false;
        } );
    }

    // 登録直後の場合は初期設定ウィンドウをオープン -
    if ( $( '#p-INIT_FLG' ).text() == '1' ) {
        F.lock_scroll( self );
        $.fn.colorbox( {
            iframe   : true,
            width    : '1140px',
            height   : '90%',
            href     : '_init_t',
            onClosed : function() {
                F.unlock_scroll( self );
            }
        } );
    }
} );
