var type = "normal";

var disabled = false;

var disabledFunction = null;



window.addEventListener("message", function (event) {

    if (event.data.action == "display") {

        type = event.data.type

        disabled = false;

        $("#hotbar").css('opacity', '1');



        if (type === "normal") {

            $(".info-div").hide();

            $("#otherInventory").hide();

            $('.help-message').show();

        } else if (type === "trunk") {

            $(".info-div").show();

            $("#otherInventory").show();

        } else if (type === "property") {

            $(".info-div").hide();

            $("#otherInventory").show();

        } else if (type === "player") {

            $(".info-div").show();

            $("#otherInventory").show();

        }



        $(".ui").fadeIn();

    } else if (event.data.action == "hide") {

        $("#dialog").dialog("close");

        $('.help-message').hide();



        $(".ui").fadeOut();

        $("#hotbar").css('opacity', '0');

        $(".item").remove();

        $("#otherInventory").html("<div id=\"noSecondInventoryMessage\"></div>");

        $("#noSecondInventoryMessage").html(invLocale.secondInventoryNotAvailable);

    } else if (event.data.action == "setItems") {

        inventorySetup(event.data.itemList);



        $('.item').draggable({

            helper: 'clone',

            scroll: false,

            appendTo: 'body',

            zIndex: 99999,

            revert: 'invalid',

            start: function (event, ui) {

                if (disabled) {

                    return false;

                }



                $(this).css('background-image', 'none');

                itemData = $(this).data("item");

                itemInventory = $(this).data("inventory");



                if (itemInventory == "second" || !itemData.canRemove) {

                    $("#drop").addClass("disabled");

                    $("#give").addClass("disabled");

                }



                if (itemInventory == "second" || !itemData.usable) {

                    $("#use").addClass("disabled");

                }

            },

            stop: function () {

                itemData = $(this).data("item");



                if (itemData !== undefined && itemData.name !== undefined) {

                    $(this).css('background-image', 'url(\'img/items/' + itemData.name + '.png\'');

                    $("#drop").removeClass("disabled");

                    $("#use").removeClass("disabled");

                    $("#give").removeClass("disabled");

                }

            }

        });

    } else if (event.data.action == "setJobData") {

        $('#job-name').text(event.data.name); // Benny's

        $('#job-title').text(event.data.title); // CEO

    } else if (event.data.action == "setNameData") {

        $('#first-name').text(event.data.first);

        $('#last-name').text(event.data.last);

    } else if (event.data.action == "setSecondInventoryItems") {

        secondInventorySetup(event.data.itemList);

    } else if (event.data.action == "getSlotItem") {

        var item = $("#hotbar").find("#item-" + event.data.slot).attr('item');

        $.post("http://esx_inventory/sendItemInSlot", JSON.stringify({

            name: item

        }));

        flashHotbar();

    } else if (event.data.action == "setInfoText") {

        $(".info-div").html(event.data.text);

    } else if (event.data.action == "clearHotbar") {

        $('.item-slot').empty();

        flashHotbar();

    } else if (event.data.action == "nearPlayers") {

        $("#nearPlayers").html("");



        $.each(event.data.players, function (index, player) {

            $("#nearPlayers").append('<button class="nearbyPlayerButton" data-player="' + player.player + '">' + player.label + ' (' + player.player + ')</button>');

        });



        $("#dialog").dialog("open");



        $(".nearbyPlayerButton").click(function () {

            $("#dialog").dialog("close");

            player = $(this).data("player");

            $.post("http://esx_inventory/GiveItem", JSON.stringify({

                player: player,

                item: event.data.item,

                number: parseInt($("#count").val())

            }));

        });

    }

});



function closeInventory() {

    $.post("http://esx_inventory/NUIFocusOff", JSON.stringify({}));

}



var finalNum

function inventorySetup(items) {

    $("#playerInventory").html("");

    finalNum = 0

    var index = 0

    $.each(items, function (index, item) {

        index = index + 1

        count = setCount(item);



        $("#playerInventory").append('<div class="slot"><div id="item-' + index + '" class="item" style = "background-image: url(\'img/items/' + item.name + '.png\')">' +

            '<div class="item-count">' + count + '</div> <div class="item-name">' + item.label + '</div> </div ></div>');

        $('#item-' + index).data('item', item);

        $('#item-' + index).data('inventory', "main");

        finalNum = index

    });

    console.log(finalNum);

    for (let step = 0; step < 20 - finalNum; step++) {

      $("#playerInventory").append('<div class="empty-slot"></div>');

    }

}



function secondInventorySetup(items) {

    $("#otherInventory").html("");

    finalNum = 0

    var index = 0

    $.each(items, function (index, item) {

        index = index + 1

        count = setCount(item);



        $("#otherInventory").append('<div class="slot"><div id="itemOther-' + index + '" class="item" style = "background-image: url(\'img/items/' + item.name + '.png\')">' +

            '<div class="item-count">' + count + '</div> <div class="item-name">' + item.label + '</div> </div ><div class="item-name-bg"></div></div>');

        $('#itemOther-' + index).data('item', item);

        $('#itemOther-' + index).data('inventory', "second");

        finalNum = index

    });

    console.log(finalNum);

    for (let step = 0; step < 20 - finalNum; step++) {

      $("#otherInventory").append('<div class="empty-slot"></div>');

    }

}



$(document).on('dblclick', '.item', function() {

  itemData = $(this).data("item");

  if (itemData.usable) {

    disableInventory(300);

    $.post("http://esx_inventory/UseItem", JSON.stringify({

      item: itemData

    }));

  }

})



$(document).on('click', '.item', function() {

  itemData = $(this).data("item");



  $(this).closest('.ui').find('.selectedItem').removeClass('selectedItem');

  $(this).addClass('selectedItem');



  // $(this).append("<div class='action-tools'></div>")

  //console.log(JSON.stringify(itemData));



  if (itemData == undefined || itemData.usable == false) {

    $(document).find('#use').removeClass('disabled');

  } else if (itemData.usable == true) {

    $(document).find('#use').removeClass('disabled');

  }

})



$(document).on('click', '#use', function() {

  item = $('.selectedItem');

  itemData = item.data("item");

  //console.log(JSON.stringify(itemData), item.attr('id'));



  if (itemData == undefined || itemData.usable == undefined) {

      return;

  }



  itemInventory = item.data("inventory");



  if (itemInventory == undefined || itemInventory == "second") {

      return;

  }



  {

      disableInventory(300);

      $.post("http://esx_inventory/UseItem", JSON.stringify({

          item: itemData

      }));

  }

})



$(document).on('click', '#give', function() {

  item = $('.selectedItem');

  itemData = item.data("item");

  //console.log(JSON.stringify(itemData), item.attr('id'));



  if (itemData == undefined || itemData.canRemove == undefined) {

      return;

  }



  itemInventory = item.data("inventory");



  if (itemInventory == undefined || itemInventory == "second") {

      return;

  }



 {

      disableInventory(300);

      $.post("http://esx_inventory/GetNearPlayers", JSON.stringify({

          item: itemData

      }));

  }

})



$(document).on('click', '#drop', function() {

  item = $('.selectedItem');

  itemData = item.data("item");

  //console.log(JSON.stringify(itemData), item.attr('id'));







  itemInventory = item.data("inventory");



  if (itemInventory == undefined || itemInventory == "second") {

      return;

  }



   {

      disableInventory(300);

      $.post("http://esx_inventory/DropItem", JSON.stringify({

          item: itemData,

          number: parseInt($("#count").val())

      }));

  }

})



function Interval(time) {

    var timer = false;

    this.start = function () {

        if (this.isRunning()) {

            clearInterval(timer);

            timer = false;

        }



        timer = setInterval(function () {

            disabled = false;

        }, time);

    };

    this.stop = function () {

        clearInterval(timer);

        timer = false;

    };

    this.isRunning = function () {

        return timer !== false;

    };

}



function disableInventory(ms) {

    disabled = true;



    if (disabledFunction === null) {

        disabledFunction = new Interval(ms);

        disabledFunction.start();

    } else {

        if (disabledFunction.isRunning()) {

            disabledFunction.stop();

        }



        disabledFunction.start();

    }

}



function setCount(item) {

    count = item.count



    if (item.limit > 0) {

        count = item.count + " / " + item.limit

    }



    if (item.type === "item_weapon") {

        if (count == 0) {

            count = "";

        } else {

            count = '<img src="img/bullet.png" class="ammoIcon"> ' + item.count;

        }

    }



    if (item.type === "item_account" || item.type === "item_money") {

        count = formatMoney(item.count);

    }



    return count;

}



function formatMoney(n, c, d, t) {

    var c = isNaN(c = Math.abs(c)) ? 2 : c,

        d = d == undefined ? "." : d,

        t = t == undefined ? "," : t,

        s = n < 0 ? "-" : "",

        i = String(parseInt(n = Math.abs(Number(n) || 0).toFixed(c))),

        j = (j = i.length) > 3 ? j % 3 : 0;



    return s + (j ? i.substr(0, j) + t : "") + i.substr(j).replace(/(\d{3})(?=\d)/g, "$1" + t);

};



$(document).ready(function () {

    $("#count").focus(function () {

        $(this).val("")

    }).blur(function () {

        if ($(this).val() == "") {

            $(this).val("1")

        }

    });



    $(document).keydown(function(e) {

        if (Config.closeKeys.includes(e.which)) {

            closeInventory();

        }

    });



    $('#use').droppable({

        hoverClass: 'hoverControl',

        drop: function (event, ui) {

            itemData = ui.draggable.data("item");

            //console.log(JSON.stringify(itemData));



          


            itemInventory = ui.draggable.data("inventory");



            if (itemInventory == undefined || itemInventory == "second") {

                return;

            }



             {

                disableInventory(300);

                $.post("http://esx_inventory/UseItem", JSON.stringify({

                    item: itemData

                }));

            }

        }

    });



    $('.item-slot').droppable({

        hoverClass: 'hoverControl',

        drop: function (event, ui) {

            itemData = ui.draggable.data("item");

            //console.log(JSON.stringify(itemData));



            if (itemData == undefined || itemData.usable == undefined) {

                return;

            }



            itemInventory = ui.draggable.data("inventory");



            if (itemInventory == undefined || itemInventory == "second") {

                return;

            }



            disableInventory(300);

            $(this).empty();



            $(this).append('<div id="item-' + $(this).attr('slot') + '" class="hotbar-item" item=' + itemData.name + ' style="background-image: url(\'img/items/' + itemData.name + '.png\')">' +

                '<div class="item-count">' + $(this).attr('slot') + '</div> <div class="item-name">' + itemData.label + '</div> </div ><div class="item-name-bg"></div>');

            $('#item-' + $(this).attr('slot')).data('item', itemData);

        }

    });



    $('#give').droppable({

        hoverClass: 'hoverControl',

        drop: function (event, ui) {

            itemData = ui.draggable.data("item");



   


            itemInventory = ui.draggable.data("inventory");



            if (itemInventory == undefined || itemInventory == "second") {

                return;

            }



         {

                disableInventory(300);

                $.post("http://esx_inventory/GetNearPlayers", JSON.stringify({

                    item: itemData

                }));

            }

        }

    });



    $('#drop').droppable({

        hoverClass: 'hoverControl',

        drop: function (event, ui) {

            itemData = ui.draggable.data("item");



            if (itemData == undefined || itemData.canRemove == undefined) {

                return;

            }



            itemInventory = ui.draggable.data("inventory");



            if (itemInventory == undefined || itemInventory == "second") {

                return;

            }



          {

                disableInventory(300);

                $.post("http://esx_inventory/DropItem", JSON.stringify({

                    item: itemData,

                    number: parseInt($("#count").val())

                }));

            }

        }

    });



    $('#playerInventory').droppable({

        drop: function (event, ui) {

            itemData = ui.draggable.data("item");

            itemInventory = ui.draggable.data("inventory");



            if (type === "trunk" && itemInventory === "second") {

                disableInventory(500);

                $.post("http://esx_inventory/TakeFromTrunk", JSON.stringify({

                    item: itemData,

                    number: parseInt($("#count").val())

                }));

            } else if (type === "property" && itemInventory === "second") {

                disableInventory(500);

                $.post("http://esx_inventory/TakeFromProperty", JSON.stringify({

                    item: itemData,

                    number: parseInt($("#count").val())

                }));

            } else if (type === "player" && itemInventory === "second") {

                disableInventory(500);

                $.post("http://esx_inventory/TakeFromPlayer", JSON.stringify({

                    item: itemData,

                    number: parseInt($("#count").val())

                }));

            }

        }

    });



    $('#otherInventory').droppable({

        drop: function (event, ui) {

            itemData = ui.draggable.data("item");

            itemInventory = ui.draggable.data("inventory");



            if (type === "trunk" && itemInventory === "main") {

                disableInventory(500);

                $.post("http://esx_inventory/PutIntoTrunk", JSON.stringify({

                    item: itemData,

                    number: parseInt($("#count").val())

                }));

            } else if (type === "property" && itemInventory === "main") {

                disableInventory(500);

                $.post("http://esx_inventory/PutIntoProperty", JSON.stringify({

                    item: itemData,

                    number: parseInt($("#count").val())

                }));

            } else if (type === "player" && itemInventory === "main") {

                disableInventory(500);

                $.post("http://esx_inventory/PutIntoPlayer", JSON.stringify({

                    item: itemData,

                    number: parseInt($("#count").val())

                }));

            }

        }

    });



    $("#count").on("keypress keyup blur", function (event) {

        $(this).val($(this).val().replace(/[^\d].+/, ""));

        if ((event.which < 48 || event.which > 57)) {

            event.preventDefault();

        }

    });

});



$.widget('ui.dialog', $.ui.dialog, {

    options: {

        // Determine if clicking outside the dialog shall close it

        clickOutside: false,

        // Element (id or class) that triggers the dialog opening

        clickOutsideTrigger: ''

    },

    open: function () {

        var clickOutsideTriggerEl = $(this.options.clickOutsideTrigger),

            that = this;

        if (this.options.clickOutside) {

            // Add document wide click handler for the current dialog namespace

            $(document).on('click.ui.dialogClickOutside' + that.eventNamespace, function (event) {

                var $target = $(event.target);

                if ($target.closest($(clickOutsideTriggerEl)).length === 0 &&

                    $target.closest($(that.uiDialog)).length === 0) {

                    that.close();

                }

            });

        }

        // Invoke parent open method

        this._super();

    },

    close: function () {

        // Remove document wide click handler for the current dialog

        $(document).off('click.ui.dialogClickOutside' + this.eventNamespace);

        // Invoke parent close method

        this._super();

    },

});





function flashHotbar() {

  $('#hotbar').addClass('flash-hotbar');

  setTimeout(function(){

    $('#hotbar').removeClass('flash-hotbar');

  }, 4000);

}

