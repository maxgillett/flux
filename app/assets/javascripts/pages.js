$(function() {
  function getURLParameter(name) {
    return decodeURIComponent((new RegExp('[?|&]' + name + '=' + '([^&;]+?)(&|#|;|$)').exec(location.search)||[,""])[1].replace(/\+/g, '%20'))||null
  }
  
  var saveOptions = function() {
    localStorage.setItem("time-period", $('.time-period .options input:checked').val())
    localStorage.setItem("journals", _.pluck($('.publications .options input:checked'), 'value'))
  };

  var loadOptions = function() {
    var time_period = localStorage.getItem("time-period");
    var journals = localStorage.getItem("journals");

    // Use default options if they have never been set
    if (time_period == null && journals == null) {
      time_period = 'NA';
      journals = String(_.pluck($('.publications .options input'), 'value'));
    }
  
    if (journals) {
      journals = journals.split(",");
      _.each(journals, function(id) {
        $('.publications .options input[value='+id+']').prop('checked', true);
      })
    }

    $('.time-period input[value='+time_period+']').prop('checked', true);
  };

  var fetchArticles = _.throttle(function() {
    saveOptions();
    var input = $('.search').val();
    var read_status = getURLParameter('status');
    var journals = JSON.stringify(_.map(_.pluck($('.publications .options input:checked'), 'value'), Number));
    var period = $('.time-period .options input:checked').val();
    $.get('articles/search', 
      {'status': read_status, 'input': input, 'journals': journals, 'period': period}, function(data) {
        $('.articles').html(data);
    });
  }, 1000);

  // Load saved settings (if they exist) from localStorage
  loadOptions();

  // Bind event handlers to DOM elements
  $('.search').on('input', fetchArticles)
  $('.options input').on('change', fetchArticles)

  // Fetch articles and filter by current options
  fetchArticles();
});
