// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery
//= require jquery_ujs
//= require_tree .


// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults
$(document).ready(function(){
    $(".add-business").live('click', function(){
        $("#business-form").dialog("open");
    });
    $( "#dialog:ui-dialog" ).dialog( "destroy" );
    var b_name = $( "#b_name" ),
    allFields = $( [] ).add( b_name );
    $("#business-form").dialog({
        autoOpen: false,
        height: 200,
        width: 450,
        modal: true,
        buttons: {
            "A D D": function() {
                if($("#b_name").val() == ""){
                    alert("Please Enter Product Name");
                    return false;
                }
                else{
                    $.ajax({
                        type: "POST",
                        data: {
                            bname : b_name.val()
                            },
                        url: "/businesses",
                        dataType: 'json',
                        success: function(data){
                            if(data.success){
                                $("#business-form").dialog("close");
                                alert(data.message);
                            }
                            else{
                                $('#valid-prog').hide();
                                alert(data.message);
                            }
                        }
                    });
                }
            },
            Cancel: function(){
                $(this).dialog("close");
            }
        },
        close: function(){
            allFields.val("").removeClass("ui-state-error");
        }
    });

    $(".add-product").live('click',function(){
        $("#product-form").dialog("open");
    });
    $( "#dialog:ui-dialog" ).dialog( "destroy" );
    var p_name = $("#p_name")
    var pb_id = $("#pb_name")
    var r_price = $("#r_price")
    var d_price = $("#d_price")
    $("#product-form").dialog({
        autoOpen: false,
        height: 300,
        width: 500,
        modal: true,
        buttons: {
            "A D D": function() {
                if(p_name.val() == ""){
                    alert("Please Enter Product Name");
                    return false;
                }
                else if(pb_id.val() == ""){
                    alert("Please Select a business");
                    return false;
                }
                else if(r_price.val() == ""){
                    alert("Please Enter Retail Price");
                    return false;
                }
                else{
                    $.ajax({
                        type: "POST",
                        data: {
                            pname : p_name.val(),
                            pbid : pb_id.val(),
                            r_price : r_price.val(),
                            d_price : d_price.val()
                            },
                        url: "/products",
                        dataType: 'json',
                        success: function(data){
                            if(data.success){
                                $("#product-form").dialog("close");
                                alert(data.message);
                            }
                            else{
                                $('#valid-prog').hide();
                                alert(data.message);
                            }
                        }
                    });
                }
            },
            Cancel: function(){
                $(this).dialog("close");
            }
        }
    });
    $("#datepicker_end").live('click', function(){
        $(this).datepicker({
            changeMonth: true,
            changeYear: true,
            dateFormat: "yy-mm-dd"
        }).focus();
    });

    $("#datepicker_start").live('click', function(){
        $(this).datepicker({
            changeMonth: true,
            changeYear: true,
            dateFormat: "yy-mm-dd"
        }).focus();
    });
    $('.fields').live('change',function(){
        var p_atr_id = $(this).attr('id');
        if(p_atr_id == "productDropdown1"){
            var pid = $('#productDropdown1'), p_box = "box1";
        }else{
            var pid = $('#productDropdown2'), p_box = "box2";
        }
        if(pid.val() != ""){
            $.ajax({
                type: "GET",
                data: {
                    pid : pid.val()
                    },
                url: "/get_product",
                dataType: 'json',
                success: function(data){
                    if(data.success){
                        if(p_box == "box1"){
                            $('#r_price_value_1').val(data.rprice);
                            $('#d_price_value_1').val(data.dprice);
                        }else{
                            $('#r_price_value_2').val(data.rprice);
                            $('#d_price_value_2').val(data.dprice);
                        }
                    }
                }
            });
        }
    });

    $("li a.ui-corner-all").live('click', function(){
        var val = $(this).text();
        $.ajax({
            type: "GET",
            data: {
                pname : val
            },
            url: "/edit_promotion",
            success: function(data){
                $('#promo_details').html(data);
            }
        });
    });

    $(".target").live('change', function(){
        var currentId = $(this).attr('id');
        var businessId = $(this).val();
        $.ajax({
            url:  "/show_products?b_id=" + businessId + "&stag_id=" + currentId,
            success: function() {},
            error: function(jqXHR) {}
        });

    });

    $("#promotionForm").submit(function(){
        var valid = true, focus = null;
        if(!$("#promos").val()){
            alert("Enter Promotion Name.");
            valid = false;
            focus = "#promos";
        }
        else if(!$("#business1").val()){
            alert("Select Business.");
            valid = false;
            focus = "#business1";
        }
        else if(!$("#productDropdown1").val()){
            alert("Select Product.");
            valid = false;
            focus = "#productDropdown1";
        }
        else if(!$("#business2").val()){
            alert("Select Business.");
            valid = false;
            focus = "#business2";
        }
        else if($("#business1").val() == $("#business2").val()){
            alert("Both Businesses can't be same.");
            valid = false;
            focus = "#business2";
        }
        else if(!$("#productDropdown2").val()){
            alert("Select Product.");
            valid = false;
            focus = "#productDropdown2";
        }
        if(!valid){
            $(focus).focus();
        }
        return valid;
    });
});
