/*----------------------------------------------------*/
/*	Image Overlay
/*----------------------------------------------------*/

$(document).ready(function () {
  // scroll to anchor
  $("a[href^='#top']").click(function(event){
      event.preventDefault();
      var full_url = this.href;
      var parts = full_url.split("#");
      var trgt = parts[1];

      var target_offset = $("#"+trgt).offset();
      var target_top = target_offset.top - 80;
      $('html, body').animate({
          scrollTop:target_top
      }, 1500, 'easeOutBounce');
  });

  $(".nav li a[href^='#']").click(function(event){
      event.preventDefault();
      var full_url = this.href;
      var parts = full_url.split("#");
      var trgt = parts[1];

      var target_offset = $("#"+trgt).offset();
      var target_top = target_offset.top -80;
      $('html, body').animate({
          scrollTop:target_top
      }, 1000, 'easeOutQuad');
  });
  //
  //


  // Cache selectors
  var lastId,
  topMenu = $(".nav"),
  topMenuHeight = topMenu.outerHeight()+50,
  // All list items
  menuItems = topMenu.find("a"),
  // Anchors corresponding to menu items
  scrollItems = menuItems.map(function(){
      var item = $($(this).attr("href"));
      if (item.length) {
          return item;
      }
  });


  // Bind to scroll
  $(window).scroll(function(){
      // Get container scroll position
      var fromTop = $(this).scrollTop()+topMenuHeight;

      // Get id of current scroll item
      var cur = scrollItems.map(function(){
          if ($(this).offset().top < fromTop)
              return this;
      });
      // Get the id of the current element
      cur = cur[cur.length-1];
      var id = cur && cur.length ? cur[0].id : "";

      if (lastId !== id) {
          lastId = id;
          // Set/remove active class
          menuItems
          .parent().removeClass("active")
          .end().filter("[href=#"+id+"]").parent().addClass("active");
      }

  });
});