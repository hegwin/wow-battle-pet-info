# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
$ ->
  $('a[rel="popover"]').popover()

validateSkill = (data, level) ->
  controls = "div#" + level
  if data?
    $(controls).removeClass("error").addClass("success")
    $("span.help-inline", $(controls)).text(data.description)
    $("input[name='skills[][skill_id]']", $(controls)).attr("value", data.id)
  else
    $(controls).removeClass("success").addClass("error")
    $("span.help-inline", $(controls)).text("Skill Not Found")

$ ->
  $('div#skill input').blur ->
    level = $(this).parents('.control-group').attr("id")
    $.ajax
      url: "/skills/verify.json"
      data:
        title_cn: this.value
      type: "GET"
      dataType: "json"
      success: (data) -> validateSkill(data, level)
