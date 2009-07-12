$(document).ready(function(){
  var mark = "", num = "", left = 0;
  var operated = false;

  var update_lcd = function(m, n){
    mark = m;
    num = n;
    $("#mark").empty().append(mark);
    $("#num").empty().append(num);
  };
  var clear_lcd = function(){
    update_lcd("", "");
  };

  // events for number button 
  for(var i=0; i<=9; i++){
    // Note: closure is needed to split each variable :-(
    function(n){
      $("#n" + i).click(function(){
        if (operated){
          left = Number(num);
          update_lcd(mark, String(n));
          operated = false;
        }
        else {
          update_lcd(mark, num + n);
        }
      });
    }(i);
  }
  
  // events for operator button 
  operations = {
    "+": function(l, r){ return l + r; },
    "-": function(l, r){ return l - r; },
    "*": function(l, r){ return l * r; },
    "/": function(l, r){ return l / r; }
  }
  var calc = function(l, op, r){
    return operations[op](l, r);
  };
  $.each({add: "+", sub: "-", mul: "*", div: "/"},
    function(name, op){
      $("#" + name).click(function(){
        if (operated) {
          update_lcd(op, num); 
        }
        else {
          if (mark){
            left = calc(left, mark, Number(num));
            update_lcd(op, left);
          }
          else {
            update_lcd(op, num); 
          }
          operated = true;
        }
      });
    });
  $("#equal").click(function(){
    var result = calc(left, mark, Number(num));
    update_lcd("", result);
    left = 0;
    operated = true;
  });
    
  // events for clear button 
  $("#ac").click(function(){ update_lcd("", ""); left = 0; });
  $("#c").click(function(){ update_lcd(mark, ""); });
});
