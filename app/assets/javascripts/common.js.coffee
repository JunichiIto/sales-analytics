$ ->
  $("td").filter(->
    @innerHTML.match /^[0-9\s\.,]+$/
  ).css "text-align", "right"

  $("th").filter(->
    @innerHTML.match /(Count|Avg|Total)/i
  ).css "text-align", "right"
