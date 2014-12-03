$(document).ready(function() {
  function checkUpdate() {
    setTimeout(function() {
      console.log('hi!');
      checkUpdate();
    }, 1000);
  }

  checkUpdate();
});
