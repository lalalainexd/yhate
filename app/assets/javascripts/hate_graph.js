var context;
$(document).ready(function() {
  var canvas = $('#hate-graph').get(0);
  context = canvas.getContext("2d");

  var data = [4,9,12,16,2,6];
  data.forEach(function(num, index, array) {
    bar(index, num);
  });
});

function bar(x,y) {
  rectangle("#999", 0, x*12, y*10, 10);
}

function rectangle(color, x, y, width, height) {
  context.fillStyle = color;
  context.fillRect(x,y,width,height);
}

function text(message, color,x, y) {
  context.fillStyle = color;
  context.font = "30px sans-serif";
  context.fillText(message, x, y);
}
