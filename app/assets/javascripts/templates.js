// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

$(function(){

  var template = function(){
    $(document).on("click", "#cart-mode-btn", this.switchToCart);
    $(document).on('click', '#edit-mode-btn', this.switchToEdit);
    $(document).on('click', '.cancel-btn', this.switchToView);
  }

  template.prototype.switchToCart = function(e){
    e.preventDefault();
    $('.tools-neutral').hide();
    $('.tools-cart, .cart-show').show();
    $('.component').addClass('cart-mode');
    $(document).on('click', '.component', Template.addToCart);
  }

  template.prototype.switchToEdit = function(e){
    e.preventDefault();
    $('.tools-neutral').hide();
    $('.tools-edit, .edit-show').show();
    $('div.multi-column-row > div.add-component.vertical').css('display', 'table-cell');
  }

  template.prototype.switchToView = function(e){
    e.preventDefault();
    e.stopPropagation();
    $('.tools-neutral').show();
    $('.tools-cart, .tools-edit, .cart-show, .edit-show').hide();
    $('.component.selected').removeClass('selected');
    $('.component').removeClass('cart-mode');
    $(document).off('click', '.component', Template.addToCart);
    $('#selected-component-count').html(0);
    $('div.multi-column-row > div.add-component.vertical').css('display', 'none');
  }

  template.prototype.addToCart = function(e){
    e.preventDefault();
    if($(this).children('.multi-column-row').length > 0 && !$(e.target).hasClass('component-cart-handle')){
      return;
    }
    $(this).toggleClass('selected');
    $('#selected-component-count').html($('.component.selected').length);
  }

  window.Template = new template();
});
