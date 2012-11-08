var P = {};

// 顧客一覧をセット -
P.build_corps = function( on_complete ) {
    var select = $( '#p-select_corp' );
    F.loading( select );
    var params = { x:F.time() };
    params.q = $( '#p-search' ).val();
    $.getJSON( '_corp_s', params, function( data ) {
        select.empty().append( '<option value="">--選択--</option>' );
        $.each( data.Corps, function() {
            var that = this;
            select.append( '<option value="' + that.corp_id + '">' + that.corp_name + '</option>');
        } );
        F.loaded( select );
        if ( on_complete ) {
            on_complete();
        }
    } );
};

// サービス一覧をセット -
P.build_servs = function( on_complete ) {
    var select = $( '#p-select_serv' );
    F.loading( select );
    var params = { x:F.time() };
    params.i = $( '#p-select_corp option:selected' ).val();
    if ( !( parseInt( params.i ) >= 1 ) ) {
        select.empty().append( '<option value="">--選択--</option>' );
        F.loaded( select );
        return false;
    }
    $.getJSON( '_serv_s', params, function( data ) {
        select.empty().append( '<option value="">--選択--</option>' );
        $.each( data.Servs, function() {
            var that = this;
            select.append( '<option value="' + that.serv_id + '">' + that.serv_name + '</option>');
        } );
        F.loaded( select );
        if ( on_complete ) {
            on_complete();
        }
    } );
};

// タグ設定テーブルにストライプを付ける -
P.reset_stripe = function() {
    var i = 1;
    $( '#p-key_canvas tr:visible' ).each( function() {
        var that = $( this );
        that.removeClass( 'dark' );
        if ( i % 2 == 1 ) {
            that.addClass( 'dark' );
        }
        i++;
    } );
};

// 詳細情報テーブルにストライプを付ける -
P.reset_stripe_more = function() {
    var i = 1;
    $( '#p-more_table table tr:visible' ).each( function() {
        var that = $( this );
        that.removeClass( 'dark' );
        if ( i % 2 == 0 ) {
            that.addClass( 'dark' );
        }
        i++;
    } );
};

// タグ入力部分の番号をリセット -
P.reset_nos = function() {
    var key_no = 1;
    $( '#p-key_canvas .p-key:visible' ).each( function() {
        var that = $( this );
        that.find( '.p-key_name' ).attr( 'name', key_no + '-key_name' );
        var tag_no = 1;
        that.find( '.p-tag_name:visible' ).each( function() {
            var that2 = $( this );
            that2.attr( 'name', key_no + '-' + tag_no + '-tag_name' );
            tag_no++;
        } );
        that.find( '.p-key_type' ).each( function() {
            var that3 = $( this );
            that3.attr( 'name', key_no + '-key_type' );
            that3.attr( 'id', 'p-' + key_no + '-key_type-' + that3.val() );
            that3.next().attr( 'for', 'p-' + key_no + '-key_type-' + that3.val() );
        } );
        key_no++;
    } );
};

$( document ).ready( function() {

    // 顧客一覧を取得 -
    P.build_corps( function() {
        var corp_id = $( '#p-corp_id' ).text();
        $( '#p-select_corp option[value=' + corp_id + ']' ).attr( 'selected', 'selected' );
        P.build_servs( function() {
            var serv_id = $( '#p-serv_id' ).text();
            $( '#p-select_serv option[value=' + serv_id + ']' ).attr( 'selected', 'selected' );
        } );
    } );

    // 顧客検索 -
    $( '#p-search' ).keypress( function( e ) {
        var that = $( this );
        P.build_corps( function() {
            $( '#p-select_corp option[value!=""]:first' ).attr( 'selected', 'selected' );
            $( '#p-select_corp' ).triggerHandler( 'change' );
        } );
        if ( e.keyCode == 13 ) {
            return false;
        }
        return true;
    } );

    // リセット -
    $( '#p-reset' ).click( function() {
        var that = $( this );
        that.parent().find( 'input.search' ).val( '' );
        P.build_corps( function() {
            $( '#p-select_corp' ).triggerHandler( 'change' );
        } );
        return false;
    } );

    // 顧客選択 -
    $( '#p-select_corp' ).change( function() {
        var that = $( this );
        P.build_servs();
        return true;
    } );

    // 削除 -
    $( '.p-del' ).click( function() {
        var that = $( this );
        var i       = that.data( 'i' );
        var flow_id = that.data( 'flow_id' );
        $( '#p-canvas' ).append( $( '<input type="hidden" name="' + i + '-flow_del-' + flow_id + '" value="1" />' ) );
        that.parent().remove();
        return false;
    } );

    // 追加 -
    $( '.p-add' ).click( function() {
        var that = $( this );
        var base = $( '#p-base' ).clone( true );
        base.find( 'input[type=text]' ).val( '' );
        $( '#p-canvas' ).append( base.show() );
        var i = $( '#p-canvas .p-flow' ).index( base ) + 1;
        base.find( 'input' ).attr( 'name', i + '-flow_name-new' );
        return false;
    } );

    // BTS 選択 -
    $( '#p-bts_type' ).change( function() {
        var that = $( this );
        var bts_type = that.find( 'option:selected' ).val();
        var cur_box = $( '.p-bts_box:visible' );
        if ( cur_box.length ) {
            cur_box.slideUp( 'fast', function() {
                $( '#p-bts_box_' + bts_type ).slideDown( 'fast' );
                P.reset_stripe();
            } );
        }
        else {
            $( '#p-bts_box_' + bts_type ).slideDown( 'fast' );
            P.reset_stripe();
        }
        return false;
    } );

    // キー追加 -
    $( '.p-key_add' ).click( function() {
        var that = $( this );
        var key_base = $( '#p-key_base' ).clone( true );
        $( '#p-key_canvas' ).append( key_base.show() );
        P.reset_nos();
        P.reset_stripe();
        return false;
    } );

    // キー削除 -
    $( '.p-key_del' ).click( function() {
        var that = $( this );
        that.parent().parent().remove();
        P.reset_nos();
        P.reset_stripe();
        return false;
    } );

    // タグ追加 -
    $( '.p-tag_add' ).click( function() {
        var that = $( this );
        var td = that.parent().parent();
        var tag_base = td.find( '.p-tag_base:first' ).clone( true );
        tag_base.find( 'input' ).val( '' );
        td.find( '.p-tag_canvas' ).append( tag_base.show() );
        P.reset_nos();
        return false;
    } );

    // タグ削除 -
    $( '.p-tag_del' ).click( function() {
        var that = $( this );
        that.parent().remove();
        P.reset_nos();
        return false;
    } );

    // no-select -
    $( '.no_select' ).click( function() {
        return false;
    } );

    // 詳細情報 -
    $( '#p-more' ).click( function() {
        var that = $( this );
        var table = $( '#p-more_table' );
        if ( table.is( ':visible' ) ) {
            table.slideUp( 'fast', function() {
                that.html( '&raquo; More Details' );
                $( 'form input[name=open]' ).attr( 'value', '' );
                P.reset_stripe_more();
            } );
        }
        else {
            table.slideDown( 'fast', function() {
                that.html( '&laquo; Close Details Tab' );
                $( 'form input[name=open]' ).attr( 'value', '1' );
                P.reset_stripe_more();
            } );
        }
        return false;
    } );

} );
