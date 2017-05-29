function calcZ(event, element) {
  var oZ, nZ;
  var re = /(shadow-z-)([\d]{1})/;
  var match = re.exec(element.className);
  if (!match[2]) return;

  oZ = parseInt(match[2], 10);

  if (event.type === "mouseenter" && oZ < 5) {
    nZ = Math.min((oZ + 1), 5);
    $(element).removeClass('shadow-z-' + oZ).addClass('toggled shadow-z-' + nZ);
    return nZ;
  } else if ($(element).hasClass('toggled')) {
    nZ = Math.max((oZ - 1), 1);
    $(element).removeClass('toggled shadow-z-' + oZ).addClass('shadow-z-' + nZ);
  }
}

$(function() {
  $(document).on('mouseenter mouseleave', '[class*="shadow-z-"]', function(e) {
    calcZ(e, this);
  });
});
