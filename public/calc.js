$(document).ready(function(){
  var read = function(){
    return $("#formula").val();
  };
  var write = function(str){
    $("#formula").val(str);
  };
  var add_event = function(id, str){
    $(id).click(function(){ 
      write(read() + str);
    });
  };

  // register events for buttons
  for(var i=0; i<=9; i++){
    add_event("#n" + i, String(i)); 
  }
  $.each({add: "+", sub: "-", mul: "*", div: "/",
          lparen: "(", rparen: ")"},
         function(name, str){ add_event("#" + name, str); });

  $("#equal").click(function(){
    var formula = read(), result = "";
    try{ result = eval(formula); } catch(e){ }
    write(result);
  });

  $("#ac").click(function(){
    write("");
  });

  $("#bs").click(function(){
    write( read().replace(/.$/, "") );
  });
});
