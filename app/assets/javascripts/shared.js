function addNewPage(resource) {
  var nextPageNumber = parseInt($(".page.current").text()) + 1;
  $(".page.current").after("<span class='page'><a rel='next' href='" + resource + "?page="+ nextPageNumber + "'>" + nextPageNumber + "</a></span>");
}

function isLastPage() {
  return $(".next").length == 0;
}
