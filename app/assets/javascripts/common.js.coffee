$ ->
  $("td").filter(->
    @innerHTML.match /^[0-9\s\.,]+$/
  ).css "text-align", "right"